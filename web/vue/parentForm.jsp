<%-- 
    Document   : demandeMatClasse
    Created on : 17 juil. 2018, 09:37:24
    Author     : ibrah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="dist/css/bootstrap.css" rel="stylesheet"/>
        <link href="dist/css/mystyle.css" rel="stylesheet"/>
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <title>Portail Parent</title>
    </head>
    <body>
        <%
            if (session.getAttribute("login") != null) {

        %>
        <%@include file="menuParent.jsp" %>
        
            <table class="table table-bordered table-hover" id="tab1">
                <thead>
                <th class="col" id="entete">Prénom</th>
                <th class="col" id="entete">Nom</th>
                <th class="col" id="entete">Date Naissance</th>
                <th class="col" id="entete">Lieu Naissance</th>
                <th class="col" id="entete">Nom Classe</th>
                <th class="col" id="entete">Adresse</th>
                <th class="col" id="entete">Action</th>
                </thead>
                <tbody>
                    <c:forEach var="l" items="${listeEleve}">
                        <tr>
                            <td>${l.prenom}</td>
                            <td>${l.nom}</td>
                            <td>${l.dateNaissance}</td>
                            <td>${l.lieuNaissance}</td>
                            <td>${l.nomClasse}</td>
                            <td>${l.adresse}</td>
                            <td><a class="btn btn-success" href="Controleur?action=eleveparent&loginEleve=${l.login}">
                                    Voir</a>
                            </td>
                        </tr> 
                    </c:forEach>
                    
                </tbody>
            </table>

        <% } else {
        %>
        <jsp:forward page="acceuilParent.jsp"/>
        <% }%>
    </body>
</html>