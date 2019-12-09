/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Locale;
import java.util.Random;
import java.util.StringTokenizer;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Arabe;
import model.Bulletin;
import model.DAOFactory;
import modelPersonne.DAODirecteurImpl;
import modelPersonne.DAOPersonneImpl;
import modelPersonne.DAOProfImpl;
import model.Eleve;
import model.Mensuel;
import model.Parent;
import modelTables.Personne;
import modele.tables.ProfClasse;
import model.Professeur;
import model.Utilisateur;
import modelPersonne.DAOEleveImpl;
import modelPersonne.DAOParentImpl;

/**
 *
 * @author Moussa Joseph Sarr
 */
public class ControleurDirecteur extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private DAOEleveImpl daoEleve;
    public Eleve eleve;
    ArrayList<String> classes;
    ArrayList<Eleve> eleves;
    ArrayList<String> annees;
    private DAODirecteurImpl daoDirecteur;
    public Parent parent;
    public Professeur professeur;
    private DAOProfImpl daoProf;
    ArrayList<String> matieres;
    ArrayList<Professeur> profs;
    private DAOPersonneImpl daoPersonne;
    private DAOParentImpl daoParent;
    public ArrayList<Eleve> rechercheParElev;
    ArrayList<String> matArabe;
    ArrayList<String> matFrancais;

    Random rd1;

    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.daoEleve = daoFactory.getDAOEleve();
        this.daoProf = daoFactory.getDAOProf();
        this.daoPersonne = daoFactory.getDAOPersonne();
        this.daoDirecteur = daoFactory.getDAODirecteur();
        this.daoParent = daoFactory.getDAOParent();
        classes = new ArrayList();
        matieres = new ArrayList();
        matArabe = new ArrayList();
        matFrancais = new ArrayList();
        profs = new ArrayList();
        eleves = new ArrayList();
        rechercheParElev = new ArrayList<>();
        matieres = daoProf.listerMatiere();
        matieres.forEach((mat) -> {
            StringTokenizer st = new StringTokenizer(mat, ":");
            while (st.hasMoreTokens()) {
                String ch = st.nextToken();
                if ("Arabe".equals(ch)) {
                    matArabe.add(mat);
                } else if ("Francais".equals(ch)) {
                    matFrancais.add(mat);
                }
            }
        });
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        String en_tete = request.getHeader("referer");
        HttpSession session = request.getSession();
        classes = daoEleve.listerClasse();
        session.setAttribute("classes", classes);
        int id = 0;
        session.setAttribute("matArabe", matArabe);
        session.setAttribute("matFrancais", matFrancais);
        session.setAttribute("matieres", matieres);
        RequestDispatcher rd = null;
        annees = daoEleve.listerAnnee();
        session.setAttribute("annees", annees);
        Bulletin bulletin = null;
        rd1 = new Random();

        String anInscr;
        String mois = new SimpleDateFormat("MM", Locale.FRANCE).format(Calendar.getInstance().getTime());
        int newmois = Integer.parseInt(mois);
        if ((newmois >= 1) && (newmois <= 9)) {
            String annee = new SimpleDateFormat("yyyy", Locale.FRANCE).format(Calendar.getInstance().getTime());
            int newYear = Integer.parseInt(annee);
            int anneeBd = newYear - 1;
            anInscr = "" + anneeBd + "-" + annee;

        } else {
            String annee = new SimpleDateFormat("yyyy", Locale.FRANCE).format(Calendar.getInstance().getTime());
            int newYear = Integer.parseInt(annee);
            int anneeBd = newYear + 1;
            anInscr = "" + annee + "-" + anneeBd;

        }
        session.setAttribute("anInscr", anInscr);
        if (action.equals("ajoutEleve")) {
            rd = request.getRequestDispatcher("surveillant/ajoutEleve.jsp");
        } else if (en_tete == null) {
            session.invalidate();
            rd = request.getRequestDispatcher("vue/erreur.jsp");
        } ////////////////////////////MENSUALITE//////////////////////////
        else if (action.equals("mensuel")) {
            classes = daoEleve.listerClasse();
            request.setAttribute("classes", classes);
            rd = request.getRequestDispatcher("directeur/mensualite.jsp");
        } else if (action.equals("mensuelClasse")) {
            String nomClasse = request.getParameter("nomClasse");
            String year = request.getParameter("year");
            eleves = daoEleve.listerEleve(nomClasse, year);
            request.setAttribute("nomCl", nomClasse);
            request.setAttribute("an", year);
            request.setAttribute("eleves", eleves);
            rd = request.getRequestDispatcher("directeur/listeDesEleves.jsp");
        } else if (action.equals("detailMensuel")) {
            ArrayList<Mensuel> mensuel = new ArrayList();
            String login = request.getParameter("login");
            String nomClasse = request.getParameter("nomClasse");
            String anneeSco = request.getParameter("anneeSco");
            mensuel = daoEleve.listerMensuel(login, nomClasse, anneeSco);
            request.setAttribute("login", login);
            request.setAttribute("nomClasse", nomClasse);
            request.setAttribute("anneeSco", anneeSco);
            request.setAttribute("mensuel", mensuel);
            rd = request.getRequestDispatcher("directeur/payementMensuel.jsp");
        } else if (action.equals("validerPayement")) {
            String login = request.getParameter("login");
            String nomClasse = request.getParameter("nomClasse");
            String anneeSco = request.getParameter("anneeSco");
            String[] moisPayement = request.getParameterValues("statutMensuel");
            Boolean resultat = false;
            //System.out.println("taille " + moisPayement.length);

            if (moisPayement != null) {
                for (int i = 0; i < moisPayement.length; i++) {
                    resultat = daoEleve.validerPayement(login, nomClasse, anneeSco, moisPayement[i]);
                }
                if (resultat == true) {
                    String msg = "payement valider";
                    request.setAttribute("msgOk", msg);
                    eleves = daoEleve.listerEleve(nomClasse, anneeSco);
                    request.setAttribute("nomCl", nomClasse);
                    request.setAttribute("an", anneeSco);
                    request.setAttribute("eleves", eleves);
                    rd = request.getRequestDispatcher("directeur/listeDesEleves.jsp");
                }
            } else {
                String msgErr = "Erreur";
                request.setAttribute("msgErr", msgErr);
                ArrayList<Mensuel> mensuel = new ArrayList();
                mensuel = daoEleve.listerMensuel(login, nomClasse, anneeSco);
                request.setAttribute("login", login);
                request.setAttribute("nomClasse", nomClasse);
                request.setAttribute("anneeSco", anneeSco);
                request.setAttribute("mensuel", mensuel);
                rd = request.getRequestDispatcher("directeur/payementMensuel.jsp");
            }

            /*
                if (moisPayement != null) {
                    System.out.println(moisPayement[i]);
                    
                } else {
                    
                }

            }*/
        } ///////////////////////////FIN MENSUALITE///////////////////
        else if (action.equals("inscription")) {
            request.setAttribute("anInscr", anInscr);
            rd = request.getRequestDispatcher("surveillant/inscription.jsp");
        } else if (action.equals("modifierElv")) {

            String login = request.getParameter("nom");
            eleve = daoEleve.listerUnEleve(login);
            request.setAttribute("login", login);
            request.setAttribute("eleve", eleve);
            String year = daoEleve.listerAnnee(login);
            request.setAttribute("year", year);
            rd = request.getRequestDispatcher("surveillant/modificationEleve.jsp");

        } else if (action.equals("formEleve")) {
            String loginIns = "";
            String mdpIns = "";
            String loginPar = "";
            String mdpPar = "";
            String idLog = request.getParameter("idLog");
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String nomClasse = request.getParameter("nomClasse");
            String dateNaissance = request.getParameter("dateNaissance");
            String lieuNaissance = request.getParameter("lieuNaissance");
            String adresse = request.getParameter("adresse");
            String annee = request.getParameter("annee");
            String year = request.getParameter("year");

            String prenomParent = request.getParameter("prenomParent");
            String telParent1 = request.getParameter("telParent1");
            String telParent2 = request.getParameter("telParent2");
            String telParent = telParent1 + telParent2;
            String chL = "";
            System.out.println(annee);
            int dateSaisi = Integer.parseInt(dateNaissance.substring(0, 4));
            int dateSco;
            dateSco = Integer.parseInt(annee.substring(5, annee.length()));
            int dateCal = dateSaisi + 5;
            for (int i = 0; i < 4; i++) {
                chL += rd1.nextInt(10);
            }

            String chM = "";
            for (int i = 0; i < 4; i++) {
                chM += rd1.nextInt(10);

            }

            String chpl = "";
            for (int i = 0; i < 4; i++) {
                chpl += rd1.nextInt(10);

            }

            String chpm = "";
            for (int i = 0; i < 4; i++) {
                chpm += rd1.nextInt(10);

            }
            if (dateCal > dateSco) {
                String message = "Veuillez revoir la date de naissance saisie!!!";
                request.setAttribute("message4", message);
                rd = request.getRequestDispatcher("surveillant/inscription.jsp");
            } else if (nom.length() > 2) {
                eleve = new Eleve(nomClasse, nom, prenom, adresse, dateNaissance, lieuNaissance, annee, null, null);
                eleve.setLogin(eleve.getNom().substring(0, 3).toUpperCase().concat(eleve.getPrenom().substring(0, 1).toUpperCase()) + "" + chL);
                eleve.setMotDePasse(eleve.getNom().substring(0, 3).toUpperCase() + "" + chM);
                loginIns = eleve.getNom().substring(0, 3).toUpperCase().concat(eleve.getPrenom().substring(0, 1).toUpperCase()) + "" + chL;
                mdpIns = eleve.getNom().substring(0, 3).toUpperCase() + "" + chM;
                String loginParent = eleve.getNom().substring(0, 3).toUpperCase().concat(prenomParent.substring(0, 1).toUpperCase()) + "" + chpl;
                String parentmdp = eleve.getNom().substring(0, 3).toUpperCase() + "" + chpm;
                parent = new Parent(loginParent, nom, prenomParent, null, parentmdp);
                parent.setTel(telParent);
                loginPar = parent.getLoginParent();
                mdpPar = parent.getMotDePasse();
            } else {
                eleve = new Eleve(nomClasse, nom, prenom, adresse, dateNaissance, lieuNaissance, annee, null, null);
                eleve.setLogin(eleve.getNom().substring(0, nom.length()).toUpperCase().concat(eleve.getPrenom().substring(0, 1).toUpperCase()) + "" + chL);
                eleve.setMotDePasse(eleve.getNom().substring(0, nom.length()).toUpperCase() + "" + chM);
                loginIns = eleve.getNom().substring(0, 3).toUpperCase().concat(eleve.getPrenom().substring(0, 1).toUpperCase()) + "" + chL;
                mdpIns = eleve.getNom().substring(0, 3).toUpperCase() + "" + chM;
                String loginParent = eleve.getNom().substring(0, nom.length()).toUpperCase().concat(prenomParent.substring(0, 1).toUpperCase()) + "" + chpl;
                String parentmdp = eleve.getNom().substring(0, nom.length()).toUpperCase() + "" + chpm;
                parent = new Parent(loginParent, nom, prenomParent, null, parentmdp);
                parent.setTel(telParent);
                loginPar = parent.getLoginParent();
                mdpPar = parent.getMotDePasse();
            }

            Boolean resultat = daoEleve.inscription(eleve, parent);
            Mensuel mensuel = new Mensuel(loginIns, anInscr, "0", nomClasse);
            Boolean resultatMensuel = daoEleve.mensualite(mensuel);
            if (resultat && resultatMensuel) {
                String message = "Inscription  effectuée avec succés";
                request.setAttribute("message1", message);
                request.setAttribute("loginIns", loginIns);
                request.setAttribute("mdpIns", mdpIns);
                request.setAttribute("loginPar", loginPar);
                request.setAttribute("mdpPar", mdpPar);
                rd = request.getRequestDispatcher("surveillant/inscription.jsp");
            } else {
                String message = "Inscription a échoué!!!";
                request.setAttribute("message2", message);
                rd = request.getRequestDispatcher("surveillant/inscription.jsp");
            }

        } else if (action.equals("reinscription")) {
            rd = request.getRequestDispatcher("surveillant/reinscription.jsp");
        } else if (action.equals("reinscription-form")) {
            String login = request.getParameter("login");
            String nomClasse = request.getParameter("nomClasse");
            String annee = request.getParameter("annee");
            eleve = daoEleve.reinscriptionEleve(login);
            System.out.println(eleve.getLogin() + "  " + eleve.getNom() + " " + eleve.getNomClasse());
            if (eleve == null) {
                String message = "Le login ne correspond à aucun éléve!!";
                request.setAttribute("message3", message);
                rd = request.getRequestDispatcher("surveillant/reinscription.jsp");
            } else {
                Boolean resultat = daoEleve.reinscription(eleve, annee, nomClasse);

                Mensuel mensuel = new Mensuel(login, anInscr, "0", nomClasse);
                Boolean resultatMensuel = daoEleve.mensualite(mensuel);
                if (resultat && resultatMensuel) {
                    String message = "Réinscription réussie !!!";
                    request.setAttribute("message1", message);
                    rd = request.getRequestDispatcher("surveillant/reinscription.jsp");
                } else {
                    String message = "La Réinscription a échoué !!!";
                    request.setAttribute("message2", message);
                    rd = request.getRequestDispatcher("surveillant/reinscription.jsp");
                }

            }
        } else if (action.equals("ajoutSurv")) {

            rd = request.getRequestDispatcher("directeur/ajoutSurv.jsp");
        } else if (action.equals("formSurv")) {
            int idPerson = 0;
            if (request.getParameter("idPerson") != null) {
                idPerson = Integer.parseInt(request.getParameter("idPerson"));
            }
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String adresse = request.getParameter("adresse");
            String tel1 = request.getParameter("tel1");
            String tel2 = request.getParameter("tel2");
            String tel = tel1 + tel2;

            String chpr = "";
            for (int i = 0; i < 4; i++) {
                chpr += rd1.nextInt(10);

            }

            String chprM = "";
            for (int i = 0; i < 4; i++) {
                chprM += rd1.nextInt(10);

            }
            String motDePasse;
            String login;
            if (nom.length() > 2) {

                login = nom.substring(0, 3).toUpperCase().concat(prenom.substring(0, 1).toUpperCase()) + "" + chpr;
                motDePasse = nom.substring(0, 3).toUpperCase() + "" + chprM;
                session.setAttribute("loginSurv", login);
                session.setAttribute("mdpSurv", motDePasse);
            } else {
                login = nom.substring(0, nom.length()).toUpperCase().concat(prenom.substring(0, 1).toUpperCase()) + "" + chpr;
                motDePasse = nom.substring(0, nom.length()).toUpperCase() + "" + chprM;
                session.setAttribute("loginSurv", login);
                session.setAttribute("mdpSurv", motDePasse);
            }

            Utilisateur utilisateur = new Utilisateur();
            utilisateur.setLogin(login);
            utilisateur.setMotDePasse(motDePasse);

            id = daoPersonne.nbrePersonne();
            id++;
            Personne personne = new Personne(id, nom, prenom, adresse, tel);
            boolean resultat = daoDirecteur.ajouterSurv(personne, utilisateur);
            if (resultat) {
                String msg = "ajout";
                request.setAttribute("msg", msg);
                rd = request.getRequestDispatcher("directeur/ajoutSurv.jsp");
            }
        } else if (action.equals("valideModEleve")) {

            String idLog = request.getParameter("idLog");
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String nomClasse = request.getParameter("nomClasse");
            String dateNaissance = request.getParameter("dateNaissance");
            String lieuNaissance = request.getParameter("lieuNaissance");
            String adresse = request.getParameter("adresse");
            String year = request.getParameter("year");
            eleve = new Eleve(nomClasse, nom, prenom, adresse, dateNaissance, lieuNaissance, year, null, null);
            daoEleve.modifierEleve(eleve, idLog);
            eleves = daoEleve.listerEleve(nomClasse, year);
            String an = year;
            System.out.println(an);
            String nomCl = nomClasse;
            request.setAttribute("nomCl", nomCl);
            request.setAttribute("an", an);
            request.setAttribute("eleves", eleves);
            rd = request.getRequestDispatcher("directeur/listeClasse.jsp");
        } else if (action.equals("ajoutProf")) {
            request.setAttribute("anInscr", anInscr);
            rd = request.getRequestDispatcher("surveillant/ajoutProfesseur.jsp");

        } else if (action.equals("bulletin")) {

            rd = request.getRequestDispatcher("surveillant/classeBulletin.jsp");

        } else if (action.equals("bulletinClasse")) {

            String nomClasse = request.getParameter("nomClasse");
            String semestre = request.getParameter("semestre");
            String annee = request.getParameter("annee");
            String ens;
            ens = request.getParameter("ens");
            request.setAttribute("annee", annee);
            request.setAttribute("semestre", semestre);
            request.setAttribute("ens", ens);
            eleves = daoEleve.listerEleve(nomClasse, annee);
            request.setAttribute("eleves", eleves);
            for (Eleve e : eleves) {

                daoDirecteur.moyenne(e.getLogin(), annee, semestre, nomClasse, ens);
            }
            eleves = daoEleve.rangerEleve(nomClasse, annee, semestre, ens);

            rd = request.getRequestDispatcher("surveillant/listeBulletin.jsp");
        } else if (action.equals("creerBulletin")) {
            String semestre = request.getParameter("semestre");
            String login = request.getParameter("login");
            String annee = request.getParameter("annee");
            String ens = request.getParameter("ens");
            request.setAttribute("eleves", eleves);
            int i = 0;

            bulletin = new Bulletin();
            System.out.println(login + " " + annee + " " + semestre + " " + ens + " joe");
            bulletin = daoDirecteur.eleve(login, annee, semestre, ens);
            bulletin.setAnnee(annee);
            bulletin.setSemestre(semestre);
            /// Commencer par ici
            if ((semestre.equals("1ère_Composition")) && (ens.equals("Francais"))) {

                for (Eleve e : eleves) {
                    i++;
                    if ((e.getLogin().equals(login)) || (bulletin.getMoyCompo1FR() == e.getMoyCompo1FR())) {
                        break;
                    }
                }
            } else if ((semestre.equals("1ère_Composition")) && (ens.equals("Arabe"))) {
                for (Eleve e : eleves) {
                    i++;
                    if ((e.getLogin().equals(login)) || (bulletin.getMoyCompo1AR() == e.getMoyCompo1AR())) {
                        break;
                    }
                }

            } else if ((semestre.equals("2eme_Composition")) && (ens.equals("Francais"))) {
                for (Eleve e : eleves) {
                    i++;
                    if ((e.getLogin().equals(login)) || (bulletin.getMoyCompo2FR() == e.getMoyCompo2FR())) {
                        break;
                    }
                }
            } else if ((semestre.equals("2eme_Composition")) && (ens.equals("Arabe"))) {
                for (Eleve e : eleves) {
                    i++;
                    if ((e.getLogin().equals(login)) || (bulletin.getMoyCompo2AR() == e.getMoyCompo2AR())) {
                        break;
                    }
                }
            } else if ((semestre.equals("3eme_Composition")) && (ens.equals("Arabe"))) {
                for (Eleve e : eleves) {
                    i++;
                    if ((e.getLogin().equals(login)) || (bulletin.getMoyCompo3AR() == e.getMoyCompo3AR())) {
                        break;
                    }
                }
            } else if ((semestre.equals("3eme_Composition")) && (ens.equals("Francais"))) {
                for (Eleve e : eleves) {
                    i++;
                    if ((e.getLogin().equals(login)) || (bulletin.getMoyCompo3FR() == e.getMoyCompo3FR())) {
                        break;
                    }
                }
            }
            bulletin.setRang(i);
            bulletin.setEns(ens);
            System.out.println(bulletin.toString());
            // Donnees ajoutees
            request.setAttribute("bulletin", bulletin);
            rd = request.getRequestDispatcher("surveillant/bulletin.jsp");
        } else if (action.equals("imprimer")) {

            rd = request.getRequestDispatcher("surveillant/bulletin.jsp");

        } else if (action.equals("")) {
            String semestre = request.getParameter("semestre");
            String login = request.getParameter("login");
            String annee = request.getParameter("annee");
            String ens = request.getParameter("ens");
            //Fin 

//            GenererPDF generer = new GenererPDF();
//
//            try {
//                generer.documentPDF(bulletin);
//            } catch (DocumentException ex) {
//                ex.printStackTrace();
//            }
            String message = "Le bulletin a été créer avec succés";
            String nomClasse = bulletin.getNomClasse();
            request.setAttribute("annee", annee);
            request.setAttribute("semestre", semestre);
            eleves = daoEleve.rangerEleve(nomClasse, annee, semestre, ens);
//            eleves = daoEleve.listerEleve(nomClasse, annee);
//            Collections.sort(eleves);
//            Collections.reverse(eleves);
            request.setAttribute("login", login);
            request.setAttribute("eleves", eleves);
            request.setAttribute("mess", message);
            rd = request.getRequestDispatcher("surveillant/listeBulletin.jsp");
        } else if (action.equals("formProf")) {
            int idPerson = 0;
            if (request.getParameter("idPerson") != null) {
                idPerson = Integer.parseInt(request.getParameter("idPerson"));
            }
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String adresse = request.getParameter("adresse");
            String tel1 = request.getParameter("tel1");
            String tel2 = request.getParameter("tel2");
            String tel = tel1 + tel2;
            String annee = request.getParameter("annee");

            String chpr = "";
            for (int i = 0; i < 4; i++) {
                chpr += rd1.nextInt(10);

            }

            String chprM = "";
            for (int i = 0; i < 4; i++) {
                chprM += rd1.nextInt(10);

            }
            String motDePasse;
            String login;
            if (nom.length() > 2) {

                login = nom.substring(0, 3).toUpperCase().concat(prenom.substring(0, 1).toUpperCase()) + "" + chpr;
                motDePasse = nom.substring(0, 3).toUpperCase() + "" + chprM;
                session.setAttribute("loginProfesseur", login);
                session.setAttribute("mdpProfesseur", motDePasse);
            } else {
                login = nom.substring(0, nom.length()).toUpperCase().concat(prenom.substring(0, 1).toUpperCase()) + "" + chpr;
                motDePasse = nom.substring(0, nom.length()).toUpperCase() + "" + chprM;
                session.setAttribute("loginProfesseur", login);
                session.setAttribute("mdpProfesseur", motDePasse);
            }
            String[] nomClasse = request.getParameterValues("nomClasse");
            String[] nomMatiere = request.getParameterValues("nomMatiere");
            if ((nomClasse == null) || (nomMatiere == null)) {
                rd = request.getRequestDispatcher("surveillant/ajoutProfesseur.jsp");
            } else {
                Collection<String> nomMat = Arrays.asList(nomMatiere);
                Collection<String> nomCl = Arrays.asList(nomClasse);

                Personne personne = new Personne(idPerson, nom, prenom, adresse, tel);

                Utilisateur utilisateur = new Utilisateur();
                utilisateur.setLogin(login);

                utilisateur.setMotDePasse(motDePasse);
                request.setAttribute("login", login);
                request.setAttribute("motDePasse", motDePasse);

                request.setAttribute("annee", annee);
                Professeur professeur = new Professeur(personne, utilisateur, nomMat, nomCl);
                session.setAttribute("nomMat", nomMat);
                session.setAttribute("nomCl", nomCl);

                id = daoPersonne.nbrePersonne();
                id++;
                request.setAttribute("id", id);
                boolean resultat = daoProf.ajouterProf(professeur, id);
                if (resultat) {

                    rd = request.getRequestDispatcher("surveillant/profclasse.jsp");

                }

            }
        } else if (action.equals("valideModProf")) {
            int idPerson = Integer.parseInt(request.getParameter("idPerson"));
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String adresse = request.getParameter("adresse");
            String tel = request.getParameter("tel");
            String annee = request.getParameter("annee");
            Personne personne = new Personne(idPerson, nom, prenom, adresse, tel);

            boolean resultat = daoProf.modifierProf(personne);
            if (resultat) {
                profs = daoProf.listerProf();
                request.setAttribute("profs", profs);
                rd = request.getRequestDispatcher("directeur/listeProfs.jsp");
            } else {
                rd = request.getRequestDispatcher("surveillant/modificationProf.jsp");
            }
        } else if (action.equals("profclasse")) {
            int idPerson = Integer.parseInt(request.getParameter("id"));
            String loginProf = request.getParameter("login");
            String annee = request.getParameter("annee");
            Collection<String> nomCl = (Collection<String>) session.getAttribute("nomCl");
            ArrayList<ProfClasse> pc = new ArrayList<ProfClasse>();
            for (String r : nomCl) {
                String[] mats = request.getParameterValues(r);
                for (String q : mats) {
                    pc.add(new ProfClasse(idPerson, loginProf, r, q, annee));
                }

            }
            if (daoProf.ajouterProfclasse(pc)) {
                String msg = "ajout";
                request.setAttribute("msg", msg);
                rd = request.getRequestDispatcher("surveillant/ajoutProfesseur.jsp");
            } else {
                rd = request.getRequestDispatcher("surveillant/modificationProf.jsp");
            }
        } else if (action.equals("listerSurv")) {
            ArrayList<Utilisateur> users = daoProf.listerSurv();
            request.setAttribute("users", users);
            rd = request.getRequestDispatcher("directeur/listeSurv.jsp");

        } else if (action.equals("modifierSurv")) {
            int idSurv = Integer.parseInt(request.getParameter("idSurv"));
            Utilisateur usr = daoProf.listerUnSurv(idSurv);
            request.setAttribute("usr", usr);
            rd = request.getRequestDispatcher("directeur/modificationSurv.jsp");
        } else if (action.equals("valideModSurv")) {
            Utilisateur usr = new Utilisateur();
            usr.setNom(request.getParameter("nom"));
            usr.setPrenom(request.getParameter("prenom"));
            usr.setAdresse(request.getParameter("adresse"));
            usr.setTelephone(request.getParameter("telephone"));
            usr.setIdPersonne(request.getParameter("idPerson"));
            System.out.println(request.getParameter("idPerson"));
            daoDirecteur.modSurv(usr);

            ArrayList<Utilisateur> users = daoProf.listerSurv();
            request.setAttribute("users", users);
            rd = request.getRequestDispatcher("directeur/listeSurv.jsp");

        } else if (action.equals("supprimerSurv")) {
            int idSurv = Integer.parseInt(request.getParameter("idSurv"));
            daoDirecteur.supprimerSurv(idSurv);
            ArrayList<Utilisateur> users = daoProf.listerSurv();
            request.setAttribute("users", users);
            rd = request.getRequestDispatcher("directeur/listeSurv.jsp");
        } else if (action.equals("listerProfs")) {
            profs = daoProf.listerProf();
            request.setAttribute("profs", profs);
            rd = request.getRequestDispatcher("directeur/listeProfs.jsp");
        } else if (action.equals("detailProf")) {
            int idProf = Integer.parseInt(request.getParameter("idProf"));
            ArrayList<Professeur> detailProf = daoProf.detailProf(idProf);
            ArrayList<Arabe> arabe = daoProf.listerMatArabe();
            for (Professeur pr : detailProf) {
                for (Arabe ar : arabe) {
                    if (pr.getNomMatiere().equals(ar.getNomEnFrancais())) {
                        pr.setArabe(ar);
                        break;
                    }
                }
            }
            request.setAttribute("detailProf", detailProf);
            rd = request.getRequestDispatcher("directeur/detailProf.jsp");

        } else if (action.equals("listerClasse") || action.equals("supprimerEleve")) {
            String an = request.getParameter("year");
            String nomCl = request.getParameter("nomClasse");

            eleves = daoEleve.listerEleve(nomCl, an);
            request.setAttribute("nomCl", nomCl);
            request.setAttribute("an", an);
            request.setAttribute("eleves", eleves);

            rd = request.getRequestDispatcher("directeur/listeClasse.jsp");
        } else if (action.equals("formAffClass")) {
            rd = request.getRequestDispatcher("directeur/formAffClasse.jsp");
        } else if (action.equals("classes")) {

            rd = request.getRequestDispatcher("directeur/classes.jsp");
        } else if (action.equals("updateClasse")) {
            String classe = request.getParameter("classe");
            request.setAttribute("classe", classe);

            rd = request.getRequestDispatcher("directeur/updateClasse.jsp");
        } else if (action.equals("validClasse")) {
            String nomClasse = request.getParameter("nomClasse");
            String classeOld = request.getParameter("classeOld");
            daoDirecteur.updateClasse(nomClasse, classeOld);
            classes = daoEleve.listerClasse();
            session.setAttribute("classes", classes);
            rd = request.getRequestDispatcher("directeur/classes.jsp");
        } else if (action.equals("modifierProf")) {
            int idProf = Integer.parseInt(request.getParameter("idProf"));
            professeur = daoProf.listerUnProf(idProf);

            request.setAttribute("professeur", professeur);
            rd = request.getRequestDispatcher("surveillant/modificationProf.jsp");
        } else if (action.equals("formNote")) {
            ArrayList<Arabe> arabe = daoProf.listerMatEnArabe();
            ArrayList<String> mat = new ArrayList<>();
            for (Arabe m : arabe) {
                mat.add(m.getNomEnArabe());
            }
            for (String f : matFrancais) {
                mat.add(f);
            }
            request.setAttribute("mat", mat);
            rd = request.getRequestDispatcher("directeur/formNote.jsp");

        } else if (action.equals("voirNote")) {
            ArrayList<Arabe> arabe = daoProf.listerMatEnArabe();
            eleves = null;
            String nomClasse = request.getParameter("nomClasse");
            String nomMatiere = request.getParameter("nomMatiere");
            String ma = nomMatiere;
            for (Arabe ar : arabe) {
                if (nomMatiere.equals(ar.getNomEnArabe())) {
                    nomMatiere = ar.getNomEnFrancais();
                    break;
                }

            }
            String semestre = request.getParameter("semestre");
            String annee = request.getParameter("annee");
            eleves = daoDirecteur.consulterNotes(nomClasse, nomMatiere, semestre, annee);
            if (eleves == null) {
                rd = request.getRequestDispatcher("directeur/formNote.jsp");
            } else {
                request.setAttribute("semestre", semestre);
                request.setAttribute("annee", annee);
                request.setAttribute("nomClasse", nomClasse);
                request.setAttribute("nomMatiere", nomMatiere);
                request.setAttribute("eleves", eleves);
                request.setAttribute("ma", ma);
                rd = request.getRequestDispatcher("directeur/affichageNote.jsp");
            }

        } else if (action.equals("saveMatiere")) {
            rd = request.getRequestDispatcher("directeur/formMatiere.jsp");

        } else if (action.equals("validerMatiere")) {
            String langueMatiere = request.getParameter("langueMatiere");

            System.out.println(langueMatiere);
            if (langueMatiere.equals("")) {
                String msg = "erreur";
                request.setAttribute("msgSelect", msg);
                rd = request.getRequestDispatcher("directeur/formMatiere.jsp");
            } else {
                String nomMatiere = request.getParameter("nomMatiere");
                String nomArabe = request.getParameter("nomArabe");

                boolean result = false;
                if (langueMatiere.equalsIgnoreCase("Arabe")) {
                    nomMatiere = nomMatiere.toUpperCase() + ":" + langueMatiere;
                    result = daoDirecteur.insertMatiere(nomMatiere, nomArabe);
                } else if (langueMatiere.equalsIgnoreCase("Francais")) {
                    nomMatiere = nomMatiere.toUpperCase() + ":" + langueMatiere;
                    String nomArabe2 = "";
                    result = daoDirecteur.insertMatiere(nomMatiere, nomArabe2);
                }

                if (result) {

                    String msg = "Matière: " + nomMatiere + "  ajoutée avec succée";
                    request.setAttribute("mes", msg);
                    matFrancais = new ArrayList<>();
                    matArabe = new ArrayList<>();
                    matieres = new ArrayList<>();
                    matieres = daoProf.listerMatiere();
                    session.removeAttribute("matieres");
                    session.removeAttribute("matArabe");
                    session.removeAttribute("matFrancais");
                    matieres.forEach((mat) -> {
                        StringTokenizer st = new StringTokenizer(mat, ":");
                        while (st.hasMoreTokens()) {
                            String ch = st.nextToken();
                            if ("Arabe".equals(ch)) {
                                matArabe.add(mat);
                            } else if ("Francais".equals(ch)) {
                                matFrancais.add(mat);
                            }
                        }

                    });
                    session.setAttribute("matieres", matieres);
                    session.setAttribute("matArabe", matArabe);
                    session.setAttribute("matFrancais", matFrancais);
                    rd = request.getRequestDispatcher("directeur/formMatiere.jsp");
                } else {
                    String msg = "échec de l'ajout";
                    request.setAttribute("message", msg);
                    rd = request.getRequestDispatcher("directeur/formMatiere.jsp");
                }
            }

        } else if (action.equals("listeMatieres")) {
            ArrayList<Arabe> arabe = daoProf.listerMatEnArabe();
            request.setAttribute("arabe", arabe);
            rd = request.getRequestDispatcher("directeur/listeMatiere.jsp");
        } else if (action.equals("updateMatAr")) {
            String nomEnAr = request.getParameter("nomEnAr");
            String nomEnFrancais = request.getParameter("nomEnFrancais");
            request.setAttribute("nomEnAr", nomEnAr);
            request.setAttribute("nomEnFrancais", nomEnFrancais);
            request.setAttribute("action", action);
            rd = request.getRequestDispatcher("directeur/updateMatiere.jsp");
        } else if (action.equals("updateMatFr")) {
            String nomMat = request.getParameter("nomMat");
            request.setAttribute("nomMat", nomMat);
            request.setAttribute("action", action);
            rd = request.getRequestDispatcher("directeur/updateMatiere.jsp");
        } else if (action.equals("valideMatFr")) {
            String nomFrancaisOld = request.getParameter("nomFrancaisOld");
            String nomFr = request.getParameter("nomFr") + ":Francais";
            nomFrancaisOld = nomFrancaisOld + ":Francais";
            daoDirecteur.updateMatiereFr(nomFr, nomFrancaisOld);

            matFrancais = new ArrayList<>();
            matArabe = new ArrayList<>();
            matieres = new ArrayList<>();
            matieres = daoProf.listerMatiere();
            session.removeAttribute("matieres");
            session.removeAttribute("matArabe");
            session.removeAttribute("matFrancais");
            matieres.forEach((mat) -> {
                StringTokenizer st = new StringTokenizer(mat, ":");
                while (st.hasMoreTokens()) {
                    String ch = st.nextToken();
                    if ("Arabe".equals(ch)) {
                        matArabe.add(mat);
                    } else if ("Francais".equals(ch)) {
                        matFrancais.add(mat);
                    }
                }

            });
            session.setAttribute("matieres", matieres);
            session.setAttribute("matArabe", matArabe);
            session.setAttribute("matFrancais", matFrancais);

            ArrayList<Arabe> arabe = daoProf.listerMatEnArabe();
            request.setAttribute("arabe", arabe);
            rd = request.getRequestDispatcher("directeur/listeMatiere.jsp");
        } else if (action.equals("validModMat")) {
            String nomEnAr = request.getParameter("nomEnAr");
            String nomEnFrancais = request.getParameter("nomEnFrancais") + ":Arabe";
            String nomEnFrancaisOld = request.getParameter("nomEnFrancaisOld");
            nomEnFrancaisOld = nomEnFrancaisOld + ":Arabe";
            System.out.println(nomEnFrancais);
            daoDirecteur.updateMatiere(nomEnAr, nomEnFrancais, nomEnFrancaisOld);
            ArrayList<Arabe> arabe = daoProf.listerMatEnArabe();
            request.setAttribute("arabe", arabe);
            rd = request.getRequestDispatcher("directeur/listeMatiere.jsp");
        } else if (action.equals("supprimerMat")) {
            String nom = request.getParameter("nom");
            daoDirecteur.SupprimerMat(nom);

            matFrancais = new ArrayList<>();
            matArabe = new ArrayList<>();
            matieres = new ArrayList<>();
            matieres = daoProf.listerMatiere();
            session.removeAttribute("matieres");
            session.removeAttribute("matArabe");
            session.removeAttribute("matFrancais");
            matieres.forEach((mat) -> {
                StringTokenizer st = new StringTokenizer(mat, ":");
                while (st.hasMoreTokens()) {
                    String ch = st.nextToken();
                    if ("Arabe".equals(ch)) {
                        matArabe.add(mat);
                    } else if ("Francais".equals(ch)) {
                        matFrancais.add(mat);
                    }
                }

            });
            session.setAttribute("matieres", matieres);
            session.setAttribute("matArabe", matArabe);
            session.setAttribute("matFrancais", matFrancais);

            ArrayList<Arabe> arabe = daoProf.listerMatEnArabe();
            request.setAttribute("arabe", arabe);

            rd = request.getRequestDispatcher("directeur/listeMatiere.jsp");
        } else if (action.equals("saveClasse")) {
            ArrayList<Arabe> arabe = daoProf.listerMatEnArabe();
            request.setAttribute("arabe", arabe);
            rd = request.getRequestDispatcher("directeur/formClasse.jsp");
        } else if (action.equals("validerClasse")) {
            String nomClasse = request.getParameter("nomClasse");
            String[] francais = request.getParameterValues("matFrancais");
            for (int i = 0; i < francais.length; i++) {
                francais[i] += ":Francais";
            }
            String[] arabe = request.getParameterValues("matArabe");
            ArrayList<String> corresFr = daoProf.listerCorespondFr(arabe);

            boolean result = daoDirecteur.insertClasse(nomClasse, francais, corresFr);
            if (result) {
                ArrayList<Arabe> arabe1 = daoProf.listerMatEnArabe();
                request.setAttribute("arabe", arabe1);
                String msg = "Classe : " + nomClasse + "  ajoutée avec succée";
                request.setAttribute("mes", msg);
                rd = request.getRequestDispatcher("directeur/formClasse.jsp");

            } else {
                ArrayList<Arabe> arabe1 = daoProf.listerMatEnArabe();
                request.setAttribute("arabe", arabe1);
                String msg = "échec de l'ajout de Classe";
                request.setAttribute("message", msg);
                rd = request.getRequestDispatcher("directeur/formClasse.jsp");
            }

        } else if (action.equals("supprimerCl")) {
            String nomCl = request.getParameter("nomCl");
            daoDirecteur.supprimerCl(nomCl);

            classes = new ArrayList<>();
            session.removeAttribute("classes");

            classes = daoEleve.listerClasse();
            session.setAttribute("classes", classes);
            rd = request.getRequestDispatcher("directeur/classes.jsp");
        } //ajouter en fin 
        else if (action.equals("compte")) {
            rd = request.getRequestDispatcher("directeur/compte.jsp");

        } else if (action.equals("annee")) {
            rd = request.getRequestDispatcher("directeur/annee.jsp");

        } else if (action.equals("ajoutAnnee")) {
            int[] an = new int[2];
            int i = 0;
            String newAnnee = request.getParameter("nv-annee");
            StringTokenizer st = new StringTokenizer(newAnnee, "-");
            while (st.hasMoreTokens()) {
                String ch = st.nextToken();
                an[i] = Integer.parseInt(ch);
                i++;
            }

            if ((an[0] >= an[1]) || (an[1] - an[0] > 1)) {
                String msg = "ajout";
                request.setAttribute("msg", msg);
                rd = request.getRequestDispatcher("directeur/annee.jsp");
            } else {
                boolean res = daoDirecteur.insertAnnee(newAnnee);
                if (!res) {
                    String er = "ajout";
                    request.setAttribute("er", er);
                }
                annees = daoEleve.listerAnnee();
                request.setAttribute("annees", annees);
                rd = request.getRequestDispatcher("directeur/annee.jsp");
            }
        } else if (action.equals("confirmPasswd")) {
            String newpasswd = request.getParameter("newpasswd");
            System.out.println("nouveau :" + newpasswd);
            String oldpasswd = request.getParameter("oldpasswd");
            System.out.println("ancien :" + oldpasswd);
            String newpasswd1 = request.getParameter("newpasswd1");
            System.out.println("nouveau :" + newpasswd1);
            String oldpasswd1 = (String) session.getAttribute("motDePasse");
            System.out.println("mot de passe :" + oldpasswd1);
            String login = (String) session.getAttribute("log");

            String profils = (String) session.getAttribute("profils");
            System.out.println("login :" + profils);
            if ((newpasswd.equals(newpasswd1)) && (oldpasswd.equals(oldpasswd1)) && (profils.equals("Directeur"))) {
                daoDirecteur.changePasswdDir(login, newpasswd);
                session.setAttribute("motDePasse", newpasswd);
                String msg = "Mot de Passe modifiée avec succés";
                request.setAttribute("mes", msg);
                rd = request.getRequestDispatcher("directeur/compte.jsp");

            } else if ((newpasswd.equals(newpasswd1)) && (oldpasswd.equals(oldpasswd1)) && (profils.equals("surveillant"))) {

                daoDirecteur.changePasswdSurv(login, newpasswd);
                session.setAttribute("motDePasse", newpasswd);
                String msg = "Mot de Passe modifiée avec succés";
                request.setAttribute("mes", msg);
                rd = request.getRequestDispatcher("directeur/compte.jsp");
            } else {
                String msg = "échec de la modification";
                request.setAttribute("message", msg);
                rd = request.getRequestDispatcher("directeur/compte.jsp");
            }
        } /////////////////////////////////////////////////Recherche////////////////////////////////////
        else if (action.equals("rechercher")) {
            String nom = request.getParameter("recherche");
            rechercheParElev = daoParent.rechercheEleveProf(nom);

            for (Eleve eleve1 : rechercheParElev) {
                System.out.println("prenom " + eleve1.getPrenom());
            }
            if (rechercheParElev.isEmpty()) {
                String message = "Aucun résultat !!!";
                request.setAttribute("message", message);
                rd = request.getRequestDispatcher("directeur/rechercheDir.jsp");
            } else {
                request.setAttribute("rechercheParElev", rechercheParElev);
                rd = request.getRequestDispatcher("directeur/rechercheDir.jsp");
            }
        }
        ////////////////////////////////////////////////Fin Recheerche///////////////////////////////

        if (rd != null) {
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
