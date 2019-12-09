<%-- 
    Document   : modificationEleve
    Created on : 2 août 2018, 23:35:53
    Author     : Moussa Joseph Sarr
--%>

<%@page import="model.Eleve"%>
<%@page import="java.util.ArrayList"%>
<html>
    <head>
        <title>Modifier élève</title>
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
        <div class="container">
            <div class="row">
                <h1>Modifier élève</h1>

                <form action="ControleurDirecteur" method="POST">
                    <input type="hidden" name="action" value="valideModEleve" />
                    <input type="hidden" name="idLog" value="${eleve.getLogin()}"/>
                    <input type="hidden" name="year" value="${year}"/>
                    <div class="col-lg-12">
                        <div class="col-lg-4"></div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>Classe</label>
                                <select name="nomClasse" class="form-control">
                                    <c:forEach var="p" items="${classes}">
                                        <c:choose>
                                            <c:when test="${p eq eleve.getNomClasse()}">
                                                <option selected >${p}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>${p}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                </select>
                            </div>
                            <div class="form-group">
                                <label>Nom</label>
                                <input type="text" name="nom" value="${eleve.getNom()}" class="form-control" />
                            </div>

                            <div class="form-group">
                                <label>Prénom</label>
                                <input type="text" name="prenom" value="${eleve.getPrenom()}" class="form-control" />
                            </div>

                            <div class="form-group">
                                <label>Adresse</label>
                                <input type="text" name="adresse" value="${eleve.getAdresse()}" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label>Téléphone</label>
                                <input type="text" name="tel" value="${eleve.getTel()}" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label>Date de naissance </label>
                                <input type="date" name="dateNaissance" value="${eleve.getDateNaissance()}" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label>Lieu de Naissance</label>
                                <input type="text" name="lieuNaissance" value="${eleve.getLieuNaissance()}" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-success btn-block " type="submit">Inscrire</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%> 

    </div>
</body>
</html>
