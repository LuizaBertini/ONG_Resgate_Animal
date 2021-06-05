<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page import="model.JavaMailApp"%>
<%
   String result="";
   String etapa = "0 - ";   
   if(request.getParameter("envio")!= null){
   try {
        String email = request.getParameter("email");
            JavaMailApp lmail = new JavaMailApp();
            lmail.SendEmailCadastro(email);
            result="Enviado com sucesso";
   } catch (Exception mex) {
      mex.printStackTrace();
      result = etapa+mex.getMessage();
   }
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
      
   <form method="POST" align="center">
       <span>email:</span>
       <input type="email" name="email">
       <input type="submit" name="envio">
   </form>
   
      <p align = "center">
         <% 
            out.println("Result: " + result + "\n");
         %>
      </p>
   </body>
</html>