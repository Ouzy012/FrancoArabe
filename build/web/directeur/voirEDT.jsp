<%-- 
    Document   : voirEDT
    Created on : 31 mai 2019, 00:11:09
    Author     : Ouzy NDIAYE
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>${profils} | Voir EDT</title> 
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>
        <%@include file="../directeur/barre_navDirector.jsp" %> 
        <!--////////////////////////////////////////////////////// -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="titre">Veuillez sélectionner une classe</p>
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <form method="POST" action="EDT">              
                            <input type="hidden" name="connect" value="afficherEDTClasse"/>
                            <div class="form-group">
                                <label>Sélectionner une classe</label>
                                <select class="form-control" name="nomClasse"> 
                                    <c:forEach var="cl" items="${listClasse}">
                                        <option value="${cl.nomClasse}///${cl.regime}">${cl.nomClasse} (${cl.regime})</option>                             
                                    </c:forEach>                     
                                </select>                    
                            </div>
                            <div class="form-group">
                                <button class="btn btn-success btn-block" type="submit">Valider</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--////////////////////////////////////////////////////// -->
        <% } else {
        %>
        <jsp:forward page="vue/SeConnecter.jsp"/>
        <% }%>
    </body>
</html>

