/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Ouzy NDIAYE
 */
public class Mensuel {

    private String loginElv;
    private String anneeScolaire;
    private int statut;
    private String dateMensuel;
    private String mois;
    private int montant;
    private int reliquat;
    private String nomClasse;
    private String statutMensuel;

    public Mensuel() {
    }

    public Mensuel(String loginElv, String anneeScolaire, int statut, String dateMensuel, String mois, int montant, int reliquat) {
        this.loginElv = loginElv;
        this.anneeScolaire = anneeScolaire;
        this.statut = statut;
        this.dateMensuel = dateMensuel;
        this.mois = mois;
        this.montant = montant;
        this.reliquat = reliquat;
    }

    

    

    public int getStatut() {
        return statut;
    }

    public void setStatut(int statut) {
        this.statut = statut;
    }
    
    

    
    public Mensuel(String mois) {
        this.mois = mois;
    }

    
    public Mensuel(String loginElv, String anneeScolaire, String statutMensuel, String nomClasse) {
        this.loginElv = loginElv;
        this.anneeScolaire = anneeScolaire;
        this.statutMensuel = statutMensuel;
        this.nomClasse = nomClasse;
    }

    public String getDateMensuel() {
        return dateMensuel;
    }

    public void setDateMensuel(String dateMensuel) {
        this.dateMensuel = dateMensuel;
    }

    
    public int getMontant() {
        return montant;
    }

    public void setMontant(int montant) {
        this.montant = montant;
    }

    public int getReliquat() {
        return reliquat;
    }

    public void setReliquat(int reliquat) {
        this.reliquat = reliquat;
    }

   

    

    public String getNomClasse() {
        return nomClasse;
    }

    public void setNomClasse(String nomClasse) {
        this.nomClasse = nomClasse;
    }

    
    public String getLoginElv() {
        return loginElv;
    }

    public void setLoginElv(String loginElv) {
        this.loginElv = loginElv;
    }

    public String getAnneeScolaire() {
        return anneeScolaire;
    }

    public void setAnneeScolaire(String anneeScolaire) {
        this.anneeScolaire = anneeScolaire;
    }

    public String getStatutMensuel() {
        return statutMensuel;
    }

    public void setStatutMensuel(String statutMensuel) {
        this.statutMensuel = statutMensuel;
    }


    public String getMois() {
        return mois;
    }

    public void setMois(String mois) {
        this.mois = mois;
    }


}
