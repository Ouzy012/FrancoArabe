<%-- 
    Document   : modificationSurv
    Created on : 27 juin 2019, 03:18:34
    Author     : Moussa Joseph D Sarr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier surveillant</title>
    </head>
    <body>
       
        <%            if (session.getAttribute("log") != null) {

        %>
       
                <%@include file="barre_navDirector.jsp"  %>
         


        <h3 style="text-align: center;">Modifier Surveillant</h3>
        <div class="container-fluid">
            <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <form action="ControleurDirecteur" method="POST">
                            <input type="hidden" name="action" value="valideModSurv" />
                            <input type="hidden" name="idPerson" value="${usr.idPersonne}" />

                            <div class="form-group">
                                <label>Nom</label>
                                <input type="text" name="nom" value="${usr.nom}" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label>Prénom</label>
                                <input type="text" name="prenom" value="${usr.prenom}" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label>Adresse</label>
                                <input type="text" name="adresse" value="${usr.adresse}" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label>Téléphone</label>
                                <input type="text" name="telephone" value="${usr.telephone}" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-success btn-block " type="submit">Modifier</button>
                            </div>
                    </div>
                </div>
            </div>

        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%> 
    </body>
</html>
