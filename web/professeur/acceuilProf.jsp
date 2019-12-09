<%-- 
    Document   : acceuil
    Created on : 24 juil. 2018, 10:57:33
    Author     : ibrah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Acceuil</title> 
    </head>
    <body>
        <%
            if (session.getAttribute("log") != null) {

        %>         

        <!--///////////////////////////////// -->
        <%@include file="barreNavProf.jsp" %>
        
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%> 
    </body>
</html>
