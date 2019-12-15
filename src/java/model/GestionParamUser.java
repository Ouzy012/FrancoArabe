/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Random;

/**
 *
 * @author Ouzy NDIAYE
 */
public class GestionParamUser {

    public List<Mensuel> listerMois() {
        List<Mensuel> list = new ArrayList<>();
        Mensuel m;
        m = new Mensuel();   
        list.add(new Mensuel("Octobre"));
        list.add(new Mensuel("Novembre"));
        list.add(new Mensuel("Decembre"));
        list.add(new Mensuel("Janvier"));
        list.add(new Mensuel("Fevrier"));
        list.add(new Mensuel("Mars"));
        list.add(new Mensuel("Avril"));
        list.add(new Mensuel("Mai"));
        list.add(new Mensuel("Juin"));
        list.add(new Mensuel("Juillet"));
        return list;
    }
    public int genererIdInscrip() {
        int idIscrip;
        String jour = new SimpleDateFormat("MM", Locale.FRANCE).format(Calendar.getInstance().getTime());
        String numGenerer = "";
        Random rd = new Random();
        for (int i = 0; i < 4; i++) {
            numGenerer += rd.nextInt(10);
        }
        String annee = new SimpleDateFormat("yyyy", Locale.FRANCE).format(Calendar.getInstance().getTime());
        idIscrip = Integer.parseInt(jour.concat(numGenerer).concat(annee.substring(2, annee.length())));
        return idIscrip;
    }    

    public String genererChiffre() {
        String chaine = "";
        Random rd = new Random();
        for (int i = 0; i < 5; i++) {
            chaine += rd.nextInt(10);
        }
        return chaine;
    }

    public String genererLogin(String nom, String prenom) {
        GestionParamUser gp = new GestionParamUser();
        String login = "";
        if (nom.length() <= 2) {
            login += nom + prenom.substring(0, 2) + gp.genererChiffre();
        } else {
            login += nom.substring(0, 2) + prenom.substring(0, 2) + gp.genererChiffre();
        }
        return login.toUpperCase();
    }

    public String genererMdp() {
        String mdp = "";
        int taille = 6;
        Random rd = new Random();
        do {
            int s = rd.nextInt(123);
            if ((s >= 0 && s <= 47) || (s >= 58 && s <= 64) || (s >= 91 && s <= 96)) {
                continue;
            } else {
                mdp += (char) s;
            }
        } while (mdp.length() < taille);
        return mdp;
    }
}
