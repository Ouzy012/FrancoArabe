<%-- 
    Document   : barreNavSurv
    Created on : 26 juin 2019, 11:13:43
    Author     : Ouzy NDIAYE
--%>


<title>Surveillant</title>
</head>
<body id="page-top">
    <%            if (session.getAttribute("log") != null) {

    %>
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
                <a class="nav-link" href="Controleur?action=accueilSurv">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Accueil</span>
                </a>
            </li>

            <!-- Divider 
            <hr class="sidebar-divider">-->

            <!-- Heading 
            <div class="sidebar-heading">
              Interface
            </div>-->

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <!--<i class="fas fa-fw fa-cog"></i>-->
                    <span>Ajouter</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="ControleurDirecteur?action=ajoutEleve">Inscrire �l�ve</a>
                        <a class="collapse-item" href="ControleurDirecteur?action=ajoutProf">Professeur</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Lister</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="ControleurDirecteur?action=formAffClass">Classes</a>
                        <a class="collapse-item" href="ControleurDirecteur?action=listerProfs">Professeurs</a>
                        <a class="collapse-item" href="ControleurDirecteur?action=classes">Les Classes</a>
                        <a class="collapse-item" href="ControleurDirecteur?action=listeMatieres">Mati�res</a>
                    </div>
                </div>
            </li>

            <!-- Divider 
            <hr class="sidebar-divider">-->

            <!-- Heading -->
            <!--<div class="sidebar-heading">
              Addons
            </div>-->

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="ControleurDirecteur?action=formNote">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Consulter notes</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="ControleurDirecteur?action=bulletin">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Bulletin</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="ControleurDirecteur?action=compte">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Mon compte</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="Controleur?action=deconnection">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Se d�connecter</span></a>
            </li>

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
                                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="ControleurDirecteur?action=compte">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Mon profil
                                </a>

                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="Controleur?action=deconnection" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Se d�connecter
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->                                
                <% } else {
                %>
                <jsp:forward page="../vue/SeConnecter.jsp"/>
                <% }%>
                </body>
                </html>