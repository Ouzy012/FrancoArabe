<%-- 
    Document   : listerNote
    Created on : 23 juil. 2018, 14:50:45
    Author     : ibrah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="dist/css/bootstrap.css" rel="stylesheet"/>
        <link href="dist/css/mystyle.css" rel="stylesheet"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <title>Modification</title>
    </head>
    <body>
        <%
            if (session.getAttribute("log") != null) {

        %>
        <%@include file="acceuil.jsp" %>
        <div>
            <form method="post" action="Controleur">
                <input type="hidden" name="action" value="modification"/>
                <input type="hidden" name="loginEleve" value="${loginEleve}"/>
                <input type="hidden" name="semestre" value="${semestre}"/>
                <input type="hidden" name="matiere" value="${matiere}"/>
                <input type="hidden" name="classe" value="${classe}"/>
                <input type="hidden" name="annee" value="${annee}"/>
                <table class="table table-bordered" id="tab1">
                    <thead>
                        <tr>
                            <th scope="col" id="entete">Prénom</th>
                            <th scope="col" id="entete">Nom</th>
                            <th scope="col" id="entete">Composition</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${prenom}</td>
                            <td>${nom}</td>
                            <td><input type="float" name="composition" value="${composition}"/></td>
                        </tr>    
                    </tbody>
                </table>
                <div id="btn">
                    <button class="btn-success">Valider</button>
                </div>
            </form>  
        </div>
        <% } else {
        %>
        <jsp:forward page="vue/SeConnecter.jsp"/>
        <% }%>
    </body>
</html>
