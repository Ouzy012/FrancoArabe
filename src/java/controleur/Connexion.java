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
 * @author Ouzy NDIAYE
 */
public class Connexion extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
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

        ////Connexion///
        if (action == null) {
            rd = request.getRequestDispatcher("accue.html");
        } else if (en_tete == null) {
            session.invalidate();
            rd = request.getRequestDispatcher("vue/erreur.jsp");
        } else if (action.equals("connection")) {
            //rd = request.getRequestDispatcher("vue/SeConnecter.jsp");
            rd = request.getRequestDispatcher("connexion/login.jsp");
        } else if (action.equals("authentifier")) {
            login = request.getParameter("login");
            String motDePasse = request.getParameter("motDePasse");
            int i = 0;
            personnes = daoPersonne.listPersonne(login, motDePasse);
            System.out.println("personnes "+personnes.isEmpty());
            if (personnes.isEmpty() == true) {
                i = 1;
                for (Utilisateur p : personnes) {
                    session.setAttribute("log", login);
                    session.setAttribute("prenom", p.getPrenom());
                    session.setAttribute("nom", p.getNom());
                    session.setAttribute("profils", p.getProfils());
                    session.setAttribute("nomImgPers", p.getNomImgPers());
                    if (p.getProfils().equals("Directeur") && p.getEtatPers() == 1) {                        
                        rd = request.getRequestDispatcher("directeur/accueilDirecteur.jsp");
                    } else if (p.getProfils().equals("Surveillant") && p.getEtatPers() == 1) {
                        rd = request.getRequestDispatcher("surveillant/accueilSurveillant.jsp");
                    } else if (p.getProfils().equals("Comptable") && p.getEtatPers() == 1) {
                        rd = request.getRequestDispatcher("comptable/accueilComptable.jsp");
                    } else if (p.getProfils().equals("Professeur") && p.getEtatPers() == 1) {
                        rd = request.getRequestDispatcher("professeur/acceuilProf.jsp");
                    }
                }
            } else {
                i = 0;
                String message = "Login et/ou mot de passe incorrect";
                request.setAttribute("mess", message);
                rd = request.getRequestDispatcher("connexion/login.jsp");
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
