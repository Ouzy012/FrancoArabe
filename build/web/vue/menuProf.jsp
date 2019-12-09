<%-- 
    Document   : menuProf
    Created on : 18 juil. 2018, 15:10:37
    Author     : ibrah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="dist/css/bootstrap.css" rel="stylesheet"/>
        <link href="dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="dist/css/bootstrap-theme.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="dist/css/mystyle.css" />
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <title>Professeur</title>
    </head>
    <body>
        <%
            if (session.getAttribute("log") != null) {
                
        %>
        <div class="container navigation">
            <div class="row navigation" block0>
                <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="nav">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="acceuil.html">SUNU ECOLE</a>
                    </div>
                    <div class="navbar-collapse collapse navbar-brand">
                        <ul class="nav navbar-nav">
                            <li id="lien"><a href="acceuilProf.jsp"><span class="glyphicon glyphicon-home"></span>Home</a></li>
                            <li id="lien"><a href="Controleur?login=${login}&action=ajoutNote">Ajouter Note</a></li>
                            <li id="lien"><a href="Controleur?login=${login}&action=Note">Liste Elève</a></li>
                            <li id="lien"><a href="Controleur?login=${login}&action=compte">Compte</a></li>
                            <li id="lien"><a href="Controleur?action=deconnection">Se Deconnecter</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>

      


        <script type="text/javascript" src="dist/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="dist/js/bootstrap.js"></script>
        <script type="text/javascript" src="dist/js/myscript.js"></script>
        <% } else {
        %>
        <jsp:forward page="vue/SeConnecter.jsp"/>
        <% }%>
    </body>
</html>
