/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Moussa Joseph Sarr
 */
public class Bulletin {

    private String prenom;
    private String nom;
    private String annee;
    private String semestre;
    private String login;
    private String moyenne;
    private String nbreEleve;
    private String dateNaissance;
    private String lieuNaissance;
    private String nomClasse;
    private ArrayList<Evaluation> evaluation;
    private int totalCoef;
    private float totalMoyenne;
    private float moyenneGenerale;
    private int absences;
    private int retards;
    private int rang;
    private float moyCompo1FR;
    private float moyCompo2FR;
    private float moyCompo3FR;
    private float moyCompo1AR;
    private float moyCompo2AR;
    private float moyCompo3AR;
    private String ens;
    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getAnnee() {
        return annee;
    }

    public void setAnnee(String annee) {
        this.annee = annee;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getMoyenne() {
        return moyenne;
    }

    public void setMoyenne(String moyenne) {
        this.moyenne = moyenne;
    }

    public String getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(String dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public String getLieuNaissance() {
        return lieuNaissance;
    }

    public void setLieuNaissance(String lieuNaissance) {
        this.lieuNaissance = lieuNaissance;
    }

    public String getNomClasse() {
        return nomClasse;
    }

    public void setNomClasse(String nomClasse) {
        this.nomClasse = nomClasse;
    }

    public ArrayList<Evaluation> getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(ArrayList<Evaluation> evaluation) {
        this.evaluation = evaluation;
    }

    public String getNbreEleve() {
        return nbreEleve;
    }

    public void setNbreEleve(String nbreEleve) {
        this.nbreEleve = nbreEleve;
    }

    public int getTotalCoef() {
        return totalCoef;
    }

    public void setTotalCoef(int totalCoef) {
        this.totalCoef = totalCoef;
    }

    public float getTotalMoyenne() {
        return totalMoyenne;
    }

    public void setTotalMoyenne(float totalMoyenne) {
        this.totalMoyenne = totalMoyenne;
    }

    public float getMoyenneGenerale() {
        return moyenneGenerale;
    }

    public void setMoyenneGenerale(float moyenneGenerale) {
        this.moyenneGenerale = moyenneGenerale;
    }

    public int getAbsences() {
        return absences;
    }

    public void setAbsences(int absences) {
        this.absences = absences;
    }

    public int getRetards() {
        return retards;
    }

    public void setRetards(int retards) {
        this.retards = retards;
    }

    public int getRang() {
        return rang;
    }

    public void setRang(int rang) {
        this.rang = rang;
    }

    public float getMoyCompo1FR() {
        return moyCompo1FR;
    }

    public void setMoyCompo1FR(float moyCompo1FR) {
        this.moyCompo1FR = moyCompo1FR;
    }

    public float getMoyCompo2FR() {
        return moyCompo2FR;
    }

    public void setMoyCompo2FR(float moyCompo2FR) {
        this.moyCompo2FR = moyCompo2FR;
    }

    public float getMoyCompo3FR() {
        return moyCompo3FR;
    }

    public void setMoyCompo3FR(float moyCompo3FR) {
        this.moyCompo3FR = moyCompo3FR;
    }

    public float getMoyCompo1AR() {
        return moyCompo1AR;
    }

    public void setMoyCompo1AR(float moyCompo1AR) {
        this.moyCompo1AR = moyCompo1AR;
    }

    public float getMoyCompo2AR() {
        return moyCompo2AR;
    }

    public void setMoyCompo2AR(float moyCompo2AR) {
        this.moyCompo2AR = moyCompo2AR;
    }

    public float getMoyCompo3AR() {
        return moyCompo3AR;
    }

    public void setMoyCompo3AR(float moyCompo3AR) {
        this.moyCompo3AR = moyCompo3AR;
    }

    public String getEns() {
        return ens;
    }

    public void setEns(String ens) {
        this.ens = ens;
    }

    @Override
    public String toString() {
        return "Bulletin{" + "prenom=" + prenom + ", nom=" + nom + ", annee=" + annee + ", semestre=" + semestre + ", login=" + login + ", moyenne=" + moyenne + ", nbreEleve=" + nbreEleve + ", dateNaissance=" + dateNaissance + ", lieuNaissance=" + lieuNaissance + ", nomClasse=" + nomClasse + ", evaluation=" + evaluation + ", totalCoef=" + totalCoef + ", totalMoyenne=" + totalMoyenne + ", moyenneGenerale=" + moyenneGenerale + ", absences=" + absences + ", retards=" + retards + ", rang=" + rang + ", moyCompo1FR=" + moyCompo1FR + ", moyCompo2FR=" + moyCompo2FR + ", moyCompo3FR=" + moyCompo3FR + ", moyCompo1AR=" + moyCompo1AR + ", moyCompo2AR=" + moyCompo2AR + ", moyCompo3AR=" + moyCompo3AR + ", ens=" + ens + '}';
    }
    
   
   
   
    
}
