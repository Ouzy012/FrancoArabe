<%-- 
    Document   : affichageNote
    Created on : 12 août 2018, 01:47:41
    Author     : Moussa Joseph Sarr
--%>

<%@page import="model.Eleve"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Afficher Notes</title>
    </head>
    <body>

        <%            if (session.getAttribute("log") != null) {
        %>
        <c:choose>
            <c:when test="${profils eq 'Directeur'}">
                <%@include file="barre_navDirector.jsp" %>
            </c:when>
            <c:otherwise>
                <%@include file="../surveillant/barreNavSurv.jsp" %>
            </c:otherwise>
        </c:choose>

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <c:if test="${empty eleves}">
                        <div class="col-lg-3"></div>
                        <div class="col-lg-6">
                            <h3 class="btn-info" style="text-align: center;">
                                Les notes de la classe ${nomClasse} ne sont pas disponible
                            </h3>
                        </div>
                    </c:if>
                    <c:if test="${!empty eleves}">                        
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">
                                    Notes de la ${nomClasse} en
                                    <c:if test="${fn:contains(nomMatiere, ':Francais')}">
                                        Français : ${fn:substringBefore(nomMatiere,':Francais')}
                                    </c:if>

                                    <c:if test="${fn:contains(nomMatiere, ':Arabe')}">
                                        Arabe : ${ma}
                                    </c:if>
                                </h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Prénom</th>
                                                <th>Nom</th>
                                                <th>Date de Naissance</th>
                                                <th>Lieu de Naissance</th>
                                                <th>Composition</th>                     
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Prénom</th>
                                                <th>Nom</th>
                                                <th>Date de Naissance</th>
                                                <th>Lieu de Naissance</th>
                                                <th>Composition</th> 
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach var="e" items="${eleves}">
                                                <tr>
                                                    <td>${e.prenom}</td>
                                                    <td>${e.nom}</td>                       
                                                    <td>${e.dateNaissance}</td>
                                                    <td>${e.lieuNaissance}</td>
                                                    <td>
                                                        <c:choose><c:when test ="${e.composition == 0.0}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                ${e.composition}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%>  


    </body>
</html>
