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
                <%--  <h2 align="center">${message}</h2> --%>
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <h3 align="center">Veuillez renseigner les champs</h3>
                    <form action="Controleur" method="POST">
                        <input type="hidden" name="action" value="demandeMatClasseListe" />
                        <input type="hidden" name="login" value="${login}" />

                        <div class="form-group">
                            <label>Classe</label>
                            <select name="classe" class="form-control">
                                <c:forEach var="i" items="${listClasse2}">
                                    <option>${i}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Matière</label>
                            <select name="matiere" class="form-control">
                                <c:forEach var="i" items="${listMatiere2}">
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
                            <label>Année Scolaire</label>
                            <select name="annee" class="form-control">
                                <c:forEach var="i" items="${listAnnee2}">
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
