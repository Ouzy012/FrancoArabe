<%-- 
    Document   : listeAnnee
    Created on : 19 nov. 2018, 14:58:13
    Author     : Moussa Joseph Sarr
--%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <title>Elève</title>
    </head>
    <body>
        <%
            if (session.getAttribute("log") != null) {

        %>
        <%@include file="../../eleve.jsp" %>
        <h1>Choisir l'année Scolaire :</h1>
        <table class="table table-hover" id="tab1">
            <c:forEach var="a" items="${annees}">
                <tr>
                    <td><a class="btn btn-success" href="ControleurEleve?annee=${a}&&action=anneeScolaire">${a}</a></td> 
                </tr>
 
            </c:forEach>
        </table>
        

        <%} else {
        %>
        <jsp:forward page="../SeConnecter.jsp"/>
        <% }%>  
    </body>
</html>
