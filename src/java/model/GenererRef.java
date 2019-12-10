package model;

import java.util.Random;

public class GenererRef {

    String tab[] = new String[5];
    String chaineRef = "";
    String extension = "";
    String contenu = "";

    public String genererRef() {
        Random rd = new Random();

        for (int i = 0; i < 5; i++) {
            tab[i] = "" + rd.nextInt(5);
            chaineRef += tab[i];
        }
        return chaineRef;
    }

    public String genererRefId() {
        Random rd = new Random();

        for (int i = 9000; i < 12000; i++) {
            contenu = "" + rd.nextInt(12000);
            chaineRef = contenu;
        }
        return chaineRef;
    }

    public String genererNbre() {
        Random rd = new Random();

        for (int i = 1; i < 100; i++) {
            contenu = "" + rd.nextInt(100);
            chaineRef = contenu;
        }
        return chaineRef;
    }

}
