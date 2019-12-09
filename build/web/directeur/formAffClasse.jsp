<%-- 
    Document   : formAffClasse
    Created on : 21 févr. 2019, 14:19:26
    Author     : Moussa Joseph Sarr
--%>
<html>
    <head>        
        <title>Afficher Classe</title>
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

        <div class="container">
            <div class="row">
                    <div class="col-lg-4 col-md-6 mb-4"></div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <h3 style="text-align: center;">Afficher Classe</h3>
                        <form action="ControleurDirecteur" method="POST">
                            <input type="hidden" name="action" value="listerClasse" />
                            <div class="form-group">
                                <label>Nom classe</label>
                                <select name="nomClasse" class="form-control" required>
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

                            <div class="form-group">
                                <label>Année Scolaire</label>
                                <select name="year" class="form-control" required="">
                                    <c:forEach var="a" items="${annees}">                                        
                                        <c:choose>
                                            <c:when test="${a eq anInscr}">
                                                <option selected >${a}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>${a}</option>
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
