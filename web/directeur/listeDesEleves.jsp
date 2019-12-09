<%-- 
    Document   : listeDesEleves
    Created on : 8 juil. 2019, 16:56:51
    Author     : Ouzy NDIAYE
--%>

<html>
    <head>
        <title>liste ${nomCl}</title>
    </head>
    <body>

        <%            if (session.getAttribute("log") != null) {
        %>
        <%@include file="barre_navDirector.jsp" %>
        <script>
            <c:if test="${!empty msgOk}">
            alert("Payement effectué avec succès");
            </c:if>
        </script>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">
                                Liste des élèves de la classe ${nomCl}
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
                                            <th>Détails</th>                      
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Prénom</th>
                                            <th>Nom</th>
                                            <th>Date de Naissance</th>
                                            <th>Lieu de Naissance</th>
                                            <th>Détails</th> 
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
                                        <a class="btn btn-success btn-block" href="ControleurDirecteur?action=detailMensuel&login=${e.login}&nomClasse=${nomCl}&anneeSco=${an}">
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
                </div>
            </div>
        </div>

        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%>  
    </body>
</html>


