<%-- 
    Document   : role
    Created on : 20 de abr. de 2021, 18:39:56
    Author     : uilsa
--%>
<%@page import="model.Role"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String exceptionMessage = null;
    if (request.getParameter("cancelar") != null) {
        response.sendRedirect(request.getRequestURI());
    }
    if (request.getParameter("formInsert") != null) {
        try {
            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");
            Role.InsertList(nome, descricao);
            response.sendRedirect(request.getRequestURI());

        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();

        }
    }
    if (request.getParameter("formUpdate") != null) {
        try {
            String nomeAntigo = request.getParameter("nomeAntigo");
            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");
            Role.UpdateList(nomeAntigo, nome, descricao);
            response.sendRedirect(request.getRequestURI());

        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();

        }
    }
    if (request.getParameter("formDelete") != null) {
        try {
            String nome = request.getParameter("nome");
            Role.DeleteList(nome);
            response.sendRedirect(request.getRequestURI());

        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();

        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Roles</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%@include file="WEB-INF/jspf/style.jspf"%>
        <h2>Roles</h2>

        <%if (exceptionMessage != null) {%>
        <div style="color: red"><%= exceptionMessage%></div>
        <%}%>
        <%if (request.getParameter("prepInsert") != null) {%>
        <h3>Inserir Registro</h3>
        <form>
            Nome: <input type="text" name="nome">
            Descrição: <input type="text" name="descricao">
            <input type="submit" name="formInsert" value="Inserir">
            <input type="submit" name="cancelar" value="Cancelar">
        </form>
        <%} else if (request.getParameter("prepUpdate") != null) {%>
        <h3>Alterar Registro</h3>
        <form>
            <%String nome = request.getParameter("nome");
                String descricao = request.getParameter("descricao");
            %>
            <input type="hidden" name="nomeAntigo" value="<%= nome%>">
            Nome: <input type="text" name="nome" value="<%= nome%>">
            Descrição: <input type="text" name="descricao" value="<%= descricao%>">
            <input type="submit" name="formUpdate" value="Alterar">
            <input type="submit" name="cancelar" value="Cancelar">
        </form>
        <%} else if (request.getParameter("prepDelete") != null) {%>
        <h3>Deletar Registro</h3>
        <form>
            <%String nome = request.getParameter("nome");%>
            <input type="hidden" name="nome" value="<%= nome%>">
            Excluir o Registro <b><%= nome%></b>?
            <input type="submit" name="formDelete" value="Deletar">
            <input type="submit" name="cancelar" value="Cancelar">
        </form>
        <%} else {%>
        <form method="post">
            <input type="submit" name="prepInsert" value="Inserir">
        </form>
        <%}%>
        <h3>Lista</h3>
        <table border="1">
            <tr>                   
                <th>Nome</th>
                <th>Descrição</th>
                <th>Comandos</th>
            </tr>
            <%for (Role u : Role.getList()) {%>
            <tr>
                <td><%= u.getNome()%></td>
                <td><%= u.getDescricao()%></td>
                <td>
                    <form>
                        <input type="hidden" name="nome" value="<%= u.getNome()%>">
                        <input type="hidden" name="descricao" value="<%= u.getDescricao()%>">
                        <input type="submit" name="prepUpdate" value="Alterar">
                        <input type="submit" name="prepDelete" value="Excluir">
                    </form>
                </td>
            </tr>
            <%}%>
        </table>

    </body>
</html>

