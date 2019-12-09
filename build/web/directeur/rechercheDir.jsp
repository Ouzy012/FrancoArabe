<%-- 
    Document   : rechercheDir
    Created on : 5 nov. 2018, 15:23:39
    Author     : ibrah
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Rechercher</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {
        %>
        <%@include file="barre_navDirecteur.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-9">
                        <c:choose >
                            <c:when test="${empty rechercheParElev}">
                                <h1>${message}</h1>
                            </c:when>
                            <c:otherwise>
                                <table class="table table-bordered" id="tab1">
                                    <thead>
                                        <tr>
                                            <th scope="col" id="entete">Prénom</th>
                                            <th scope="col" id="entete">Nom</th>
                                            <th scope="col" id="entete">Date de Naissance</th>
                                            <th scope="col" id="entete">Lieu de Naissance</th>
                                            <th scope="col" id="entete">Classe</th>
                                        </tr>
                                    </thead>

                                    <c:forEach var="i" items="${rechercheParElev}">

                                        <tbody>
                                            <tr>
                                                <td id="entete">${i.prenom}</td>
                                                <td id="entete">${i.nom}</td>
                                                <td id="entete">${i.dateNaissance}</td>
                                                <td id="entete">${i.lieuNaissance}</td>
                                                <td id="entete">${i.classe}</td>
                                            </tr>    
                                        </tbody>
                                    </c:forEach> 
                                </table>   
                            </c:otherwise>
                        </c:choose>
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
