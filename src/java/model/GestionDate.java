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
public class GestionDate {
    
    public String formatDate(String date){
        String date1 = "";
        date.replace("-", "/");
        //char[] tab = date.toCharArray();                      
        return "";
    }
    public String formatJour(int numero){
        String jour ="";
        if (numero == 0) {
            jour = "Lundi";
        }
        if (numero == 1) {
            jour = "Mardi";
        }
        if (numero == 2) {
            jour = "Mercredi";
        }
        if (numero == 3) {
            jour = "Jeudi";
        }
        if (numero == 4) {
            jour = "Vendredi";
        }
        if (numero == 5) {
            jour = "Samedi";
        }
        return jour;
    }
    
    public int numeroJour(String jour){
        int num = -1;
        if (jour.equalsIgnoreCase("Lundi")) {
            num = 0;
        }
        if (jour.equalsIgnoreCase("Mardi")) {
            num = 1;
        }
        if (jour.equalsIgnoreCase("Mercredi")) {
            num = 2;
        }
        if (jour.equalsIgnoreCase("Jeudi")) {
            num = 3;
        }
        if (jour.equalsIgnoreCase("Vendredi")) {
            num = 4;
        }
        if (jour.equalsIgnoreCase("Samedi")) {
            num = 5;
        }
        return num;
    }
    
    public int numeroHeure(String heure){        
        int num = -1;
        if (heure.equalsIgnoreCase("8h-10h")) {
            num = 0;
        }
        if (heure.equalsIgnoreCase("10h-12h")) {
            num = 1;
        }
        if (heure.equalsIgnoreCase("13h-15h")) {
            num = 2;
        }
        if (heure.equalsIgnoreCase("15h-17h")) {
            num = 3;
        }
       
        return num;
    }
}
