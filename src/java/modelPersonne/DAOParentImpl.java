/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelPersonne;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.DAOFactory;
import model.Eleve;
import model.Parent;

/**
 *
 * @author ibrah
 */
public class DAOParentImpl {
    private DAOFactory daoFactory;
    
    public DAOParentImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    public ArrayList<Eleve> listerEleve(String loginParent){
        ArrayList<Eleve> eleve = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select distinct loginEleve,nomClasse,prenom,nom,dateNaissance,lieuNaissance,adresse from eleve where loginParent='"+ loginParent +"'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                Eleve e = new Eleve();
                e.setNomClasse(rs.getString("nomClasse"));
                e.setPrenom(rs.getString("prenom"));
                e.setNom(rs.getString("nom"));
                e.setDateNaissance(rs.getString("dateNaissance"));
                e.setLieuNaissance(rs.getString("lieuNaissance"));
                e.setAdresse(rs.getString("adresse"));
                e.setLogin(rs.getString("loginEleve"));
                eleve.add(e);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return eleve;
    }

    public ArrayList<String> prenomEleve(String loginParent){
        ArrayList<String> prenomEleve = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select prenom from eleve where loginParent='" + loginParent + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                prenomEleve.add(rs.getString("prenom"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return prenomEleve;
    }
    
    public ArrayList<String> nomleve(String loginParent){
        ArrayList<String> nomleve = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select nom from eleve where loginParent='" + loginParent + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                nomleve.add(rs.getString("nom"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return nomleve;
    }

    public ArrayList<String> dateNaiEleve(String loginParent){
       ArrayList<String> dateNaiEleve = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select dateNaissance from eleve where loginParent='" + loginParent + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                dateNaiEleve.add(rs.getString("dateNaissance"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return dateNaiEleve; 
    }

    public ArrayList<String> lieuNaiEleve(String loginParent){
       ArrayList<String> lieuNaiEleve = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select lieuNaissance from eleve where loginParent='" + loginParent + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                lieuNaiEleve.add(rs.getString("lieuNaissance"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return lieuNaiEleve; 
    }

    public ArrayList<String> classeEleve(String loginParent){
      ArrayList<String> classeEleve = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select nomClasse from eleve where loginParent='" + loginParent + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                classeEleve.add(rs.getString("nomClasse"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return classeEleve;  
    }

    public ArrayList<String> anneeEleve(){
        ArrayList<String> anneeEleve = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select annee from annee ";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                anneeEleve.add(rs.getString("annee"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return anneeEleve;
    }

    public ArrayList<Parent> listPar(String login, String motDePasse){
       ArrayList<Parent> listParent = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select * from parent where loginParent='" + login + "' and motDePasse='" + motDePasse + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            
            while (rs.next()) {
                Parent par= new Parent();
                par.setLoginParent(rs.getString("loginParent"));
                par.setMotDePasse(rs.getString("motDePasse"));
                par.setPrenom(rs.getString("prenom"));
                par.setNom(rs.getString("nom"));
                listParent.add(par);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listParent; 
    }

    public String loginParent(String loginParent, String motDePasse){
        String idParent="";
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select loginParent from parent where loginParent='" + loginParent + "' and motDePasse='" + motDePasse + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                idParent=rs.getString("loginParent");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return idParent;
    }
    
    public ArrayList<Eleve> rechercheEleve(String nom){
        ArrayList<Eleve> eleve = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select * from eleve where nom='" + nom + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                Eleve e = new Eleve();
                e.setNomClasse(rs.getString("nomClasse"));
                e.setPrenom(rs.getString("prenom"));
                e.setNom(rs.getString("nom"));
                e.setDateNaissance(rs.getString("dateNaissance"));
                e.setLieuNaissance(rs.getString("lieuNaissance"));
                eleve.add(e);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return eleve;
    }
    public ArrayList<Eleve> rechercheEleveProf(String nom){
        ArrayList<Eleve> eleve = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select distinct * from eleve where loginEleve='" + nom + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                Eleve e = new Eleve();
                e.setClasse(rs.getString("nomClasse"));
                e.setPrenom(rs.getString("prenom"));
                e.setNom(rs.getString("nom"));
                e.setDateNaissance(rs.getString("dateNaissance"));
                e.setLieuNaissance(rs.getString("lieuNaissance"));
                e.setTel(rs.getString("telephone"));
                eleve.add(e);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return eleve;
    }
    public int compte2(String ancienMdp) {
        String login = "null";
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select loginParent from parent where motDePasse='" + ancienMdp + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                login = rs.getString("loginParent");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        if (!login.equals("null")) {
            return 0;
        } else {
            return 1;
        }
    }
    public void modifierCompte(String login, String nouveauMdp) {
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete1 = "UPDATE  parent SET  motDePasse ='" + nouveauMdp + "'" + "WHERE  loginParent='" + login + "'";
            st = con.createStatement();
            int rs1 = st.executeUpdate(requete1);
            

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}


