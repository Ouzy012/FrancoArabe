<%-- 
    Document   : validerMensualite
    Created on : 21 mai 2019, 04:59:42
    Author     : Ouzy NDIAYE
--%>

<title>Acceuil</title> 
</head>
<body>
    <%            if (session.getAttribute("log") != null) {

    %>
    <%@include file="barre_navComptable.jsp" %> 
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-4"></div>
                <c:if test="${! empty payer}">
                    <script>
                        <c:if test="${! empty erreurMontantSaisi}">
                        alert("Le montant saisi ne doit être suppérieur au montant à payer");
                        </c:if>
                        <c:if test="${! empty erreurPayement}">
                        alert("Une erreur s'est produite lors du payement. Veuillez réessayer");
                        </c:if>

                    </script>

                    <div class="content">
                        <div class="container-fluid">                
                            <div class="row">                
                                <div class="col-md-12">                        
                                    <div class="header">
                                        <h4 class="title" style="text-align: center;">Payement mensualité</h4>
                                    </div>
                                    <!--<div class="card">-->
                                    <div class="content">
                                        <form action="Comptable" method="Post">
                                            <input type="hidden" name="connect" value="validerMensuel"/>
                                            <input type="hidden" name="login" value="${reglement}"/>
                                            <input type="hidden" name="nomClasse" value="${nomClasse}"/>
                                            <input type="hidden" name="montantApayer" value="${montantApayer}"/>
                                            <input type="hidden" name="moisMensuel" value="${moisMensuel}"/>
                                            <div class="row">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label>Montant</label>
                                                        <input type="text" name="montant" class="form-control" value="${montant}"  maxlength="7"
                                                               onkeypress=" return event.charCode >= 48 && event.charCode <= 57" required/>
                                                    </div>
                                                    <div class="form-group">
                                                        <button class="btn btn-success btn-block " type="submit">Valider</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:if>

                <!--//////Payer reliquat -->
                <c:if test="${! empty reliquat}">
                    <script>
                        <c:if test="${! empty msgErrorReliquat}">
                        alert("Le montant saisi ne doit être suppérieur au montant du reliquat");
                        </c:if>

                        <c:if test="${! empty erreurReliquat}">
                        alert("Une erreur s'est produite lors du payement. Veuillez réessayer");
                        </c:if>

                    </script>

                    <div class="content">
                        <div class="container-fluid">                
                            <div class="row">                
                                <div class="col-md-12">                        
                                    <div class="header">
                                        <h4 class="title" style="text-align: center;">Payement mensualité</h4>
                                    </div>
                                    <form method="Post" action="Comptable">
                                        <!--<div class="card">-->
                                        <div class="content">
                                            <input type="hidden" name="action" value="payerReliquat"/>
                                            <input type="hidden" name="login" value="${login}"/>
                                            <input type="hidden" name="nomClasse" value="${nomClasse}"/>
                                            <input type="hidden" name="montantReliquat" value="${montantReliquat}"/>
                                            <input type="hidden" name="moisMensuel" value="${moisMensuel}"/>
                                            <input type="hidden" name="montant" value="${montant}"/>
                                            <div class="form-group">
                                                <label >Montant</label>
                                                <input type="text" name="montantRecu" class="form-control" value="${montantReliquat}"  maxlength="7"
                                                       onkeypress=" return event.charCode >= 48 && event.charCode <= 57" required>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-success btn-block " type="submit">Valider</button>
                                            </div>

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>                    
                </c:if>
            </div>
        </div>
    </div>
    <!--///////////Fin/////////////// -->
    <% } else {
    %>
    <jsp:forward page="./connexion/login.jsp"/>                                                    
    <% }%>
</body>
</html>
