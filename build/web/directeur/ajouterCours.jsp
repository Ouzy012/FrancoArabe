<%-- 
    Document   : ajouterCours
    Created on : 30 mai 2019, 17:41:11
    Author     : Ouzy NDIAYE
--%>

<!DOCTYPE html>
<html>
    <head>        
        <title>${profils} | Ajouter Cours</title> 
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barre_navDirector.jsp" %>
        <!--////////////////////////////////////////////////////// -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="titre">Ajouter cours pour la ${nomClasse}</p>
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">                    
                        <form method="POST" action="EDT">
                            <input type="hidden" name="connect" value="valider-ajout"/>
                            <input type="hidden" name="heure" value="${heure}"/>
                            <input type="hidden" name="jour" value="${jour}"/>
                            <input type="hidden" name="regime" value="${regime}"/>
                            <input type="hidden" name="nomClasse" value="${nomClasse}"/>
                            <div class="form-group">
                                <label>Matière</label>
                                <select class="form-control" name="nomMatiere" required> 
                                    <c:forEach var="mt" items="${listMatiere}">
                                        <option value="${mt}">${mt}</option>                            
                                    </c:forEach>                        
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Sélectionner un professeur</label>
                                <select class="form-control" name="nomProf" required> 
                                    <c:forEach var="cl" items="${listerProf}">
                                        <option value="${cl.nom}///${cl.login}">
                                            ${cl.nom}
                                        </option>                            
                                    </c:forEach>                        
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Sélectionner une salle de cours</label>
                                <select class="form-control" name="nomSalle" required> 
                                    <c:forEach var="cl" items="${listSalle}">
                                        <option value="${cl}">
                                            ${cl}
                                        </option>                            
                                    </c:forEach>                        
                                </select>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-success btn-block" type="submit">Ajouter</button>
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
