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
public class Parent {

    private String loginParent;
    private String motDePasse;
    private String nom;
    private String prenom;
    private String tel;
    private String profils;
    private int etatPers;
    private String email;

    public Parent() {
    }

    public Parent(String loginParent) {
        this.loginParent = loginParent;
    }
    
    
    
    public Parent(String loginParent, String nom, String prenom,String tel, String motDePasse,String profils,int etatPers,String email) {
        this.loginParent = loginParent;
        this.nom = nom;
        this.prenom = prenom;
        this.tel = tel;
        this.motDePasse = motDePasse;
        this.profils = profils;
        this.etatPers = etatPers;
        this.email = email;
    }
    
    public Parent(String loginParent, String nom, String prenom,String tel, String motDePasse) {
        this.loginParent = loginParent;
        this.nom = nom;
        this.prenom = prenom;
        this.motDePasse = motDePasse;
        
    }

    public String getProfils() {
        return profils;
    }

    public void setProfils(String profils) {
        this.profils = profils;
    }

    public int getEtatPers() {
        return etatPers;
    }

    public void setEtatPers(int etatPers) {
        this.etatPers = etatPers;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    

    public String getLoginParent() {
        return loginParent;
    }

    public void setLoginParent(String loginParent) {
        this.loginParent = loginParent;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
    
}
