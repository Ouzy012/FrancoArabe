/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelPersonne;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Bulletin;
import model.Evaluation;
import model.DAOFactory;
import model.Eleve;
import model.GestionDate;
import model.GestionParamUser;
import model.Mensuel;
import model.Parent;
import model.Prof;
import model.Professeur;
import model.Utilisateur;
import modelTables.Inscription;
import modelTables.Personne;

/**
 *
 * @author Moussa Joseph Sarr
 */
public class DAODirecteurImpl {

    public model.DAOFactory daoFactory;

    public DAODirecteurImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    Connection con;

    ////////Comptable
    public int verifMontantInscription(String nomClasse) {
        int reliquat = 0;
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select inscription from fichederenseignement where nomClasse='" + nomClasse + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                reliquat = rs.getInt("inscription");
                System.out.println("reliquat " + reliquat);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return reliquat;
    }

    public String verifloginParent(String loginAncienPar) {
        String loginPar = "";
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select Par_login from eleve where Par_login='" + loginAncienPar + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                loginPar = rs.getString("Par_login");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return loginPar;
    }

    public boolean inscrireEleve2(Personne pers, Inscription ins, Mensuel m, Parent par, Eleve elv) {
        boolean resultat = false;
        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;
            PreparedStatement pst4;

            String requete1 = "insert into personne (login,prenom,nom,adresse,motDePasse,etatPers,profils)"
                    + " values(?,?,?,?,?,?,?)";
            pst1 = con.prepareStatement(requete1);
            pst1.setString(1, pers.getLogin());
            pst1.setString(2, pers.getPrenom());
            pst1.setString(3, pers.getNom());
            pst1.setString(4, pers.getAdresse());
            pst1.setString(5, pers.getMotDePasse());
            pst1.setInt(6, pers.getEtatPers());
            pst1.setString(7, pers.getProfils());
            int result1 = pst1.executeUpdate();

            if (result1 > 0) {
                System.out.println("Enregistrement réussit de la table Personne");

                String requete4 = "insert into inscription (idInscription,dateInscription,statutInscription,montant,reliquat)"
                        + " values(?,?,?,?,?)";
                pst4 = con.prepareStatement(requete4);
                pst4.setInt(1, ins.getIdInscription());
                pst4.setString(2, ins.getDateInscription());
                pst4.setInt(3, ins.getStatus());
                pst4.setInt(4, ins.getMontant());
                pst4.setInt(5, ins.getReliquat());
                int result4 = pst4.executeUpdate();
                if (result4 > 0) {
                    String requete5 = "insert into eleve (login,anneeScolaire,idInscription,nomClasse,"
                            + "Par_login,dateNaissance,lieuNaissance,sexe)"
                            + " values (?,?,?,?,?,?,?,?)";
                    pst4 = con.prepareStatement(requete5);
                    pst4.setString(1, pers.getLogin());
                    pst4.setString(2, elv.getAnnee());
                    pst4.setInt(3, ins.getIdInscription());
                    pst4.setString(4, elv.getNomClasse());
                    pst4.setString(5, par.getLoginParent());
                    pst4.setString(6, elv.getDateNaissance());
                    pst4.setString(7, elv.getLieuNaissance());
                    pst4.setString(8, elv.getSexe());
                    int result5 = pst4.executeUpdate();
                    if (result5 > 0) {
                        GestionParamUser gpu = new GestionParamUser();
                        System.out.println("Enregistrement avec succes de la table Eleve");
                        gpu.listerMois();
                        for (Mensuel listerMoi : gpu.listerMois()) {
                            String requete6 = "insert into mensuel (login,anneeScolaire,statutMensuel,dateMensuel,mois,"
                                    + "montant,reliquat) values (?,?,?,?,?,?,?)";
                            pst4 = con.prepareStatement(requete6);
                            pst4.setString(1, pers.getLogin());
                            pst4.setString(2, elv.getAnnee());
                            pst4.setInt(3, m.getStatut());
                            pst4.setString(4, m.getDateMensuel());
                            pst4.setString(5, listerMoi.getMois());
                            pst4.setInt(6, m.getMontant());
                            pst4.setInt(7, m.getReliquat());
                            int result6 = pst4.executeUpdate();
                            if (result6 > 0) {
                                System.out.println("Enregistrement avec success de la table mensuel");
                            } else {
                                System.out.println("Erreur d'enregistrement de la table mensuel");
                            }
                        }
                    } else {
                        System.out.println("Erreur d'enregistrement de la table Eleve");
                    }
                    resultat = true;
                }
            } else {
                resultat = false;
                System.out.println("Erreur d'enregistrement table Personne");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;
    }

    public boolean inscrireEleve(Personne pers, Inscription ins, Mensuel m, Parent par, Eleve elv) {
        boolean resultat = false;
        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;
            PreparedStatement pst2;
            PreparedStatement pst3;
            PreparedStatement pst4;

            String requete1 = "insert into personne (login,prenom,nom,adresse,motDePasse,etatPers,profils)"
                    + " values(?,?,?,?,?,?,?)";
            pst1 = con.prepareStatement(requete1);
            pst1.setString(1, pers.getLogin());
            pst1.setString(2, pers.getPrenom());
            pst1.setString(3, pers.getNom());
            pst1.setString(4, pers.getAdresse());
            pst1.setString(5, pers.getMotDePasse());
            pst1.setInt(6, pers.getEtatPers());
            pst1.setString(7, pers.getProfils());
            int result1 = pst1.executeUpdate();

            if (result1 > 0) {
                System.out.println("Enregistrement réussit de la table Personne");
                String requete2 = "insert into personne (login,prenom,nom,adresse,telephone,motDePasse,etatPers,profils)"
                        + " values(?,?,?,?,?,?,?,?)";
                pst2 = con.prepareStatement(requete2);
                pst2.setString(1, par.getLoginParent());
                pst2.setString(2, par.getPrenom());
                pst2.setString(3, par.getNom());
                pst2.setString(4, pers.getAdresse());
                pst2.setString(5, par.getTel());
                pst2.setString(6, par.getMotDePasse());
                pst2.setInt(7, par.getEtatPers());
                pst2.setString(8, par.getProfils());
                int result2 = pst2.executeUpdate();
                if (result2 > 0) {
                    System.out.println("Parent ajouter avec success");
                    String requete3 = "insert into parent (login,email) values (?,?)";
                    pst3 = con.prepareStatement(requete3);
                    pst3.setString(1, par.getLoginParent());
                    pst3.setString(2, par.getEmail());
                    int result3 = pst3.executeUpdate();
                    if (result3 > 0) {
                        System.out.println("Enregistrement réussit table Parent");
                        String requete4 = "insert into inscription (idInscription,dateInscription,statutInscription,montant,reliquat)"
                                + " values(?,?,?,?,?)";
                        pst4 = con.prepareStatement(requete4);
                        pst4.setInt(1, ins.getIdInscription());
                        pst4.setString(2, ins.getDateInscription());
                        pst4.setInt(3, ins.getStatus());
                        pst4.setInt(4, ins.getMontant());
                        pst4.setInt(5, ins.getReliquat());
                        int result4 = pst4.executeUpdate();
                        if (result4 > 0) {
                            System.out.println("enregistrement table inscription reussit");
                            String requete5 = "insert into eleve (login,anneeScolaire,idInscription,nomClasse,"
                                    + "Par_login,dateNaissance,lieuNaissance,sexe)"
                                    + " values (?,?,?,?,?,?,?,?)";
                            pst4 = con.prepareStatement(requete5);
                            pst4.setString(1, pers.getLogin());
                            pst4.setString(2, elv.getAnnee());
                            pst4.setInt(3, ins.getIdInscription());
                            pst4.setString(4, elv.getNomClasse());
                            pst4.setString(5, par.getLoginParent());
                            pst4.setString(6, elv.getDateNaissance());
                            pst4.setString(7, elv.getLieuNaissance());
                            pst4.setString(8, elv.getSexe());
                            int result5 = pst4.executeUpdate();
                            if (result5 > 0) {
                                GestionParamUser gpu = new GestionParamUser();
                                System.out.println("Enregistrement avec succes de la table Eleve");
                                gpu.listerMois();
                                for (Mensuel listerMoi : gpu.listerMois()) {
                                    String requete6 = "insert into mensuel (login,anneeScolaire,statutMensuel,dateMensuel,mois,"
                                            + "montant,reliquat) values (?,?,?,?,?,?,?)";
                                    pst4 = con.prepareStatement(requete6);
                                    pst4.setString(1, pers.getLogin());
                                    pst4.setString(2, elv.getAnnee());
                                    pst4.setInt(3, m.getStatut());
                                    pst4.setString(4, m.getDateMensuel());
                                    pst4.setString(5, listerMoi.getMois());
                                    pst4.setInt(6, m.getMontant());
                                    pst4.setInt(7, m.getReliquat());
                                    int result6 = pst4.executeUpdate();
                                    if (result6 > 0) {
                                        System.out.println("Enregistrement avec success de la table mensuel");
                                    } else {
                                        System.out.println("Erreur d'enregistrement de la table mensuel");
                                    }
                                }
                            } else {
                                System.out.println("Erreur d'enregistrement de la table Eleve");
                            }

                        }
                    } else {
                        System.out.println("Erreur enregistrement table Parent");
                    }

                } else {
                    System.out.println("Erreur d'ajout du parent");
                }
                resultat = true;
            } else {
                resultat = false;
                System.out.println("Erreur d'enregistrement table Personne");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;
    }

    public ArrayList<Eleve> listerEleveClasse(String classe, String annee) {
        ArrayList<Eleve> listEleve = new ArrayList<>();
        Connection con;
        Statement st;
        Eleve eleve;
        try {
            con = daoFactory.getConnection();
            String requete = "select elv.login,prenom,nom,dateNaissance,lieuNaissance FROM eleve elv,personne pers where elv.login=pers.login and nomClasse='" + classe + "' and anneeScolaire='" + annee + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                eleve = new Eleve();
                eleve.setNom(rs.getString("nom"));
                eleve.setPrenom(rs.getString("prenom"));
                eleve.setDateNaissance(rs.getString("dateNaissance"));
                eleve.setLieuNaissance(rs.getString("lieuNaissance"));
                eleve.setLogin(rs.getString("login"));
                listEleve.add(eleve);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listEleve;
    }

    public int verifMensualite(String nomClasse) {
        int reliquat = 0;
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select mensualite from fichederenseignement where nomClasse='" + nomClasse + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                reliquat = rs.getInt("mensualite");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return reliquat;
    }

    public ArrayList<Mensuel> listerMensualite(String login, String annee) {
        ArrayList<Mensuel> listMois = new ArrayList<>();
        Connection con;
        Statement st;
        Mensuel mensuel;
        try {
            con = daoFactory.getConnection();
            String requete = "select mois,statutMensuel,reliquat FROM mensuel WHERE login='" + login + "' and anneeScolaire='" + annee + "' order by idMensuel";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                mensuel = new Mensuel();
                mensuel.setMois(rs.getString("mois"));
                mensuel.setStatutMensuel(rs.getString("statutMensuel"));
                mensuel.setReliquat(rs.getInt("reliquat"));
                listMois.add(mensuel);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listMois;
    }

    public Boolean validerMensualite(String login, String anneeScolaire, String statutMensuel, String dateMensuel,
            String mois, int montant, int reliquat) {
        Connection con;
        Boolean resultat = false;
        PreparedStatement pst;
        try {
            con = daoFactory.getConnection();
            String requete = "update mensuel set statutMensuel=?, dateMensuel=?,montant=?,reliquat=? where login=? and anneeScolaire=? and mois=?";
            pst = con.prepareStatement(requete);
            pst.setString(1, statutMensuel);
            pst.setString(2, dateMensuel);
            pst.setInt(3, montant);
            pst.setInt(4, reliquat);
            pst.setString(5, login);
            pst.setString(6, anneeScolaire);
            pst.setString(7, mois);
            int rs = pst.executeUpdate();
            if (rs > 0) {
                resultat = true;
                System.out.println("la requete est bien exécutée");
            } else {
                System.out.println("Erreur d'exécution");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;
    }

    public int verifMontantPayer(String login, String annee, String moisMensuel) {
        int montant = 0;
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select montant from mensuel where login='" + login + "' and anneeScolaire='" + annee + "' and mois='" + moisMensuel + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                montant = rs.getInt("montant");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return montant;
    }

    public Boolean validerPayementReliquat(String login, String anneeScolaire, String statutMensuel, String dateMensuel,
            String mois, int montant, int reliquat) {
        Connection con;
        Boolean resultat = false;
        PreparedStatement pst;
        try {
            con = daoFactory.getConnection();
            String requete = "update mensuel set statutMensuel=?, dateMensuel=?,montant=?,reliquat=? where login=? and anneeScolaire=? and mois=?";
            pst = con.prepareStatement(requete);
            pst.setString(1, statutMensuel);
            pst.setString(2, dateMensuel);
            pst.setInt(3, montant);
            pst.setInt(4, reliquat);
            pst.setString(5, login);
            pst.setString(6, anneeScolaire);
            pst.setString(7, mois);
            int rs = pst.executeUpdate();
            if (rs > 0) {
                resultat = true;
                System.out.println("la requete est bien exécutée");
            } else {
                System.out.println("Erreur d'exécution");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;
    }

    //Fin Comptable
    /////EDT///////////
    public boolean verifDisponibilite(String jour, String heure, String nomClasse) {
        boolean listEleve = false;
        GestionDate gd = new GestionDate();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select jour,heureDeb FROM emploidutemps where nomClasse='" + nomClasse + "' and jour='" + jour + "' and heureDeb='" + heure + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                if (rs.getString("heureDeb") != null && rs.getString("jour") != null) {
                    listEleve = true;
                }
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listEleve;
    }

    public ArrayList<String> listerSalleClasse() {
        ArrayList<String> listEleve = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select nomSalle FROM salle";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                listEleve.add(rs.getString("nomSalle"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listEleve;
    }

    public ArrayList<String> listerMatiereClasse(String classe) {
        ArrayList<String> listEleve = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select nomMatiere FROM classeMatiere where nomClasse='" + classe + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                listEleve.add(rs.getString("nomMatiere"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listEleve;
    }

    public ArrayList<Personne> listerProfClasse(String classe, String annee) {
        ArrayList<Personne> listEleve = new ArrayList<>();
        Personne personne;
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select login FROM profClasse where nomClasse='" + classe + "' and anneeScolaire='" + annee + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                String requete2 = "select nom from personne where login='" + rs.getString("login") + "'";
                st = con.createStatement();
                ResultSet rs1 = st.executeQuery(requete2);
                while (rs1.next()) {
                    personne = new Personne();
                    personne.setLogin(rs.getString("login"));
                    personne.setNom(rs1.getString("nom"));
                    listEleve.add(personne);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listEleve;
    }

    public String[][] afficherEDT(String classe) {
        String[][] listEleve = new String[4][5];
        GestionDate gd = new GestionDate();
        int l = 0;
        int c = 0;
        int cpt = 0;
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select * FROM emploidutemps where nomClasse='" + classe + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                String requete2 = "select nom from personne where login ='" + rs.getString("login") + "'";
                st = con.createStatement();
                ResultSet rs1 = st.executeQuery(requete2);
                while (rs1.next()) {
                    c = gd.numeroJour(rs.getString("jour")); //Colonne
                    l = gd.numeroHeure(rs.getString("heureDeb")); //Ligne
                    listEleve[l][c] = rs.getString("nomMatiere") + "//---//" + rs1.getString("nom") + "//---//" + rs.getString("nomSalle");
                    System.out.println("requete bien executer");
                    System.out.println(rs.getString("nomSalle"));
                }
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listEleve;
    }

    ////Fin EDT/////////
    public ArrayList<Eleve> consulterNotes(String nomClasse, String nomMatiere, String semestre, String annee) {

        ArrayList<Eleve> eleves = new ArrayList();
        Statement st;
        try {
            con = daoFactory.getConnection();

            String requete = "select dateNaissance,lieuNaissance,nom, prenom, noteComposition from eleve e1, evaluation e2,personne p, classematiere cm where e1.login=p.login and e1.login=e2.login and e1.nomClasse='" + nomClasse + "' and e2.nomMatiere='" + nomMatiere + "' and cm.nomClasse='" + nomClasse + "' and cm.nomMatiere='" + nomMatiere + "' and e2.semestre='" + semestre + "' and e2.anneeScolaire='" + annee + "' and e1.anneeScolaire=e2.anneeScolaire and e1.anneeScolaire='" + annee + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);

            while (rs.next()) {
                Eleve elev = new Eleve(nomClasse, rs.getString(3), rs.getString(4), null, rs.getString(1), rs.getString(2), null, null, null);

                elev.setComposition(rs.getFloat(5));
                eleves.add(elev);

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return eleves;

    }

    public boolean insertMatiere(String nomMatiere, String nomArabe) {
        boolean resultat = false;
        if (nomArabe.equals("")) {
            nomArabe = null;
        }
        try {
            con = daoFactory.getConnection();
            PreparedStatement pst;

            String requete1 = "insert into matiere values(?,?)";
            pst = con.prepareStatement(requete1);
            pst.setString(1, nomMatiere);
            pst.setString(2, nomArabe);

            int result = pst.executeUpdate();

            if (result > 0) {
                System.out.println("l'insertion de matiere a reussie");
                resultat = true;
            } else {

                System.out.println("Erreur de requete(s) : l'insertion de matiere n'a pas reussie");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;
    }

    public boolean insertClasse(String nomClasse, String[] matFrancais, ArrayList<String> arabe) {

        boolean resultat = false;
        try {
            con = daoFactory.getConnection();

            PreparedStatement pst;
            String requete1 = "insert into classe values(?)";
            pst = con.prepareStatement(requete1);
            pst.setString(1, nomClasse);
            int result = pst.executeUpdate();

            int result1 = 0;
            for (int i = 0; i < matFrancais.length; i++) {
                PreparedStatement pst1;
                String requete = "insert into classematiere values(?,?,?)";
                pst1 = con.prepareStatement(requete);
                pst1.setString(1, nomClasse);
                pst1.setString(2, matFrancais[i]);
                pst1.setInt(3, 1);
                result1 = pst1.executeUpdate();
            }

            int result2 = 0;
            for (String ar : arabe) {
                PreparedStatement pst2;
                String requete = "insert into classematiere values(?,?,?)";
                pst2 = con.prepareStatement(requete);
                pst2.setString(1, nomClasse);
                pst2.setString(2, ar);
                pst2.setInt(3, 1);
                result2 = pst2.executeUpdate();
            }

            if ((result > 0) && (result1 > 0) && (result2 > 0)) {
                System.out.println("l'insertion de matiere a reussie");
                resultat = true;
            } else {

                System.out.println("Erreur de requete(s) : l'insertion de matiere n'a pas reussie");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;

    }

//    public boolean insertCoef(String nomClasse,String[] nomMatieres,String[] coefs){
//        int coef =0;
//        int result = 0;
//        boolean resultat = false;
//        try {
//            con = daoFactory.getConnection();
//            for(int i=0;i<coefs.length;i++){
//                coef = Integer.parseInt(coefs[i]);
//                PreparedStatement pst;
//                String requete1 = "update classematiere set coef=? where nomClasse=? and nomMatiere=? ";
//                pst = con.prepareStatement(requete1);
//                pst.setInt(1, coef);
//                pst.setString(2, nomClasse);
//                pst.setString(3, nomMatieres[i]);
//                result = pst.executeUpdate();
//                
//            }
//            if(result>0){
//                    System.out.println("la requete a bien été executée");
//                    resultat = true;
//                }else{
//                    System.out.println("la requete a eu une erreur");
//                }
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//        return resultat;
//    
//    }
    public Bulletin eleve(String login, String annee, String semestre, String ens) {
        System.out.println(login + " " + annee + " " + semestre + " " + ens);
        Bulletin bulletin = new Bulletin();
        Evaluation eva;
        ArrayList<Evaluation> evaluations = new ArrayList<>();
        int totalCoef = 0;
        float totalMoy = 0;
        Statement st;
        Statement st1;
        Statement st2;
        try {
            ///////////requet select pour les donnees de l'eleve//////////////////////////////////////////
            con = daoFactory.getConnection();
            String requete = "select nom,prenom,lieuNaissance,dateNaissance,adresse,nomClasse,retards,absences,moyCompo1FR,moyCompo2FR,moyCompo3FR,moyCompo1AR,moyCompo2AR,moyCompo3AR from eleve where loginEleve = '" + login + "' and annee='" + annee + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                bulletin.setLogin(login);
                bulletin.setNom(rs.getString("nom"));
                bulletin.setPrenom(rs.getString("prenom"));
                bulletin.setNomClasse(rs.getString("nomClasse"));
                bulletin.setLieuNaissance(rs.getString("lieuNaissance"));
                bulletin.setDateNaissance(rs.getString("dateNaissance"));
                bulletin.setAbsences(rs.getInt("absences"));
                bulletin.setRetards(rs.getInt("retards"));
                bulletin.setMoyCompo1FR(rs.getFloat("moyCompo1FR"));
                bulletin.setMoyCompo2FR(rs.getFloat("moyCompo2FR"));
                bulletin.setMoyCompo3FR(rs.getFloat("moyCompo3FR"));
                bulletin.setMoyCompo1AR(rs.getFloat("moyCompo1AR"));
                bulletin.setMoyCompo2AR(rs.getFloat("moyCompo2AR"));
                bulletin.setMoyCompo3AR(rs.getFloat("moyCompo3AR"));
                ////////////////////requete select pour connaitre le nombre d'eleves/////////////////////////////
                String requete1 = "select count(*) as nombreEleve from eleve where nomClasse = '" + rs.getString("nomClasse") + "' and annee='" + annee + "'";
                st1 = con.createStatement();
                ResultSet rs1 = st1.executeQuery(requete1);
                if (rs1.next()) {
                    bulletin.setNbreEleve(rs1.getString("nombreEleve"));
                }
            }

            /////////////////////requete select pour recuperer les notes d'evaluations//////////////////////////////
            String requete2 = "select evaluation.nomMatiere,noteComposition,coef,nomArabe from evaluation,classeMatiere,matiere where matiere.nomMatiere=evaluation.nomMatiere and loginEleve = '" + login + "' and evaluation.nomMatiere=classeMatiere.nomMatiere and nomClasse='" + bulletin.getNomClasse() + "' and semestre='" + semestre + "' and annee='" + annee + "' and evaluation.nomMatiere like '%:" + ens + "'";
            st2 = con.createStatement();
            ResultSet rs2 = st2.executeQuery(requete2);
            while (rs2.next()) {
                eva = new Evaluation();
                eva.setNomMatiere(rs2.getString("nomMatiere"));
                eva.setComposition(rs2.getFloat("noteComposition"));
                eva.setNomArabe(rs2.getString("nomArabe"));
                System.out.println(eva.getNomArabe());
                eva.setCoef(rs2.getInt("coef"));

                //*******************Appreciations**********************************
                if ((eva.getComposition() >= 8) && (eva.getComposition() <= 10)) {
                    eva.setAppreciations("Tres Bien");
                } else if ((eva.getComposition() >= 6) && (eva.getComposition() < 8)) {
                    eva.setAppreciations("Bien");
                } else if ((eva.getComposition() >= 4) && (eva.getComposition() < 6)) {
                    eva.setAppreciations("A.Bien");
                } else {
                    eva.setAppreciations("Passable");
                }
                evaluations.add(eva);
                bulletin.setEvaluation(evaluations);
                totalCoef += rs2.getInt("coef");
                totalMoy += rs2.getFloat("noteComposition");
            }
            bulletin.setTotalCoef(totalCoef);
            System.out.println(totalCoef);
            bulletin.setTotalMoyenne(totalMoy);
            System.out.println(totalMoy);
            bulletin.setMoyenneGenerale(totalMoy / totalCoef);

            ////////////////////requete pour inserer la moyenne generale du 1er semestre ou du 2eme////////////////////////
            PreparedStatement pst;
            String requete1 = null;
            if ((semestre.equals("1ère_Composition")) && (ens.equals("Francais"))) {
                requete1 = "update eleve set moyCompo1FR=? where loginEleve=? and annee=?";
            } else if ((semestre.equals("1ère_Composition")) && (ens.equals("Arabe"))) {
                requete1 = "update eleve set moyCompo1AR=? where loginEleve=? and annee=?";
            } else if ((semestre.equals("2eme_Composition")) && (ens.equals("Francais"))) {
                requete1 = "update eleve set moyCompo2FR=? where loginEleve=? and annee=?";
            } else if ((semestre.equals("2eme_Composition")) && (ens.equals("Arabe"))) {
                requete1 = "update eleve set moyCompo2AR=? where loginEleve=? and annee=?";
            } else if ((semestre.equals("3eme_Composition")) && (ens.equals("Francais"))) {
                requete1 = "update eleve set moyCompo3FR=? where loginEleve=? and annee=?";
            } else if ((semestre.equals("3eme_Composition")) && (ens.equals("Arabe"))) {
                requete1 = "update eleve set moyCompo3AR=? where loginEleve=? and annee=?";
            }
            pst = con.prepareStatement(requete1);
            pst.setFloat(1, bulletin.getMoyenneGenerale());  //
            pst.setString(2, login);
            pst.setString(3, annee);
            int result = pst.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return bulletin;

    }

    public void moyenne(String login, String annee, String semestre, String nomClasse, String ens) {

        Bulletin bulletin = new Bulletin();
        Evaluation eva;
        ArrayList<Evaluation> evaluations = new ArrayList<>();
        int totalCoef = 0;
        float totalMoy = 0;
        Statement st2;
        try {
            con = daoFactory.getConnection();
            /////////////////////requete select pour recuperer les notes d'evaluations//////////////////////////////
            String requete2 = "select evaluation.nomMatiere,noteComposition,coef from evaluation,classeMatiere where loginEleve = '" + login + "' and evaluation.nomMatiere=classeMatiere.nomMatiere and nomClasse='" + nomClasse + "' and semestre='" + semestre + "' and annee='" + annee + "'and evaluation.nomMatiere like '%" + ens + "'";

            st2 = con.createStatement();
            ResultSet rs2 = st2.executeQuery(requete2);
            while (rs2.next()) {

                eva = new Evaluation();
                eva.setNomMatiere(rs2.getString("nomMatiere"));
                eva.setComposition(rs2.getFloat("noteComposition"));
                eva.setCoef(rs2.getInt("coef"));

                evaluations.add(eva);
                bulletin.setEvaluation(evaluations);
                totalCoef += rs2.getInt("coef");
                totalMoy += rs2.getFloat("noteComposition");
            }
            bulletin.setTotalCoef(totalCoef);
            System.out.println(totalCoef);
            bulletin.setTotalMoyenne(totalMoy);
            System.out.println(totalMoy);
            bulletin.setMoyenneGenerale(totalMoy / totalCoef);

            ////////////////////requete pour inserer la moyenne generale du 1er semestre ou du 2eme////////////////////////
            PreparedStatement pst;
            String requete1 = null;
            if ((semestre.equals("1ère_Composition")) && (ens.equals("Francais"))) {
                requete1 = "update eleve set moyCompo1FR=? where loginEleve=? and annee=?";
            } else if ((semestre.equals("1ère_Composition")) && (ens.equals("Arabe"))) {
                requete1 = "update eleve set moyCompo1AR=? where loginEleve=? and annee=?";
            } else if ((semestre.equals("2eme_Composition")) && (ens.equals("Francais"))) {
                requete1 = "update eleve set moyCompo2FR=? where loginEleve=? and annee=?";
            } else if ((semestre.equals("2eme_Composition")) && (ens.equals("Arabe"))) {
                requete1 = "update eleve set moyCompo2AR=? where loginEleve=? and annee=?";
            } else if ((semestre.equals("3eme_Composition")) && (ens.equals("Francais"))) {
                requete1 = "update eleve set moyCompo3FR=? where loginEleve=? and annee=?";
            } else if ((semestre.equals("3eme_Composition")) && (ens.equals("Arabe"))) {
                requete1 = "update eleve set moyCompo3AR=? where loginEleve=? and annee=?";
            }

            pst = con.prepareStatement(requete1);
            pst.setFloat(1, bulletin.getMoyenneGenerale());
            pst.setString(2, login);
            pst.setString(3, annee);
            int result = pst.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    public void changePasswdDir(String idPersonne, String passwd, String prenom, String nom, String adresse) {

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst;
            PreparedStatement pst2;
            String requete1 = "update directeur set motDePasse=? where idPersonne=?";
            pst = con.prepareStatement(requete1);
            pst.setString(1, passwd);
            pst.setString(2, idPersonne);
            int result = pst.executeUpdate();
            if (result > 0) {
                String requete2 = "update personne set prenom=? ,nom=?, adresse=? where idPersonne=?";
                pst2 = con.prepareStatement(requete2);
                pst2.setString(1, prenom);
                pst2.setString(2, nom);
                pst2.setString(3, adresse);
                pst2.setString(4, idPersonne);
                int result2 = pst2.executeUpdate();
                if (result2 > 0) {
                    System.out.println("update personne success");
                }
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());;
        }
    }

    public void changePasswdSurv(String login, String passwd, String prenom, String nom, String adresse) {

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst;
            PreparedStatement pst2;
            String requete1 = "update personne set prenom=? ,nom=?, adresse=?,motDePasse=? where login=?";
            pst = con.prepareStatement(requete1);
            pst.setString(1, prenom);
            pst.setString(2, nom);
            pst.setString(3, adresse);
            pst.setString(4, passwd);
            pst.setString(5, login);
            int result = pst.executeUpdate();
            if (result > 0) {
                System.out.println("update personne success");
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());;
        }
    }

    public ArrayList<Utilisateur> compteDirecteur(String loginDir) {
        Utilisateur uti = new Utilisateur();
        ArrayList<Utilisateur> compteProf = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select login,prenom,nom,adresse,nomImgPers,motDePasse from personne where login='" + loginDir + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                uti = new Utilisateur();
                uti.setLogin(rs.getString("login"));
                uti.setMotDePasse(rs.getString("motDePasse"));
                uti.setAdresse(rs.getString("adresse"));
                uti.setPrenom(rs.getString("prenom"));
                uti.setNom(rs.getString("nom"));
                uti.setAdresse(rs.getString("adresse"));
                uti.setNomImgPers(rs.getString("nomImgPers"));
                compteProf.add(uti);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return compteProf;
    }


    public boolean insertAnnee(String annee) {
        boolean resultat = false;
        try {
            con = daoFactory.getConnection();
            PreparedStatement pst;

            String requete1 = "insert into annee values(?)";
            pst = con.prepareStatement(requete1);
            pst.setString(1, annee);

            int result = pst.executeUpdate();

            if (result > 0) {
                System.out.println("l'insertion de matiere a reussie");
                resultat = true;
            } else {

                System.out.println("Erreur de requete(s) : l'insertion de matiere n'a pas reussie");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;
    }

    public boolean ajouterSurv(Personne pers) {
        boolean resultat = false;

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;
            PreparedStatement pst2;

            String requete1 = "insert into personne (login,nom,prenom,adresse,telephone,motDePasse,etatPers,profils) values(?,?,?,?,?,?,?,?)";
            pst1 = con.prepareStatement(requete1);
            pst1.setString(1, pers.getLogin());
            pst1.setString(2, pers.getNom());
            pst1.setString(3, pers.getPrenom());
            pst1.setString(4, pers.getAdresse());
            pst1.setString(5, pers.getTel());
            pst1.setString(6, pers.getMotDePasse());
            pst1.setInt(7, pers.getEtatPers());
            pst1.setString(8, pers.getProfils());
            int result1 = pst1.executeUpdate();

            String requete2 = "insert into surveillant values(?)";
            pst2 = con.prepareStatement(requete2);
            pst2.setString(1, pers.getLogin());
            int result2 = pst2.executeUpdate();

            if ((result1 > 0) && (result2 > 0)) {
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

    public boolean updateClasse(String nomClasse, String classeOld) {
        boolean resultat = false;

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;
            String req = "update classe set nomclasse=? where nomClasse=?";
            pst1 = con.prepareStatement(req);
            pst1.setString(1, nomClasse);
            pst1.setString(2, classeOld);
            int result = pst1.executeUpdate();
            if (result > 0) {
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

    public boolean updateMatiere(String nomEnAr, String nomEnFrancais, String nomEnFrancaisOld) {
        boolean resultat = false;

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;
            System.out.println("Ma matiere " + nomEnFrancais);
            String req = "update matiere set nomMatiere='" + nomEnFrancais + "', nomArabe='" + nomEnAr + "' where nomMatiere='" + nomEnFrancaisOld + "'";
            pst1 = con.prepareStatement(req);
            int result = pst1.executeUpdate();
            if (result > 0) {
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

    public boolean updateMatiereFr(String nomFr, String nomFrancaisOld) {
        boolean resultat = false;

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;
            String req = "update matiere set nomMatiere='" + nomFr + "' where nomMatiere='" + nomFrancaisOld + "'";
            pst1 = con.prepareStatement(req);
            int result = pst1.executeUpdate();
            if (result > 0) {
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

    public boolean SupprimerMat(String nomMat) {
        boolean resultat = false;

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;
            String req = "delete from matiere where nomMatiere='" + nomMat + "'";
            pst1 = con.prepareStatement(req);
            int result = pst1.executeUpdate();
            if (result > 0) {
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

    public boolean supprimerCl(String nomCl) {
        boolean resultat = false;

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;
            String req = "delete from classe where nomClasse='" + nomCl + "'";
            pst1 = con.prepareStatement(req);
            int result = pst1.executeUpdate();
            if (result > 0) {
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

    public boolean modSurv(Utilisateur usr) {
        boolean resultat = false;

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;
            String req = "update personne set nom=?, prenom=?, adresse=?,telephone=? where login=?";
            pst1 = con.prepareStatement(req);
            pst1.setString(1, usr.getNom());
            pst1.setString(2, usr.getPrenom());
            pst1.setString(3, usr.getAdresse());
            pst1.setString(4, usr.getTelephone());
            pst1.setString(5, usr.getLogin());

            int result = pst1.executeUpdate();
            if (result > 0) {
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

    public boolean supprimerSurv(String login) {
        boolean resultat = false;

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst1;

            String req = "delete from personne where login=?";
            pst1 = con.prepareStatement(req);
            pst1.setString(1, login);
            int result = pst1.executeUpdate();
            if (result > 0) {
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

}
