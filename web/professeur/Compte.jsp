<%-- 
    Document   : demandeMatClasse
    Created on : 17 juil. 2018, 09:37:24
    Author     : ibrah
--%>

<title>Mon compte</title>
</head>
<body>
    <%            if (session.getAttribute("log") != null) {

    %>
    <%@include file="barreNavProf.jsp" %>  
    <script>
        <c:if test="${!empty message}">
        alert("Echec du changement de mot de passe!");
        </c:if>
        <c:if test="${!empty mes}">
        alert("Votre mot de passe a été modifié avec succèss!!");
        </c:if>
        <c:if test="${!empty msg}">
        alert("Nous ne prenons en charge que les images de format PNG, GIF ou JPG.");
        </c:if>
        <c:if test="${!empty msgSupp}">
        alert("Une erreur s'est produite lors de la suppression de la photo de profil.\n\n\
        Veuillez réessayer");
        </c:if>
    </script>
    <div class="content">
        <div class="container-fluid">                
            <div class="row">                
                <div class="col-md-8">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">Modifier profil</h4>
                        </div>                            
                        <div class="content">
                            <form action="Controleur" method="POST">
                                <input type="hidden" name="action" value="modifCompte" />
                                <input type="hidden" name="idPersonne" value="${idPersonne}" />                                   
                                <c:forEach var="i" items="${compte}">                                       
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Login</label>
                                                <input type="text" name="login" value="${log}" class="form-control" disabled placeholder="Company">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Prénom</label>
                                                <input type="text" name="prenom" class="form-control" placeholder="Prénom..." value="${i.prenom}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Nom</label>
                                                <input type="text" name="nom" value="${i.nom}" class="form-control" placeholder="Nom..." required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Ancien mot de passe</label>
                                                <input type="password" name="ancienMdp" class="form-control" placeholder="Votre ancien mot de passe..." required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nouveau mot de passe</label>
                                                <input type="password" name="nouveauMdp" class="form-control" placeholder="Votre nouveau mot de passe..." required>
                                            </div>
                                        </div>
                                    </div>
                                            <div class="row">
                                                <div class="col-md-6"></div>
                                            </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Confirmer mot de passe</label>
                                                <input type="password" name="confirmerMdp" class="form-control" placeholder="Confirmer votre mot de passe..." required/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Addresse</label>
                                                <input type="text" name="adresse" value="${i.adresse}" class="form-control" placeholder="Votre Addresse" required/>
                                            </div>
                                        </div>
                                    </div>             
                                </c:forEach>
                                <button type="submit" class="btn btn-info btn-fill pull-right">Modifier Profil</button>
                                <div class="clearfix"></div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <form action="Controleur" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="photoProfil"/>
                        <input type="hidden" name="idPersonne" value="${idPersonne}" />
                        <div class="card card-user">                            
                            <div class="content">
                                <div class="author">
                                    <p style="text-align: center;">Changer photo de profil</p>
                                    <c:forEach var="i" items="${compte}"> 
                                        <a href="#" onclick="myFunction()">  
                                            <c:if test="${i.nomImgPers ne null}">                                            
                                                <img src="ImageUser/${i.nomImgPers}" class="avatar border-gray img_user" alt="Photo profil" >
                                            </c:if>
                                            <c:if test="${i.nomImgPers eq null}">  
                                                <img src="ImageUser/Avatar.png" class="avatar border-gray img_user" alt="Photo profil"/>
                                            </c:if>
                                        </a>

                                        <h4 style="text-align: center;" class="title">
                                            ${i.prenom} ${i.nom}<br />
                                            <small>${log}</small>
                                        </h4>

                                        <br>
                                        <button onclick="myFunction()" class="btn btn-success">  Changer photo</button>
                                        <c:if test="${i.nomImgPers ne null}">
                                            <a id="lien_form" onclick="javascript: return confirmation();"
                                               class="btn btn-danger" href="Surveillant?action=suppPhotoProfil&login=${log}&profils=${profils}"> 
                                                Supprimer photo
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                    <p id="demo"></p> 



                                </div>                                
                            </div>
                        </div>
                        <script>
                            var champs = "<input type='file' name='nomImage' class='form-control' required/>\n\
                                <div>\n\
                                <button class='btn btn-success btn-block' type='submit'>Valider</button>\n\
                                </div>"
                            function myFunction() {
                                document.getElementById("demo").innerHTML = champs;
                            }

                            function confirmation() {
                                var code = "Voulez vous vraiment supprimer la photo de profil ?\
            ";
                                var msg = confirm(code);
                                if (msg) {
                                    return true;
                                } else {
                                    return false;
                                }
                            }
                        </script>
                    </form>
                </div>
            </div>
            </form>
        </div>
    </div>                                                            
    <% } else {
    %>
    <jsp:forward page="../connexion/login.jsp"/>
    <% }%>
</body>

</html>
