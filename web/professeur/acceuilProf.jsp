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
        <%            if (session.getAttribute("log") != null) {

        %>         

        <!--///////////////////////////////// -->
        <%@include file="barreNavProf.jsp" %>
        <script>
            <c:if test="${!empty msg1}">
            alert("Photo de profil modifier avec success");
            </c:if>

            <c:if test="${!empty msg2}">
            alert("Photo de profil supprimer avec success");
            </c:if>
        </script>

        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%> 
    </body>
</html>
