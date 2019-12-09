/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Collection;
import modelTables.Personne;

/**
 *
 * @author Moussa Joseph Sarr
 */
public class Professeur {
    Personne personne;
    Utilisateur utilisateur;
    String annee;
    String nomMatiere;
    String nomClasse;
    Collection<String> matiere;
    Collection<String> classe;
    Arabe arabe;

    public Professeur(){};
    
    
    public Professeur(Personne personne, Utilisateur utilisateur, Collection<String> matiere, Collection<String> classe) {
        this.personne = personne;
        this.utilisateur = utilisateur;
        this.matiere = matiere;
        this.classe = classe;
    }
    
   
    public Personne getPersonne() {
        return personne;
    }

    public void setPersonne(Personne personne) {
        this.personne = personne;
    }

    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

    public String getAnnee() {
        return annee;
    }

    public void setAnnee(String annee) {
        this.annee = annee;
    }

    public String getNomMatiere() {
        return nomMatiere;
    }

    public void setNomMatiere(String nomMatiere) {
        this.nomMatiere = nomMatiere;
    }

    public String getNomClasse() {
        return nomClasse;
    }

    public void setNomClasse(String nomClasse) {
        this.nomClasse = nomClasse;
    }

    
    public Collection<String> getMatiere() {
        return matiere;
    }

    public void setMatiere(ArrayList<String> matiere) {
        this.matiere = matiere;
    }

    public Collection<String> getClasse() {
        return classe;
    }

    public void setClasse(ArrayList<String> classe) {
        this.classe = classe;
    }

    public Arabe getArabe() {
        return arabe;
    }

    public void setArabe(Arabe arabe) {
        this.arabe = arabe;
    }
    
    
    
    

   

    
    
}
