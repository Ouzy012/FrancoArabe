<%-- 
    Document   : payementMensuel
    Created on : 8 juil. 2019, 18:05:20
    Author     : Ouzy NDIAYE
--%>

<html>
    <head>
        <title>Payement Mensuel</title>
    </head>
    <body>
        <style>
            /* The container */
            .container_Label {
                display: block;
                position: relative;                
                padding-left: 35px;
                margin-bottom: 12px;
                cursor: pointer;
                font-size: 22px;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            /* Hide the browser's default checkbox */
            .container_Label input {
                position: absolute;
                opacity: 0;
                cursor: pointer;
                height: 0;
                width: 0;
            }

            /* Create a custom checkbox */
            .checkmark {
                position: absolute;
                top: 0;
                left: 0;
                height: 28px;
                width: 28px;
                background-color: #999999;
            }

            /* On mouse-over, add a grey background color */
            .container_Label:hover input ~ .checkmark {
                background-color: #ccc;
            }

            /* When the checkbox is checked, add a blue background */
            .container_Label input:checked ~ .checkmark {
                background-color: #2196F3;
            }

            .container_Label input:disabled ~ .checkmark {
                background-color: greenyellow;
            }

            /* Create the checkmark/indicator (hidden when not checked) */
            .checkmark:after {
                content: "";
                position: absolute;
                display: none;
            }

            /* Show the checkmark when checked */
            .container_Label input:checked ~ .checkmark:after {
                display: block;
            }

            /* Style the checkmark/indicator */
            .container_Label .checkmark:after {
                left: 9px;
                top: 5px;
                width: 10px;
                height: 15px;
                border: solid white;
                border-width: 0 3px 3px 0;
                -webkit-transform: rotate(45deg);
                -ms-transform: rotate(45deg);
                transform: rotate(45deg);
            }
        </style>

        <%            if (session.getAttribute("log") != null) {
        %>
        <%@include file="barre_navDirector.jsp" %>
        <script>
            <c:if test="${!empty msgErr}">
            alert("Veuillez cocher au mois une case");
            </c:if>

        </script>
        <div class="container">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8"> 
                    <form method="post" action="ControleurDirecteur">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" style="text-align: center;">
                                Veuillez cocher les mois
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Mois</th>
                                            <th>Statut</th>                      
                                        </tr>
                                    </thead>
                                    <!--<tfoot>
                                        <tr>
                                            <th>Mois</th>
                                            <th>Statut</th>
                                        </tr>
                                    </tfoot>-->
                                    <tbody>
                                        <c:forEach var="m" items="${mensuel}">
                                            <tr>
                                                <td>${m.mois}</td>
                                                <td>
                                                    <c:if test="${m.statutMensuel eq '0'}">
                                                        <label class="container_Label">
                                                            <input type="checkbox" name="statutMensuel" value="${m.mois}"/>
                                                            <span class="checkmark"></span>
                                                        </label>

                                                    </c:if>
                                                    <c:if test="${m.statutMensuel eq '1'}">
                                                        <label class="container_Label">
                                                            <input type="checkbox" checked disabled>
                                                            <span class="checkmark"></span>
                                                        </label>

                                                    </c:if>

                                                </td> 
                                            </tr>

                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>                    
                        <input type="hidden" name="action" value="validerPayement"/>
                        <input type="hidden" name="nomClasse" value="${nomClasse}"/>
                        <input type="hidden" name="login" value="${login}"/>
                        <input type="hidden" name="anneeSco" value="${anneeSco}"/>                       
                        <div class="form-group">
                            <button class="btn btn-success btn-block " type="submit">Valider</button>
                            </a>
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