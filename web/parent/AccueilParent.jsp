<%-- 
    Document   : AccueilParent
    Created on : 12 déc. 2019, 21:50:48
    Author     : mac
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
        <%@include file="barreNavParent.jsp" %>
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
