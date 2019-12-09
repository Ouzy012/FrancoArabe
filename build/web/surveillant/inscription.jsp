<%-- 
    Document   : inscription
    Created on : 2 nov. 2018, 17:40:18
    Author     : Moussa Joseph Sarr
--%>

<html>
    <head>
        <title>Inscription</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barreNavSurv.jsp" %>
        <script>
            <c:if test="${!empty message4}">
            alert("Veuillez revoir la date de naissance saisie");
            </c:if>
            <c:if test="${!empty message1}">
            alert("Inscription  effectué avec succé");
            </c:if>
            <c:if test="${!empty message2}">
            alert("Inscription a échoué!!!");
            </c:if>
        </script>

        <div class="container">
            <div class="col-lg-12">
                <c:if test="${!empty loginIns && !empty mdpIns && !empty loginPar && !empty mdpPar}">
                    <h2>Eleve:&nbsp;&nbsp;${loginIns}&nbsp;&nbsp;&nbsp;${mdpIns}</h2>
                    <h2>Parent:&nbsp;&nbsp;${loginPar}&nbsp;&nbsp;&nbsp;${mdpPar}</h2>
                </c:if>     
            </div>
            <div class="col-lg-12">
                <table class="table table-bordered">
                    <tr>
                        <td class="test" style="background: grey">
                            <a href="ControleurDirecteur?action=inscription" style="color: white">Inscription</a>
                        </td>
                </table>
            </div>
            <div class="col-lg-12">
                <h3 style="text-align: center;">Inscrire un élève</h3>
                <div class="col-lg-8">
                    <h4>Informations personnelles de l'élève</h4>
                </div>
                <div class="col-lg-4">
                    <h4>Informations du parent ou tuteur</h4>
                </div>
            </div>
        </div>


        <div class="container">

            <div class="col-lg-12">
                <form action="ControleurDirecteur" method="POST">
                    <input type="hidden" name="action" value="formEleve"/>
                    <input type="hidden" name="annee" value="${anInscr}"/>
                    <h4>Informations personnelles de l'élève</h4>
                    <div class="col-lg-4">

                        <div class="form-group">
                            <label>Classe</label>
                            <select name="nomClasse" class="form-control" required/>
                            <c:forEach var="p" items="${classes}">
                                <option>${p}</option>
                            </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Nom</label>
                            <input type="text" name="nom" class="form-control" required/>
                        </div>

                        <div class="form-group">
                            <label>Prénom</label>
                            <input type="text" name="prenom" class="form-control" required/>
                        </div>

                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label>Adresse</label>
                            <input type="text" name="adresse" class="form-control" required/>
                        </div>
                        <div class="form-group">
                            <label>Date de naissance</label>
                            <input type="date" name="dateNaissance" class="form-control" required/>
                        </div>

                        <div class="form-group">
                            <label>Lieu de Naissance</label>
                            <input type="text" name="lieuNaissance" value="" class="form-control" required/>
                        </div>
                    </div>
                    <!--/////////////////////////// -->

                    <div class="col-lg-4">

                        <div class="form-group">
                            <label>Prénom du papa ou du tuteur</label>
                            <input type="text" name="prenomParent" class="form-control" required/>
                        </div>


                        <%--      <input type="text" name="telParent2" maxlength="7" onkeypress=" return event.charCode >= 48 && event.charCode <= 57" class="form-control" required/> --%>

                    </div>
                    <div class="col-lg-12">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8">
                            <div class="form-group">
                                <button class="btn btn-success btn-block " type="submit">Inscrire</button>
                            </div>
                        </div>
                    </div>
                </form>
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
