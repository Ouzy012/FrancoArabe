<%-- 
    Document   : inscrire-eleve
    Created on : 8 mai 2019, 20:30:10
    Author     : Ouzy NDIAYE
--%>

 
        <%
            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barre_navComptable.jsp" %> 
        <script>
            <!-- Message erreur date-->
            <c:if test="${!empty msgeErreurDate}">
            alert("Veuillez revoir la date de naissance saisie");
            </c:if>
                <!--Message erreur Régime -->
            <c:if test="${!empty msgErreurRegime}">
            alert("Veuillez choisir un régime");
            </c:if>
                <!--Message Erreur NumTelElv -->
            <c:if test="${!empty msgErreurTelElv}">
            alert("Numéro de Téléphone de l'élève incorrect");
            </c:if>
            <!--Message Erreur NumTelPar -->
            <c:if test="${!empty msgErreurTelPar}">
            alert("Numéro de Téléphone du parent incorrect");
            </c:if>
            <c:if test="${!empty msgErreurMontant}">
            alert("Veuillez vérifier le montant saisi");
            </c:if>
            <c:if test="${!empty msgErreurEnreg}">
            alert("l'inscription a échoué!!!");
            </c:if>
            <c:if test="${!empty msgErreurLogAnsPar}">
            alert("Le login du parent saisi n'existe pas dans la base");
            </c:if>
            <c:if test="${!empty msgEnregReussit}">
            alert("l'inscription a réussi!!!");
            </c:if>
        </script>
        <!--///////////////////////////////////// -->
        <div class="content">
            <div class="container-fluid">                
                <div class="row">                
                    <div class="col-md-12">                        
                            <div class="header">
                                <h4 class="title">Inscription élève</h4>
                            </div>
                        <!--<div class="card">-->
                            <div class="content">
                                <form action="Comptable" method="Post">
                                    <input type="hidden" name="action" value="valider-inscription" />
                                    <h5>Information de l'élève</h5>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Prénom</label>
                                                <input type="text" name="prenom" class="form-control" placeholder="Saisir le prénom..." required>
                                            </div>
                                        </div> 
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="nom">Nom</label>
                                                <input type="text" name="nom" class="form-control" placeholder="Saisir le nom..." maxlength="20" required>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="sexe">Sexe</label>
                                                <select class="form-control" name="sexe">
                                                    <option value="Garçon">Garçon</option>
                                                    <option value="Fille">Fille</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Adresse</label>
                                                    <input type="text" name="adresse" class="form-control" placeholder="Saisir l'adresse" maxlength="40" required>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <!-- Message erreur date-->
                                            <c:if test="${!empty msgeErreurDate}">
                                                <div class="form-group">
                                                    <label>Date Naissance</label>
                                                    <input type="date" name="dateNaiss" class="form-control alert alert-danger" required>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty msgeErreurDate}">
                                                <div class="form-group">
                                                    <label>Date Naissance</label>
                                                    <input type="date" name="dateNaiss" class="form-control" required>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Lieu de Naissance</label>
                                                <input type="text" name="lieuNaiss" class="form-control" placeholder="Saisir le lieu de naissance" maxlength="20" required>
                                            </div>
                                        </div> 
                                        
                                        <%--<div class="col-md-4">
                                            <div class="form-group">
                                                <label for="numTel">Numéro de Téléphone</label>
                                                <div class="form-inline">
                                                    <select name="opeTelElv" class="form-control">                                
                                                        <option>30</option>
                                                        <option>33</option>
                                                        <option>70</option>
                                                        <option>76</option>
                                                        <option>77</option>
                                                        <option>78</option>
                                                    </select>
                                                    <c:if test="${!empty msgErreurTelElv}">
                                                        <input type="text" name="numTelElv" placeholder="Facultatif"  maxlength="7" 
                                                               onkeypress=" return event.charCode >= 48 && event.charCode <= 57" class="form-control alert alert-danger"/>                                                
                                                    </c:if>
                                                    <c:if test="${empty msgErreurTelElv}">
                                                        <input type="text" name="numTelElv" placeholder="Facultatif"  maxlength="7" 
                                                               onkeypress=" return event.charCode >= 48 && event.charCode <= 57" class="form-control"/>                                                
                                                    </c:if>
                                                </div>
                                            </div>
</div>--%>
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Nom Clasee</label>
                                                <select class="form-control" name="nomClasse">
                                                    <c:forEach var='e2' items='${classes}'>
                                                        <option value='${e2}'>${e2}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                        <h5>Informations du parent</h5>
                                        <div class="row"> 
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                        <label for="">Selectioner le parent</label>
                                                        <select id="selectPar" onchange="functionPar()" class="form-control" name="selectPar">
                                                            <option value="">-------Veuillez sélectionner-------</option>
                                                            <option value="nouveau">Nouveau parent</option>
                                                            <option value="ancien">Ancien parent</option>
                                                        </select>
                                            </div>
                                        </div>
                                        </div>
                                                        <p id="demo2" ></p>                    
                                                        <script>
                                                            var newParent = "\n\
                                                            <div class='row'>\n\
                                                            <div class='col-md-4'>\n\
                                                            <div class='form-group'>\n\
                                                            <label>Prénom</label>\n\
                                                            <input id='prenom' type='text' name='prenomPar' class='form-control' placeholder='Saisir le prénom' required/>\n\
                                                            </div>\n\
                                                            </div>\n\
                                                            <div class='col-md-4'>\n\
                                                            <div class='form-group'>\n\
                                                            <label for='nom'>Nom</label>\n\
                                                            <input id='prenom' type='text' name='nomPar' class='form-control' placeholder='Saisir le nom' maxlength='20' required/>\n\
                                                            </div>\n\
                                                            </div>\n\
                                                            <div class='col-md-4'>\n\
                                                            <div class='form-group'>\n\
                                                            <label for='nom'>Email</label>\n\
                                                            <input id='prenom' type='email' name='email' class='form-control' placeholder='Saisir l Email (Facultatif)' maxlength='50'/>\n\
                                                            </div>\n\
                                                            </div>\n\
                                                            <div class='col-md-5'>\n\
                                                            <div class='form-group'>\n\
                                                            <label for='numTel'>Numéro de Téléphone</label>\n\
                                                            <div class='form-inline'>\n\
                                                            <select name='opeTelPar' class='form-control' required>\n\
                                                            <option>30</option>\n\
                                                            <option>33</option>\n\
                                                            <option>70</option>\n\
                                                            <option>76</option>\n\
                                                            <option>77</option>\n\
                                                            <option>78</option>\n\
                                                            </select>\n\
                                                            <input type='text' name='numTelPar' placeholder='Saisir le numéro de téléphone'  maxlength='7' onkeypress=' return event.charCode >= 48 && event.charCode <= 57' class='form-control' required/>\n\
                                                            </div>\n\
                                                            </div>\n\
                                                            </div>\n\
                                                            ";
                                                        </script>
                                                            <script>
                                                            var ancienParent = "\n\
                                                            <div class='row'>\n\
                                                            <div class='col-md-4'>\n\
                                                            <div class='form-group'>\n\
                                                            <label>Login Parent</label>\n\
                                                            <input id='login' type='text' name='loginPar' class='form-control' placeholder='Saisir le login' required/>\n\
                                                            </div>\n\
                                                            </div>\n\
                                                            </div>\n\
                                                            ";
                                                            </script>
                                                        <script>
                                                            function functionPar() {
                                                                var choix = document.getElementById("selectPar").value;
                                                                if (choix == "nouveau") 
                                                                    document.getElementById("demo2").innerHTML = newParent;

                                                                if (choix == "ancien") 
                                                                    document.getElementById("demo2").innerHTML = ancienParent;

                                                            }                                            
                                                        </script>
                                                    
                                        
                                        </div>
                                        
                                        <h5>Comptabilité</h5>
                                        <div class="row">
                                            <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Montant Inscription</label>
                                                <input id="prenom" type="text" name="montantInsc" class="form-control" placeholder="Saisir le montant"
                                                       maxlength="7" onkeypress=" return event.charCode >= 48 && event.charCode <= 57" required>
                                            </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-3"></div>
                                            <div class="col-md-6">
                                                <button class="btn btn-success btn-block" type="submit">Inscrire</button>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            
                        </div>
                    </div>
        <% } else {
        %>
        <jsp:forward page="../connexion/login.jsp"/>
        <% }%>
    </body>
</html>