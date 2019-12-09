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
        list.add(new Mensuel("Octocre"));
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
}
