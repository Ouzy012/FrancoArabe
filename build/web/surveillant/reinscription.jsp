<%-- 
    Document   : reinscription
    Created on : 2 nov. 2018, 18:26:19
    Author     : Moussa Joseph Sarr
--%>
<html>
    <head>
        <title>Réinscription</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barreNavSurv.jsp" %>
        <script>
            <c:if test="${!empty message1}">
            alert("Réinscription réussie !!!");
            </c:if>
            <c:if test="${!empty message2}">
            alert("La Réinscription a échoué !!!");
            </c:if>
            <c:if test="${!empty message3}">
            alert("Le login ne correspond à aucun éléve dans notre établissement!!");
            </c:if>
        </script>

        <div class="container">
            <div class="row">                
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <h3 style="text-align: center;">Réinscrire un élève</h3>
                    <form action="ControleurDirecteur" method="POST"> 
                        <input type="hidden" name="action" value="reinscription-form"/>


                        <div class="form-group">
                            <label>Login</label>
                            <input type="text" name="login" value="" class="form-control" required=""/>
                        </div>
                        <div class="form-group">
                            <label>Classe</label>
                            <select name="nomClasse" class="form-control" required="">
                                <c:forEach var="p" items="${classes}">
                                    <option>${p}</option>
                                </c:forEach>

                            </select>
                        </div>
                        <div class="form-group">
                            <label>Année scolaire</label>
                            <select name="annee" class="form-control" required="">
                                <c:forEach var="a" items="${annees}">
                                    <option>${a}</option> 
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <button class="btn btn-success btn-block " type="submit">Réinscrire</button>
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
