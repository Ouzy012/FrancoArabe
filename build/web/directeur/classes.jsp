<%-- 
    Document   : classes
    Created on : 25 juin 2019, 22:31:22
    Author     : Moussa Joseph D Sarr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${profils} | Classes de l'établissement</title>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">Liste des classes de l'établissement</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Classe</th>
                                                <c:if test="${profils eq 'Directeur'}">
                                                <th>Modifier</th>
                                                <th>Supprimer</th>
                                                </c:if>                     
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Classe</th>
                                                <c:if test="${profils eq 'Directeur'}">
                                                <th>Modifier</th>
                                                <th>Supprimer</th>
                                                </c:if> 
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="c" items="${classes}">
                                            <tr>
                                                <td>
                                                    ${c}
                                                </td>    
                                                <c:if test="${profils eq 'Directeur'}">
                                                    <td>
                                                        <a href="ControleurDirecteur?action=updateClasse&&classe=${c}">
                                                            <img src="modifier.png" style="height: 4vh;">
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a onclick="javascript: return confirmation();" href="ControleurDirecteur?action=supprimerCl&&nomCl=${c}">
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
        <jsp:forward page="../connexion/login.jsp"/>
        <% }%> 
    </body>
</html>
<script>
    function confirmation() {
        var code = "Voulez vous vraiment supprimer cette classe ?\
    ";
        var msg = confirm(code);
        if (msg) {
            return true;
        } else {
            return false;
        }
    }
</script>
