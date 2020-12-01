package clases;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Andres
 */
public class Seguridad {
    public static String md5(String clave){
        MessageDigest md5;
        StringBuffer h = null;
        try{
            md5 = MessageDigest.getInstance("MD5");
            
            byte[] b = md5.digest(clave.getBytes());
            
            int size = b.length;
            h = new StringBuffer(size);
            for(int i = 0; i < size; i++){
                int u = b[i] & 255;
                if(u < 16){
                    h.append("0" + Integer.toHexString(u));
                }else{
                    h.append(Integer.toHexString(u));
                }
            }
        }catch(NoSuchAlgorithmException ex){
            Logger.getLogger(Seguridad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return h.toString();
    }
    
}
