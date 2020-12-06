package clases;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import clases.Herramientas;
import clases.Seguridad;
/**
 *
 * @author Andres
 */
public class JavaMail {

    public static void enviarMail(String destinatario, String asunto, String texto) {

        Properties props = System.getProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.port", "587");

        Session session = Session.getDefaultInstance(props);
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("registropagospf@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            message.setSubject(asunto);
            message.setText(texto, "UTF-8", "html");
            Transport t = session.getTransport("smtp");
            t.connect("registropagospf@gmail.com", "D105n03x1573");
            t.sendMessage(message, message.getAllRecipients());
            t.close();
            System.out.println("Sent message successfully....");
        } catch (MessagingException ex) {
            System.out.println(ex);
        }

    }
    /*
    public static void main(String[] args) {

        String pass = Seguridad.md5(Herramientas.random(6));
        
        String destinatario = "sammaeldn3@gmail.com";
        String asunto = "Puto perro";
        String texto = "puto perroo: "+pass+"";

        JavaMail.enviarMail(destinatario, asunto, texto);
    }*/

}
