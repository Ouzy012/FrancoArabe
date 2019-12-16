<%-- 
    Document   : updateMatiere
    Created on : 26 juin 2019, 23:59:35
    Author     : Moussa Joseph D Sarr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${profils} | Modifier matière</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>
        <c:choose>
            <c:when test="${profils eq 'Directeur'}">
                <%@include file="barre_navDirector.jsp" %>
            </c:when>
            <c:otherwise>
                <%@include file="../surveillant/barreNavSurv.jsp" %>
            </c:otherwise>
        </c:choose>
        <h3 style="text-align: center;">Modification de la matière</h3>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <form method="Post" action="ControleurDirecteur">


                        <input type="hidden" name="nomEnFrancaisOld" value="${nomEnFrancais}">
                        <input type="hidden" name="nomFrancaisOld" value="${nomMat}">
                        <table class="table table-bordered table-hover">
                            <%
                                if (request.getAttribute("action").equals("updateMatAr")) {

                            %>
                            <input type="hidden" name="action" value="validModMat">
                            <tr>
                                <th style="background-color: greenyellow">Nom En Arabe</th>
                                <td><input type="text" name="nomEnAr" value="${nomEnAr}"></td>

                            </tr>
                            <tr>
                                <th style="background-color: greenyellow">Nom En Français</th>
                                <td><input type="text" name="nomEnFrancais" value="${nomEnFrancais}"></td>

                            </tr>
                            <tr>
                                <td><input type="submit" value="Valider" name="Valider" class="btn btn-success"></td>
                            </tr>
                            <%                } else {

                            %>
                            <tr>
                            <input type="hidden" name="action" value="valideMatFr">
                            <th style="background-color: greenyellow">Nom Matière Français</th>
                            <td><input type="text" name="nomFr" value="${nomMat}"></td>
                            </tr>
                            <tr>
                                <td>
                                    <button type="submit" value="Valider" name="Valider" class="btn btn-success">
                                        Valider
                                    </button>
                                </td>

                            </tr>


                            <%                     }

                            %>
                        </table>
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
