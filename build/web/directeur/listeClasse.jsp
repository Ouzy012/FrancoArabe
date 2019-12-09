<%-- 
    Document   : listeClasse
    Created on : 25 juil. 2018, 17:02:26
    Author     : Moussa Joseph Sarr
--%>

<%@page import="model.Eleve"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Liste des élèves de la classe</title>
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

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h2 style="text-align: center;">Liste de la Classe : ${nomCl} en ${an}</h2>
                </div>
                <div class="col-lg-12">                    
                    <form action="ControleurDirecteur" method="POST">
                        <input type="hidden" name="action" value="listerClasse" />
                        <div class="col-lg-3"></div>

                        <div class="col-lg-2">
                            <div class="form-inline">
                                <select name="nomClasse" class="form-control" required="">
                                    <c:forEach var="p" items="${classes}">
                                        <c:choose>
                                            <c:when test="${p eq nomCl}">
                                                <option selected >${p}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>${p}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <div class="form-inline">
                                <select name="year" class="form-control" required="">
                                    <c:forEach var="a" items="${annees}">
                                        <c:choose>
                                            <c:when test="${a eq an}">
                                                <option selected >${a}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>${a}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <div class="form-inline">
                                <button class="btn btn-success btn-block " type="submit">Valider</button>
                            </div>
                        </div>                        
                    </form>
                </div>       
            </div>
        </div>
                <br><br>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <c:if test="${empty eleves}">
                        <h2 style="text-align: center;" class="btn-warning">
                            Aucun élève n'est enregistrer dans la classe ${nomCl} 
                        </h2>
                    </c:if>
                    <c:if test="${!empty eleves}">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Liste de la classe</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Nom</th>
                                                <th>Prenom</th>
                                                <th>Adresse</th>
                                                <th>Date de Naissance</th>
                                                <th>Lieu de Naissance</th> 
                                                    <c:if test="${profils eq 'surveillant'}">
                                                    <th>Modifier</th>
                                                    </c:if> 
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Nom</th>
                                                <th>Prenom</th>
                                                <th>Adresse</th>
                                                <th>Date de Naissance</th>
                                                <th>Lieu de Naissance</th> 
                                                    <c:if test="${profils eq 'surveillant'}">
                                                    <th>Modifier</th>
                                                    </c:if> 
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach var="e" items="${eleves}">
                                                <tr>
                                                    <td>${e.nom}</td>
                                                    <td>${e.prenom}</td>
                                                    <td>${e.adresse}</td>
                                                    <td>${e.dateNaissance}</td>
                                                    <td>${e.lieuNaissance}</td>

                                                    <c:if test="${profils eq 'surveillant'}">
                                                        <td>
                                                            <a href="ControleurDirecteur?action=modifierElv&&nom=${e.login}&&year=${year}">
                                                                <img style="width: 30px; height: 30px;" src="modifier.png" alt="Modifier" id="modifier"/>
                                                            </a>
                                                        </td>
                                                    </c:if>
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

<script type="text/javascript">
    function confirmation() {
        var msg = confirm("tu veux supprimer cette ligne");
        if (msg) {
            return true;
        } else {
            return false;
        }
    }
</script>
