/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelPersonne;

import java.sql.*;
import java.util.ArrayList;
import model.DAOFactory;
import model.Eleve;
import model.Utilisateur;
import modelTables.Personne;

/**
 *
 * @author Moussa Joseph Sarr
 */
public class DAOPersonneImpl {

    private DAOFactory daoFactory;

    public DAOPersonneImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    public int determinerProfil(String login, String motDePasse) {
        boolean isTrue = false;
        int nbre = 0;
        String requete = null;
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            st = con.createStatement();
            requete = "select idPersonne from directeur where loginDir='" + login + "' and motDePasse='" + motDePasse + "'";
            ResultSet rs = st.executeQuery(requete);
            if (rs.next() == true) {
                nbre = 1;
                isTrue = true;
                System.out.println(isTrue);
                System.out.println("nbre " + nbre);
            } else {
                requete = "select idPersonne from surveillant where loginSurv='" + login + "' and motDePasse='" + motDePasse + "'";
                ResultSet rs1 = st.executeQuery(requete);
                if (rs1.next() == true) {
                    nbre = 2;
                    isTrue = true;
                    System.out.println(isTrue);
                }else{
                    requete = "select idPersonne from professeur where loginProf='" + login + "' and motDePasse='" + motDePasse + "'";
                    ResultSet rs2 = st.executeQuery(requete);
                    if (rs2.next() == true) {
                        nbre = 3;
                        isTrue = true;
                        System.out.println(isTrue);
                    }else{
                        nbre = 0;
                        isTrue = false;
                    }
                }
            }
            }catch (Exception e) {
            System.out.println(e.getMessage());
        }
            return nbre;
        }
    

    

    public ArrayList<Utilisateur> listPersonne(int nbre, String login, String motDePasse) {
        String requete = null;
        ArrayList<Utilisateur> listPerson = new ArrayList();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            Utilisateur person = new Utilisateur();
            //Directeur
            if (nbre == 1) {
                requete = "select nom,prenom,profils from personne p,directeur d where d.loginDir='" + login + "' and d.motDePasse='" + motDePasse + "' and d.idPersonne=p.idPersonne";
                st = con.createStatement();
                ResultSet rs = st.executeQuery(requete);
                while (rs.next()) {
                    person.setNom(rs.getString("nom"));
                    person.setPrenom(rs.getString("prenom"));
                    person.setProfils(rs.getString("profils"));
                    System.out.println("profil " + rs.getString("profils"));
                }
            }

            //Surveillant
            if (nbre == 2) {
                requete = "select nom,prenom,profils from personne p,surveillant d where d.loginSurv='" + login + "' and d.motDePasse='" + motDePasse + "' and d.idPersonne=p.idPersonne";
                st = con.createStatement();
                ResultSet rs = st.executeQuery(requete);
                while (rs.next()) {
                    person.setNom(rs.getString("nom"));
                    person.setPrenom(rs.getString("prenom"));
                    person.setProfils(rs.getString("profils"));
                    System.out.println(rs.getString("profils"));
                }
            }

            //Professeur
            if (nbre == 3) {
                requete = "select nom,prenom,profils from personne p,professeur d where d.loginProf='" + login + "' and d.motDePasse='" + motDePasse + "' and d.idPersonne=p.idPersonne";
                st = con.createStatement();
                ResultSet rs = st.executeQuery(requete);
                while (rs.next()) {
                    person.setNom(rs.getString("nom"));
                    person.setPrenom(rs.getString("prenom"));
                    person.setProfils(rs.getString("profils"));
                    System.out.println(rs.getString("profils"));
                }
            }
            listPerson.add(person);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listPerson;
    }

    public int nbrePersonne() {
        int nb = 0;
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select idPersonne from personne";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);

            if (rs.last()) {
                nb = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return nb;
    }

}
