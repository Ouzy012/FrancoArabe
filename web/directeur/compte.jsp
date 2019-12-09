<%-- 
    Document   : compteDirecteur
    Created on : 31 oct. 2018, 02:18:36
    Author     : Moussa Joseph Sarr
--%>


<html>
    <head>
        <title>Paramètre Compte</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>       
        
        <%@include file="" %>
        <c:choose>
            <c:when test="${profils eq 'Directeur'}">
                <%@include file="barre_navDirector.jsp" %>
            </c:when>
            <c:otherwise>
                <%@include file="../surveillant/barreNavSurv.jsp" %>
            </c:otherwise>
        </c:choose>        

        <script>
            <c:if test="${!empty message}">
            alert("Echec du changement de mot de passe!");
            </c:if>
            <c:if test="${!empty mes}">
            alert("Votre mot de Passe a été modifié avec succés!!");
            </c:if>
        </script>


        <div class="container-fluid">
            <div class="row">                    
                    <div class="col-lg-5">
                        <h3 style="text-align: center;">Changer les paramètres du compte</h3>
                        <form method="POST" action="ControleurDirecteur">
                            <input type="hidden" name="action" value="confirmPasswd">

                            <div class="form-group">
                                <label>Login</label>
                                <input type="text" value="${log}" disabled="disabled"  class="form-control"/>
                            </div>

                            <div class="form-group">
                                <label>Ancien mot de passe</label>
                                <input type="password" name="oldpasswd" value="" class="form-control" maxlength="24" required>
                            </div>

                            <div class="form-group">
                                <label>Nouveau mot de passe</label>
                                <input type="password" name="newpasswd" value="" class="form-control" maxlength="24" required>
                            </div>

                            <div class="form-group">
                                <label>Confirmer nouveau mot de passe</label>
                                <input type="password" name="newpasswd1" value="" class="form-control" required="">
                            </div>

                            <div class="col-lg-12">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <button class="btn btn-success btn-block " type="submit">Changer Paramètre</button>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <button class="btn btn-danger btn-block " type="reset">Annuler</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%> 
    </body>
</html>
