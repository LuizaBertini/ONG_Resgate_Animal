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

            /** Ativa Debug para sessÃ£o */
            session.setDebug(true);

            try {

                  Message message = new MimeMessage(session);
                  message.setFrom(new InternetAddress("ongrescuepet@gmail.com")); //Remetente

                  message.setRecipients(Message.RecipientType.TO,
                                    InternetAddress.parse(email)); //DestinatÃ¡rio(s)
                  message.setSubject("Cadastro | ONG Pet Rescue");//Assunto
                  message.setText("Muito obrigado por se cadastrar em nosso site!!\n"
                                 + "Aguarde a confirmação de sua conta para começar a usar!!!\n"
                                 + "https://ongresgateanimal.herokuapp.com/\n");
                  /**MÃ©todo para enviar a mensagem criada*/
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

            /** Ativa Debug para sessÃ£o */
            session.setDebug(true);

            try {

                  Message message = new MimeMessage(session);
                  message.setFrom(new InternetAddress("ongrescuepet@gmail.com")); //Remetente

                  message.setRecipients(Message.RecipientType.TO,
                                    InternetAddress.parse(email)); //DestinatÃ¡rio(s)
                  message.setSubject("Aprovação da sua conta | ONG Pet Rescue");//Assunto
                  message.setText("Parabéns sua conta foi aprovada!!!\n"
                                 + "Agora você está habilitado para usar nosso site!!!\n"
                                 + "https://ongresgateanimal.herokuapp.com/\n");
                  /**MÃ©todo para enviar a mensagem criada*/
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

            /** Ativa Debug para sessÃ£o */
            session.setDebug(true);

            try {

                  Message message = new MimeMessage(session);
                  message.setFrom(new InternetAddress("ongrescuepet@gmail.com")); //Remetente

                  message.setRecipients(Message.RecipientType.TO,
                                    InternetAddress.parse(email)); //DestinatÃ¡rio(s)
                  message.setSubject("Pedido de adoção | ONG Pet Rescue");//Assunto
                  message.setText("Seu pedido de adoção foi registrado!!!\n"
                                 + "Agora é só esperar a análise de seu pedido, e se tudo der certo será aprovado!!!\n"
                                 + "https://ongresgateanimal.herokuapp.com/\n");
                  /**MÃ©todo para enviar a mensagem criada*/
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

            /** Ativa Debug para sessÃ£o */
            session.setDebug(true);

            try {

                  Message message = new MimeMessage(session);
                  message.setFrom(new InternetAddress("ongrescuepet@gmail.com")); //Remetente

                  message.setRecipients(Message.RecipientType.TO,
                                    InternetAddress.parse(email)); //DestinatÃ¡rio(s)
                  message.setSubject("Aprovação de adoção | ONG Pet Rescue");//Assunto
                  message.setText("Parabéns seu pedido de adoção foi APROVADO!!!\n"
                                 + "Agora iremos entrar em contato para o encontro de você com seu novo(a) Amigo(a)!!!\n"
                                 + "https://ongresgateanimal.herokuapp.com/\n");
                  /**MÃ©todo para enviar a mensagem criada*/
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

            /** Ativa Debug para sessÃ£o */
            session.setDebug(true);

            try {

                  Message message = new MimeMessage(session);
                  message.setFrom(new InternetAddress("ongrescuepet@gmail.com")); //Remetente

                  message.setRecipients(Message.RecipientType.TO,
                                    InternetAddress.parse(email)); //DestinatÃ¡rio(s)
                  message.setSubject("Pedido de adoção Reprovado | ONG Pet Rescue");//Assunto
                  message.setText("Infelizmente seu pedido de adoção foi Reprovado!!!\n"
                                 + "Alguns requerimentos foram de acordo com as políticas da ONG!!!\n"
                                 + "https://ongresgateanimal.herokuapp.com/\n");
                  /**MÃ©todo para enviar a mensagem criada*/
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

            /** Ativa Debug para sessÃ£o */
            session.setDebug(true);

            try {

                  Message message = new MimeMessage(session);
                  message.setFrom(new InternetAddress("ongrescuepet@gmail.com")); //Remetente

                  message.setRecipients(Message.RecipientType.TO,
                                    InternetAddress.parse(email)); //DestinatÃ¡rio(s)
                  message.setSubject("Alteração na senha | ONG Pet Rescue");//Assunto
                  message.setText("Recebemos um comando de alteração de sua senha de seu usuário!!!\n"
                                 + "https://ongresgateanimal.herokuapp.com/\n");
                  /**MÃ©todo para enviar a mensagem criada*/
                  Transport.send(message);

                  System.out.println("Feito!!!");

             } catch (MessagingException e) {
                  throw new RuntimeException(e);
            }
      }
}