<%-- 
    Document   : listerNote
    Created on : 23 juil. 2018, 14:50:45
    Author     : ibrah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<title>Modification</title>
</head>
<body>
    <%
        if (session.getAttribute("log") != null) {

    %>
    <%@include file="barreNavProf.jsp" %>
    <script>
        <c:if test="${!empty msg}">
        alert("La note devrait etre infèrieure à 10");
        </c:if>
    </script>
    <div class="container">

        <form method="post" action="Controleur">
            <input type="hidden" name="action" value="modification"/>
            <input type="hidden" name="loginEleve" value="${loginEleve}"/>
            <input type="hidden" name="semestre" value="${semestre}"/>
            <input type="hidden" name="matiere" value="${matiere}"/>
            <input type="hidden" name="classe" value="${classe}"/>
            <input type="hidden" name="annee" value="${annee}"/>
            <input type="hidden" name="nom" value="${nom}"/>
            <input type="hidden" name="prenom" value="${prenom}"/>
            <div class="col-lg-12">

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Prénom</th>
                            <th>Nom</th>
                            <th>Composition</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${prenom}</td>
                            <td>${nom}</td>
                            <td>
                                <input class="form-control" type="float" name="composition" value="${composition}"/>
                            </td>
                        </tr>    
                    </tbody>
                </table>
            </div>
            <div class="col-lg-12">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <button class="btn btn-success" onclick="javascript: return confirmation();">Valider</button>
                </div>
            </div>
        </form>  
    </div>
    <% } else {
    %>
    <jsp:forward page="vue/SeConnecter.jsp"/>
    <% }%>
</body>
</html>
<script>
    function confirmation() {
        var code = "Voulez vous vraiment modifier cette note ?\
    ";
        var msg = confirm(code);
        if (msg) {
            return true;
        } else {
            return false;
        }
    }
</script>