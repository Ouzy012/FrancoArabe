<%-- 
    Document   : compteEleve
    Created on : 31 oct. 2018, 04:02:48
    Author     : Moussa Joseph Sarr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <title>Mon compte</title>
    </head>
    <body>
        <%
            if (session.getAttribute("log") != null) {

        %>
        <%@include file="../../eleve.jsp" %> 
        <h1>Paramétre Compte :</h1>
        
        <script>
            <c:if test="${!empty message}">
            alert("Echec du changement de mot de passe!");
            </c:if>
            <c:if test="${!empty mes}">
            alert("Votre mot de Passe a été modifié avec succés!!");
            </c:if>
        </script>
        
        <div id="tab">
            <form method="POST" action="ControleurEleve">
                <input type="hidden" name="action" value="confirmPasswd">
                <table class="table table-bordered">
                    <tr>
                        <td>Login</td>
                        <td>
                            <div class="form-group">
                                <input type="text" value="${log}" disabled="disabled"  class="form-control" required=""/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Ancien mot de Passe</td>
                        <td>
                            <div class="form-group">
                                <input type="password" name="oldpasswd" value="" class="form-control" required="">
                            </div></td>
                    </tr>
                    <tr>
                        <td>Nouveau Mot de Passe</td>
                        <td>
                            <div class="form-group">
                                <input type="password" name="newpasswd" value="" class="form-control" required="">
                            </div></td>
                    </tr>
                    <tr>
                        <td>Confirmer Nouveau Mot de Passe</td>
                        <td>
                            <div class="form-group">
                                <input type="password" name="newpasswd1" value="" class="form-control" required="">
                            </div></td>
                    </tr>
                    <tr>
                        <td><button class="btn btn-success">Valider</button></td>
                        <td><button type="reset" class="btn btn-success">Annuler</button></td>
                    </tr>
                </table>
            </form>
        </div>
        <% } else {
        %>
        <jsp:forward page="../SeConnecter.jsp"/>
        <% }%> 
    </body>
</html>
