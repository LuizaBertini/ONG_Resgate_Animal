<%@page import="model.SendEmail"%>
<%@page import="web.dbListener"%>
<%@page import="model.Usuario"%>
<%@page import="model.Role"%>
<%@page import="model.Animal"%>
<%@page import="model.Teste"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     String Erro ="";
if (request.getParameter("EnviaEmail") != null) {
   
    try{
       SendEmail mail = new SendEmail();       
        mail.sendMail("ongrescuepet@gmail.com", "uilsantos09@hotmail.com", "TESTE JAVAMAIL", "TESTE");
    }catch(Exception ex){
            Erro =  ex.toString();}
}


%>
<h1><%=Erro %></h1>
<html>
    <head>
        <title>ONG</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    </head>
    <%@include file="WEB-INF/jspf/style.jspf"%>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <div align="center" class="container">
            <div class="col-md-auto">
                <%--<img class="img-fluid" src="imgs/animal.jpg">--%>
                <%@include file="WEB-INF/jspf/galeriaanimais.jspf"%>
                <h3>
                    O site ainda esta em construção
                    <br>
                    Aguarde por novidades ;)
                </h3>
            </div>
        </div>
        <% 
        Teste d = new Teste();       
        %>
         <h4><%= d.getTeste()%> </h4>
         <form align="center">              
               <input class="btn btn-secondary" type="submit" name="EnviaEmail" value="Enviar Email">           
        </form>
</html>