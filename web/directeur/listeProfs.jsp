<%-- 
    Document   : listeProfs
    Created on : 20 juil. 2018, 03:10:38
    Author     : Moussa Joseph Sarr
--%>

<%@page import="model.Professeur"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Liste des Professeurs de l'etablissement</title>
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
                    <c:if test="${empty profs}">
                        <h2>Aucun professeur n'est encore ajouté</h2>
                    </c:if>                                                                    

                    <c:if test="${!empty profs}">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">
                                    Liste des professeurs
                                </h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Nom</th>
                                                <th>Prénom</th>
                                                <th>Adresse</th>
                                                <th>Téléphone</th>
                                                    <c:if test="${profils eq 'Surveillant'}">
                                                    <th>Modifier</th>
                                                    </c:if>
                                                <th>Détails</th>                      
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Nom</th>
                                                <th>Prénom</th>
                                                <th>Adresse</th>
                                                <th>Téléphone</th>
                                                    <c:if test="${profils eq 'Surveillant'}">
                                                    <th>Modifier</th>
                                                    </c:if>
                                                <th>Détails</th> 
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach var="p" items="${profs}">
                                                <tr>
                                                    <td>${p.personne.nom}</td>
                                                    <td>${p.personne.prenom}</td>
                                                    <td>${p.personne.adresse}</td>
                                                    <td>${p.personne.tel}</td>

                                                    <c:if test="${profils eq 'Surveillant'}">
                                                        <td>
                                                            <!--<button class="btn btn-success">-->
                                                            <a href="ControleurDirecteur?action=modifierProf&&idProf=${p.personne.idPersonne}">
                                                                <img style="width: 30px; height: 30px;" src="modifier.png" alt="Modifier" id="modifier"/>
                                                            </a>
                                                            <!--</button>-->
                                                        </td>
                                                    </c:if>
                                                    <td style="text-align: center;">
                                                        <a class="bouton_table btn btn-success" href="ControleurDirecteur?action=detailProf&&idProf=${p.personne.idPersonne}">
                                                            Détails
                                                        </a>
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
        <jsp:forward page="../connexion/login.jsp"/>
        <% }%>  
    </body>
</html>
<script type="text/javascript">
    function confirmation() {
        var msg = confirm("Voulez-vous vraiment supprimer ce professeur");
        if (msg) {
            return true;
        } else {
            return false;
        }
    }
</script>