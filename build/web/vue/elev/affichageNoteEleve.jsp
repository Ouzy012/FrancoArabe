<%-- 
    Document   : affichageNoteEleve
    Created on : 20 août 2018, 13:29:53
    Author     : Moussa Joseph Sarr
--%>

<%@page import="model.Eleve"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="Image/icone_logo.png" sizes="310x310" />
        <title>Note Eleve</title>
    </head>
    <body>
        <%
            if (session.getAttribute("log") != null) {

        %>
        <%@include file="../../eleve.jsp" %>
        <h1>Veuillez choisir le semestre concerné :</h1>
        <table id="tab" class="table table-bordered">
            <tr>

                <td class="test">
                    <a href="ControleurEleve?action=1ère_Composition&&annee=${annee}">1ère Composition</a>
                </td>
                <td class="test">
                    <a href="ControleurEleve?action=2eme_Composition&&annee=${annee}">2eme Composition</a>
                </td>
                <td class="test">
                    <a href="ControleurEleve?action=3eme_Composition&&annee=${annee}">3eme Composition</a>
                </td>
            </tr>
        </table>
        <%             if (request.getAttribute("action") != null) {
                ArrayList<Eleve> eleves = (ArrayList<Eleve>) request.getAttribute("eleves");
        %>
        <br>
        <h1>Année Scolaire : <a style="color: #00a1dc" href="ControleurEleve?action=afficherNote">${annee}</a></h1>
        <table class="table table-bordered table-hover" id="tab1">
            <thead>
                <tr>
                    <th class="col" id="entete">Matieres</th>
                    <th class="col" id="entete">Composition</th>
                    <th class="col" id="entete">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="e" items="${eleves}">
                    <tr>
                        <td>${e.matiere}</td>
                        <td>${e.composition}</td>
                        <c:choose>
                            <c:when test="${!empty varAn}">
                                <td><a class="btn btn-success" href="ControleurEleve?action=reclamer&nomClasse=${e.classe}&nomMatiere=${e.matiere}">Réclamer</a></td>
                            </c:when>
                            <c:otherwise>
                                <td><button class="btn btn-success" href="ControleurEleve?annee=${a}&&action=anneeScolaire" disabled="disabled">Réclamer</button></td>


                            </c:otherwise>
                        </c:choose>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <%}
        } else {
        %>
        <jsp:forward page="../SeConnecter.jsp"/>
        <% }%>  
    </body>
</html>
