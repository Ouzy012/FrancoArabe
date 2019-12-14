<%-- 
    Document   : barreNavParent
    Created on : 12 déc. 2019, 21:56:00
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body id="page-top">
        <%            if (session.getAttribute("log") != null) {

        %>
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                    <!--<div class="sidebar-brand-icon rotate-n-15">
                      <i class="fas fa-laugh-wink"></i>
                    </div>-->
                    <div class="sidebar-brand-text mx-3">Ecole Franco Arabe</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="#">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Accueil</span>
                    </a>
                </li>
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link" href="ControleurParent?login=${log}&action=listerEnfant">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Liste des enfants</span></a>
                </li>               


                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="Controleur?login=${log}&action=compte">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Mon compte</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="Controleur?action=deconnection">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Se déconnecter</span></a>
                </li>

                <!-- Nav Item - Pages Collapse Menu -->                
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->
                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Rechercher..." aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>                       

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${prenom}&nbsp;${nom}</span>
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${profils}</span>
                                    <c:if test="${nomImgPers ne null}">
                                        <img class="img-profile rounded-circle" src="ImageUser/${nomImgPers}">
                                    </c:if>
                                    <c:if test="${nomImgPers eq null}">
                                        <img class="img-profile rounded-circle" src="ImageUser/Avatar.png">
                                    </c:if>
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="Controleur?login=${log}&action=compte">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Mon profil
                                    </a>

                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="Controleur?action=deconnection" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Se déconnecter
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->




                    <% } else {
                    %>
                    <jsp:forward page="../connexion/login.jsp"/>
                    <% }%>

                    </body>
                    </html>
