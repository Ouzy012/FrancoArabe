<%-- 
    Document   : formClasse
    Created on : 9 sept. 2018, 16:38:57
    Author     : Moussa Joseph Sarr
--%>

<!DOCTYPE html>
<html>
    <head>        
        <title>Enregistrer Classe</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barre_navDirector.jsp" %>

        <script>
            <c:if test="${!empty message}">
            alert("�chec de l'ajout de la Classe!");
            </c:if>
            <c:if test="${!empty mes}">
            alert("La Classe a �t� ajout�e avec succ�e!!");
            </c:if>
        </script>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-md-6 mb-4"></div>
                <div class="col-xl-5 col-md-6 mb-4">
                    <h2>Enregistrer une classe</h2>
                    <form action="ControleurDirecteur" method="POST">
                        <input type="hidden" name="action" value="validerClasse" />
                        <div class="form-group">
                            <label>Nom classe</label>
                            <input type="text" name="nomClasse" class="form-control form-control-user" required>
                        </div>

                        <div class="form-group">
                            <label>Mati�res Francais</label>
                            <select name="matFrancais" multiple="multiple" class="form-control">
                                <c:forEach var="m" items="${matFrancais}">
                                    <option>${fn:substringBefore(m, ':Francais' )}</option> 
                                </c:forEach>
                            </select>
                            <p>
                                S�lectionnner seulement les mati�res francaises
                            </p>
                        </div>


                        <div class="form-group">
                            <label>Mati�res Arabes</label>
                            <select name="matArabe" multiple="multiple" class="form-control">
                                <c:forEach var="m" items="${arabe}">
                                    <option>${m.nomEnArabe}</option> 
                                </c:forEach>
                            </select>
                            <p>
                                S�lectionnner seulement les mati�res arabes 
                            </p>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-success btn-block " type="submit">Enregistrer</button>
                        </div>                     

                    </form>
                </div>
            </div>
        </div>
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%> 
    </body>
</html>
