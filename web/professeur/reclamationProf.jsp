<%-- 
    Document   : reclamation
    Created on : 29 sept. 2018, 11:44:46
    Author     : ibrah
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Réclamation</title>
    </head>
    <body>
        <%
            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barreNavProf.jsp" %>
        <div>
            <h3 style="text-align: center;">${message}</h3>
                <c:forEach var="r" items="${listReclation}">
                    <table  border="3" bordercolor="#F1C40F">
                        <div class="mes"><h6><span class="glyphicon glyphicon-book"></span>&nbsp;${r.date}</h6></div>
                        <tbody>
                            <tr>
                                <td class="reclamation">
                                    <h3 align="center">${r.enTete}</h3>
                                    <h5>${r.message}</h5>
                                    <p align="center"><a href="Controleur?action=repondre&loginEleve=${r.loginEleve}&loginProf=${log}&idReclamation=${r.idReclamation}">Répondre</a>
                                    </p>
                                </td> 
                            </tr>
                        </tbody>
                    </table>
                </c:forEach>
        </div>
        <% } else {
        %>
        <jsp:forward page="vue/SeConnecter.jsp"/>
        <% }%>
    </body>
</html>
