<%-- 
    Document   : acceuil
    Created on : 24 juil. 2018, 10:57:33
    Author     : ibrah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta  charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="dist/css/bootstrap.css" rel="stylesheet"/>
        <link rel="stylesheet" href="dist/css/mystyle.css" />
        <link rel="stylesheet" type="text/css" href="Style/style1.css">
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <title>Espace Parent</title> 
    </head>
    <body>
        <%
            if (session.getAttribute("login") != null) {

        %> 
        <div class="row navigation" block0>
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="nav">
                <div class="navbar-header">
                    <img class="taille_img" src="Image/log.png" alt="Ecole"/>
                    <a class="sunu_ecole" href="accueilPar.jsp">Ecole Franco-Arabe El Hadji Amadou Lamine Diene</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-exemple-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li id="nom">${nom}&nbsp;${prenom}</li>
                     <form action="Controleur" method="post" class="navbar-form navbar-right"/>
                    <input type="hidden" name="action" value="rechercherParent" />
                    <div class="searchBox">
                        <input type="text" name="recherche" class="form-control recherche" placeholder="Rechercher nom"/>
                        <button class="btn" type="submit"><img src="vue/search.png" id="btn_search"/></button>
                    </div>
                    </form>   
                    </ul> 
                </div>
            </nav>
        </div>
        <div class="menu-verticale">
            <div class="menuDir">
                <ul>
                    <li><a href="accueilPar.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;&nbsp;Home</a></li>
                    <li><a href="Controleur?login=${login}&mdp=${mdp}&action=parentLien"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;&nbsp;Lister Elève</a></li>
                    <li><a href="Controleur?login=${login}&mdp=${mdp}&action=compteParent"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;Compte</a></li>
                    <li><a href="Controleur?action=deconnectionParent"><span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;&nbsp;Se Deconnecter</a></li>
                </ul>
            </div>
        </div>
        <div class="corpsPar">

        </div>



        <script type="text/javascript" src="dist/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="dist/js/bootstrap.js"></script>
        <script type="text/javascript" src="dist/js/myscript.js"></script>

        <% } else {
        %>
        <jsp:forward page="acceuilParent.jsp"/>
        <% }%> 
    </body>
</html>
