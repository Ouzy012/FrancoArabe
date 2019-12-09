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
    <div class="content">
        <div class="container-fluid">                
            <div class="row">
                <h1 align='center'>${message}</h1>
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
                                                <input type="text" class="form-control" placeholder="Prénom..." value="michael23">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Nom</label>
                                                <input type="text" class="form-control" placeholder="Nom...">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Ancien mot de passe</label>
                                                <input type="password" name="ancienMdp" class="form-control" placeholder="Votre ancien mot de passe..."">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nouveau mot de passe</label>
                                                <input type="password" name="nouveauMdp" class="form-control" placeholder="Votre nouveau mot de passe...">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Addresse</label>
                                                <input type="text" class="form-control" placeholder="Votre Addresse">
                                            </div>
                                        </div>
                                    </div>             
                                </c:foreach>
                                <button type="submit" class="btn btn-info btn-fill pull-right">Modifier Profil</button>
                                <div class="clearfix"></div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-user">
                        <div class="image">
                            <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400" alt="..."/>
                        </div>
                        <div class="content">
                            <div class="author">
                                <a href="#">
                                    <img class="avatar border-gray" src="images/logo_ecole.jpg" alt="..."/>

                                    <h4 class="title">Prénom Nom<br />
                                        <small>Login</small>
                                    </h4>
                                </a>
                            </div>                                
                        </div>
                    </div>
                </div>

            </div>
            </form>
        </div>
    </div>                                                            
    <% } else {
    %>
    <jsp:forward page="../vue/SeConnecter.jsp"/>
    <% }%>
</body>
</html>
