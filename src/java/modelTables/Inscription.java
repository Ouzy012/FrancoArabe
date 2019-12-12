/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelTables;

/**
 *
 * @author Ouzy NDIAYE
 */
public class Inscription {
    private int idInscription;
    private String dateInscription;
    private int status;
    private int montant;
    private  int reliquat;

    public Inscription(int idInscription, String dateInscription, int status, int montant,int reliquat) {
        this.idInscription = idInscription;
        this.dateInscription = dateInscription;
        this.status = status;
        this.montant = montant;
        this.reliquat = reliquat;
    }

    public int getReliquat() {
        return reliquat;
    }

    public void setReliquat(int reliquat) {
        this.reliquat = reliquat;
    }

    public int getIdInscription() {
        return idInscription;
    }

    public void setIdInscription(int idInscription) {
        this.idInscription = idInscription;
    }

    
    

    public String getDateInscription() {
        return dateInscription;
    }

    public void setDateInscription(String dateInscription) {
        this.dateInscription = dateInscription;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getMontant() {
        return montant;
    }

    public void setMontant(int montant) {
        this.montant = montant;
    }
    
    
}
