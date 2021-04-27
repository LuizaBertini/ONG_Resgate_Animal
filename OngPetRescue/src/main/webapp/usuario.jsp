<%-- 
    Document   : usuario
    Created on : 7 de abr. de 2021, 20:17:05
    Author     : uilsa

--%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String exceptionMessage = null;
    if(request.getParameter("cancelar") != null){
            response.sendRedirect(request.getRequestURI());
        
    }
    if(request.getParameter("formInsert") != null){
        try {
            String username = request.getParameter("username");
            String senha = request.getParameter("senha");
            Usuario.Insert(username, senha);
            response.sendRedirect(request.getRequestURI());
            
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        
        }
    }
    if(request.getParameter("formUpdate") != null){
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
            String senha = request.getParameter("senha");
            Usuario.Update(id, username, senha);
            response.sendRedirect(request.getRequestURI());
            
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        
        }
    }
    if(request.getParameter("formDelete") != null){
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario.DeletetList(id);
            response.sendRedirect(request.getRequestURI());
            
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    <body>
            <%@include file="WEB-INF/jspf/header.jspf"%>
            <%@include file="WEB-INF/jspf/style.jspf"%>

            <h2>Usuarios</h2>
            
            <%if(exceptionMessage != null){%>
                <div style="color: red"><%= exceptionMessage%></div>
            <%}%>
            <%if(request.getParameter("prepInsert") != null){%>
                <h3>Inserir Registro</h3>
                <form>
                    Nome: <input type="text" name="username">
                    Senha <input type="text" name="senha">
                    <input type="submit" name="formInsert" value="Inserir">
                    <input type="submit" name="cancelar" value="Cancelar">
                </form>
            <%}else if(request.getParameter("prepUpdate") != null){%>
            <h3>Alterar Registro</h3>
                <form>
                    <%int id = Integer.parseInt(request.getParameter("id"));
                      String senha = request.getParameter("senha");
                      String username = request.getParameter("username");
                    %>                   
                    Username: <input type="text" name="username" value="<%= username%>">
                    Senha: <input type="text" name="senha" value="<%= senha%>">
                    <input type="hidden" name="id" value="<%= id%>">
                    <input type="submit" name="formUpdate" value="Alterar">
                    <input type="submit" name="cancelar" value="Cancelar">
                </form>
            <%}else if(request.getParameter("prepDelete") != null){%>
            <h3>Deletar Registro</h3>
                <form>
                    <%String username = request.getParameter("username");
                    int id = Integer.parseInt(request.getParameter("id"));%>
                    <input type="hidden" name="id" value="<%= id%>">
                    Excluir o Registro <b><%= username%></b>?
                    <input type="submit" name="formDelete" value="Deletar">
                    <input type="submit" name="cancelar" value="Cancelar">
                </form>
             <%}else if(request.getParameter("prepDelete") != null){%>
            <h3>Aprovar Usuário</h3>
                <form>
                    <%String username = request.getParameter("username");%>
                    <input type="hidden" name="username" value="<%= username%>">
                    Deseja aprovar a inscrição do usuario? <b><%= username%></b>?
                    <input type="submit" name="formAprove" value="Aprovar">
                    <input type="submit" name="cancelar" value="Cancelar">
                </form>
            <%}else{%>
                <form method="post">
                    <input type="submit" name="prepInsert" value="Inserir">
                </form>
            <%}%>
            <h3>Lista</h3>
            <table border="1">
                <tr>
                    <th>Id</th>
                    <th>Usuario</th>
                    <th>Senha</th>
                    <th>Comandos</th>
                </tr>
                <%for(Usuario u: Usuario.getList()){%>
                <tr>
                <td><%= u.getId()%></td>
                <td><%= u.getUsername()%></td>
                <td><%= u.getSenha()%></td>
                <td>
                    <form>
                        <input type="hidden" name="id" value="<%= u.getId()%>">
                        <input type="hidden" name="username" value="<%= u.getUsername()%>">
                        <input type="hidden" name="senha" value="<%= u.getSenha()%>">
                        <input type="submit" name="prepUpdate" value="Alterar">
                        <input type="submit" name="prepDelete" value="Excluir">
                        <input type="submit" name="prepAprove" value="Aprovar">
                    </form>
                </td>
                </tr>
                <%}%>
            </table>
        
    </body>
</html>
