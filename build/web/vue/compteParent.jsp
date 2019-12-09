<%-- 
    Document   : compteParent
    Created on : 8 nov. 2018, 15:31:31
    Author     : ibrah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="dist/css/bootstrap.css" rel="stylesheet"/>
        <link href="dist/css/mystyle.css" rel="stylesheet"/>
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <title>Compte Parent</title>
    </head>
    <body>
        <%
            if (session.getAttribute("login") != null) {

        %>
        <%@include file="menuParent.jsp" %>
        <h1 align="center">Modification Compte</h1>
        <script>
            <c:if test="${!empty mes1}">
            alert("Modification effectuée avec succée");
            </c:if>
            <c:if test="${!empty mes2}">
            alert("L'ancien mot de passe n'est pas conforme");
            </c:if>
            <c:if test="${!empty mes3}">
            alert("Les mots de passes ne sont pas conformes");
            </c:if>
        </script>
        <form action="Controleur" method="POST">
            <input type="hidden" name="action" value="modifCompteParent" />
            <div id="tab">
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <td>Login</td>
                            <td>
                                <div class="form-group">
                                    <input type="text" name="login" value="${login}"  disabled="disabled" class="form-control"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Ancien Password</td>
                            <td>
                                <div class="form-group">
                                    <input type="password" name="ancienMdp" value="" placeholder="Ancien mot de passe" required="" class="form-control"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Nouveau Password</td>
                            <td>
                                <div class="form-group">
                                    <input type="password" name="nouveauMdp" value="" placeholder="Nouveau mot de passe" required="" class="form-control"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Confirmer Password</td>
                            <td>
                                <div class="form-group">
                                    <input type="password" name="confirmerMdp" value="" placeholder="confirmer mot de passe" required="" class="form-control"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><button class="btn btn-success">Valider</button></td>
                            <td><button type="reset" class="btn btn-success">Annuler</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
        <% } else {
        %>
        <jsp:forward page="acceuilParent.jsp"/>
        <% }%>
    </body>
</html>
