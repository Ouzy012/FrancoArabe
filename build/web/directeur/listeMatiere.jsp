<%-- 
    Document   : listeMatiere
    Created on : 26 juin 2019, 00:04:25
    Author     : Moussa Joseph D Sarr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste des matières</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>

        <c:choose>
            <c:when test="${profils eq 'Directeur'}">
                <%@include file="barre_navDirector.jsp" %>
            </c:when>
            <c:otherwise>
                <%@include file="../surveillant/barreNavSurv.jsp" %>
            </c:otherwise>
        </c:choose>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 style="text-align: center;">Listes de toutes les matières étudiées</h3>
                </div>
                <div class="col-lg-12">                                
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">Liste des matières Arabe</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <td>Matières</td>
                                            <td>’شفهثقث</td>
                                            <c:if test="${profils eq 'Directeur'}">
                                                <td>Modifier</td>
                                                <td>Supprimer</td> 
                                            </c:if>                       
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <td>Matières</td>
                                            <td>’شفهثقث</td>
                                            <c:if test="${profils eq 'Directeur'}">
                                                <td>Modifier</td>
                                                <td>Supprimer</td> 
                                            </c:if>  
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="ar" items="${arabe}">
                                            <tr>       
                                                <td style="width:8vw;">${fn:substringBefore(ar.nomEnFrancais, ':Arabe' )}</td>
                                                <td>${ar.nomEnArabe}</td>
                                                <c:if test="${profils eq 'Directeur'}">
                                                    <td><a href="ControleurDirecteur?action=updateMatAr&&nomEnAr=${ar.nomEnArabe}&&nomEnFrancais=${fn:substringBefore(ar.nomEnFrancais, ':Arabe' )}">
                                                            <img src="modifier.png" style="height: 4vh;"></a></td>
                                                    <td>
                                                        <a onclick="javascript: return confirmation();" href="ControleurDirecteur?action=supprimerMat&&nom=${ar.nomEnFrancais}">
                                                            <img src="delete.png" style="height: 4vh;"/>
                                                        </a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">
                                Liste des matières Françaises
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Matières</th>
                                            <th>Langues Enseignées</th>
                                                <c:if test="${profils eq 'Directeur'}">
                                                <th>Modifier</th>
                                                <th>Supprimer</th>
                                                </c:if>                      
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Matières</th>
                                            <th>Langues Enseignées</th>
                                                <c:if test="${profils eq 'Directeur'}">
                                                <th>Modifier</th>
                                                <th>Supprimer</th>
                                                </c:if> 
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="mf" items="${matFrancais}">
                                            <tr>       
                                                <td style="width:8vw;">${fn:substringBefore(mf, ':Francais' )}</td>
                                                <td>Français</td>
                                                <c:if test="${profils eq 'Directeur'}">
                                                    <td><a href="ControleurDirecteur?action=updateMatFr&&nomMat=${fn:substringBefore(mf, ':Francais')}">
                                                            <img src="modifier.png" style="height: 4vh;"/>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a onclick="javascript: return confirmation();" href="ControleurDirecteur?action=supprimerMat&&nom=${mf}">
                                                            <img src="delete.png" style="height: 4vh;"/>
                                                        </a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>  
                </div>
            </div>
        </div>       
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%> 
    </body>
</html>
<script>
    function confirmation() {
        var code = "Voulez vous vraiment supprimer cette matière ?\
    ";
        var msg = confirm(code);
        if (msg) {
            return true;
        } else {
            return false;
        }
    }
</script>