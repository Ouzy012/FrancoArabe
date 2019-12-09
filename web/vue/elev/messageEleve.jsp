<%-- 
    Document   : messageEleve
    Created on : 20 oct. 2018, 12:18:31
    Author     : ibrah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <title>Message Eleve</title>
    </head>
    <body>
         <%
            if (session.getAttribute("log") != null) {

        %>
        <%@include file="../../eleve.jsp" %>
        <div>
            <h1>${message}</h1>
                <c:forEach var="r" items="${listReponse}">
                    <table  border="3" bordercolor="#F1C40F" id="tab">
                        <div class="mes"><h6><span class="glyphicon glyphicon-book"></span>&nbsp;${r.date}</h6></div>
                        <tbody>
                            <tr>
                                <td class="reclamation">
                                    <h3 align="center">${r.enTete}</h3>
                                    <p>${r.message}</p>
                                    <p align="center">
                                    </p>
                                </td> 
                            </tr>
                        </tbody>
                    </table>
                </c:forEach>
        </div>
        <% } else {
        %>
        <jsp:forward page="../SeConnecter.jsp"/>
        <% }%>
    </body>
</html>
