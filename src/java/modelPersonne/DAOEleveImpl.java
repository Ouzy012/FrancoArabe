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
import model.Eleve;
import model.GestionParamUser;
import model.ListEleve;
import model.Mensuel;
import model.Parent;
import model.Prof;
import model.Reclamation;
import model.Utilisateur;
import modelTables.Personne;

/**
 *
 * @author ibrah
 */
public class DAOEleveImpl {

    private DAOFactory daoFactory;
    public Eleve eleve = new Eleve();
    public ListEleve eleve1 = new ListEleve();

    public DAOEleveImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    Connection con;

    public ArrayList<Eleve> listEleve(String classe, String matiere, String annee) {
        ArrayList<Eleve> listEleves = new ArrayList<>();
        Connection con;
        Statement st;
        PreparedStatement pst;
        try {
            con = daoFactory.getConnection();
            String requete = "select distinct eleve.loginEleve,prenom,nom,classematiere.nomMatiere FROM eleve,classematiere where classematiere.nomMatiere='" + matiere + "' and classematiere.nomClasse='" + classe + "' and eleve.nomClasse= '" + classe + "' and eleve.annee='" + annee + "' order by nom";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                eleve = new Eleve();
                eleve.setNom(rs.getString("nom"));
                eleve.setPrenom(rs.getString("prenom"));
                eleve.setClasse(classe);
                eleve.setMatiere(matiere);
                eleve.setMatriculeEleve(rs.getString("loginEleve"));
                listEleves.add(eleve);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listEleves;
    }

    public void ajouterNote1(String composition, String matricule, String semestre, String annee, String matiere) {
        Connection con;
        Statement st;
        PreparedStatement pst;
        try {
            con = daoFactory.getConnection();
            String requete = "update evaluation set noteComposition=? where loginEleve=? and nomMatiere=? and semestre=? and annee=?";
            pst = con.prepareStatement(requete);

            pst.setString(1, composition);
            pst.setString(2, matricule);
            pst.setString(3, matiere);
            pst.setString(4, semestre);
            pst.setString(5, annee);
            int rs = pst.executeUpdate();
            if (rs > 0) {
                System.out.println("la requete est bien exécutée");
            } else {
                System.out.println("Erreur d'exécution");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void ajouterNote2(String note, String matricule) {
        Connection con;
        Statement st;
        PreparedStatement pst;
        try {
            con = daoFactory.getConnection();
//            String requete = "UPDATE  elevevaluation SET  note ='" + note + "'" + "WHERE  matriculeEleve='"+matricule+"'";
            String requete = "insert into elevevaluation (loginEleve,idEvaluation,note,libelle) values(?,?,?,?)";
            pst = con.prepareStatement(requete);
            pst.setString(1, matricule);
            pst.setString(2, "2");
            pst.setString(3, note);
            pst.setString(4, "composition");
            pst.execute();
            pst.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<ListEleve> listNote(String classe, String matiere, String annee) {
        ArrayList<ListEleve> list = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select distinct eleve.loginEleve,prenom,nom,evaluation.nomMatiere,classe.nomClasse,evaluation.noteComposition,evaluation.semestre,evaluation.annee FROM classe,eleve,evaluation,profclasse p where evaluation.nomMatiere='" + matiere + "' and classe.nomClasse='" + classe + "' and eleve.loginEleve=evaluation.loginEleve and eleve.nomClasse='" + classe + "' and evaluation.annee='" + annee + "' and p.nomClasse='" + classe + "' and p.nomMatiere='" + matiere + "' and p.annee='" + annee + "' and eleve.annee='" + annee + "' and evaluation.annee=eleve.annee order by nom";
//            String requete = "select eleve.loginEleve,prenom,nom,classematiere.nomMatiere,classe.nomClasse,elevevaluation.devoir1,elevevaluation.devoir2,elevevaluation.composition,evaluation.idEvaluation FROM classe,eleve,classematiere,evaluation,elevevaluation where elevevaluation.loginEleve=eleve.loginEleve and classematiere.nomMatiere='" + matiere + "' and classe.nomClasse='" + classe + "' and eleve.nomClasse=classe.nomClasse order by nom ";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                eleve1 = new ListEleve();
                eleve1.setNom(rs.getString("nom"));
                eleve1.setPrenom(rs.getString("prenom"));
                eleve1.setClasse(classe);
                eleve1.setMatiere(matiere);
                eleve1.setMatriculeEleve(rs.getString("loginEleve"));
                eleve1.setComposition(rs.getFloat("noteComposition"));
                eleve1.setSemestre(rs.getString("semestre"));
                eleve1.setAnnee(rs.getString("annee"));
                list.add(eleve1);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    /*joe*/ public ArrayList<String> eleveParent(String loginEleve) {

        ArrayList<String> annee = new ArrayList();
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select annee from  eleveannesco where loginEleve ='" + loginEleve + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                annee.add(rs.getString(1));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return annee;
    }

    public ArrayList<Eleve> eleveParent(String annee, String loginEleve) {
        ArrayList<Eleve> elevePar = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete1 = "select noteComposition,nomMatiere,semestre from evaluation where annee='" + annee + "'and loginEleve='" + loginEleve + "'";
            st = con.createStatement();
            ResultSet rs1 = st.executeQuery(requete1);
            while (rs1.next()) {
                Eleve eleve = new Eleve();

                eleve.setSemestre(rs1.getString("semestre"));
                eleve.setComposition(rs1.getFloat("noteComposition"));
                eleve.setMatiere(rs1.getString("nomMatiere"));
                eleve.setAnnee(annee);
                elevePar.add(eleve);
            }
            for (Eleve e : elevePar) {
                System.out.println(e.getComposition() + " " + e.getDevoir1() + " " + e.getDevoir2());
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return elevePar;
    }

    public void modifierNote(String composition, String loginEleve, String matiere, String semestre, String classe, String annee) {
        Connection con;
        Statement st;
        PreparedStatement pst;
        try {
            con = daoFactory.getConnection();
            String requete2 = "UPDATE  evaluation SET  noteComposition ='" + composition + "'" + "WHERE  loginEleve='" + loginEleve + "' and nomMatiere='" + matiere + "' and semestre='" + semestre + "' and annee='" + annee + "'";
            st = con.createStatement();
            int rs2 = st.executeUpdate(requete2);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public String verifProf(String matiere, String classe) {
        String loginProf = "";
        Connection con;
        Statement st;
        Prof pro = new Prof();
        try {
            con = daoFactory.getConnection();
            String requete = "select profclasse.loginProf from profclasse,profmatiere where profclasse.loginProf=profmatiere.loginProf and profmatiere.nomMatiere='" + matiere + "'" + " and profclasse.nomClasse='" + classe + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                pro.setLoginProf(rs.getString("loginProf"));
                loginProf = rs.getString("loginProf");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return loginProf;

    }

    public ArrayList<Arabe> selectMatiere(String loginProf) {
        ArrayList<Arabe> listMatiere = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select matiere.nomMatiere,nomArabe from profmatiere,matiere where loginProf='" + loginProf + "' and profmatiere.nomMatiere=matiere.nomMatiere";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                Arabe ar = new Arabe();
                ar.setNomEnArabe(rs.getString("nomArabe"));
                System.out.println(rs.getString("nomArabe") + "  " + rs.getString("nomMatiere"));
                ar.setNomEnFrancais(rs.getString("nomMatiere"));
                listMatiere.add(ar);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listMatiere;
    }

    public ArrayList<String> selectClasse(String loginProf) {
        ArrayList<String> listClasse = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select distinct nomClasse from profclasse where loginProf='" + loginProf + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                listClasse.add(rs.getString("nomClasse"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listClasse;
    }

    public ArrayList<Utilisateur> compte(String loginProf) {
        Utilisateur uti = new Utilisateur();
        ArrayList<Utilisateur> compteProf = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select personne.idPersonne,personne.prenom,personne.nom,personne.adresse,personne.nomImgPers,professeur.loginProf,professeur.motDePasse from personne,professeur where professeur.loginProf='" + loginProf + "' and professeur.idPersonne=personne.idPersonne";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                uti = new Utilisateur();
                uti.setLogin(rs.getString("loginProf"));
                uti.setMotDePasse(rs.getString("motDePasse"));
                uti.setAdresse(rs.getString("adresse"));
                uti.setIdPersonne(rs.getString("idPersonne"));
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

    public void modifierCompte(String login, String ancienMdp, int idPersonne, String prenom, String nom, String adresse) {
        Connection con;
        Statement st;
        Statement st1;
        try {
            con = daoFactory.getConnection();
            String requete1 = "UPDATE  professeur SET  motDePasse ='" + ancienMdp + "'" + "WHERE  idPersonne='" + idPersonne + "'";
            st = con.createStatement();
            int rs1 = st.executeUpdate(requete1);
            if (rs1 > 0) {
                String requete2 = "UPDATE  personne SET  prenom ='" + prenom + "'" + ", nom ='" + nom + "'" + ",adresse='" + adresse + "'" + "WHERE  idPersonne='" + idPersonne + "'";
                st1 = con.createStatement();
                int rs2 = st1.executeUpdate(requete2);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public Boolean ajouterImageCompte(String idPersonne, String nomImgPers) {
        Connection con;
        Statement st;
        boolean result = false;
        try {
            con = daoFactory.getConnection();
            String requete1 = "UPDATE  personne SET  nomImgPers ='" + nomImgPers + "'" + "WHERE  idPersonne='" + idPersonne + "'";
            st = con.createStatement();
            int rs1 = st.executeUpdate(requete1);
            result = true;

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public ArrayList<String> selectAnnee() {
        ArrayList<String> listAnnee = new ArrayList<>();
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select * from annee ";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                listAnnee.add(rs.getString("annee"));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listAnnee;
    }

    public String verifProf1(String matiere, String classe, String loginProf) {
        String annne = "";
        Connection con;
        Statement st;
        Prof pro = new Prof();
        try {
            con = daoFactory.getConnection();
            String requete = "select annee from profclasse pc where loginProf='" + loginProf + "'" + " and nomClasse='" + classe + "'" + " and nomMatiere='" + matiere + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                pro.setLoginProf(rs.getString("annee"));
                annne = rs.getString("annee");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return annne;
    }

    public int compte2(String ancienMdp) {
        String login = "null";
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select loginProf from professeur where motDePasse='" + ancienMdp + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                login = rs.getString("loginProf");
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

    public int compte3(String ancienMdp) {
        String login = "null";
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select loginDir from directeur where motDePasse='" + ancienMdp + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                login = rs.getString("loginDir");
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

    public boolean determinerMotDePasse(String login, String ancienMdp) {
        boolean result = false;
        Connection con;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select login from personne where login='" + login + "' and motDePasse='" + ancienMdp + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public String reclamation(String nomClasse, String nomMatiere, String an) {

        String loginProf = "";
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select loginProf from profclasse where nomMatiere='" + nomMatiere + "' and nomClasse='" + nomClasse + "' and annee='" + an + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                loginProf = rs.getString("loginProf");
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return loginProf;
    }

    public void insereReclamation(String loginEleve, String loginProf, String message, String enTete, String date) {

        Statement st;
        PreparedStatement pst;
        try {
            con = daoFactory.getConnection();
            String requete = "insert into reclamation (loginEleve,loginProf,enTete,message,Date,reponse,lue) values(?,?,?,?,?,?,?)";
            pst = con.prepareStatement(requete);
            pst.setString(1, loginEleve);
            pst.setString(2, loginProf);
            pst.setString(3, enTete);
            pst.setString(4, message);
            pst.setString(5, date);
            pst.setInt(6, 0);
            pst.setInt(7, 0);
            int result0 = pst.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Reclamation> selectReclamation(String loginProf) {

        ArrayList<Reclamation> message = new ArrayList();
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select enTete,message,loginEleve,Date,idReclam from reclamation  where loginProf='" + loginProf + "' and reponse=0 and lue=0";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                Reclamation rec = new Reclamation();
                rec.setEnTete(rs.getString("enTete"));
                rec.setMessage(rs.getString("message"));
                rec.setLoginEleve(rs.getString("loginEleve"));
                rec.setDate(rs.getString("Date"));
                rec.setIdReclamation(rs.getString("idReclam"));
                message.add(rec);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return message;
    }

    public void insereReclamationRep(String loginEleve, String loginProf, String message, String enTete, String date, String idReclamation) {

        Statement st;
        PreparedStatement pst;
        try {
            con = daoFactory.getConnection();
            String requete = "insert into reclamation (loginEleve,loginProf,enTete,message,Date,reponse,lue) values(?,?,?,?,?,?,?)";
            pst = con.prepareStatement(requete);
            pst.setString(1, loginEleve);
            pst.setString(2, loginProf);
            pst.setString(3, enTete);
            pst.setString(4, message);
            pst.setString(5, date);
            pst.setInt(6, 1);
            pst.setInt(7, 1);
            int result0 = pst.executeUpdate();
            String requete1 = "update reclamation set lue=1 where idReclam='" + idReclamation + "'";
            st = con.createStatement();
            int rs1 = st.executeUpdate(requete1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Reclamation> selectReclamationRep(String loginEleve) {

        ArrayList<Reclamation> message = new ArrayList();
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select enTete,message,LoginProf,Date from reclamation  where loginEleve='" + loginEleve + "' and reponse=1";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                Reclamation rec = new Reclamation();
                rec.setEnTete(rs.getString("enTete"));
                rec.setMessage(rs.getString("message"));
                rec.setLoginProf(rs.getString("LoginProf"));
                rec.setDate(rs.getString("Date"));
                message.add(rec);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return message;
    }

    /////////////////////////////////////////////////////joe////////////////////////////////////////////////////////////////// 
    public Boolean validerPayement(String login, String nomClasse, String anneeSco, String mois) {

        Boolean resultat = false;
        try {
            con = daoFactory.getConnection();
            PreparedStatement pst;
            String requete = "update mensuel set statutMensuel=? where login= '" + login + "' and nomClasse='" + nomClasse + "' and anneeScolaire='" + anneeSco + "' and mois='" + mois + "'";
            pst = con.prepareStatement(requete);
            pst.setString(1, "1");
            int result = pst.executeUpdate();
            if (result > 0) {
                resultat = true;
                System.out.println("requete a été bien éxécutée");

            } else {
                System.out.println("Erreur de la requete");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;
    }

    public ArrayList<Mensuel> listerMensuel(String loginEleve, String nomClasse, String anneSco) {

        ArrayList<Mensuel> mensuel = new ArrayList();
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select mois,statutMensuel from mensuel  where login='" + loginEleve + "' and nomClasse='" + nomClasse + "' and anneeScolaire='" + anneSco + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                Mensuel m = new Mensuel();
                m.setMois(rs.getString("mois"));
                m.setStatutMensuel(rs.getString("statutMensuel"));
                mensuel.add(m);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return mensuel;
    }

    public Boolean mensualite(Mensuel mensuel) {
        Boolean resultat = false;
        Statement st;
        PreparedStatement pst;
        GestionParamUser gpu = new GestionParamUser();
        try {
            con = daoFactory.getConnection();
            for (Mensuel listerMoi : gpu.listerMois()) {
                if (!(listerMoi.getMois().equalsIgnoreCase("Juillet"))) {
                    String requete = "insert into mensuel (login,nomClasse,anneeScolaire,statutMensuel,mois) values(?,?,?,?,?)";
                    pst = con.prepareStatement(requete);
                    pst.setString(1, mensuel.getLoginElv());
                    pst.setString(2, mensuel.getNomClasse());
                    pst.setString(3, mensuel.getAnneeScolaire());
                    pst.setString(4, mensuel.getStatutMensuel());
                    pst.setString(5, listerMoi.getMois());
                    int resulta = pst.executeUpdate();
                    if (resulta > 0) {
                        resultat = true;
                        System.out.println("requete mensuel exécuter avec succes");
                    } else {
                        System.out.println("erreur requete mensuel");
                    }
                } else {
                    String requete = "insert into mensuel (login,nomClasse,anneeScolaire,statutMensuel,mois) values(?,?,?,?,?)";
                    pst = con.prepareStatement(requete);
                    pst.setString(1, mensuel.getLoginElv());
                    pst.setString(2, mensuel.getNomClasse());
                    pst.setString(3, mensuel.getAnneeScolaire());
                    pst.setString(4, "1");
                    pst.setString(5, listerMoi.getMois());

                    int resulta = pst.executeUpdate();
                    if (resulta > 0) {
                        resultat = true;
                        System.out.println("requete mensuel Juillet exécuter avec succes");
                    } else {
                        System.out.println("erreur requete mensuel");
                    }
                }
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;
    }

    public Boolean inscription(Eleve elev, Parent parent) {

        Boolean resultat = false;

        try {
            con = daoFactory.getConnection();

            PreparedStatement pstp;
            String reqPa = "insert into parent values(?,?,?,?,?)";
            pstp = con.prepareStatement(reqPa);
            pstp.setString(1, parent.getLoginParent());
            pstp.setString(2, parent.getNom());
            pstp.setString(3, parent.getPrenom());
            pstp.setString(4, parent.getTel());
            pstp.setString(5, parent.getMotDePasse());
            int resulta = pstp.executeUpdate();

            PreparedStatement pst;
            String requete = "insert into eleve(nomClasse,nom,prenom,adresse,dateNaissance,lieuNaissance,loginEleve,motDePasse,loginParent,annee) values(?,?,?,?,?,?,?,?,?,?)";
            pst = con.prepareStatement(requete);
            pst.setString(1, elev.getNomClasse());
            pst.setString(2, elev.getNom());
            pst.setString(3, elev.getPrenom());
            pst.setString(4, elev.getAdresse());
            pst.setString(5, elev.getDateNaissance());
            pst.setString(6, elev.getLieuNaissance());

            pst.setString(7, elev.getLogin());
            pst.setString(8, elev.getMotDePasse());
            pst.setString(9, parent.getLoginParent());
            pst.setString(10, elev.getAnnee());
            int result = pst.executeUpdate();

            PreparedStatement pst0;
            String req = "insert into eleveannesco values(?,?)";
            pst0 = con.prepareStatement(req);
            pst0.setString(1, elev.getAnnee());
            pst0.setString(2, elev.getLogin());
            int result0 = pst0.executeUpdate();

            Statement st0;
            String requ = "select nomMatiere from classematiere where nomClasse = '" + elev.getNomClasse() + "'";
            st0 = con.createStatement();
            ResultSet rs0 = st0.executeQuery(requ);
            while (rs0.next()) {

                PreparedStatement pst1;

                String requete2 = "insert into evaluation values (?,?,?,?,?)";
                pst1 = con.prepareStatement(requete2);
                pst1.setString(1, elev.getLogin());
                pst1.setString(2, rs0.getString("nomMatiere"));
                System.out.println(rs0.getString("nomMatiere"));
                pst1.setString(3, "1ère_Composition");
                pst1.setString(4, elev.getAnnee());
                System.out.println(elev.getAnnee());
                pst1.setFloat(5, elev.getComposition());
                int result1 = pst1.executeUpdate();

                PreparedStatement pst2;
                String requete3 = "insert into evaluation values (?,?,?,?,?)";
                pst2 = con.prepareStatement(requete3);
                pst2.setString(1, elev.getLogin());
                pst2.setString(2, rs0.getString("nomMatiere"));
                pst2.setString(3, "2eme_Composition");
                pst2.setString(4, elev.getAnnee());
                pst2.setFloat(5, elev.getComposition());
                int result2 = pst2.executeUpdate();

                PreparedStatement pst3;
                String requete4 = "insert into evaluation values (?,?,?,?,?)";
                pst3 = con.prepareStatement(requete3);
                pst3.setString(1, elev.getLogin());
                pst3.setString(2, rs0.getString("nomMatiere"));
                pst3.setString(3, "3eme_Composition");
                pst3.setString(4, elev.getAnnee());
                pst3.setFloat(5, elev.getComposition());
                int result3 = pst3.executeUpdate();

            }

            if (result > 0) {
                System.out.println("requete a été bien éxécutée");
                resultat = true;
            } else {

                System.out.println("Erreur de la requete");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;

    }

    public Boolean reinscription(Eleve elev, String annee, String nomClasse) {

        Boolean resultat = false;

        try {
            con = daoFactory.getConnection();

            PreparedStatement pst;
            String requete = "insert into eleve(nomClasse,nom,prenom,adresse,dateNaissance,lieuNaissance,loginEleve,motDePasse,loginParent,annee) values(?,?,?,?,?,?,?,?,?,?)";
            pst = con.prepareStatement(requete);
            pst.setString(1, nomClasse);
            pst.setString(2, elev.getNom());
            pst.setString(3, elev.getPrenom());
            pst.setString(4, elev.getAdresse());
            //pst.setString(5, elev.getTel());
            pst.setString(5, elev.getDateNaissance());
            pst.setString(6, elev.getLieuNaissance());

            pst.setString(7, elev.getLogin());
            pst.setString(8, elev.getMotDePasse());
            pst.setString(9, elev.getLoginParent());
            pst.setString(10, annee);
            int result = pst.executeUpdate();

            PreparedStatement pst0;
            String req = "insert into eleveannesco values(?,?)";
            pst0 = con.prepareStatement(req);
            pst0.setString(1, annee);
            pst0.setString(2, elev.getLogin());
            int result0 = pst0.executeUpdate();

            Statement st0;
            String requ = "select nomMatiere from classematiere where nomClasse = '" + nomClasse + "'";
            st0 = con.createStatement();
            ResultSet rs0 = st0.executeQuery(requ);
            while (rs0.next()) {

                PreparedStatement pst1;

                String requete2 = "insert into evaluation values (?,?,?,?,?)";
                pst1 = con.prepareStatement(requete2);
                pst1.setString(1, elev.getLogin());
                pst1.setString(2, rs0.getString("nomMatiere"));
                pst1.setString(3, "1ère_Composition");
                pst1.setString(4, annee);
                pst1.setFloat(5, elev.getComposition());
                int result1 = pst1.executeUpdate();

                PreparedStatement pst2;
                String requete3 = "insert into evaluation values (?,?,?,?,?)";
                pst2 = con.prepareStatement(requete3);
                pst2.setString(1, elev.getLogin());
                pst2.setString(2, rs0.getString("nomMatiere"));
                pst2.setString(3, "2eme_Composition");
                pst2.setString(4, annee);
                pst2.setFloat(5, elev.getComposition());
                int result2 = pst2.executeUpdate();

                PreparedStatement pst3;
                String requete4 = "insert into evaluation values (?,?,?,?,?)";
                pst3 = con.prepareStatement(requete4);
                pst3.setString(1, elev.getLogin());
                pst3.setString(2, rs0.getString("nomMatiere"));
                pst3.setString(3, "3eme_Composition");
                pst3.setString(4, annee);
                pst3.setFloat(5, elev.getComposition());
                int result3 = pst3.executeUpdate();

            }

            if (result > 0) {
                System.out.println("requete a été bien éxécutée");
                resultat = true;
            } else {

                System.out.println("Erreur de la requete");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return resultat;

    }

    public Eleve reinscriptionEleve(String login) {
        Eleve eleve = null;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select * from eleve where loginEleve = '" + login + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            if (rs.next()) {
                eleve = new Eleve(rs.getString("nomClasse"), rs.getString("nom"), rs.getString("prenom"), rs.getString("adresse"), null, rs.getString("dateNaissance"), rs.getString("lieuNaissance"), rs.getString("annee"), rs.getString("loginEleve"), rs.getString("motDePasse"), rs.getString("loginParent"));

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return eleve;
    }

    public ArrayList<String> listerClasse() {

        ArrayList<String> classes = new ArrayList();
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select * from classe";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                classes.add(rs.getString("nomClasse"));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return classes;
    }

    public ArrayList<Eleve> listerEleve(String nomCl, String an) {

        ArrayList<Eleve> eleves = new ArrayList();
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select elv.login,nom,prenom,adresse,dateNaissance,lieuNaissance,telephone,moyCompo1FR,moyCompo2FR,moyCompo3FR,moyCompo1AR,moyCompo2AR,moyCompo3AR from eleve elv, personne p where elv.login=p.login and nomClasse = '" + nomCl + "' and anneeScolaire = '" + an + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                Eleve el = new Eleve(null, rs.getString("nom"), rs.getString("prenom"), rs.getString("adresse"), rs.getString("telephone"), rs.getString("dateNaissance"), rs.getString("lieuNaissance"), null, rs.getString("login"), null, null);
                el.setMoyCompo1FR(rs.getFloat("MoyCompo1FR"));
                el.setMoyCompo2FR(rs.getFloat("MoyCompo2FR"));
                el.setMoyCompo3FR(rs.getFloat("MoyCompo3FR"));
                el.setMoyCompo1AR(rs.getFloat("MoyCompo1AR"));
                el.setMoyCompo2AR(rs.getFloat("MoyCompo2AR"));
                el.setMoyCompo3AR(rs.getFloat("MoyCompo3AR"));
                eleves.add(el);

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return eleves;
    }

    public void supprimerEleve(String login) {

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst;
            PreparedStatement pst1;
            String requete = "delete from evaluation where loginEleve=?";
            pst = con.prepareStatement(requete);
            pst.setString(1, login);
            pst.executeUpdate();

            String requete1 = "delete from eleve where loginEleve=?";
            pst1 = con.prepareStatement(requete1);
            pst1.setString(1, login);
            int result1 = pst1.executeUpdate();

            if (result1 > 0) {
                System.out.println("la Suppression a bien été bien effectuée");

            } else {

                System.out.println("Erreur de requete");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    public Eleve listerUnEleve(String login) {
        Eleve eleve = null;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select * from eleve where loginEleve = '" + login + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            if (rs.next()) {
                eleve = new Eleve(rs.getString("nomClasse"), rs.getString("nom"), rs.getString("prenom"), rs.getString("adresse"), rs.getString("telephone"), rs.getString("dateNaissance"), rs.getString("lieuNaissance"), null, rs.getString("loginEleve"), rs.getString("motDePasse"), null);

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return eleve;
    }

    public void modifierEleve(Eleve eleve, String idLog) {

        try {
            con = daoFactory.getConnection();
            PreparedStatement pst;
            String requete = "update eleve set nomClasse=? , nom=? , prenom=? , adresse=? ,telephone=?, dateNaissance=? , lieuNaissance=? where loginEleve = '" + idLog + "'";
            pst = con.prepareStatement(requete);
            pst.setString(1, eleve.getNomClasse());
            pst.setString(2, eleve.getNom());
            pst.setString(3, eleve.getPrenom());
            pst.setString(4, eleve.getAdresse());
            pst.setString(5, eleve.getTel());
            pst.setString(6, eleve.getDateNaissance());
            pst.setString(7, eleve.getLieuNaissance());

            int result = pst.executeUpdate();

            PreparedStatement pst1;
            String req = "update eleveannesco set annee=? where loginEleve =?";
            pst1 = con.prepareStatement(req);
            pst1.setString(1, eleve.getAnnee());
            pst1.setString(2, idLog);
            int result1 = pst1.executeUpdate();
            if ((result > 0) && (result1 > 0)) {
                System.out.println("requete a été bien éxécutée");

            } else {
                System.out.println("Erreur de la requete");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Eleve> evaluationEleve(String login, String semestre, String an) {

        ArrayList<Eleve> eleves = new ArrayList();
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select nomMatiere,noteComposition,annee from evaluation where loginEleve = '" + login + "' and semestre = '" + semestre + "' and annee='" + an + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {

                Eleve el = new Eleve(0, 0, rs.getFloat("noteComposition"), rs.getString("nomMatiere"));
                eleves.add(el);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return eleves;

    }

    public String nomClasse(String login, String an) {

        String nomClasse = "";
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select nomClasse from eleve where loginEleve = '" + login + "' and annee='" + an + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                nomClasse = rs.getString("nomClasse");
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return nomClasse;

    }

    public ArrayList<Eleve> listerclasse(String login, String an) {
        ArrayList<Eleve> eleves = new ArrayList();
        String nomClasse = null;
        String annee = null;
        Statement st;
        Statement st1;
        try {
            con = daoFactory.getConnection();
            String requete = "select nomClasse,eleve.annee from eleve,eleveannesco where eleve.loginEleve ='" + login + "' and eleve.loginEleve=eleveannesco.loginEleve and eleve.annee='" + an + "' and eleve.annee=eleveannesco.annee";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            if (rs.next()) {
                nomClasse = rs.getString("nomClasse");
                annee = rs.getString("annee");
                System.out.println(nomClasse);

            }
            String requete1 = "select nom,prenom,adresse,telephone from eleve,eleveannesco ela where nomClasse = '" + nomClasse + "' and ela.annee='" + annee + "' and eleve.loginEleve=ela.loginEleve and eleve.annee=ela.annee order by nom";
            st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery(requete1);
            while (rs1.next()) {
                Eleve el = new Eleve(rs1.getString(1), rs1.getString(2), rs1.getString(3), rs1.getString(4));
                System.out.println(el.getAdresse());
                System.out.println(el.getPrenom());
                eleves.add(el);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return eleves;

    }

    public String maClasse(String login) {

        String nomClasse = null;
        Statement st;

        try {
            con = daoFactory.getConnection();
            String requete = "select nomClasse from eleve where loginEleve = '" + login + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            if (rs.next()) {
                nomClasse = rs.getString("nomClasse");

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return nomClasse;
    }

    public ArrayList<Personne> listerProf(String login, String an) {
        ArrayList<Personne> profs = new ArrayList();
        String[] matieres;
        int i = 0;
        String nomClasse = maClasse(login);
        Statement st;
        Statement st0;
        Personne prof;
        try {
            con = daoFactory.getConnection();
            String requete = "select distinct loginProf,nom,prenom,adresse,tel from personne p, profclasse pc where nomClasse = '" + nomClasse + "' and annee='" + an + "' and pc.idPersonne = p.idPersonne";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                matieres = new String[5];
                System.out.println(rs.getString(1));
                String requete0 = "select nomMatiere from profclasse pc where pc.loginProf='" + rs.getString(1) + "' and pc.nomClasse='" + nomClasse + "' and annee='" + an + "'";
                st0 = con.createStatement();
                ResultSet rs0 = st0.executeQuery(requete0);
                while (rs0.next()) {
                    String k = rs0.getString(1);
                    matieres[i] = k;
                    System.out.println(rs.getString(1));
                    i++;
                }

                prof = new Personne(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), matieres);

                profs.add(prof);

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return profs;

    }

    public String listerAnnee(String login) {

        String annee = null;
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select annee from  eleveannesco where loginEleve ='" + login + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            if (rs.next()) {
                annee = rs.getString(1);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return annee;
    }
    /////

    public ArrayList<String> anneeScolaire(String login) {

        ArrayList<String> annee = new ArrayList();
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select annee from  eleveannesco where loginEleve ='" + login + "'";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                annee.add(rs.getString(1));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return annee;
    }
/////

    public ArrayList<String> listerAnnee() {

        ArrayList<String> annee = new ArrayList();
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = "select anneeScolaire from annee";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                annee.add(rs.getString(1));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return annee;
    }

    public void changepswd(String login, String passwd) {
        try {
            con = daoFactory.getConnection();
            PreparedStatement pst;
            String requete1 = "update eleve set motDePasse=? where loginEleve=?";
            pst = con.prepareStatement(requete1);
            pst.setString(1, passwd);
            pst.setString(2, login);
            int result = pst.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<Eleve> rangerEleve(String nomCl, String an, String semestre, String ens) {
        ArrayList<Eleve> eleves = new ArrayList();
        Statement st;
        try {
            con = daoFactory.getConnection();
            String requete = null;
            if ((semestre.equals("1ère_Composition")) && (ens.equals("Francais"))) {
                requete = "select loginEleve,nom,prenom,adresse,dateNaissance,lieuNaissance,telephone,moyCompo1FR,moyCompo2FR,moyCompo3FR,moyCompo1AR,moyCompo2AR,moyCompo3AR from eleve where nomClasse = '" + nomCl + "' and annee = '" + an + "' order by moyCompo1FR desc";
            } else if ((semestre.equals("2eme_Composition")) && (ens.equals("Francais"))) {
                requete = "select loginEleve,nom,prenom,adresse,dateNaissance,lieuNaissance,telephone,moyCompo1FR,moyCompo2FR,moyCompo3FR,moyCompo1AR,moyCompo2AR,moyCompo3AR from eleve where nomClasse = '" + nomCl + "' and annee = '" + an + "' order by moyCompo2FR desc";
            } else if ((semestre.equals("3eme_Composition")) && (ens.equals("Francais"))) {
                requete = "select loginEleve,nom,prenom,adresse,dateNaissance,lieuNaissance,telephone,moyCompo1FR,moyCompo2FR,moyCompo3FR,moyCompo1AR,moyCompo2AR,moyCompo3AR from eleve where nomClasse = '" + nomCl + "' and annee = '" + an + "' order by moyCompo3FR desc";
            } else if ((semestre.equals("1ère_Composition")) && (ens.equals("Arabe"))) {
                requete = "select loginEleve,nom,prenom,adresse,dateNaissance,lieuNaissance,telephone,moyCompo1FR,moyCompo2FR,moyCompo3FR,moyCompo1AR,moyCompo2AR,moyCompo3AR from eleve where nomClasse = '" + nomCl + "' and annee = '" + an + "' order by moyCompo1AR desc";
            } else if ((semestre.equals("2eme_Composition")) && (ens.equals("Arabe"))) {
                requete = "select loginEleve,nom,prenom,adresse,dateNaissance,lieuNaissance,telephone,moyCompo1FR,moyCompo2FR,moyCompo3FR,moyCompo1AR,moyCompo2AR,moyCompo3AR from eleve where nomClasse = '" + nomCl + "' and annee = '" + an + "' order by moyCompo2AR desc";
            } else {
                requete = "select loginEleve,nom,prenom,adresse,dateNaissance,lieuNaissance,telephone,moyCompo1FR,moyCompo2FR,moyCompo3FR,moyCompo1AR,moyCompo2AR,moyCompo3AR from eleve where nomClasse = '" + nomCl + "' and annee = '" + an + "' order by moyCompo3AR desc";
            }

            st = con.createStatement();
            ResultSet rs = st.executeQuery(requete);
            while (rs.next()) {
                Eleve el = new Eleve(null, rs.getString("nom"), rs.getString("prenom"), rs.getString("adresse"), rs.getString("telephone"), rs.getString("dateNaissance"), rs.getString("lieuNaissance"), null, rs.getString("loginEleve"), null, null);
                el.setMoyCompo1FR(rs.getFloat("MoyCompo1FR"));
                el.setMoyCompo2FR(rs.getFloat("MoyCompo2FR"));
                el.setMoyCompo3FR(rs.getFloat("MoyCompo3FR"));
                el.setMoyCompo1AR(rs.getFloat("MoyCompo1AR"));
                el.setMoyCompo2AR(rs.getFloat("MoyCompo2AR"));
                el.setMoyCompo3AR(rs.getFloat("MoyCompo3AR"));
                eleves.add(el);

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return eleves;
    }
}
