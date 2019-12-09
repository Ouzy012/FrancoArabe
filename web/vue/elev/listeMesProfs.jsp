<%-- 
    Document   : listeMesProfs
    Created on : 27 août 2018, 14:14:07
    Author     : Moussa Joseph Sarr
--%>

<%@page import="modelTables.Personne"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <title>Mes Professeurs</title>
    </head>
    <body>
        <%
            if (session.getAttribute("log") != null) {
                ArrayList<Personne> profs = (ArrayList<Personne>) request.getAttribute("profs");
        %>
        <%@include file="../../eleve.jsp" %>
        <h1>Liste de Mes Professeurs : </h1>

        <table class="table table-bordered table-hover" id="tab1">
            <thead>
                <tr>
                    <th class="col" id="entete">Nom</th>
                    <th class="col" id="entete">Prénom</th>
                    <th class="col" id="entete">Adresse</th>
                    <th class="col" id="entete">Téléphone</th>
                    <th class="col" id="entete">Matière</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <c:forEach var="p" items="${profs}">
                    <tr>
                        <td>${p.nom}</td>
                        <td>${p.prenom}</td>
                        <td>${p.adresse}</td>
                        <td>${p.tel}</td>
                        <td>
                            <c:forEach var="m" items="${p.matiere}">
                                ${m  }
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>
                </tr>
            </tbody>
        </table>

        <% } else {
        %>
        <jsp:forward page="../SeConnecter.jsp"/>
        <% }%> 

    </body>
</html>

