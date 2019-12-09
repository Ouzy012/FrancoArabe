<%-- 
    Document   : accueilSurveillant
    Created on : 26 juin 2019, 11:24:15
    Author     : Ouzy NDIAYE
--%>

<!DOCTYPE html>
<html>
    <head>        
        <title>Acceuil Surveillant</title> 
    </head>
    <body>
        <%if (session.getAttribute("log") != null) {

        %>
        <!--///////////////////////////////////////////////////////////////// -->
        <%@include file="barreNavSurv.jsp" %> 
        <!--///////////////////////////////////////////////////////////////// -->
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%>
    </body>
</html>
