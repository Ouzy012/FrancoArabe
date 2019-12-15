<<<<<<< HEAD
<%-- 
    Document   : Mensuel
    Created on : 20 mai 2019, 22:55:42
    Author     : Ouzy NDIAYE
--%>

<title>${profils}</title> 
</head>
<body>
    <%            if (session.getAttribute("log") != null) {

    %>
    <%@include file="barre_navComptable.jsp" %>  

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
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th scope="col" style="text-align: center">Mois</th>
                                        <th scope="col" style="text-align: center">Mensualité</th>
                                        <th scope="col" style="text-align: center">Action</th>                                          
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th scope="col" style="text-align: center">Mois</th>
                                        <th scope="col" style="text-align: center">Mensualité</th>
                                        <th scope="col" style="text-align: center">Action</th>  
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <c:forEach var="m" items="${listerMois}">
                                        <tr>                                                                   
                                            <td style="text-align: center">
                                                ${m.mois}
                                                <input type="hidden" name="mois" value="${m.mois}"/>
                                            </td> 
                                            <td style="text-align: center">${montant}</td>                             
                                            <c:if test="${m.statutMensuel eq '0'}">
                                                <td style="text-align: center">
                                                    <a class="btn btn-danger btn-block" href="Comptable?action=payer&login=${login}&nomClasse=${nomClasse}&mois=${m.mois}&montant=${montant}">
                                                        Payer
                                                    </a>
                                                </td>
                                            </c:if>

                                            <c:if test="${(m.statutMensuel eq '1') and (m.reliquat eq '0')}">
                                                <td style="text-align: center">                                    
                                                    <a class="btn btn-success btn-block" href="#">En règle</a>
                                                </td>                            
                                            </c:if>

                                            <c:if test="${(m.statutMensuel eq '1') and (m.reliquat ne '0')}">
                                                <td>                                    
                                                    <a class="btn btn-warning btn-block" href="Comptable?action=resteApayer&login=${login}&nomClasse=${nomClasse}&mois=${m.mois}&reliquat=${m.reliquat}">
                                                        Reste à payer</a>
                                                </td>                            
                                            </c:if>

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
    <!--///////////Fin/////////////// -->
    <% } else {
    %>
    <jsp:forward page="vue/SeConnecter.jsp"/>                                                    
    <% }%>
</body>
</html>
=======
<%-- 
    Document   : Mensuel
    Created on : 20 mai 2019, 22:55:42
    Author     : Ouzy NDIAYE
--%>

<title>${profils}</title> 
</head>
<body>
    <%            if (session.getAttribute("log") != null) {

    %>
    <%@include file="barre_navComptable.jsp" %>  

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
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th scope="col" style="text-align: center">Mois</th>
                                        <th scope="col" style="text-align: center">Mensualité</th>
                                        <th scope="col" style="text-align: center">Action</th>                                          
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th scope="col" style="text-align: center">Mois</th>
                                        <th scope="col" style="text-align: center">Mensualité</th>
                                        <th scope="col" style="text-align: center">Action</th>  
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <c:forEach var="m" items="${listerMois}">
                                        <tr>                                                                   
                                            <td style="text-align: center">
                                                ${m.mois}
                                                <input type="hidden" name="mois" value="${m.mois}"/>
                                            </td> 
                                            <td style="text-align: center">${montant}</td>                             
                                            <c:if test="${m.statutMensuel eq '0'}">
                                                <td style="text-align: center">
                                                    <a class="btn btn-success btn-block" href="Comptable?action=payer&login=${login}&nomClasse=${nomClasse}&mois=${m.mois}&montant=${montant}">
                                                        Payer
                                                    </a>
                                                </td>
                                            </c:if>

                                            <c:if test="${(m.statutMensuel eq '1') and (m.reliquat eq '0')}">
                                                <td style="text-align: center">                                    
                                                    <a class="btn btn-success btn-block">En règle</a>
                                                </td>                            
                                            </c:if>

                                            <c:if test="${(m.statutMensuel eq '1') and (m.reliquat ne '0')}">
                                                <td>                                    
                                                    <a class="btn btn-success btn-block" href="Comptable?action=resteApayer&login=${login}&nomClasse=${nomClasse}&mois=${m.mois}&reliquat=${m.reliquat}">
                                                        Reste à payer</a>
                                                </td>                            
                                            </c:if>

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
    <!--///////////Fin/////////////// -->
    <% } else {
    %>
    <jsp:forward page="vue/SeConnecter.jsp"/>                                                    
    <% }%>
</body>
</html>
>>>>>>> 338561ae5f92582b87dfb1e1d74bad69309d24c8
