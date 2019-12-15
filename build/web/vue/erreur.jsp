<%-- 
    Document   : erreur
    Created on : 7 juin 2019, 19:32:46
    Author     : Ouzy NDIAYE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Page d'erreur</title>
    </head>
    <body>
        
        <!--/////////////////////////////////////////// -->
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <p class="alert-danger" style="font-size: 25px;">
                Désolé!!!<br>
                Veuillez vous connectez d'abord<br>
                <a href="Controleur?action=connection">Cliquez ici pour vous connectez à nouveau</a>
            </p>
        </div>
        <!--/////////////////////////////////////////////// -->        
         
    </body>
</html>
