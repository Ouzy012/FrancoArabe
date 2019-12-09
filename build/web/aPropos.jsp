<%-- 
    Document   : aPropos
    Created on : 6 déc. 2018, 11:57:59
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
        <title>A Propos</title>
    </head>
    <body>
        <div class="row navigation" block0>
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="nav">
                <div class="navbar-header">
                    <a class="sunu_ecole" href="accue.html">SUNU ECOLE</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-exemple-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right"> 
                        <li class="lien"><a href="accue.html"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;&nbsp;Home</a></li>
                    </ul>  
                </div>
            </nav>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 col-xs-12 doublet">
                    <h3 id="ap">Description du projet</h3>
                    <p id="para">
                        Pour pallier à tous les problèmes que rencontre les collèges dans la gestion des notes, nous avons eu l’idée de mettre en place une application
                        de gestion des évaluations pédagogiques autrement dit la plateforme web « SUNU
                        ECOLE » mise à la disposition des écoles (collèges). Les tâches de chaque intervenant
                        ont été bien prises en compte. Le Directeur, à la tête, se charge de créer et d’assurer le
                        suivi de l’ensemble des utilisateurs (les professeurs, les élèves, les parents). En plus, il a
                        la possibilité de visualiser l’ensemble des attributs des classes : les élèves, leurs notes,
                        leurs professeurs et leurs matières. Egalement, le Directeur confectionne les bulletins. Le
                        Professeur quant à lui peut voir la liste de ses élèves pour chaque classe qu’il a. Il est
                        chargé de renseigner la note de chaque élève de sa classe. L’élève aussi prend part à
                        l’application en visualisant l’ensemble de ses notes sur chaque matière et peut faire des
                        réclamations en cas d’erreur. Mais la plus grande innovation concerne l’existence du
                        portail parent dans l’application. Le Parent peut voir les notes de son enfant sur chaque
                        matière. Cependant la connexion à l’application requiert une authentification pour tous les acteurs.
                        L’Administrateur qui gère l’ensemble des comptes, intervient en cas de panne et assure
                        une gestion plus large et plus haute de l’application.
                    </p>
                </div>
                <div class="col-md-6 col-xs-12 doublet">
                    <h3 align="center">Objectif du projet</h3>
                    <p id="para">
                        Pour bien planifier un projet, il est important de définir ses objectifs. Les objectifs
                        définissent une démarche visant à organiser de bout en bout le bon déroulement du projet.
                        Ainsi comme objectifs de notre projet, nous allons :
                        Gérer, automatiser, sauvegarder les informations dans notre base de données beaucoup
                        plus structurer pour que les requêtes soient plus faciles et plus rapides.
                        Permettre à la direction et aux parents de suivre plus facilement l’évolution des élèves
                        en ayant accès aux résultats des différentes évaluations.
                        Donner aux professeurs la facilité d’insérer des notes à distance.
                        Permettre aux élèves de visualiser leur note et de réclamer si nécessaire.
                        De manière générale, Informatiser le travail dans le milieu éducatif afin d’avoir une
                        meilleure performance.
                    </p>
                </div>
            </div>
        </div>
        <div class="footer">
            <p>{2018}Université Alioune Diop de Bambey  Mémoire fin de cycle Licence  Designed by Ibrahim DATTE & Moussa Diégane SARR</p>
        </div>
    </body>
</html>
