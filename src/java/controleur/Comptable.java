/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import model.Parent;
import model.Professeur;
import model.Utilisateur;
import modelPersonne.DAODirecteurImpl;
import modelPersonne.DAOEleveImpl;
import modelPersonne.DAOPersonneImpl;
import modelPersonne.DAOProfImpl;

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
        System.out.println("anneeSco "+anInscr);
        session.setAttribute("anInscr", anInscr);
        classes = daoEleve.listerClasse();
        session.setAttribute("classes", classes);
        
        if (action == null) {
            rd = request.getRequestDispatcher("comptable/accueilComptable.jsp");
        } else if (action.equals("inscrireEleve")) {
            session.setAttribute("classes", classes);
            rd = request.getRequestDispatcher("comptable/inscrireEleve.jsp");
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
