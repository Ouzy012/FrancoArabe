<%-- 
    Document   : accueilEDT
    Created on : 30 mai 2019, 15:19:02
    Author     : Ouzy NDIAYE
--%>


        <title>${profils} | Emploi du temps</title> 
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barre_navDirector.jsp" %> 
        <!--////////////////////////////////////////////////////// -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="titre">Veuillez sélectionner une classe</p>
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <form method="POST" action="EDT">

                            <input type="hidden" name="action" value="creerEDT"/>
                            <input type="hidden" name="action" value="afficherEDTClasse"/>
                            <div class="form-group">
                                <label>Sélectionner une classe</label>
                                <select class="form-control" name="nomClasse"> 
                                    <c:forEach var="cl" items="${listClasse}">
                                        <option value="${cl.nomClasse}">${cl.nomClasse}</option>                             
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
        <jsp:forward page="../connexion/login.jsp"/>
        <% }%>
    </body>
</html>
