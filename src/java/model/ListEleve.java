/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ibrah
 */
public class ListEleve {

    private String matriculeEleve;
    private String nom;
    private String prenom;
    private String nomClasse;
    private String adresse;
    private String niveau;
    private String dateEtLieuNaiss;
    private int nbAbsence;
    private String login;
    private String motDePasse;
    private String matiere;
    private String classe;
    private Float devoir1;
    private Float devoir2;
    private String idEvaluation;
    private Float composition;
    private String semestre;
    private String annee;
    private Float moyenne;

    public String getMatriculeEleve() {
        return matriculeEleve;
    }

    public void setMatriculeEleve(String matriculeEleve) {
        this.matriculeEleve = matriculeEleve;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNomClasse() {
        return nomClasse;
    }

    public void setNomClasse(String nomClasse) {
        this.nomClasse = nomClasse;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getNiveau() {
        return niveau;
    }

    public void setNiveau(String niveau) {
        this.niveau = niveau;
    }

    public String getDateEtLieuNaiss() {
        return dateEtLieuNaiss;
    }

    public void setDateEtLieuNaiss(String dateEtLieuNaiss) {
        this.dateEtLieuNaiss = dateEtLieuNaiss;
    }

    public int getNbAbsence() {
        return nbAbsence;
    }

    public void setNbAbsence(int nbAbsence) {
        this.nbAbsence = nbAbsence;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }

    public String getMatiere() {
        return matiere;
    }

    public void setMatiere(String matiere) {
        this.matiere = matiere;
    }

    public String getClasse() {
        return classe;
    }

    public void setClasse(String classe) {
        this.classe = classe;
    }

    public String getIdEvaluation() {
        return idEvaluation;
    }

    public void setIdEvaluation(String idEvaluation) {
        this.idEvaluation = idEvaluation;
    }

    public Float getDevoir1() {
        return devoir1;
    }

    public void setDevoir1(Float devoir1) {
        this.devoir1 = devoir1;
    }

    public Float getDevoir2() {
        return devoir2;
    }

    public void setDevoir2(Float devoir2) {
        this.devoir2 = devoir2;
    }

    public Float getComposition() {
        return composition;
    }

    public void setComposition(Float composition) {
        this.composition = composition;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

    public String getAnnee() {
        return annee;
    }

    public void setAnnee(String annee) {
        this.annee = annee;
    }
    public Float getMoyenne() {
        return (((getDevoir1()+getDevoir2())/2)+getComposition())/2;
    }

    public void setMoyenne(Float moyenne) {
        this.moyenne = moyenne;
    }
}
