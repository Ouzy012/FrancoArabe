<%-- 
    Document   : bulletin
    Created on : 21 mai 2019, 01:49:17
    Author     : Moussa Joseph D Sarr
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <title>Bulletin ${bulletin.prenom} ${bulletin.nom}</title>

        <style>
            .entete{
                width: 100vw;
                display:flex;
                flex-direction: row;
                align-items : center;
                align-content : space-around;
                justify-content : flex-start;
            }
            h1{
                text-align: center;
            }
            #imag{
                width: 15vw;
            }
            th,td{
                border: black solid;
            }
            .tableau{
                display: flex;
                justify-content: center;
            }
            table{
                border: black solid;
                border-collapse: collapse; 
                text-align: center;
            }
            #tabl1{

                border: black solid;
                border-collapse: collapse; 
                text-align: center;
                width: 80vw;
            }
            .ecole{
                margin-left: 5vw;
                font-size: 3vw;
                font-weight: bold;
            }
            .infos{
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                margin-left: 9vw;
                margin-right: 9vw;
            }
            a{
                display: flex;
                justify-content: center;
            }            
        </style>
    </head>
    <body>
        <% String couleur = "red";%>

        <div class="entete">
            <img src="${pageContext.request.contextPath}/Image/log_bul.jpg" style="width: 100px;" id="imag">
            <c:choose>
                <c:when test="${bulletin.ens eq 'Francais'}">
                    <div class="ecole">Ecole Franco-Arabe El Hadji Amadou Lamine Diene</div>
                </div>
                <h1>Bulletin de Notes</h1>
            </c:when>
            <c:otherwise>
                <div class="ecole">المدرسة الفرنسية العربية الحاج أمادو لمين ديان</div>
            </div>
            <h1>نشرة الملاحظات</h1>
        </c:otherwise>
    </c:choose>



    <div class="infos">
        <div class="gauche">Prénom : ${bulletin.prenom}</div>
        <div class="droite">Nom : ${bulletin.nom}</div>
    </div>
    <div class="infos">
        <div class="gauche">Naissance : ${fn:replace(bulletin.dateNaissance, '-', '/')}</div>
        <div class="droite">Classe: ${bulletin.nomClasse}</div>
    </div>
    <div class="infos">
        <div class="gauche">Matricule : ${bulletin.login}</div>
        <div class="droite">Nbres d'éléves : ${bulletin.nbreEleve}</div>
    </div>
    <div class="infos">
        <div class="gauche">Composition : ${fn:replace(bulletin.semestre, '_', ' ')}</div>
        <div class="droite">Année Scolaire : ${bulletin.annee}</div>
    </div>
    <br>
    <div class="tableau">
        <table id="tabl1">
            <tr>
                <th style="text-align: center">Matières</th>
                <th style="text-align: center">Comp</th>
                    <c:choose>
                        <c:when test="${bulletin.ens eq 'Francais'}">
                        <th style="text-align: center">Coef</th>
                        </c:when>
                        <c:otherwise>
                        <th style="text-align: center">درجة</th>
                        <th style="text-align: center">مادة</th>
                        </c:otherwise>
                    </c:choose>
                <th style="text-align: center">Appréciations</th>
            </tr>
            <c:forEach var="eval" items="${bulletin.evaluation}">
                <tr>
                    <td>
                        <c:if test="${bulletin.ens eq 'Francais'}">
                            ${fn:substringBefore(eval.nomMatiere,
                              ':Francais')}
                        </c:if>
                        <c:if test="${bulletin.ens eq 'Arabe'}">
                            ${fn:substringBefore(eval.nomMatiere,
                              ':Arabe')}
                        </c:if>

                    </td>
                    <td>
                        ${eval.composition}
                    </td>

                    <td>
                        ${eval.coef}
                    </td>
                    <c:if test="${bulletin.ens eq 'Arabe'}">

                        <td>${eval.nomArabe}</td>
                    </c:if>

                    <td>
                        ${eval.appreciations}
                    </td>
                </tr>
            </c:forEach>
            <c:choose>
                <c:when test="${bulletin.ens eq 'Francais'}">
                    <tr>
                        <td colspan="4" ng-if="${bulletin.ens eq 'Francais'}">TOTAL : ${bulletin.totalMoyenne}/${bulletin.totalCoef*10}   &nbsp; Moyenne : ${bulletin.moyenneGenerale}/10<br>
                            Rang : ${bulletin.rang}<br>
                            Appréciation du Travail :<br>
                            <c:choose>
                                <c:when test="${bulletin.getMoyenneGenerale() >= 8}">
                                    <div style=" color: green;border: black solid;margin-left: 30%;margin-right :30%;" ng-if="${bulletin.getMoyenneGenerale() > 6}">
                                        Félicitation
                                    </div>
                                </c:when>
                                <c:otherwise><div style=" border: black solid;margin-left: 30%;margin-right :30%;" ng-if="${bulletin.getMoyenneGenerale() > 6}">
                                        Félicitation
                                    </div></c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${bulletin.getMoyenneGenerale() >= 6 and bulletin.getMoyenneGenerale() < 8}">
                                    <div style=" color :#0092ef;border: black solid;margin-left: 30%;margin-right :30%;">
                                        Encouragements
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div style=" border: black solid;margin-left: 30%;margin-right :30%;">
                                        Encouragements
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${bulletin.getMoyenneGenerale() >= 5 and bulletin.getMoyenneGenerale() < 6}">
                                    <div style="color : #2ecc71; border: black solid;margin-left: 30%;margin-right :30%;">
                                        Peut Mieux Faire
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div style=" border: black solid;margin-left: 30%;margin-right :30%;">
                                        Peut Mieux Faire
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${bulletin.getMoyenneGenerale() > 0 and bulletin.getMoyenneGenerale() < 5}">
                                    <div style="color: red;border: black solid;margin-left: 30%;margin-right :30%;">
                                        Insuffisant
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div style="border: black solid;margin-left: 30%;margin-right :30%;">
                                        Insuffisant
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            Conduite :
                        </td>

                    </tr>

                    <tr>
                        <td>Bonne</td>
                        <td colspan="2">Passable</td>
                        <td>Avertissement</td>

                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5" >TOTAL : ${bulletin.totalMoyenne}/${bulletin.totalCoef*10}   &nbsp; Moyenne : ${bulletin.moyenneGenerale}/10<br>
                            Rang : ${bulletin.rang}<br>
                            Appréciation du Travail :<br>
                            <div style=" border: black solid;margin-left: 30%;margin-right :30%;">
                                Félicitation
                            </div>
                            <div style=" border: black solid;margin-left: 30%;margin-right :30%;">
                                Encouragements
                            </div>
                            <div style=" border: black solid;margin-left: 30%;margin-right :30%;">
                                Peut Mieux Faire
                            </div>
                            <div style=" border: black solid;margin-left: 30%;margin-right :30%;">
                                Insuffisant
                            </div>
                            Conduite :
                        </td>

                    </tr>

                    <tr>
                        <td>Bonne</td>
                        <td colspan="2">Passable</td>
                        <td>Avertissement</td>
                        <td>Blame</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
    <c:if test="${bulletin.semestre eq '2eme_Composition'}">
        <br>
        <div class="infos">
            <table>
                <tr>
                    <th>Récapitulation</th>
                </tr>
                <tr><td>1er Trimestre : ${bulletin.moyCompo1FR} /10<br>
                        2e Trimestre : ${bulletin.moyCompo2FR} /10</td></tr>
            </table>
        </div>
    </c:if>
    <c:if test="${bulletin.semestre eq '3eme_Composition'}">
        <br>
        <div class="infos">
            <table>
                <tr>
                    <th colspan="2">Décision du Conseil des Maitres</th>
                </tr>
                <tr>
                    <td>Admis(e) en classe supérieure</td>
                    <td style="color: white">textetexte</td>
                </tr>
                <tr>
                    <td>Autoriser à redoubler</td>
                    <td>&nbsp</td>
                </tr>
                <tr>
                    <td>Exclusion</td>
                    <td>&nbsp</td>
                </tr>
            </table>
            <br>

            <table>
                <tr>
                    <th>Récapitulation</th>
                </tr>
                <tr><td>1er Trimestre : ${bulletin.moyCompo1FR} /10<br>
                        2e Trimestre : ${bulletin.moyCompo2FR} /10 <br>
                        3e Trimestre : ${bulletin.moyCompo3FR} /10<br>
                        Moy. Génerale :${bulletin.moyCompo1FR+bulletin.moyCompo2FR+bulletin.moyCompo3FR div 3}</td></tr>
            </table>
        </div>
    </c:if>
    <br>
    <c:choose>
        <c:when test="${bulletin.ens eq 'Francais'}">
            <div class="infos">
                <div style="font-weight: bold;text-decoration: underline;">Le Maitre :</div>
                <div style="font-weight: bold;text-decoration: underline;">Le Directeur :</div>
            </div>

        </c:when>
        <c:otherwise>
            <div class="infos">
                <div style="font-weight: bold;text-decoration: underline;">سيد:</div>
                <div style="font-weight: bold;text-decoration: underline;">مدير:</div>
            </div>

        </c:otherwise>
    </c:choose>
    <style media="print">
        #pasaffiche{
            visibility: hidden;
        }
    </style>
    <a id="pasaffiche" href="javascript:print()">Imprimer</a>
</body>
</html>
