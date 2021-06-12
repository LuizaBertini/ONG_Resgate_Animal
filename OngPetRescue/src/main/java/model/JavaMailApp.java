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

      public static void SendEmailCadastro(String email) {
            Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", "587");
        props.put("mail.smtp.socketFactory.fallback", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");
        props.put("mail.smtp.ssl.enable", "false");
        
        
        props.put("mail.smtp.starttls.port", "587");
        props.put("mail.smtp.ssl.port", "465");
        
        props.put("mail.smtp.starttls.enable", "true"); //TLS
        props.put("mail.username", "ongrescuepet@gmail.com"); //TLS
        props.put("mail.password", "OngRescuePet123"); //TLS
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
                  message.setSubject("Cadastro | ONG Pet Rescue");//Assunto
                  message.setText("Muito obrigado por se cadastrar em nosso site!!\n"
                                 + "Aguarde a confirma��o de sua conta para come�ar a usar!!!\n"
                                 + "https://ongresgateanimal.herokuapp.com/\n");
                  /**Método para enviar a mensagem criada*/
                  Transport.send(message);

                  System.out.println("Feito!!!");

             } catch (MessagingException e) {
                  throw new RuntimeException(e);
            }
      }
      public static void SendEmailAprovacao(String email) {
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
                  message.setSubject("Aprova��o da sua conta | ONG Pet Rescue");//Assunto
                  message.setText("Parab�ns sua conta foi aprovada!!!\n"
                                 + "Agora voc� est� habilitado para usar nosso site!!!\n"
                                 + "https://ongresgateanimal.herokuapp.com/\n");
                  /**Método para enviar a mensagem criada*/
                  Transport.send(message);

                  System.out.println("Feito!!!");

             } catch (MessagingException e) {
                  throw new RuntimeException(e);
            }
      }
      public static void SendEmailPedidoAdocao(String email) {
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
                  message.setSubject("Pedido de ado��o | ONG Pet Rescue");//Assunto
                  message.setText("Seu pedido de ado��o foi registrado!!!\n"
                                 + "Agora � s� esperar a an�lise de seu pedido, e se tudo der certo ser� aprovado!!!\n"
                                 + "https://ongresgateanimal.herokuapp.com/\n");
                  /**Método para enviar a mensagem criada*/
                  Transport.send(message);

                  System.out.println("Feito!!!");

             } catch (MessagingException e) {
                  throw new RuntimeException(e);
            }
      }
      public static void SendEmailAprovacaoA(String email) {
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
                  message.setSubject("Aprova��o de ado��o | ONG Pet Rescue");//Assunto
                  message.setText("Parab�ns seu pedido de ado��o foi APROVADO!!!\n"
                                 + "Agora iremos entrar em contato para o encontro de voc� com seu novo(a) Amigo(a)!!!\n"
                                 + "https://ongresgateanimal.herokuapp.com/\n");
                  /**Método para enviar a mensagem criada*/
                  Transport.send(message);

                  System.out.println("Feito!!!");

             } catch (MessagingException e) {
                  throw new RuntimeException(e);
            }
      }
      public static void SendEmailReprovacaoA(String email) {
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
                  message.setSubject("Pedido de ado��o Reprovado | ONG Pet Rescue");//Assunto
                  message.setText("Infelizmente seu pedido de ado��o foi Reprovado!!!\n"
                                 + "Alguns requerimentos foram de acordo com as pol�ticas da ONG!!!\n"
                                 + "https://ongresgateanimal.herokuapp.com/\n");
                  /**Método para enviar a mensagem criada*/
                  Transport.send(message);

                  System.out.println("Feito!!!");

             } catch (MessagingException e) {
                  throw new RuntimeException(e);
            }
      }
      public static void SendEmailAlterarSenha(String email) {
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
                  message.setSubject("Altera��o na senha | ONG Pet Rescue");//Assunto
                  message.setText("Recebemos um comando de altera��o de sua senha de seu usu�rio!!!\n"
                                 + "https://ongresgateanimal.herokuapp.com/\n");
                  /**Método para enviar a mensagem criada*/
                  Transport.send(message);

                  System.out.println("Feito!!!");

             } catch (MessagingException e) {
                  throw new RuntimeException(e);
            }
      }
}