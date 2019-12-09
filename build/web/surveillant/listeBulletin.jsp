<%-- 
    Document   : listeBulletin
    Created on : 16 oct. 2018, 18:54:56
    Author     : Moussa Joseph Sarr
--%>

<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bulletin</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {
                String ens = (String) request.getAttribute("ens");
        %>
        <%@include file="barreNavSurv.jsp" %>
        <script>
            <c:if test="${!empty mess}">
            alert("Le bulletin a été créer avec succès");
            </c:if>
        </script>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">Liste de la classe</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Prénom</th>
                                            <th>Nom</th>
                                            <th>Bulletin</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Prénom</th>
                                            <th>Nom</th>                                            
                                            <th>Bulletin</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="e" items="${eleves}">
                                            <tr>
                                                <td>${e.prenom}</td>
                                                <td>${e.nom}</td>                                                
                                                <td>
                                                    <c:if test="${ens == 'Francais'}">
                                                        <a href="ControleurDirecteur?action=creerBulletin&&login=${e.login}&&ens=${ens}&&annee=${annee}&&semestre=${semestre}" target="_blank" class="btn btn-success">Imprimer</a>
                                                    </c:if>
                                                    <c:if test="${ens == 'Arabe'}">
                                                        <a href="ControleurDirecteur?action=creerBulletin&&login=${e.login}&&ens=${ens}&&annee=${annee}&&semestre=${semestre}" target="_blank" class="btn btn-success">Arabe</a>
                                                    </c:if>
                                                </td>
                                                <c:if test="${(!empty mess) && (login eq e.login)}">
                                                    <td><a href="bulletin/${e.prenom}${e.nom}.pdf">voir fichier</a></td>    
                                                </c:if> 
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

        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%>
    </body>
</html>
<SCRIPT LANGUAGE="JavaScript">
    function popup() {
        w = open("information_essai.html", 'popup', 'width=600,height=900,toolbar=no,scrollbars=no,resizable=yes');
        w.document.write("<BODY id='facbody'>");
        w.document.write("<h1>CLIENT</h1>");
        w.document.write("<h3>Prenom: <BR>");
        w.document.write("Nom:<BR>");
        w.document.write("Adresse: <BR>");
        w.document.write("Email: <BR>");
        w.document.write("Téléphone: </h3><BR><BR><BR>");

        w.document.write("<p id='center'><font color='#e40060'>****************************SUNUHOTEL***************************</font></p>");

        w.document.write("<h1>RESERVATON</h1>");
        w.document.write("<table id='tabclientlist'  border='2' cellspacing='10'><tr><td id='td'><font color='#e40060'>Chambre</font></td><td id='td'><font color='#e40060'>Date Entrée</font></td><td id='td'><font color='#e40060'>Date Sortie</font></td><td id='td'><font color='#e40060'>Prix</font></td><td id='td'><font color='#e40060'>Nombre de jours</font></td></tr>");
        w.document.write("<tr><td></td>");
        w.document.write("<td></td>");
        w.document.write("<td></td>");
        w.document.write("<td>F</td>");
        w.document.write("<td></td></tr>");
        w.document.write("<tr><td colspan='5'>Net à payer</td><td> F</td></tr>");


        w.document.write("</BODY>");
        w.document.close();
        w.print();
        w.close();
    }

</SCRIPT>