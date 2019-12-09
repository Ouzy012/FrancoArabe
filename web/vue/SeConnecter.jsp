<%@include file="../authentification.jsp" %>
<script>
    <c:if test="${!empty mess}">
    alert("Login et/ou mot de passe incorrect");
    </c:if>
</script>
<div class="container-fluid bg">
        <div class="row">               
            <div class="col-md-4 col-sm-4 col-xs-12"></div>
            <div class="col-md-4 col-sm-4 col-xs-12">
                <a href="accue.html"><img class="im_retour" src="vue/back-arrow.png"/></a>
                <form action="Controleur" method="Post" id="log">
                    <h1>Authentification</h1>
                    <img class="img-responsive img-circle" src="vue/user1.png"/>
                    <input type="hidden" name="action" value="authentifier">
                    <div class="form-group">
                        <label>Profils </label>
                        <select name="profils" class="form-control">
                            <option>Directeur</option>
                            <option>Surveillant</option>
                            <!--<option>Eleve</option>-->
                            <option>Professeur</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Login </label>   
                        <input type="text" name="login" class="form-control" placeholder="Login"/>
                    </div>
                    <div class="form-group">
                        <label>Mot de Passe </label>
                        <input type="password" name="motDePasse" class="form-control" placeholder="Mot de passe"/>
                    </div>
                    <button class="btn btn-success btn-block" type="submit">Valider</button>
                </form>
            </div>   
            <div class="col-md-4 col-sm-4 col-xs-12"></div>
        </div>
</div>
</body>
</html>
