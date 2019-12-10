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
public class Utilisateur {

    private String login;
    private String motDePasse;
    private String adresse;
    private String idPersonne;
    private String nom;
    private String prenom;
    private String telephone;
    private String profils;
    private String nomImgPers;

    public String getNomImgPers() {
        return nomImgPers;
    }

    public void setNomImgPers(String nomImgPers) {
        this.nomImgPers = nomImgPers;
    }
    
    
    
    

    public String getProfils() {
        return profils;
    }

    public void setProfils(String profils) {
        this.profils = profils;
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

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getIdPersonne() {
        return idPersonne;
    }

    public void setIdPersonne(String idPersonne) {
        this.idPersonne = idPersonne;
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

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    
    
}
