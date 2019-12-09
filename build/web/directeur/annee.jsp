<%-- 
    Document   : annee
    Created on : 15 nov. 2018, 22:51:43
    Author     : Moussa Joseph Sarr
--%>

<!DOCTYPE html>
<html>
    <head>        
        <title>Ann�e-Scolaire</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barre_navDirector.jsp" %>

        <script>
            <c:if test="${!empty msg}">
            alert("Veuillez revoir l'ann�e Scolaire saisi!");
            </c:if>
        </script>
        <script>
            <c:if test="${!empty er}">
            alert("Veuillez Changer d'ann�e; celle-ci a �t� d�j� ajout�e!");
            </c:if>
        </script>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-md-6 mb-4"></div>
                <div class="col-xl-4 col-md-6 mb-4">
                    <form action="ControleurDirecteur" method="Post">
                        <input type="hidden" name="action" value="ajoutAnnee">

                        <div class="form-group">
                            <label>Ajouter une nouvelle Ann�e Scolaire</label>
                            <input type="text" name="nv-annee" placeholder="format 2018-2019" maxlength="9" onkeypress=" return event.charCode >= 48 && event.charCode <= 57 || event.charCode === 45" class="form-control" required="">
                        </div>

                        <div class="form-group">
                            <button class="btn btn-success btn-block " type="submit">Ajouter</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>        

        <!--////////////////////////// -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">Liste des ann�es-scolaire</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Ann�e Scolaire</th>                      
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Ann�e Scolaire</th> 
                            </tr>
                        </tfoot>
                        <tbody>
                            <c:forEach var="p" items="${annees}">
                                <tr> 
                                    <td>${p}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%>  
    </body>
</html>
