<%-- 
    Document   : mensualite
    Created on : 20 mai 2019, 21:43:10
    Author     : Ouzy NDIAYE
--%>

<head>
    <title>${profils} - Mensualité</title>
</head>
<body>
    <%            if (session.getAttribute("log") != null) {

    %>
    <%@include file="barre_navComptable.jsp" %> 
    <c:if test="${(! empty classes) && (empty eleves)}">
        <script>
            <c:if test="${! empty payementReussit}">
            alert("Payement effectué avec success");
            </c:if>
        </script>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">
                                Mensualité
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">Nom classe</th>
                                            <th style="text-align: center;">Action</th>                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th style="text-align: center;">Nom classe</th>
                                            <th style="text-align: center;">Action</th> 
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="cl" items="${classes}">
                                            <tr>
                                                <td style="text-align: center;">${cl}</td>
                                                <td style="text-align: center;">
                                                    <a class="btn btn-success" href="Comptable?action=choixClasse&nomClasse=${cl}">
                                                        Voir la classe
                                                    </a>
                                                </td>                                            
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
    </c:if>

    <!--///////////Fin Liste Classe Privee/////////////// -->
    <!--///////////Liste des eleves de la classe X/////////////// -->
    <c:if test="${!empty eleves}">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">
                            Liste des élèves de la classe de ${nomClasse}
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <form method="POST" action="Comptable">
                                <input type="hidden" name="action" value="payerMensuel"/>
                                <input type="hidden" name="nomClasse" value="${nomClasse}"/>  
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="text-align: center">Prénom</th>
                                            <th scope="col" style="text-align: center">Nom</th>
                                            <th scope="col" style="text-align: center">Date de Naissance</th>
                                            <th scope="col" style="text-align: center">Lieu de Naissance</th>
                                            <th scope="col" style="text-align: center">Action</th>                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th scope="col" style="text-align: center">Prénom</th>
                                            <th scope="col" style="text-align: center">Nom</th>
                                            <th scope="col" style="text-align: center">Date de Naissance</th>
                                            <th scope="col" style="text-align: center">Lieu de Naissance</th>
                                            <th scope="col" style="text-align: center">Action</th> 
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="cl" items="${eleves}">
                                            <tr>
                                                <td style="text-align: center">${cl.prenom}</td>                                    
                                                <td style="text-align: center">${cl.nom}</td>
                                                <td style="text-align: center">${cl.dateNaissance}</td>
                                                <td style="text-align: center">${cl.lieuNaissance}</td>
                                        <input type="hidden" name="login" value="${cl.login}"/>

                                        <td><button class="btn btn-success btn-block" type="submit">Voir élève</button></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>                    
            </div>
        </div>
    </div>            
            </c:if>

        </div>
    </div>
    <!--///////////Fin Liste des eleves de la classe X/////////////// -->
    <% } else {
    %>
    <jsp:forward page="vue/SeConnecter.jsp"/>                                                    
    <% }%>
</body>
</html>
