<%-- 
    Document   : classeBulletin
    Created on : 16 oct. 2018, 16:48:31
    Author     : Moussa Joseph Sarr
--%>

<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bulletins</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {
        %>
        <%@include file="barreNavSurv.jsp" %>
        <div class="container">
            <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <h3 style="text-align: center;">Création du bulletin</h3>
                        <form method="POST" action="ControleurDirecteur">
                            <input type="hidden" name="action" value="bulletinClasse"/>

                            <div class="form-group">
                                <label>Choisir une classe</label>
                                <select name="nomClasse" class="form-control">
                                    <c:forEach var="p" items="${classes}">
                                        <option>${p}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Composition</label>
                                <select name="semestre" class="form-control">
                                    <option value="1ère_Composition">1ère Composition</option>
                                    <option value="2eme_Composition">2nde Composition</option>
                                    <option value="3eme_Composition">3ème Composition</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Enseignement</label>
                                <select name="ens" class="form-control">
                                    <option value="Francais">Français</option>
                                    <option value="Arabe">Arabe</option>
                                </select> 

                            </div>
                            <div class="form-group">
                                <label>Année-Scolaire</label>
                                <select name="annee" class="form-control">
                                    <c:forEach var="a" items="${annees}">
                                        <c:choose>
                                            <c:when test="${a eq anInscr}">
                                                <option selected >${a}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>${a}</option>
                                            </c:otherwise>
                                        </c:choose>  
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-success btn-block " type="submit">Valider</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%>  

    </body>
</html>
