<%-- 
    Document   : formNote
    Created on : 12 août 2018, 00:51:11
    Author     : Moussa Joseph Sarr
--%>

<%@page import="java.util.ArrayList"%>
<html>
    <head>
        <title>Note des élèves</title>
    </head>

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

    <div class="container-fluid">
        <div class="row">            
            <div class="col-lg-4"></div>
            <div class="col-lg-4">        
                <h3 style="text-align: center;">Afficher les notes de la classe</h3>
                <form action="ControleurDirecteur" method="Post">
                    <input type="hidden" name="action" value="voirNote">
                    <div class="form-group">
                        <label>Classe</label>
                        <select name="nomClasse" class="form-control" required="">
                            <c:forEach var="p" items="${classes}">
                                <option>${p}</option>       
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Matière</label>
                        <select name="nomMatiere" class="form-control" required="">
                            <c:forEach var="m" items="${mat}">
                                <c:choose>
                                    <c:when test="${fn:contains(m, ':Francais')}">
                                        <option value="${m}">${fn:substringBefore(m,':Francais')}</option> 
                                    </c:when>
                                    <c:otherwise>
                                        <option>${m}</option> 
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Composition</label>
                        <select name="semestre" class="form-control" required="">                         
                            <option value="1ère_Composition">1ère Composition</option> 
                            <option value="2eme_Composition">2nde Composition</option>
                            <option value="3eme_Composition">3ème Composition</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Année</label>
                        <select name="annee" class="form-control" required="">
                            <c:forEach var="a" items="${annees}">
                                <c:choose>
                                    <c:when test="${a eq anInscr}">
                                        <option selected>${a}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option>${a}</option>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                        </select>
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
    <jsp:forward page="../vue/SeConnecter.jsp"/>
    <% }%> 



</html>
