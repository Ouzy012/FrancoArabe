<%-- 
    Document   : rechercheParent
    Created on : 31 oct. 2018, 12:44:17
    Author     : ibrah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="dist/css/bootstrap.css" rel="stylesheet"/>
        <link href="dist/css/mystyle.css" rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <title>Recherche</title>
    </head>
    <body>
        <%
            if (session.getAttribute("login") != null) {

        %>
        <%@include file="menuParent.jsp" %>
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
                                <td>${i.prenom}</td>
                                <td>${i.nom}</td>
                                <td>${i.dateNaissance}</td>
                                <td>${i.lieuNaissance}</td>
                                <td>${i.nomClasse}</td>
                            </tr>    
                        </tbody>
                    </c:forEach> 
                </table>   
            </c:otherwise>
        </c:choose>
        <% } else {
        %>
        <jsp:forward page="acceuilParent.jsp"/>
        <% }%>
    </body>
</html>
