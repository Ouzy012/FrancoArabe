/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;
import java.util.StringTokenizer;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AnneeScolaire;
import model.DAOFactory;
import model.Eleve;
import model.GestionParamUser;
import model.Mensuel;
import model.Parent;
import model.Professeur;
import model.Utilisateur;
import modelPersonne.DAODirecteurImpl;
import modelPersonne.DAOEleveImpl;
import modelPersonne.DAOPersonneImpl;
import modelPersonne.DAOProfImpl;
import modelTables.Inscription;
import modelTables.Personne;

/**
 *
 * @author Ouzy NDIAYE
 */
public class Comptable extends HttpServlet {

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
    public ArrayList<Utilisateur> compte;
    ArrayList<String> matieres;
    ArrayList<Professeur> profs;
    private DAOPersonneImpl daoPersonne;
    public ArrayList<Eleve> rechercheParElev;
    ArrayList<String> matArabe;
    ArrayList<String> matFrancais;

    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.daoEleve = daoFactory.getDAOEleve();
        this.daoProf = daoFactory.getDAOProf();
        this.daoPersonne = daoFactory.getDAOPersonne();
        this.daoDirecteur = daoFactory.getDAODirecteur();
        classes = new ArrayList();
        matieres = new ArrayList();
        matArabe = new ArrayList();
        matFrancais = new ArrayList();
        compte = new ArrayList<>();
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
        String action = request.getParameter("action");
        RequestDispatcher rd = null;
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        AnneeScolaire anneeScolaire = new AnneeScolaire();
        String anInscr = anneeScolaire.anneeSco();
        String dateToday = new SimpleDateFormat("dd/MM/yyyy", Locale.FRANCE).format(Calendar.getInstance().getTime());
        String annee = new SimpleDateFormat("yyyy", Locale.FRANCE).format(Calendar.getInstance().getTime());
        session.setAttribute("anInscr", anInscr);
        classes = daoEleve.listerClasse();
        session.setAttribute("classes", classes);

        if (action == null) {
            rd = request.getRequestDispatcher("comptable/accueilComptable.jsp");
        } else if (action.equals("inscrireEleve")) {
            session.setAttribute("classes", classes);
            rd = request.getRequestDispatcher("comptable/inscrireEleve.jsp");
        } else if (action.equals("valider-inscription")) {

            //Infos Eleves
            String prenom = request.getParameter("prenom");
            String nom = request.getParameter("nom");
            String dateNaiss = request.getParameter("dateNaiss");
            String lieuNaiss = request.getParameter("lieuNaiss");
            String nomClasse = request.getParameter("nomClasse");
            String adresse = request.getParameter("adresse");
            String sexe = request.getParameter("sexe");

            System.out.println(prenom + " " + nom + " " + dateNaiss + " " + lieuNaiss + " " + nomClasse + " " + adresse + " " + sexe);
            //Infos New Parent
            String prenomPar = request.getParameter("prenomPar");
            String nomPar = request.getParameter("nomPar");
            String numTelPar = request.getParameter("opeTelPar") + request.getParameter("numTelPar");
            String email = request.getParameter("email");
            String profilPar = "Parent";

            System.out.println();
            //Infos Ancien Parent
            String loginAncienPar = request.getParameter("loginPar");

            ////////////////|||||||||||||TEST|||||||||////////////////////
            if (request.getParameter("email") != null && request.getParameter("email").equals("")) {
                email = "";
            }
            //Inscription
            int reliquat = 0;
            String montantInsc = request.getParameter("montantInsc");

            ///Test erreur
            int dateSaisi = Integer.parseInt(dateNaiss.substring(0, 4));
            int dateSco = Integer.parseInt(annee);
            int dateCal = dateSaisi + 10;

            boolean erreur = false;
            //Erreur sur la date
            if (dateCal > dateSco) {
                String message = "Veuillez revoir la date de naissance saisie!!!";
                request.setAttribute("msgeErreurDate", message);
                erreur = true;
                rd = request.getRequestDispatcher("comptable/inscrireEleve.jsp");
            }

            //Erreur sur le numéro de Tel Parent
            if (request.getParameter("numTelPar") != null && request.getParameter("numTelPar").length() < 7) {
                String message = "erreur numTel Parent";
                request.setAttribute("msgErreurTelPar", message);
                erreur = true;
                rd = request.getRequestDispatcher("comptable/inscrireEleve.jsp");
            }
            GestionParamUser gpu = new GestionParamUser();
            //Inscription
            Eleve eleve = null;
            int verifMontantIns = verifMontantIns = daoDirecteur.verifMontantInscription(nomClasse);
//            if (nomClassePriv != null) {
//                ;
//            }

            if ((erreur == false)) {
                String profils = "Eleve";
                String loginElv = gpu.genererLogin(nom, prenom);
                String password = gpu.genererMdp();
                int idInscription = gpu.genererIdInscrip();
                if (verifMontantIns > Integer.parseInt(montantInsc)) {
                    reliquat = verifMontantIns - Integer.parseInt(montantInsc);
                }
                if (verifMontantIns < Integer.parseInt(montantInsc)) {
                    String message = "erreur montant";
                    request.setAttribute("msgErreurMontant", message);
                    rd = request.getRequestDispatcher("comptable/inscrireEleve.jsp");
                }
                if (verifMontantIns >= Integer.parseInt(montantInsc)) {
                    if (prenomPar != null) {
                        String loginPar = gpu.genererLogin(nomPar, prenomPar);
                        String passwordPar = gpu.genererMdp();
                        Personne p = new Personne(loginElv, prenom, nom, adresse, password, profils, 0);
                        //Fin Requete Ajouter Personne
                        //Ajouter Inscription
                        Inscription inscrip = new Inscription(idInscription, dateToday, 1, Integer.parseInt(montantInsc), reliquat);

//                        //Parent
                        Parent parent = new Parent(loginPar, nomPar, prenomPar, numTelPar, passwordPar, profilPar, 1, email);

                        eleve = new Eleve(loginElv, loginPar, anInscr, idInscription, nomClasse, dateNaiss, lieuNaiss, sexe);

                        Mensuel mensuel = new Mensuel(loginElv, anInscr, 0, "", "", 0, 0);
                        boolean result = daoDirecteur.inscrireEleve(p, inscrip, mensuel, parent, eleve);
                        if (result == true) {
                            request.setAttribute("loginElv", loginElv);
                            request.setAttribute("passwordElv", password);
                            request.setAttribute("loginPar", loginPar);
                            request.setAttribute("passwordPar", passwordPar);
                            request.setAttribute("prenom", prenom);
                            request.setAttribute("nom", nom);
                            request.setAttribute("sexe", sexe);
                            request.setAttribute("montantIns", montantInsc);
                            request.setAttribute("reliquat", reliquat);
                            rd = request.getRequestDispatcher("comptable/infoInscription.jsp");
                        } else {
                            String message = "erreur enregistrement";
                            request.setAttribute("msgErreurEnreg", message);
                            rd = request.getRequestDispatcher("comptable/inscrireEleve.jsp");
                        }
                    }

                    /////////Inscrire Eleve avec Parent existant
                    if (loginAncienPar != null) {
                        String loginAncienPar1 = daoDirecteur.verifloginParent(loginAncienPar);
                        if (loginAncienPar1.equals(loginAncienPar)) {
                            Personne p = new Personne(loginElv, prenom, nom, adresse, password, profils, 0);
                            //Fin Requete Ajouter Personne
                            //Ajouter Inscription
                            Inscription inscrip = new Inscription(idInscription, dateToday, 1, Integer.parseInt(montantInsc), reliquat);

                            //Parent
                            Parent parent = new Parent(loginAncienPar1);
                            //Eleve
                            eleve = new Eleve(loginElv, loginAncienPar1, anInscr, idInscription, nomClasse, dateNaiss, lieuNaiss, sexe);
                            Mensuel mensuel = new Mensuel(loginElv, anInscr, 0, "", "", 0, 0);
                            boolean result = daoDirecteur.inscrireEleve2(p, inscrip, mensuel, parent, eleve);
                            if (result == true) {
                                request.setAttribute("loginElv", loginElv);
                                request.setAttribute("passwordElv", password);
                                request.setAttribute("prenom", prenom);
                                request.setAttribute("nom", nom);
                                request.setAttribute("sexe", sexe);
                                request.setAttribute("montantIns", montantInsc);
                                request.setAttribute("reliquat", reliquat);
                                rd = request.getRequestDispatcher("comptable/infoInscription.jsp");
                            } else {
                                String message = "erreur enregistrement";
                                request.setAttribute("msgErreurEnreg", message);
                                rd = request.getRequestDispatcher("comptable/inscrireEleve.jsp");
                            }
                        } else {
                            String message = "erreur login Parent";
                            request.setAttribute("msgErreurLogAnsPar", message);
                            rd = request.getRequestDispatcher("comptable/inscrireEleve.jsp");
                        }

                    }
                }
            }
        }
        ////////////////////MENSUALITE/////////////////////////
        else if (action.equals("mensualite")) {
            request.setAttribute("classes", classes);
            rd = request.getRequestDispatcher("comptable/mensualite.jsp");
        }else if (action.equals("choixClasse")) {
            ArrayList<Eleve> eleves = new ArrayList();
            String nomClasse = request.getParameter("nomClasse");
            eleves = daoDirecteur.listerEleveClasse(nomClasse, anInscr);
            String message = "";            
            if (!eleves.isEmpty()) {
                request.setAttribute("nomClasse", nomClasse);
                request.setAttribute("eleves", eleves);                
                rd = request.getRequestDispatcher("comptable/mensualite.jsp");
            } else {
                message = "Aucun élève n'est inscrit dans cette classe";
                request.setAttribute("msgClasseVide", message);
                request.setAttribute("eleveVide", eleves);
                rd = request.getRequestDispatcher("comptable/mensualite.jsp");
            }
        }else if (action.equals("payerMensuel")) {
            ArrayList<Mensuel> listMensuel = new ArrayList();
            String login = request.getParameter("login");
            String nomClasse = request.getParameter("nomClasse");
            int montant = daoDirecteur.verifMensualite(nomClasse);
            listMensuel = daoDirecteur.listerMensualite(login, anInscr);
            request.setAttribute("listerMois", listMensuel);
            request.setAttribute("montant", montant);
            request.setAttribute("login", login);
            request.setAttribute("nomClasse", nomClasse);
            rd = request.getRequestDispatcher("comptable/Mensuel.jsp");
        }else if (action.equals("payer")) {
            int montant = Integer.parseInt(request.getParameter("montant"));
            int montantApayer = Integer.parseInt(request.getParameter("montant"));
            String login = request.getParameter("login");
            String nomClasse = request.getParameter("nomClasse");
            String moisMensuel = request.getParameter("mois");
            request.setAttribute("reglement", login);
            request.setAttribute("nomClasse", nomClasse);
            request.setAttribute("montant", montant);
            request.setAttribute("montantApayer", montantApayer);
            request.setAttribute("moisMensuel", moisMensuel);
            request.setAttribute("payer", "payer");
            rd = request.getRequestDispatcher("comptable/validerMensualite.jsp");
        } else if (action.equals("validerMensuel")) {
            int reliquat = 0;
            int montant = Integer.parseInt(request.getParameter("montant"));
            int montantApayer = Integer.parseInt(request.getParameter("montantApayer"));
            String moisMensuel = request.getParameter("moisMensuel");
            String login = request.getParameter("login");
            if (montant > montantApayer) {
                String msg = "erreur montant";
                request.setAttribute("payer", "payer");
                request.setAttribute("erreurMontantSaisi", msg);
                rd = request.getRequestDispatcher("comptable/validerMensualite.jsp");
            }

            System.out.println("login " + login);
            Boolean resultat = false;
            if (montant <= montantApayer) {
                reliquat = montantApayer - montant;
                resultat = daoDirecteur.validerMensualite(login, anInscr, "1", dateToday, moisMensuel, montant, reliquat);
                if (resultat == true) {
                    String msg = "success";
                    request.setAttribute("payementReussit", msg);
                    request.setAttribute("classes", classes);
                    rd = request.getRequestDispatcher("comptable/mensualite.jsp");
                } else {
                    String msg = "erreur montant";
                    request.setAttribute("payer", "payer");
                    request.setAttribute("erreurPayement", msg);
                    rd = request.getRequestDispatcher("comptable/validerMensualite.jsp");
                }
            }
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

}
