/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author ibrah
 */
public class Test {
    public static void main(String[] args) {
//       SimpleDateFormat date= new SimpleDateFormat("dd/MM/yyyy", Locale.FRANCE);
//        System.out.println(date);
        DateFormat df= new SimpleDateFormat("dd/MM/yyyy");
        Date today= Calendar.getInstance().getTime();
        String date= df.format(today);
        System.out.println(date);
    }
    
}
