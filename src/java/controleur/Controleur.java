/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Arabe;
import model.DAOFactory;
import model.Eleve;
import model.GenererRef;
import model.ListEleve;
import model.Parent;
import model.Reclamation;
import model.Utilisateur;
import modelPersonne.DAOEleveImpl;
import modelPersonne.DAOParentImpl;
import modelPersonne.DAOPersonneImpl;
import modelPersonne.DAOProfImpl;

/**
 *
 * @author ibrah
 */

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 20)
public class Controleur extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private DAOPersonneImpl daoPersonne;
    public List<Utilisateur> personnes;
    public ArrayList<Eleve> eleve2;
    public ArrayList<ListEleve> eleve3;
    public ArrayList<Eleve> eleve4;
    public ArrayList<Arabe> listMatiere;
    public ArrayList<String> listAnnee;
    public ArrayList<String> listClasse;
    public ArrayList<Arabe> listMatiere2;
    public ArrayList<String> listAnnee2;
    public ArrayList<String> listClasse2;
    public ArrayList<Utilisateur> compte;
    private DAOEleveImpl daoEleve;
    private DAOProfImpl daoProf;
    private DAOParentImpl daoParent;
    public ArrayList<Parent> listParent;
    public ArrayList<Eleve> listeEleve;
    public ArrayList<Reclamation> reclamation;
    public ArrayList<Eleve> rechercheParElev;
    
    
    private final String RepDestinationImg = "D:\\Personnel\\7Tup\\Projet_7Tup\\Projet Franco Arabe\\ecoleArabe\\web\\ImageUser";

    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.daoPersonne = daoFactory.getDAOPersonne();
        personnes = new ArrayList();
        this.daoEleve = daoFactory.getDAOEleve();
        this.daoProf = daoFactory.getDAOProf();
        this.daoParent = daoFactory.getDAOParent();
        eleve2 = new ArrayList();
        eleve3 = new ArrayList();
        eleve4 = new ArrayList();
        compte = new ArrayList<>();
        listParent = new ArrayList();
        reclamation = new ArrayList<>();
        rechercheParElev = new ArrayList<>();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        RequestDispatcher rd = null;
        String en_tete = request.getHeader("referer");
        System.out.println("en tete " + en_tete);
        String login = "";

        String anInscr;
        String mois1 = new SimpleDateFormat("MM", Locale.FRANCE).format(Calendar.getInstance().getTime());
        int newmois = Integer.parseInt(mois1);
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

        if (action == null) {
            rd = request.getRequestDispatcher("accue.html");
        } else if (en_tete == null) {
            session.invalidate();
            rd = request.getRequestDispatcher("vue/erreur.jsp");
        } else if (action.equals("accueil")) {
            rd = request.getRequestDispatcher("directeur/accueilDirecteur.jsp");
        } else if (action.equals("accueilSurv")) {
            rd = request.getRequestDispatcher("surveillant/accueilSurveillant.jsp");
        } else if (action.equals("connection")) {
            //rd = request.getRequestDispatcher("vue/SeConnecter.jsp");
            rd = request.getRequestDispatcher("connexion/login.jsp");
        } else if (action.equals("parent")) {
            rd = request.getRequestDispatcher("vue/parent/parent.jsp");
        } else if (action.equals("authentifier")) {
            login = request.getParameter("login");
            String motDePasse = request.getParameter("motDePasse");
            int nbre = daoPersonne.determinerProfil(login, motDePasse);
            int i = 0;
            if (nbre == 1) {
                personnes = daoPersonne.listPersonne(nbre, login, motDePasse);

                for (Utilisateur p : personnes) {
                    session.setAttribute("log", login);
                    session.setAttribute("motDePasse", motDePasse);
                    session.setAttribute("prenom", p.getPrenom());
                    session.setAttribute("nom", p.getNom());
                    session.setAttribute("profils", p.getProfils());
                    session.setAttribute("nomImgPers", p.getNomImgPers());
                    i = 1;
                    rd = request.getRequestDispatcher("directeur/accueilDirecteur.jsp");
                }
            }
            if (nbre == 2) {
                personnes = daoPersonne.listPersonne(nbre, login, motDePasse);

                for (Utilisateur p : personnes) {
                    session.setAttribute("log", login);
                    session.setAttribute("motDePasse", motDePasse);
                    session.setAttribute("prenom", p.getPrenom());
                    session.setAttribute("nom", p.getNom());
                    session.setAttribute("profils", p.getProfils());                    
                    session.setAttribute("nomImgPers", p.getNomImgPers());
                    i = 1;
                    rd = request.getRequestDispatcher("surveillant/accueilSurveillant.jsp");
                }
            }
            if (nbre == 3) {
                personnes = daoPersonne.listPersonne(nbre, login, motDePasse);

                for (Utilisateur p : personnes) {
                    session.setAttribute("log", login);
                    session.setAttribute("motDePasse", motDePasse);
                    session.setAttribute("prenom", p.getPrenom());
                    session.setAttribute("nom", p.getNom());
                    session.setAttribute("profils", p.getProfils());
                    session.setAttribute("nomImgPers", p.getNomImgPers());
                    i = 1;
                    rd = request.getRequestDispatcher("professeur/acceuilProf.jsp");
                }
            }
            if ((nbre == 0) || (i == 0)) {
                String message = "Login et/ou mot de passe incorrect";
                request.setAttribute("mess", message);
                rd = request.getRequestDispatcher("connexion/login.jsp");
            }

                //Eleve/////////
            //                if ((p.getProfils().equalsIgnoreCase("eleve")) && (login.equals(p.getLogin())) && (motDePasse.equals(p.getMotDePasse()))) {
//                    session.setAttribute("log", login);
//                    session.setAttribute("motDePasse", motDePasse);
//                    session.setAttribute("prenom", p.getPrenom());
//                    session.setAttribute("nom", p.getNom());
//                    i = 1;
//                    rd = request.getRequestDispatcher("acceuilEleve.jsp");
            
            
            //***********************************************Ajouter note Eleve************************************************************************  
        } else if (action.equals("ajoutNote")) {
            String loginProf = request.getParameter("login");
            listMatiere = daoEleve.selectMatiere(loginProf);
            listClasse = daoEleve.selectClasse(loginProf);
            listAnnee = daoEleve.selectAnnee();
            request.setAttribute("listMatiere", listMatiere);
            request.setAttribute("listClasse", listClasse);
            request.setAttribute("listAnnee", listAnnee);
            rd = request.getRequestDispatcher("professeur/demandeMatClasse.jsp");
        } else if (action.equals("demandeMatClasse")) {
            String matiere = request.getParameter("matiere");
            matiere = daoProf.matiere(matiere);
            String login1 = request.getParameter("login");
            String classe = request.getParameter("classe");
            String semestre = request.getParameter("semestre");
            String annee = request.getParameter("annee");
            String message = "";
            String annee1 = daoEleve.verifProf1(matiere, classe, login1);
            eleve2 = daoEleve.listEleve(classe, matiere, annee);

            for (Eleve eleve : eleve2) {
                System.out.println("prenom :" + eleve.getPrenom());
            }
            String loginProf = daoEleve.verifProf(matiere, classe);
            if (!annee.equals(annee1)) {
                message = "L'année est incorrect!!!";
                request.setAttribute("message", message);
                session.setAttribute("listMatiere", listMatiere);
                session.setAttribute("listClasse", listClasse);
                session.setAttribute("listAnnee", listAnnee);
                rd = request.getRequestDispatcher("professeur/demandeMatClasse.jsp");
            } else if (matiere == null || classe == null) {
                message = "Vous n'avez aucun privilège ici!!!";
                request.setAttribute("message", message);
                rd = request.getRequestDispatcher("professeur/demandeMatClasse.jsp");
            } else if (eleve2.isEmpty()) {
                session.setAttribute("listMatiere", listMatiere);
                session.setAttribute("listClasse", listClasse);
                session.setAttribute("listAnnee", listAnnee);
                message = "Cette classe n'a pas encore d'élèves";
                request.setAttribute("message", message);
                rd = request.getRequestDispatcher("professeur/demandeMatClasse.jsp");
            } else {
                session.setAttribute("semestre", semestre);
                session.setAttribute("matiere", matiere);
                session.setAttribute("annee", annee);
                session.setAttribute("eleve", eleve2);
                rd = request.getRequestDispatcher("professeur/AjouterNote.jsp");
            }
        } else if (action.equals("ajouterNote")) {
            DAOFactory daoFactory = DAOFactory.getInstance();
            DAOEleveImpl d = new DAOEleveImpl(daoFactory);
            String annee = request.getParameter("annee");
            String semestre = request.getParameter("semestre");
            String matiere = request.getParameter("matiere");
            String[] composition = request.getParameterValues("composition");
            int i = 0;
            boolean ex = true;
            for (int j = 0; j < composition.length; j++) {
                if (Float.parseFloat(composition[j]) > 10) {
                    ex = false;
                }
                break;
            }
            if (ex == true) {
                for (Eleve eleve1 : eleve2) {
                    d.ajouterNote1(composition[i], eleve1.getMatriculeEleve(), semestre, annee, matiere);
                    i++;
                }
                if (ex == true) {
                    request.setAttribute("eleve", eleve2);
                    String mes = "Ajouter avecc succèss";
                    request.setAttribute("mes", mes);
                    rd = request.getRequestDispatcher("professeur/AjouterNote.jsp");
                }
            } else {
                String message = "les notes ne doivent pas etre supérieur à 10";
                request.setAttribute("message", message);
                request.setAttribute("eleve", eleve2);
                rd = request.getRequestDispatcher("professeur/AjouterNote.jsp");
            }
        } //***********************************************Fin Ajouter note Eleve************************************************************************  
        //***********************************************Lister note Eleve************************************************************************  
        else if (action.equals("Note")) {
            String loginProf = request.getParameter("login");
            System.out.println("loginProf " + loginProf);
            listMatiere2 = daoEleve.selectMatiere(loginProf);
            listClasse2 = daoEleve.selectClasse(loginProf);
            listAnnee2 = daoEleve.selectAnnee();

            request.setAttribute("listMatiere2", listMatiere2);
            request.setAttribute("listClasse2", listClasse2);
            request.setAttribute("listAnnee2", listAnnee2);
            rd = request.getRequestDispatcher("professeur/demandeClasseMatListe.jsp");
        } else if (action.equals("demandeMatClasseListe")) {
            String matiere = request.getParameter("matiere");
            matiere = daoProf.matiere(matiere);
            String login2 = request.getParameter("login");
            String classe = request.getParameter("classe");
            String annee = request.getParameter("annee");
            String message = "Veuillez vérifier les informations saisies";
            eleve3 = daoEleve.listNote(classe, matiere, annee);
            request.setAttribute("eleve", eleve3);
            String loginProf = daoEleve.verifProf(matiere, classe);
            if (matiere == null || classe == null) {
                message = "Vous n'avez aucun privilège ici!!!";
                request.setAttribute("message", message);
                rd = request.getRequestDispatcher("professeur/demandeClasseMatListe.jsp");
            } else {
                if (eleve3.isEmpty()) {
                    request.setAttribute("message", message);
                    request.setAttribute("listMatiere2", listMatiere2);
                    request.setAttribute("listClasse2", listClasse2);
                    request.setAttribute("listAnnee2", listAnnee2);
                    rd = request.getRequestDispatcher("professeur/demandeClasseMatListe.jsp");
                } else {
                    rd = request.getRequestDispatcher("professeur/listerNote.jsp");
                }
            }
            //***********************************************Fin Lister note Eleve************************************************************************  
        } //***********************************************Parent************************************************************************     
        else if (action.equals("portailParent")) {
            rd = request.getRequestDispatcher("acceuilParent.jsp");
        } else if (action.equals("authen_parent")) {
            String nom = "";
            String prenom = "";
            String annee = new SimpleDateFormat("yyyy", Locale.FRANCE).format(Calendar.getInstance().getTime());
            int newYear = Integer.parseInt(annee);
            int anneeBd = newYear - 1;
            String an = "" + anneeBd + "-" + annee;
            String loginPar = request.getParameter("login");
            String motDePasse = request.getParameter("mdp");
            listParent = daoParent.listPar(loginPar, motDePasse);
            String loginParent = daoParent.loginParent(loginPar, motDePasse);
            System.out.println("login parent " + loginParent);
            System.out.println("//////////////////////////////parent//////////////////////////// ");
            for (Parent par : listParent) {
                nom = par.getNom();
                prenom = par.getPrenom();
            }
            if (!listParent.isEmpty()) {
                session.setAttribute("login", loginParent);
                session.setAttribute("mdp", motDePasse);
                session.setAttribute("nom", nom);
                session.setAttribute("prenom", prenom);
                rd = request.getRequestDispatcher("accueilPar.jsp");
            } else {
                String mes = "Login et/ou mot de passe invalide(s)";
                request.setAttribute("message", mes);
                rd = request.getRequestDispatcher("acceuilParent.jsp");

            }

        } else if (action.equals("parentLien")) {
            String an = "";
            String mois = new SimpleDateFormat("MM", Locale.FRANCE).format(Calendar.getInstance().getTime());
            int newMois = Integer.parseInt(mois);
            if (newMois >= 1 && newMois <= 9) {
                String annee = new SimpleDateFormat("yyyy", Locale.FRANCE).format(Calendar.getInstance().getTime());
                int newYear = Integer.parseInt(annee);
                int anneeBd = newYear - 1;
                an = "" + anneeBd + "-" + annee;
            } else {
                String annee = new SimpleDateFormat("yyyy", Locale.FRANCE).format(Calendar.getInstance().getTime());
                int newYear = Integer.parseInt(annee);
                int anneeBd = newYear + 1;
                an = "" + annee + "-" + anneeBd;
            }

            String loginPar = request.getParameter("login");
            String motDePasse = request.getParameter("mdp");

            listParent = daoParent.listPar(loginPar, motDePasse);
            String loginParent = daoParent.loginParent(loginPar, motDePasse);
            listeEleve = daoParent.listerEleve(loginParent);
            request.setAttribute("listeEleve", listeEleve);
            request.setAttribute("login", loginParent);
//            request.setAttribute("mdp", motDePasse);
            session.setAttribute("mdp", motDePasse);
            rd = request.getRequestDispatcher("parentForm.jsp");
        } else if (action.equals("eleveparent")) {
//            String message = "Votre enfant n'a pas encore de notes.";
//            String prenom = request.getParameter("prenom");
//            String nom = request.getParameter("nom");
//            String dateNaissance = request.getParameter("dateNaissance");
//            String lieuNaissance = request.getParameter("lieuNaissance");
//            String annee = request.getParameter("annee");
//            String classe = request.getParameter("nomClasse");
            //String loginEleve = daoEleve.eleveParent(prenom, nom, dateNaissance, lieuNaissance, classe);
            String loginEleve = request.getParameter("loginEleve");
            if (loginEleve != null) {
                ArrayList<String> annees = daoEleve.eleveParent(loginEleve);
                request.setAttribute("annees", annees);
                Eleve el = daoEleve.listerUnEleve(loginEleve);
                session.setAttribute("el", el);
                rd = request.getRequestDispatcher("anEleve.jsp");
            } else {
                rd = request.getRequestDispatcher("acceuil.html");
            }
        } else if (action.equals("note")) {
            String message = "Votre enfant n'a pas encore de notes.";
            String annee = request.getParameter("annee");
            String loginEleve = request.getParameter("loginEleve");
            eleve4 = daoEleve.eleveParent(annee, loginEleve);

            request.setAttribute("annee", annee);
            request.setAttribute("eleve4", eleve4);
            request.setAttribute("message", message);
            rd = request.getRequestDispatcher("eleveparent.jsp");

            //***********************************************Fin Parent************************************************************************
            //***********************************************Modification note Eleve************************************************************************  
        } else if (action.equals("modifier")) {
            String prenom = request.getParameter("prenom");
            String nom = request.getParameter("nom");
            String composition = request.getParameter("composition");
            String loginEleve = request.getParameter("loginEleve");
            String matiere = request.getParameter("matiere");
            String semestre = request.getParameter("semestre");
            String classe = request.getParameter("classe");
            String annee = request.getParameter("annee");
            request.setAttribute("prenom", prenom);
            request.setAttribute("nom", nom);

            request.setAttribute("composition", composition);
            request.setAttribute("loginEleve", loginEleve);
            request.setAttribute("matiere", matiere);
            request.setAttribute("semestre", semestre);
            request.setAttribute("classe", classe);
            request.setAttribute("annee", annee);
            rd = request.getRequestDispatcher("professeur/modifier.jsp");
        } else if (action.equals("modification")) {
            String prenom = request.getParameter("prenom");
            String nom = request.getParameter("nom");
            String loginEleve = request.getParameter("loginEleve");
            String composition = request.getParameter("composition");
            float comp = Float.parseFloat(composition);

            String matiere = request.getParameter("matiere");
            String semestre = request.getParameter("semestre");
            String classe = request.getParameter("classe");
            String annee = request.getParameter("annee");
            DAOFactory daoFactory = DAOFactory.getInstance();
            DAOEleveImpl d = new DAOEleveImpl(daoFactory);
            if ((comp > 10) || (comp < 0)) {
                request.setAttribute("prenom", prenom);
                request.setAttribute("nom", nom);
                request.setAttribute("composition", composition);
                request.setAttribute("loginEleve", loginEleve);
                request.setAttribute("matiere", matiere);
                request.setAttribute("semestre", semestre);
                request.setAttribute("classe", classe);
                request.setAttribute("annee", annee);
                String msg = "note entrée : Invalide";
                request.setAttribute("msg", msg);
                rd = request.getRequestDispatcher("professeur/modifier.jsp");
            } else {

                d.modifierNote(composition, loginEleve, matiere, semestre, classe, annee);
                eleve3 = daoEleve.listNote(classe, matiere, annee);
                request.setAttribute("eleve", eleve3);
                String msgOk = "ok";
                request.setAttribute("msgOk", msgOk);
                rd = request.getRequestDispatcher("professeur/listerNote.jsp");
            }

        } //***********************************************Fin modif note Eleve************************************************************************  
        //***********************************************compte Prof************************************************************************  
        //**********************************************Compte Parent**********************************************************************
        else if (action.equals("compteParent")) {
            rd = request.getRequestDispatcher("compteParent.jsp");
        } else if (action.equals("modifCompteParent")) {
            String loginPar = (String) session.getAttribute("login");
            String ancienMdp = request.getParameter("ancienMdp");
            String nouveauMdp = request.getParameter("nouveauMdp");
            String confirmerMdp = request.getParameter("confirmerMdp");

            if (nouveauMdp.equals(confirmerMdp)) {
                int i = daoParent.compte2(ancienMdp);
                if (i == 0) {
                    daoParent.modifierCompte(loginPar, nouveauMdp);
                    String mes1 = "Modification effectuée avec succée";
                    request.setAttribute("mes1", mes1);
                    rd = request.getRequestDispatcher("compteParent.jsp");
                } else {
                    String mes2 = "L'ancien mot de passe n'est pas conforme";
                    request.setAttribute("mes2", mes2);
                    rd = request.getRequestDispatcher("compteParent.jsp");
                }
            } else {
                String mes3 = "Les mots de passes ne sont pas conformes";
                request.setAttribute("mes3", mes3);
                rd = request.getRequestDispatcher("compteParent.jsp");
            }

        } //**********************************************Fin Compte Parent******************************************************************
        else if (action.equals("compte")) {
            String loginProf = request.getParameter("login");
            compte = daoEleve.compte(loginProf);
            for (Utilisateur ut : compte) {
                request.setAttribute("idPersonne", ut.getIdPersonne());
            }
            request.setAttribute("compte", compte);
            rd = request.getRequestDispatcher("professeur/Compte.jsp");
        } else if (action.equals("modifCompte")) {
            String loginProf = request.getParameter("login");
            String prenom = request.getParameter("prenom");
            String nom = request.getParameter("nom");
            String adresse = request.getParameter("adresse");
            String ancienMdp = request.getParameter("ancienMdp");
            String nouveauMdp = request.getParameter("nouveauMdp");
            String confirmerMdp = request.getParameter("confirmerMdp");
            int idPersonne = Integer.parseInt(request.getParameter("idPersonne"));
            if (nouveauMdp.equals(confirmerMdp)) {
                int i = daoEleve.compte2(ancienMdp);
                if (i == 0) {
                    daoEleve.modifierCompte(loginProf, nouveauMdp, idPersonne,prenom, nom, adresse);
                    String mes = "Modification effectuée avec succès";
                    request.setAttribute("mes", mes);
                    request.setAttribute("compte", compte);
                    rd = request.getRequestDispatcher("professeur/Compte.jsp");
                } else {
                    String mes = "L'ancien mot de passe n'est pas conforme";
                    request.setAttribute("message", mes);
                    request.setAttribute("compte", compte);
                    rd = request.getRequestDispatcher("professeur/Compte.jsp");
                }
            } else {
                String mes = "Les mots de passes ne sont pas conformes";
                request.setAttribute("message", mes);
                request.setAttribute("compte", compte);
                rd = request.getRequestDispatcher("professeur/Compte.jsp");
            }

        } ///////////////////////////////Changer Image Utilisateur/////////////////////
        else if (action.equals("photoProfil")) {
            GenererRef ref = new GenererRef();
            Part partImg1 = request.getPart("nomImage");
            System.out.println("Taille "+partImg1.getSize());
            String idPersonne = request.getParameter("idPersonne");
            String image1 = "";
            String cheminImg = RepDestinationImg + File.separator;
            image1 = nomFichier(partImg1);
            String chemin = cheminImg + image1;
            int position = chemin.indexOf(".");
            String extension = chemin.substring(position + 1);
            if (extension.equalsIgnoreCase("png")
                    || extension.equalsIgnoreCase("jpg")
                    || extension.equalsIgnoreCase("jpeg")
                    || extension.equalsIgnoreCase("gif")) {
                String reference = ref.genererRef();
                File f = new File(cheminImg + reference + image1);
                //boolean result = true;                
                boolean result = daoEleve.ajouterImageCompte(idPersonne, reference + image1);
                partImg1.write(cheminImg + reference + image1);
                if (result) {
                    String message = "image modifier avec succes";
                    request.setAttribute("msg1", message);
                    rd = request.getRequestDispatcher("professeur/acceuilProf.jsp");
                }
            } else {
                String message = "erreur extension";
                request.setAttribute("msg", message);
                request.setAttribute("compte", compte);
                rd = request.getRequestDispatcher("professeur/Compte.jsp");
            }

        }
        
        //***********************************************Fin Compte Prof************************************************************************ 
        //***********************************************Réclamation************************************************************************
        else if (action.equals("afficheMessage")) {
            String loginProf = request.getParameter("login");
            reclamation = daoEleve.selectReclamation(loginProf);
            if (reclamation.isEmpty()) {
                String message = "Vous n'avez aucun message";
                request.setAttribute("message", message);
            }
            request.setAttribute("listReclation", reclamation);
            rd = request.getRequestDispatcher("professeur/reclamationProf.jsp");
        } else if (action.equals("repondre")) {
            String idReclamation = request.getParameter("idReclamation");
            String loginEleve = request.getParameter("loginEleve");
            String loginProf = request.getParameter("loginProf");
            String nom = (String) session.getAttribute("nom");
            String prenom = (String) session.getAttribute("prenom");
            request.setAttribute("idReclamation", idReclamation);
            request.setAttribute("loginEleve", loginEleve);
            request.setAttribute("loginProf", loginProf);
            request.setAttribute("nom", nom);
            request.setAttribute("prenom", prenom);
            rd = request.getRequestDispatcher("message.jsp");
        } else if (action.equals("reponse")) {
            String idReclamation = request.getParameter("idReclamation");
            String loginEleve = request.getParameter("loginEleve");
            String loginProf = request.getParameter("loginProf");
            String nom = (String) session.getAttribute("nom");
            String prenom = (String) session.getAttribute("prenom");
            String message = request.getParameter("message");
            String enTete = prenom + " " + nom;
            DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
            Date today = Calendar.getInstance().getTime();
            String date = df.format(today);
            daoEleve.insereReclamationRep(loginEleve, loginProf, message, enTete, date, idReclamation);
            reclamation = daoEleve.selectReclamation(loginProf);
            request.setAttribute("listReclation", reclamation);
            rd = request.getRequestDispatcher("reclamationProf.jsp");
        } //***********************************************Fin Réclamation************************************************************************
        ///////////////////////////////////////////////Recherche///////////////////////////////////////////////////////////
        //********************************************Reherche eleve par parent*******************************************
        else if (action.equals("rechercherParent")) {
            String nom = request.getParameter("recherche");
            rechercheParElev = daoParent.rechercheEleve(nom);

            if (rechercheParElev.isEmpty()) {
                String message = "Aucun résultat !!!";
                request.setAttribute("message", message);
                rd = request.getRequestDispatcher("rechercheParent.jsp");
            } else {
                request.setAttribute("rechercheParElev", rechercheParElev);
                rd = request.getRequestDispatcher("rechercheParent.jsp");
            }

        } //*******************************************Recherche eleve par prof*******************************************
        else if (action.equals("rechercherProf")) {
            String nom = request.getParameter("recherche");
            rechercheParElev = daoParent.rechercheEleve(nom);

            if (rechercheParElev.isEmpty()) {
                String message = "Aucun résultat !!!";
                request.setAttribute("message", message);
                rd = request.getRequestDispatcher("rechercheProf.jsp");
            } else {
                request.setAttribute("rechercheParElev", rechercheParElev);
                rd = request.getRequestDispatcher("rechercheProf.jsp");
            }
        } ///////////////////////////////////////////////Fin Recherche//////////////////////////////////////////////////////
        else if (action.equals("deconnection")) {
            session.invalidate();
            rd = request.getRequestDispatcher("connexion/login.jsp");
        } else if (action.equals("deconnectionParent")) {
            session.invalidate();
            rd = request.getRequestDispatcher("acceuilParent.jsp");
        }

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

    private String nomFichier(Part part) {
        String contenu = part.getHeader("content-disposition");
        String[] items = contenu.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
