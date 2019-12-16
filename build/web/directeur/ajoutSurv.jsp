<%-- 
    Document   : ajoutSurv
    Created on : 15 févr. 2019, 23:58:29
    Author     : Moussa Joseph Sarr
--%>
<html>
    <head>
        <title>${profils} | Ajout Surveillant</title>
    </head>
    <body>
        <%             if (session.getAttribute("log") != null) {

        %>
        <%@include file="barre_navDirector.jsp" %>
        <script>
            <c:if test="${!empty msg}">
            alert("Surveillant enregistré avec succèss");
            </c:if>
        </script>

        <div class="container-fluid">
            <div class="row">
                    <div class="col-xl-3 col-md-6 mb-4"></div>
                    <div class="col-xl-5 col-md-6 mb-4">

                        <c:if test="${!empty msg}">
                            <h2>Login:&nbsp;&nbsp;${loginSurv}</h2>
                            <h2>Mot de passe:&nbsp;&nbsp;${mdpSurv}</h2>
                        </c:if>                           
                        <h2>Ajouter un nouveau surveillant</h2>
                        <form action="ControleurDirecteur" method="Post">
                            <input type="hidden" name="action" value="formSurv"/>

                            <div class="form-group">
                                <label>Nom</label>
                                <input type="text" name="nom" class="form-control" required/>                                
                            </div>

                            <div class="form-group">
                                <label>Prénom</label>
                                <input type="text" name="prenom" class="form-control" required/>                              
                            </div>

                            <div class="form-group">
                                <label>Adresse</label>
                                <input type="text" name="adresse" class="form-control" required/>                              
                            </div>

                            <div class="form-group">
                                <label>Téléphone</label>
                                <div class="form-inline">
                                    <select name="tel1" class="form-control" required="">                                
                                        <option>30</option>
                                        <option>33</option>
                                        <option>70</option>
                                        <option>76</option>
                                        <option>77</option>
                                        <option>78</option>
                                    </select> 
                                    <input type="text" name="tel2" value="" maxlength="7" onkeypress=" return event.charCode >= 48 && event.charCode <= 57" class="form-control" required=""/>
                                </div>
                            </div>
                            <div class="form-group">
                                <button class="btn btn-success btn-block " type="submit">Valider</button>
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
