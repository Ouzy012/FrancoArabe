<%-- 
    Document   : accueilDirecteur
    Created on : 25 juin 2019, 18:47:28
    Author     : Ouzy NDIAYE
--%>

       
        <title>Acceuil Directeur</title> 
    </head>
    <body>
        <%if (session.getAttribute("log") != null) {

        %>
        <!--///////////////////////////////////////////////////////////////// -->
        <%@include file="barre_navDirector.jsp" %> 
        <!--///////////////////////////////////////////////////////////////// -->
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%>
    </body>
</html>
