<%-- 
    Document   : updateClasse
    Created on : 25 juin 2019, 23:18:44
    Author     : Moussa Joseph D Sarr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modification Classe</title>
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
        <h3 style="text-align: center;">Modifier la Classe ${classe}</h3>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-4"></div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <form method="Post" action="ControleurDirecteur">
                        <input type="hidden" name="action" value="validClasse">
                        <input type="hidden" name="classeOld" value="${classe}">

                        <div class="form-group">
                            <label>Nom classe</label>
                            <input type="text" name="nomClasse" class="form-control" value="${classe}"/>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-success btn-block " type="submit">Modifier</button>
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
