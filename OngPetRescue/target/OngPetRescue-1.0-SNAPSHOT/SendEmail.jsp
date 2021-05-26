<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page import="model.JavaMailApp"%>
<%
   String result="";
   String etapa = "0 - ";   

   try {
      
            JavaMailApp lmail = new JavaMailApp();
            //mail.sendMail("ongrescuepet@gmail.com", "uilsantos09@hotmail.com", "TESTE JAVAMAIL", "TESTE");
       lmail.SendEmail();
   } catch (Exception mex) {
      mex.printStackTrace();
      result = etapa+mex.getMessage();
   }
%>

<html>
   <head>
      <title>Send Email using JSP</title>
   </head>
   
   <body>
      <center>
         <h1>Send Email using JSP</h1>
      </center>
      
      <p align = "center">
         <% 
            out.println("Result: " + result + "\n");
         %>
      </p>
   </body>
</html>