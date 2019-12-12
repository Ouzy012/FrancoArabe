<%-- 
    Document   : accueilComptable
    Created on : 12 déc. 2019, 12:04:13
    Author     : Ouzy NDIAYE
--%>

<title>${profils} -- Acceuil</title> 
</head>
<body>
    <%if (session.getAttribute("log") != null) {
    %>

    <!--//////////////////////////////////////////// -->
    <%@include file="barre_navComptable.jsp" %>
    <!--//////////////////////////////////////////// -->

    <% } else {
    %>
    <jsp:forward page="../connexion/login.jsp"/>
    <% }%>
</body>
</html>
