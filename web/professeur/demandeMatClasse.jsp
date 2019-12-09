<%-- 
    Document   : demandeMatClasse
    Created on : 17 juil. 2018, 09:37:24
    Author     : ibrah
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Professeur</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barreNavProf.jsp" %>
        <div class="container">
            <div class="row">                
                <script>
                    <c:if test="${!empty message}">
                    alert("Veuillez vérifier les informations saisies");
                    </c:if>
                </script>

                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <h3 style="text-align: center;">Ajouter notes</h3>
                    <form action="Controleur" method="POST">
                        <input type="hidden" name="action" value="demandeMatClasse" />
                        <input type="hidden" name="login" value="${login}" />                        
                        <div class="form-group">
                            <label>Classe</label>
                            <select name="classe" class="form-control">
                                <c:forEach var="i" items="${listClasse}">
                                    <option>${i}</option>                                         
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Matière</label>
                            <select name="matiere" class="form-control">
                                <c:forEach var="i" items="${listMatiere}">
                                    <c:choose>
                                        <c:when test="${i.nomEnArabe != null}">
                                            <option>${i.nomEnArabe}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option>${i.nomEnFrancais}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Semestre</label>
                            <select name="semestre" class="form-control">
                                <option value="1ère_Composition">1ère Composition</option>
                                <option value="2eme_Composition">2nde Composition</option>
                                <option value="3eme_Composition">3ème Composition</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Année Scolaire</label>
                            <select name="annee" class="form-control">
                                <c:forEach var="i" items="${listAnnee}">
                                    <c:choose>
                                        <c:when test="${i eq anInscr}">
                                            <option selected >${i}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option>${i}</option>
                                        </c:otherwise>
                                    </c:choose> 
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-success btn-block " type="submit">Valider</button>
                        </div>
                </div>
                </form>
            </div>
        </div>
    <% } else {
    %>
    <jsp:forward page="../vue/SeConnecter.jsp"/>
    <% }%>
</body>
</html>
