<%-- 
    Document   : ajoutEleve
    Created on : 12 juil. 2018, 14:17:27
    Author     : Moussa Joseph Sarr
--%>

<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Ajouter elève</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barreNavSurv.jsp" %>
        <div class="container-fluid">
            <div class="row">                    
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <h3 style="text-align: center;">Enregistrer un élève </h3>
                        <table class="table table-bordered">
                            <tr>
                                <td style="background-color: #2ecc71" class="test">
                                    <a class="bouton_table btn btn-primary" href="ControleurDirecteur?action=inscription">Inscription</a>
                                </td>
                                <td style="background-color: #2ecc71" class="test">
                                    <a class="bouton_table btn btn-primary" href="ControleurDirecteur?action=reinscription">RéInscription</a>
                                </td>
                        </table>
                    </div>
                </div>
            </div>
        
        
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%>  
    </body>
</html>
