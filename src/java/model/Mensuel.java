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
    private String statutMensuel;
    private String mois;
    private String nomClasse;

    public Mensuel() {
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
