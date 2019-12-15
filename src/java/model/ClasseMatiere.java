/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele.tables;

/**
 *
 * @author Moussa Joseph Sarr
 */
public class ClasseMatiere {
    
    private String classes ;
    private String[] matieres;

    public ClasseMatiere(String classes, String[] matieres) {
        this.classes = classes;
        this.matieres = matieres;
    }

    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    public String[] getMatieres() {
        return matieres;
    }

    public void setMatieres(String[] matieres) {
        this.matieres = matieres;
    }
    
    
    
    
}
