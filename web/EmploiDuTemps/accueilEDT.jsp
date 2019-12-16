<%-- 
    Document   : accueilEDT
    Created on : 15 déc. 2019, 21:30:37
    Author     : Ouzy NDIAYE
--%>


<title>${profils}</title>
</head>
<body>
    <%            if (session.getAttribute("log") != null) {

    %>
    <%@include file="../directeur/barre_navDirector.jsp" %> 
    <!--////////////////////////////////////////////////////// -->
    <div class="container-fluid">
        <div class="row">            
            <div class="col-lg-4"></div>
            <div class="col-lg-4">        
                <h3 style="text-align: center;">Afficher les notes de la classe</h3>
                <form method="POST" action="EmploiDuTemps">
                    <input type="hidden" name="action" value="creerEDT"/>
                    <input type="hidden" name="action" value="afficherEDTClasse"/>
                    <div class="form-group">
                        <label>Classe</label>
                        <select name="nomClasse" class="form-control" required="">
                            <c:forEach var="cl" items="${listClasse}">
                                <option value="${cl.nomClasse}">${cl.nomClasse}</option>       
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


    <!--////////////////////////////////////////////////////// -->
    <% } else {
    %>
    <jsp:forward page="../connexion/login.jsp"/>
    <% }%>
</body>
</html>
