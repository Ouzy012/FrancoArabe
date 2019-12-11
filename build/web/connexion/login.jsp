<%-- 
    Document   : login
    Created on : 7 déc. 2019, 17:51:00
    Author     : Ouzy NDIAYE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    <c:if test="${!empty mess}">
    alert("Login et/ou mot de passe incorrect");
    </c:if>
</script>
  <title>Connexion</title>  
</head>


<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <!--<div class="col-lg-6 d-none d-lg-block bg-login-image">-->
                    <div class="col-lg-6 d-none d-lg-block bg-login-image">
                        <img class="col-lg-6" src="Image/log_bul.jpg"/>
                </div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Bienvenue</h1>
                  </div>
                  <form action="Controleur" method="Post" class="user">
                      <input type="hidden" name="action" value="authentifier">
                    <div class="form-group">
                        <input type="text" name="login" class="form-control form-control-user" placeholder="Entrer votre login...">
                    </div>
                    <div class="form-group">
                        <input type="password" name="motDePasse" class="form-control form-control-user" id="exampleInputPassword" placeholder="Entrer votre mot de passe">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Se souvenir de moi</label>
                      </div>
                    </div>
                      <button class="btn btn-primary btn-user btn-block">
                      Se connecter
                      </button>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="forgot-password.html">Mot de passe oublié?</a>
                  </div>                  
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div> 

</body>

</html>

