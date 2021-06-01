<%-- 
    Document   : registerUser
    Created on : 21 de abr. de 2021, 11:48:38
    Author     : uilsa
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<!DOCTYPE html>
<%
        String ponto = "";
    String exceptionMessage = null;
    if(request.getParameter("cancelar") != null){
            response.sendRedirect("index.jsp");
        
    }
    if(request.getParameter("Cadastrar") != null){
        try {
            exceptionMessage = "aqui";
            String nome = request.getParameter("nome");
            String username = request.getParameter("username");
            String senha = request.getParameter("senha");
            String endereco = request.getParameter("endereco");
            String email = request.getParameter("email");
            String dtnasc = request.getParameter("dtnasc");
            String rg = request.getParameter("rg");
            String cpf = request.getParameter("cpf");
            String telefone = request.getParameter("telefone");
        
           ponto = Usuario.InsertNewUsuario(nome,username, senha, endereco, email, dtnasc, rg, cpf, telefone);
            response.sendRedirect("index.jsp");
            exceptionMessage = "final";
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        
        }
    }
   
    
%>
<html>
    <head>
        <title>Ong Resgate Animal | Cadastro</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/style.jspf"%>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%=ponto%>
        <form>
            <div align="center" class="h-50 p-2" style="background-color: #FFB84B; color: white"> 
            <h2>Ficha de Cadastro</h2>
            </div>
            <br>
           <tr><th  colspan="4"> </th> </tr>
           <table class="table" style="width: 50%" align="center">
             <th style="width: 50%">
            <div class="input-group mb-3"><div ><span class="input-group-text" id="basic-addon1">Nome</span> </div>
            <input type="text" class="form-control" min="4" max="70" name="nome" placeholder="José Oliveira da Silva" aria-describedby="basic-addon1" required> </div>
            <div class="input-group mb-3"><div ><span class="input-group-text" id="basic-addon1">Username</span> </div>
            <input type="text" class="form-control"  min="4" max="10" placeholder="Seu username deverá conter de 4 até 10 caracteres" name="username" aria-describedby="basic-addon1" required> </div>
            <div class="input-group mb-3"><div ><span class="input-group-text" id="basic-addon1">Senha</span> </div>
            <input type="password" class="form-control" placeholder="Sua senha deverá conter de 5 até 20 caracteres" name="senha" min="5" max="20" aria-describedby="basic-addon1" required> </div>
           <div class="input-group mb-3"><div ><span class="input-group-text" id="basic-addon1">Endereço</span> </div>
               <input type="text" class="form-control" name="endereco" placeholder="Rua X 123" aria-describedby="basic-addon1" required></div>
           <div class="input-group mb-3"><div ><span class="input-group-text" id="basic-addon1">Email</span> </div>
               <input type="email" class="form-control" name="email" placeholder="exmpl@exmpl.com" aria-describedby="basic-addon1" required></div>
           <div class="input-group mb-3"><div ><span class="input-group-text" id="basic-addon1">Data de Nascimento</span> </div>
               <input type="Date" class="form-control" min="1900-01-01" max="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>" name="dtnasc" aria-describedby="basic-addon1" required></div>
            <div class="input-group mb-3"><div ><span class="input-group-text" id="basic-addon1">RG</span> </div>
                <input type="number" class="form-control" name="rg" pattern="([0-9]{9})" placeholder="123456789" aria-describedby="basic-addon1" required>
            <div ><span class="input-group-text" id="basic-addon1">CPF</span> </div>
            <input type="number" class="form-control" name="cpf" pattern="([0-9]{11})" placeholder="12345678912" aria-describedby="basic-addon1" required>
            </div>          
           <div class="input-group mb-3"><div ><span class="input-group-text" id="basic-addon1">telefone</span> </div>
            <input type="tel" placeholder="(99) 9999-9999" pattern="(\([0-9]{2}\))\s([9]{1})?([0-9]{4})-([0-9]{4})" class="form-control" name="telefone" aria-describedby="basic-addon1" required></div>
           <input type="submit" class="btn btn-success" name="Cadastrar" value="Cadastrar">
            <input type="submit" class="btn btn-danger" name="cancelar" value="Cancelar">
           
           </form>
        </th>
</table>
           <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
