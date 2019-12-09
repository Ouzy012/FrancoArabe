<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barreNavSurv.jsp" %>
        <h1>Enregistrement des classes et des matieres que le prof enseigne:</h1>


            <form  action="ControleurDirecteur" method="Post">
                <table class="table table-bordered" id="tab">
                    <input type="hidden" name="id" value="${id}">
                    <input type="hidden" name="login" value="${login}">
                    <input type="hidden" name="annee" value="${annee}">
                    <input type="hidden" name="action" value="profclasse" />
                    <c:forEach var="i" items="${nomCl}">
                        <tr><td>${i} :</td>
                            <c:forEach var="n" items="${nomMat}">
                                <td>${n}<input type="checkbox" name="${i}" value="${n}" class="form-control" required=""/></td>&nbsp;
                                </c:forEach> 
                        </tr>
                    </c:forEach>
                    <tr><td> <button class="btn btn-success">Valider</button></td></tr>
                </table>
            </form>
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%>
    </body>
</html>

