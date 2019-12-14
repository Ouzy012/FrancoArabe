<%-- 
    Document   : listeNote
    Created on : 13 déc. 2019, 21:32:35
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>${profils}</title> 
</head>
<body>
    <%            if (session.getAttribute("log") != null) {

    %>
    <%@include file="barreNavParent.jsp" %>  

    <c:choose >
        <c:when test="${empty listeNote}">
            <h6 style="text-align: center;">${message}</h6>
        </c:when> 
        <c:otherwise>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">
                                    Liste des Notes pour l'année académique ${annee} 
                                </h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="text-align: center">Nom Matière</th>
                                                <th scope="col" style="text-align: center">Semestre</th>
                                                <th scope="col" style="text-align: center">Note</th> 
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th scope="col" style="text-align: center">Nom Matière</th>
                                                <th scope="col" style="text-align: center">Semestre</th>
                                                <th scope="col" style="text-align: center">Note</th> 
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach var="m" items="${listeNote}">
                                                <tr>                                                                   
                                                    <td style="text-align: center">
                                                        ${m.matiere}
                                                    </td> 
                                                    <td style="text-align: center">
                                                        ${m.semestre}
                                                    </td> 
                                                    <td style="text-align: center">
                                                        ${m.composition}
                                                    </td>
                                                </tr>
                                            </c:forEach> 
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>                    
                    </div>
                </div>
            </div>  
            <!--///////////Fin/////////////// -->
        </c:otherwise>
    </c:choose> 

    <% } else {
    %>
    <jsp:forward page="vue/SeConnecter.jsp"/>                                                    
    <% }%>
</body>
</html>

