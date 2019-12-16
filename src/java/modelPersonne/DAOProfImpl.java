/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelPersonne;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.Arabe;
import model.DAOFactory;
import modelTables.Personne;
import modele.tables.ProfClasse;
import model.Professeur;
import model.Utilisateur;

/**
 *
 * @author Moussa Joseph Sarr
 */
public class DAOProfImpl {

    public model.DAOFactory daoFactory;

    public DAOProfImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    Connection con;

    public boolean ajouterProf(Professeur prof, int id) {
        boolean resultat = false;

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;
            PreparedStatement pst2;

            String requete1 = "insert into personne values(?,?,?,?,?)";
            pst1 = con.prepareStatement(requete1);
            pst1.setInt(1, id);
            pst1.setString(2, prof.getPersonne().getNom());
            pst1.setString(3, prof.getPersonne().getPrenom());
            pst1.setString(4, prof.getPersonne().getAdresse());
            pst1.setString(5, prof.getPersonne().getTel());
            int result1 = pst1.executeUpdate();

            String requete2 = "insert into professeur values(?,?,?)";
            pst2 = con.prepareStatement(requete2);
            pst2.setInt(1, id);
            pst2.setString(2, prof.getUtilisateur().getLogin());
            pst2.setString(3, prof.getUtilisateur().getMotDePasse());
            int result2 = pst2.executeUpdate();

            int result3 = 0;
            for (String i : prof.getMatiere()) {
                PreparedStatement pst3;
                String requete3 = "insert into profmatiere values(?,?,?)";
                pst3 = con.prepareStatement(requete3);
                pst3.setInt(1, id);
                pst3.setString(2, prof.getUtilisateur().getLogin());
                pst3.setString(3, i);
                result3 = pst3.executeUpdate();
            }

            if ((result1 > 0) && (result2 > 0) && (result3 > 0)) {
                System.out.println("les requetes ont été bien éxécutées");
                resultat = true;
            } else {

                System.out.println("Erreur de requete(s)");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;

    }

    public boolean ajouterProfclasse(ArrayList<ProfClasse> pc) {
        boolean result = false;
        int resultat = 0;
        try {
            for (ProfClasse c : pc) {
                PreparedStatement pst3;
                String requete3 = "insert into profclasse values(?,?,?,?,?)";
                pst3 = con.prepareStatement(requete3);
                pst3.setInt(1, c.getIdPerson());
                pst3.setString(2, c.getLoginProf());
                pst3.setString(3, c.getNomClasse());
                pst3.setString(4, c.getNomMatiere());
                pst3.setString(5, c.getAnnee());
                resultat = pst3.executeUpdate();
            }
            if (resultat > 0) {
                System.out.println("les requetes ont été bien éxécutées");
                result = true;
            } else {

                System.out.println("Erreur de requete(s)");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public ArrayList<String> listerMatiere() {

        ArrayList<String> matieres = new ArrayList();
        Statement st;

        try {
            con = daoFactory.getConnection();
            String requete = "select nomMatiere from matiere";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                matieres.add(rs.getString("nomMatiere"));

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return matieres;
    }

    public ArrayList<Arabe> listerMatEnArabe() {

        ArrayList<Arabe> matieres = new ArrayList();
        Statement st;

        try {
            con = daoFactory.getConnection();
            String requete = "select nomArabe,nomMatiere from matiere where nomArabe!='null'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                Arabe arabe = new Arabe();
                arabe.setNomEnArabe(rs.getString("nomArabe"));
                arabe.setNomEnFrancais(rs.getString("nomMatiere"));
                matieres.add(arabe);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return matieres;
    }

    public ArrayList<Arabe> listerMatArabe() {

        ArrayList<Arabe> matieres = new ArrayList();
        Statement st;

        try {
            con = daoFactory.getConnection();
            String requete = "select nomArabe,nomMatiere from matiere";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                Arabe arabe = new Arabe();
                arabe.setNomEnArabe(rs.getString("nomArabe"));
                arabe.setNomEnFrancais(rs.getString("nomMatiere"));
                matieres.add(arabe);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return matieres;
    }

    public ArrayList<String> listerCorespondFr(String[] arabe) {
        ArrayList<String> fr = new ArrayList<>();
        Statement st;

        try {
            con = daoFactory.getConnection();
            for (String ar : arabe) {
                String requete = "select nomMatiere from matiere where nomArabe='" + ar + "'";
                st = con.createStatement();
                ResultSet rs = st.executeQuery(requete);
                if (rs.next()) {
                    fr.add(rs.getString(1));
                }
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return fr;
    }

    public ArrayList<Professeur> listerProf(String an) {

        ArrayList<Professeur> profs = new ArrayList();
        Statement st;

        try {
            con = daoFactory.getConnection();
            String requete = "select p.login,nom,prenom,adresse,telephone from personne p,professeur pf where p.login = pf.login";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);

            while (rs.next()) {

                ArrayList<String> tabM = new ArrayList();
                ArrayList<String> tabC = new ArrayList();

                Personne person = new Personne(rs.getInt(1), rs.getString("nom"), rs.getString("prenom"), rs.getString("adresse"), rs.getString("telephone"));

                Statement st2;
                String requeteC = "select nomClasse from profClasse where login='" + rs.getString(1) + "' and anneeScolaire='" + an + "'";
                st2 = con.createStatement();
                ResultSet rsc = st2.executeQuery(requeteC);

                while (rsc.next()) {
                    tabC.add(rsc.getString(1));
                    //i++;
                }

                Statement st1;
                String requeteM = "select nomMatiere from profmatiere where login=" + rs.getString(1);
                st1 = con.createStatement();
                ResultSet rsm = st1.executeQuery(requeteM);
                while (rsm.next()) {

                    tabM.add(rsm.getString(1));
                    // k++;
                }

                profs.add(new Professeur(person, null, tabM, tabC));

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return profs;
    }

    public void supprimerProf(int id) {

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;
            PreparedStatement pst2;
            PreparedStatement pst3;

            String requete1 = "delete from profmatiere where idPersonne=?";
            pst1 = con.prepareStatement(requete1);
            pst1.setInt(1, id);
            int result1 = pst1.executeUpdate();

            String requete2 = "delete from profclasse where idPersonne=?";
            pst2 = con.prepareStatement(requete2);
            pst2.setInt(1, id);
            int result2 = pst2.executeUpdate();

            String requete3 = "delete from professeur where idPersonne=?";
            pst3 = con.prepareStatement(requete3);
            pst3.setInt(1, id);
            int result3 = pst3.executeUpdate();

            PreparedStatement pst4;
            String requete4 = "delete from personne where idPersonne=?";
            pst4 = con.prepareStatement(requete4);
            pst4.setInt(1, id);
            int result4 = pst4.executeUpdate();

            if ((result1 > 0) && (result2 > 0) && (result3 > 0) && (result4 > 0)) {
                System.out.println("les requetes ont été bien éxécutées");

            } else {

                System.out.println("Erreur de requete(s)");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    public Professeur listerUnProf(int idProf) {

        Professeur prof = null;
        Statement st;

        try {
            con = daoFactory.getConnection();
            String requete = "select nom,prenom,adresse,tel from personne where idPersonne = " + idProf;
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);

            if (rs.next()) {
                Utilisateur user = null;
                ArrayList<String> tabM = new ArrayList();
                ArrayList<String> tabC = new ArrayList();

                Personne person = new Personne(idProf, rs.getString("nom"), rs.getString("prenom"), rs.getString("adresse"), rs.getString("tel"));

                Statement st2;
                String requeteC = "select nomClasse from profClasse where idpersonne=" + idProf;
                st2 = con.createStatement();
                ResultSet rsc = st2.executeQuery(requeteC);

                while (rsc.next()) {
                    tabC.add(rsc.getString(1));
                    //i++;
                }

                Statement st1;
                String requeteM = "select nomMatiere from profmatiere where idpersonne=" + idProf;
                st1 = con.createStatement();
                ResultSet rsm = st1.executeQuery(requeteM);
                while (rsm.next()) {

                    tabM.add(rsm.getString(1));
                    // k++;
                }
                Statement st3;
                String requeteU = "select loginProf,motDepasse from professeur where idpersonne=" + idProf;
                st3 = con.createStatement();
                ResultSet rsu = st1.executeQuery(requeteU);
                if (rsu.next()) {
                    user = new Utilisateur();
                    user.setLogin(rsu.getString("loginProf"));
                    user.setMotDePasse(rsu.getString("motDePasse"));
                }

                prof = new Professeur(person, user, tabM, tabC);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return prof;

    }

    public Utilisateur listerUnSurv(String login) {

        Utilisateur usr = new Utilisateur();
        Statement st;

        try {
            con = daoFactory.getConnection();
            String requete = "select nom,prenom,adresse,telephone from personne where login = '" + login + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);

            if (rs.next()) {
                usr.setAdresse(rs.getString(3));
                usr.setNom(rs.getString(1));
                usr.setPrenom(rs.getString(2));
                usr.setTelephone(rs.getString(4));

                usr.setLogin(login);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return usr;

    }

    public boolean modifierProf(Personne prof) {

        boolean resultat = false;
        int result1 = 0;

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;
            PreparedStatement pst2;

            String requete1 = "update personne set nom=? , prenom=? , adresse=? , tel=? where idPersonne =? ";
            pst1 = con.prepareStatement(requete1);

            pst1.setString(1, prof.getNom());
            pst1.setString(2, prof.getPrenom());
            pst1.setString(3, prof.getAdresse());
            pst1.setString(4, prof.getTel());
            pst1.setInt(5, prof.getIdPersonne());
            result1 = pst1.executeUpdate();
            if (result1 > 0) {
                System.out.println("les requetes ont été bien éxécutées /t modifiees avec succes");
                resultat = true;
            } else {
                System.out.println("Erreur de requete(s)");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;

    }

    public ArrayList<Professeur> detailProf(int id) {
        ArrayList<Professeur> profs = new ArrayList<>();
        Professeur prof;
        try {
            Statement st;
            String requeteU = "select nomClasse,nomMatiere,annee from profclasse where idpersonne=" + id;
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requeteU);
            while (rs.next()) {
                prof = new Professeur();
                prof.setNomClasse(rs.getString("nomClasse"));
                prof.setNomMatiere(rs.getString("nomMatiere"));
                prof.setAnnee(rs.getString("annee"));
                System.out.println(rs.getString("nomMatiere"));
                profs.add(prof);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return profs;

    }

    public ArrayList<Utilisateur> listerSurv() {

        ArrayList<Utilisateur> users = new ArrayList();
        Statement st;

        try {
            con = daoFactory.getConnection();
            String requete = "select p.login,nom,prenom,adresse,telephone from personne p,surveillant sur where p.login = sur.login ";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);

            while (rs.next()) {
                Utilisateur usr = new Utilisateur();
                usr.setLogin(rs.getString(1));
                usr.setAdresse(rs.getString(4));
                usr.setNom(rs.getString(2));
                usr.setPrenom(rs.getString(3));
                usr.setTelephone(rs.getString(5));
                users.add(usr);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return users;
    }

    public String matiere(String nomMatiere) {
        String nom = "";
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requeteU = "select nomMatiere from matiere where nomMatiere='" + nomMatiere + "' or nomArabe='" + nomMatiere + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requeteU);
            if (rs.next()) {
                nom = rs.getString("nomMatiere");
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return nom;

    }

}
