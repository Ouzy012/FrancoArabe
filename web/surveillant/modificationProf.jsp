<%-- 
    Document   : modificationProf
    Created on : 8 août 2018, 14:05:37
    Author     : Moussa Joseph Sarr
--%>

<%@page import="model.Professeur"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modifier professeur</title>
    </head>
    <body>

        <%            if (session.getAttribute("log") != null) {

        %>
        <c:choose>
            <c:when test="${profils eq 'Directeur'}">
                <%--<%@include file="../../accueilDirecteur.jsp" %>--%>
            </c:when>
            <c:otherwise>
                <%@include file="barreNavSurv.jsp" %>
            </c:otherwise>
        </c:choose>


        <h1>Modifier professeur :</h1>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <form action="ControleurDirecteur" method="POST">
                            <input type="hidden" name="action" value="valideModProf" />
                            <input type="hidden" name="idPerson" value="${professeur.getPersonne().getIdPersonne()}" />

                            <div class="form-group">
                                <label>Nom</label>
                                <input type="text" name="nom" value="${professeur.getPersonne().getNom()}" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label>Prénom</label>
                                <input type="text" name="prenom" value="${professeur.getPersonne().getPrenom()}" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label>Adresse</label>
                                <input type="text" name="adresse" value="${professeur.getPersonne().getAdresse()}" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label>Téléphone</label>
                                <input type="text" name="tel" value="${professeur.getPersonne().getTel()}" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-success btn-block " type="submit">Modifier</button>
                            </div>
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
