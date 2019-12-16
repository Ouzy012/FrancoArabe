<%-- 
    Document   : listeSurv
    Created on : 27 juin 2019, 03:04:01
    Author     : Moussa Joseph D Sarr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${profils} | Liste des surveillants</title>
    </head>
    <body>
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
        <c:if test="${! empty users}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">
                                Liste des surveillants
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Nom</th>
                                            <th>Prénom</th>
                                            <th>Adresse</th>
                                            <th>Téléphone</th>
                                                <c:if test="${profils eq 'Directeur'}">
                                                <th>Modifier</th>
                                                <th>Supprimer</th>
                                                </c:if>                      
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Nom</th>
                                            <th>Prénom</th>
                                            <th>Adresse</th>
                                            <th>Téléphone</th>
                                                <c:if test="${profils eq 'Directeur'}">
                                                <th>Modifier</th>
                                                <th>Supprimer</th>
                                                </c:if> 
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="u" items="${users}">
                                            <tr>
                                                <td>${u.nom}</td>
                                                <td>${u.prenom}</td>
                                                <td>${u.adresse}</td>
                                                <td>${u.telephone}</td>
                                                <c:if test="${profils eq 'Directeur'}">
                                                    <td>
                                                        <a href="ControleurDirecteur?action=modifierSurv&&login=${u.login}">
                                                            <img style="width: 30px; height: 30px;" src="modifier.png" alt="Modifier" id="modifier"/>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a onclick="javascript: return confirmation();" href="ControleurDirecteur?action=supprimerSurv&&login=${u.login}">
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
        </c:if>
        <c:if test="${empty users}">
            <h3>Aucun(e) surveillant(e) n'a encore été ajouté</h3>
        </c:if>
        <% } else {
        %>
        <jsp:forward page="../connexion/login.jsp"/>
        <% }%>  
    </body>
</body>
</html>
<script>
    function confirmation() {
        var code = "Voulez vous vraiment supprimer le surveillant ?\
        ";
        var msg = confirm(code);
        if (msg) {
            return true;
        } else {
            return false;
        }
    }
</script>