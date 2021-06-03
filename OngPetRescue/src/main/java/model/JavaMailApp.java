package model;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMailApp
{
    static Session session; //declarar como um atributo de classe e static(global)

      public static void SendEmail(String email) {
            Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); //TLS

             session = Session.getDefaultInstance(props,
                        new javax.mail.Authenticator() {
                            @Override
                             protected PasswordAuthentication getPasswordAuthentication()
                             {
                                   return new PasswordAuthentication("ongrescuepet@gmail.com", "OngRescuePet123");
                             }
                        });

            /** Ativa Debug para sessão */
            session.setDebug(true);

            try {

                  Message message = new MimeMessage(session);
                  message.setFrom(new InternetAddress("ongrescuepet@gmail.com")); //Remetente

                  message.setRecipients(Message.RecipientType.TO,
                                    InternetAddress.parse(email)); //Destinatário(s)
                  message.setSubject("Enviando email com JavaMail");//Assunto
                  message.setText("Enviei este email utilizando JavaMail com minha conta Hotmail!");
                  /**Método para enviar a mensagem criada*/
                  Transport.send(message);

                  System.out.println("Feito!!!");

             } catch (MessagingException e) {
                  throw new RuntimeException(e);
            }
      }
}