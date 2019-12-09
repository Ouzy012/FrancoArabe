<%-- 
    Document   : mensualite
    Created on : 8 juil. 2019, 15:48:35
    Author     : Ouzy NDIAYE
--%>

<html>
    <head>
        <title>Afficher Notes</title>
    </head>
    <body>

        <%            if (session.getAttribute("log") != null) {
        %>
        <%@include file="barre_navDirector.jsp" %>
         <div class="container">
            <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <h3 style="text-align: center;">Afficher Classe</h3>
                        <form action="ControleurDirecteur" method="POST">
                            <input type="hidden" name="action" value="mensuelClasse"/>
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

