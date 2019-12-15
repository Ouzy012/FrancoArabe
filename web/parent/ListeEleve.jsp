<%-- 
    Document   : parentForm
    Created on : 12 déc. 2019, 22:40:42
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>${profils}</title> 
</head>
<body>
    <%            if (session.getAttribute("log") != null) {

    %>
    <%@include file="barreNavParent.jsp" %>  

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">
                            Liste de vos enfants 
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th scope="col" style="text-align: center">Nom</th>
                                        <th scope="col" style="text-align: center">Prenom</th>
                                        <th scope="col" style="text-align: center">Classe</th> 
                                        <th scope="col" style="text-align: center">Action</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th scope="col" style="text-align: center">Nom</th>
                                        <th scope="col" style="text-align: center">Prenom</th>
                                        <th scope="col" style="text-align: center">Classe</th>
                                        <th scope="col" style="text-align: center">Action</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <c:forEach var="m" items="${listeEleve}">
                                        <tr>                                                                   
                                            <td style="text-align: center">
                                                ${m.nom}
                                                <input type="hidden" name="nom" value="${m.nom}"/>
                                            </td> 
                                            <td style="text-align: center">
                                                ${m.prenom}
                                                <input type="hidden" name="prenom" value="${m.prenom}"/>
                                            </td> 
                                            <td style="text-align: center">
                                                ${m.nomClasse}
                                                <input type="hidden" name="nomClasse" value="${m.nomClasse}"/>
                                            </td>
                                            <td><a class="btn btn-success" href="ControleurParent?action=eleveparent&loginEleve=${m.login}">
                                                    Voir</a>
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
    <!--///////////Fin/////////////// -->
    <% } else {
    %>
    <jsp:forward page="vue/SeConnecter.jsp"/>                                                    
    <% }%>
</body>
</html>
