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
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AnneeScolaire;
import model.DAOFactory;
import model.GestionDate;
import model.Mensuel;
import modelPersonne.DAODirecteurImpl;
import modelPersonne.DAOEleveImpl;
import modelPersonne.DAOParentImpl;
import modelPersonne.DAOPersonneImpl;
import modelTables.Personne;

/**
 *
 * @author Ouzy NDIAYE
 */
public class EDT extends HttpServlet {
    
    private DAODirecteurImpl daoDirecteur;
    public ArrayList<model.Eleve> listClasse;
    public ArrayList<model.Eleve> afficherEDT;
    public ArrayList<Mensuel> listMensuel;
    public ArrayList<String> listMatiere;
    public ArrayList<String> listSalle;
    private DAOEleveImpl daoEleve;
    public ArrayList<Personne> listerProf;
    ArrayList<String> classes;
    
    Random rd1;

    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.daoDirecteur = daoFactory.getDAODirecteur();
        this.daoEleve = daoFactory.getDAOEleve();
        listClasse = new ArrayList();
        classes = new ArrayList();
        listMatiere = new ArrayList();
        listerProf = new ArrayList();
        listSalle = new ArrayList();
        afficherEDT = new ArrayList();
    }


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        RequestDispatcher rd = null;
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        classes = daoEleve.listerClasse();
        session.setAttribute("classes", classes);

        String dateToday = new SimpleDateFormat("dd/MM/yyyy", Locale.FRANCE).format(Calendar.getInstance().getTime());
        AnneeScolaire anneeScolaire = new AnneeScolaire();
        String anInscr = anneeScolaire.anneeSco();
        
        /////////////////////
        GestionDate gd = new GestionDate();
        //Heure de cours
        String[] heures = {"8h-10h", "10h-12h", "13h-15h",
            "15h-17h"};
        if (action.equals("accueilEDT")) {
            request.setAttribute("listClasse", classes);
            rd = request.getRequestDispatcher("directeur/accueilEDT.jsp");
        } else if (action.equals("creerEDT")) {
            String nomClasse = request.getParameter("nomClasse");
            String[] regime = nomClasse.split("///");
            String nomClasse1 = regime[0];
            String regime1 = regime[1];      
            session.setAttribute("heure", heures);
            session.setAttribute("classe", nomClasse1);
            session.setAttribute("regime", regime1);
            session.setAttribute("annee", anInscr);
            rd = request.getRequestDispatcher("directeur/creerEDT.jsp");
        } else if (action.equals("ajouterCours")) {
            String nomClasse = request.getParameter("nomClasse");
            String heure = request.getParameter("heure");
            String jour = request.getParameter("jour"); 
            System.out.println("annee-sco "+anInscr);
            ////Gesttion des erreurs d'ajout
            //A faire verif prof
            boolean rsDisponibilite = daoDirecteur.verifDisponibilite(gd.formatJour(Integer.parseInt(jour)), heure, nomClasse);
            if (rsDisponibilite == true) {
                String msg = "erreurDisponibilité";
                request.setAttribute("noDispo", msg);
                rd = request.getRequestDispatcher("directeur/creerEDT.jsp");
            }else{
            listSalle = daoDirecteur.listerSalleClasse();
            listMatiere = daoDirecteur.listerMatiereClasse(nomClasse);
            listerProf = daoDirecteur.listerProfClasse(nomClasse, anInscr);            
            session.setAttribute("jour", jour);
            session.setAttribute("heure", heure);
            session.setAttribute("nomClasse", nomClasse);
            session.setAttribute("listMatiere", listMatiere);
            session.setAttribute("listerProf", listerProf);
            session.setAttribute("listSalle", listSalle);
            rd = request.getRequestDispatcher("directeur/ajouterCours.jsp");
            }
        } else if (action.equals("valider-ajout")) {
            String heure = request.getParameter("heure");
            int numJour = Integer.parseInt(request.getParameter("jour"));
            int numHeure = gd.numeroHeure(heure);
            String nomClasse = request.getParameter("nomClasse");
            String regime = request.getParameter("regime");
            String nomMatiere = request.getParameter("nomMatiere");
            String loginProf = request.getParameter("nomProf");
            String nomSalle = request.getParameter("nomSalle");

            String[] loginEtNomProf = loginProf.split("///");
            String nomProf = loginEtNomProf[0];
            String login = loginEtNomProf[1];            

            /*boolean resultat = daoEleve.ajouterCours(login, nomMatiere, regime, nomClasse, nomSalle, gd.formatJour(numJour), heure);
            if (resultat == true) {
                String msg = "insertion réussit";
                session.setAttribute("classe", nomClasse);
                session.setAttribute("regime", regime);
                session.setAttribute("heure", heures);
                request.setAttribute("msgInsertReussit", msg);
                rd = request.getRequestDispatcher("directeur/creerEDT.jsp");
            }*/
        } ////Afficher emploi du temps
        else if (action.equals("afficherEDT")) {
            session.setAttribute("listClasse", classes);
            rd = request.getRequestDispatcher("directeur/voirEDT.jsp");
        } else if (action.equals("afficherEDTClasse")) {
            String nomClasse = request.getParameter("nomClasse");
            String[] regime = nomClasse.split("///");
            String nomClasse1 = regime[0];
            String emploiDuTemps[][] = daoDirecteur.afficherEDT(nomClasse1);
            session.setAttribute("heure", heures);
            session.setAttribute("classe", nomClasse1);
            session.setAttribute("afficherEDT", emploiDuTemps);
            rd = request.getRequestDispatcher("directeur/afficherEDT.jsp");
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
