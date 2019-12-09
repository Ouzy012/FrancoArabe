<%-- 
    Document   : listerNote
    Created on : 23 juil. 2018, 14:50:45
    Author     : ibrah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Professeur</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barreNavProf.jsp" %>
        <script>
            <c:if test="${!empty msgOk}">
            alert("La note a été modifiée avec succès!!!");
            </c:if>
        </script>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">Liste des années-scolaire</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                                    <thead>
                                        <tr>
                                            <th>Prénom</th>
                                            <th>Nom</th>
                                            <th>Composition</th>
                                            <th>Note</th>
                                            <th>Modifier</th>                      
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Prénom</th>
                                            <th>Nom</th>
                                            <th>Composition</th>
                                            <th>Note</th>
                                            <th>Modifier</th> 
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="i" items="${eleve}">
                                        <tbody>
                                            <tr>
                                                <c:if test="${i.composition ne 0}">
                                                    <td>${i.prenom}</td>
                                                    <td>${i.nom}</td>
                                                    <td>

                                                        <c:if test="${i.semestre eq '1ère_Composition'}">
                                                            1ère Composition
                                                        </c:if>
                                                        <c:if test="${i.semestre eq '2eme_Composition'}">
                                                            2nde Composition
                                                        </c:if>
                                                        <c:if test="${i.semestre eq '3eme_Composition'}">
                                                            3ème Composition
                                                        </c:if>


                                                    </td>
                                                    <td>${i.composition}</td>
                                                    <td>
                                                        <a href="Controleur?action=modifier&prenom=${i.prenom}&nom=${i.nom}&composition=${i.composition}&loginEleve=${i.matriculeEleve}&matiere=${i.matiere}&semestre=${i.semestre}&annee=${i.annee}&classe=${i.classe}">
                                                            <img style="width: 30px; height: 30px;" src="modifier.png" alt="Modifier" id="modifier"/>
                                                        </a>
                                                    </td>
                                                </c:if>
                                            </tr>    
                                        </tbody>
                                    </c:forEach> 
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <% } else {
                %>
                <jsp:forward page="vue/SeConnecter.jsp"/>
                <% }%>
                </body>
                </html>
