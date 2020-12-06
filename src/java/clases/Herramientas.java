package clases;

import java.text.DateFormat;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author Andres
 */
public class Herramientas {

    public static String formatFecha(Date fecha) {
        String date = " ";
        DateFormat formato = DateFormat.getDateInstance(DateFormat.FULL);
        date = formato.format(fecha);
        return date;
    }

    public static String random(int longitud) {
        Random r = new Random();
        String pass = "";
        String dCase = "abcdefghijklmnopqrstuvwyz";
        String uCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String intChar = "0123456789";
        while (pass.length() != longitud) {
            int rPick = r.nextInt(4);
            if (rPick == 0) {
                int spot = r.nextInt(25);
                pass += dCase.charAt(spot);
            } else if (rPick == 1) {
                int spot = r.nextInt(25);
                pass += uCase.charAt(spot);
            } else if (rPick == 3) {
                int spot = r.nextInt(9);
                pass += intChar.charAt(spot);
            }
        }
        return pass;
    }
}
