<%-- 
    Document   : demandeMatClasse
    Created on : 17 juil. 2018, 09:37:24
    Author     : ibrah
--%>


<%@include file="authentification.jsp" %>
<script>
    <c:if test="${!empty message}">
    alert("Login et/ou mot de passe incorrect");
    </c:if>
</script>
<div class="container-fluid bg">
    <div class="row">
        <div class="col-md-4 col-sm-4 col-xs-12"></div>
        <div class="col-md-4 col-sm-4 col-xs-12">
            <a href="accue.html"><img class="im_retour" src="vue/back-arrow.png"/></a>
            <form action="Controleur" method="Post" id="logPar">
                <h1>Authentification</h1>
                <img class="img-responsive img-circle" src="vue/user1.png"/>
                <%--  <h2>${message}</h2> --%>
                <input type="hidden" name="action" value="authen_parent" />
                <div class="form-group">
                    <label>Login </label>   
                    <input type="text" name="login" class="form-control" placeholder="Login"/>
                </div>
                <div class="form-group">
                    <label>Mot de Passe </label>
                    <input type="password" name="mdp" class="form-control" placeholder="Mot de passe"/>
                </div>
                <button class="btn btn-success btn-block" type="submit">Valider</button>
            </form>
        </div>   
        <div class="col-md-4 col-sm-4 col-xs-12"></div>
    </div>
</div>
</body>
</html>

