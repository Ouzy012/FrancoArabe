<%-- 
    Document   : formMatiere
    Created on : 9 sept. 2018, 15:25:17
    Author     : Moussa Joseph Sarr
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Enregistrer matière</title>
    </head>
    <body>
        <%            if (session.getAttribute("log") != null) {

        %>
        <%@include file="barre_navDirector.jsp" %>

        <script>
            <c:if test="${!empty message}">
            alert("échec de l'ajout de la matière!");
            </c:if>
            <c:if test="${!empty mes}">
            alert("Matière ajoutée avec succée!!");
            </c:if>
            <c:if test="${!empty msgSelect}">
            alert("Veuillez sélectionner une langue!!");
            </c:if>    
                
        </script>
        <div class="container">
            <div class="row">
                    <div class="col-xl-3 col-md-6 mb-4"></div>
                    <div class="col-xl-4 col-md-6 mb-4">
                        <h3>Enregistrer matière</h3>
                        <form action="ControleurDirecteur" method="POST">
                            <input type="hidden" name="action" value="validerMatiere" />
                          
                            <label>Sélectionner langue matière</label>
                            <select id="fonction" onchange="myFunction()" class="form-control" name="langueMatiere">
                            <option value="">Sélectionner la langue de la matière</option>
                            <option value="Arabe">Arabe</option>
                            <option value="Francais">Français</option>
                        </select>
                        <p id="demo" ></p>
                        <script>
                            var codeArabe = "\n\
                        <div class='form-group'>\n\
                            <label>اسم المادة</label>\n\
                                \n\<input type='text' name='nomArabe' class='form-control' placeholder='Saisir le nom de la matière en Arabe' required>\n\
                        </div>\n\
\n\                     \n\
                        <div class='form-group'>\n\
\n\                      <label>Nom matière</label>\n\
                            <input type='text' name='nomMatiere' class='form-control' placeholder='Saisir le nom de la matière en Francais' required>\n\
                        \n\</div>\n";
                        </script>
                        
                        <script>
                            var codeFrancais = "\n\
                        <div class='form-group'>\n\
\n\                      <label>Nom matière</label>\n\
                            <input type='text' name='nomMatiere' class='form-control' placeholder='Saisir le nom de la matière en Francais' required>\n\
                        \n\</div>\n";
                        </script>
                            
                            
                            <script>
                            function myFunction() {
                                var choix = document.getElementById("fonction").value;
                                if (choix == "Arabe") {
                                    document.getElementById("demo").innerHTML = codeArabe;
                                }
                                if (choix == "Francais") {
                                    document.getElementById("demo").innerHTML = codeFrancais;
                                }
                            }
                        </script>
                            
                            
                        <div class="form-group">
                                <button class="btn btn-success btn-block " type="submit">Enregistrer</button>
                        </div> 
                        </form>
                    </div>
                </div>
            </div>
        <% } else {
        %>
        <jsp:forward page="../vue/SeConnecter.jsp"/>
        <% }%> 
    </body>
</html>
