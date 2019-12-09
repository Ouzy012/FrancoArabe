<%-- 
    Document   : detailProf
    Created on : 11 oct. 2018, 18:58:25
    Author     : Moussa Joseph Sarr
--%>

<!DOCTYPE html>
<html>
    <head>        
        <title>Détail du professeur</title>
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
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">
                                Informations du professeur
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Classe</th>
                                            <th>Matière</th>
                                            <th>Année Scolaire</th>                      
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Classe</th>
                                            <th>Matière</th>
                                            <th>Année Scolaire</th> 
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="d" items="${detailProf}">
                                            <tr>
                                                <td>${d.nomClasse}</td>
                                                <c:choose>
                                                    <c:when test="${d.arabe.nomEnArabe != null}">
                                                        <td>${d.arabe.nomEnArabe}</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>${fn:substringBefore(d.arabe.nomEnFrancais, ':Francais' )}</td>
                                                    </c:otherwise>
                                                </c:choose>

                                                <td>${d.annee}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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
