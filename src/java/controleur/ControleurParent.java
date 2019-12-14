/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AnneeScolaire;
import model.DAOFactory;
import model.Eleve;
import modelPersonne.DAOParentImpl;

/**
 *
 * @author mac
 */
public class ControleurParent extends HttpServlet {

    private DAOParentImpl daoParent;
    public ArrayList<Eleve> listeEleve;
    public ArrayList<Eleve> listeNote;

    @Override
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.daoParent = daoFactory.getDAOParent();
        listeNote = new ArrayList();

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
        String action = request.getParameter("action");
        RequestDispatcher rd = null;
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();

        if (action == null) {
            rd = request.getRequestDispatcher("parent/AccueilParent.jsp");
        } else if (action.equals("listerEnfant")) {
            String loginPar = (String) session.getAttribute("log");
            listeEleve = daoParent.listerEleve(loginPar);
            request.setAttribute("listeEleve", listeEleve);
            rd = request.getRequestDispatcher("parent/ListeEleve.jsp");
        } else if (action.equals("eleveparent")) {
            String message="Votre enfant n'a pas encore de note!!";
            String loginEleve = request.getParameter("loginEleve");
            AnneeScolaire an = new AnneeScolaire();
            String annee = an.anneeSco();
            listeNote = daoParent.eleveParent(annee, loginEleve);
            request.setAttribute("annee", annee);
            request.setAttribute("listeNote", listeNote);
            request.setAttribute("message", message);
            rd = request.getRequestDispatcher("parent/listeNote.jsp");

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
