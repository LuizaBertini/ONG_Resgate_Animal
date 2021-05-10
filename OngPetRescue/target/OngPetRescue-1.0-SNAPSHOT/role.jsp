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

        <h1></h1>
        <div>
            <table class="table">
                <thead class="thead-dark">
                    <tr  align="center">
                        <th colspan="4"><h2>Roles</h2></th>                    
                    </tr>
                </thead>
            </table>  
        </div>
        
        <%if (exceptionMessage != null) {%>
        <div style="color: red"><%= exceptionMessage%></div>
        <%}%>
        <%if (request.getParameter("prepInsert") != null) {%>

        <form>
            <h3 align="center">Inserir Registro</h3>
            <table class="table" style="width: 50%" align="center">
                <th style="width: 50%">    
                    <div class="form-group"> 

                        <div class="input-group mb-3">
                            <div>
                                <span class="input-group-text">Nome:</span>
                            </div>
                            <input class="form-control" type="text" name="nome">
                        </div>    

                        <div class="input-group mb-3">
                            <div>
                                <span class="input-group-text">Descrição:</span> 
                            </div>
                            <input class="form-control" type="text" name="descricao">
                        </div>

                        <input class="btn btn-secondary" type="submit" name="formInsert" value="Inserir">
                        <input class="btn btn-dark" type="submit" name="cancelar" value="Cancelar">

                    </div>
                </th>
            </table>
        </form>

        <%} else if (request.getParameter("prepUpdate") != null) {%>



        <form>
            <h3 align="center">Alterar Registro</h3>
            <table class="table" style="width: 50%" align="center">
                <th style="width: 50%">
                    <div class="form-group">
                        <%String nome = request.getParameter("nome");
                            String descricao = request.getParameter("descricao");
                        %>
                        <input type="hidden" name="nomeAntigo" value="<%= nome%>">

                        <div class="input-group mb-3">
                            <div>
                                <span class="input-group-text">Nome:</span>
                            </div>        
                            <input class="form-control" type="text" name="nome" value="<%= nome%>">
                        </div>  

                        <div class="input-group mb-3">
                            <div>
                                <span class="input-group-text">Descrição:</span>
                            </div>        
                            <input class="form-control" type="text" name="descricao" value="<%= descricao%>">
                        </div>            
                        <input class="btn btn-secondary" type="submit" name="formUpdate" value="Alterar">
                        <input class="btn btn-dark" type="submit" name="cancelar" value="Cancelar">
                    </div>
                </th>
            </table>
        </form>


        <%} else if (request.getParameter("prepDelete") != null) {%>
        <h3 align="center">Deletar Registro</h3>
        <form align="center">
            <%String nome = request.getParameter("nome");%>
            <input type="hidden" name="nome" value="<%= nome%>">
            Excluir o Registro <b><%= nome%></b>?
            <input class="btn btn-secondary" type="submit" name="formDelete" value="Deletar">
            <input class="btn btn-secondary" type="submit" name="cancelar" value="Cancelar">
        </form>
        <br/>
        <%} else {%>
        <form method="post" align="center">
            <input class="btn btn-secondary" type="submit" name="prepInsert" value="Inserir">
        </form>
        <br/>
        <%}%>

        <div class=" table-responsive">
            <table class="table-bordered table-hover" align="center">
                <h3 align="center">Lista</h3>
                <thead>
                    <tr>                   
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Comandos</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (Role u : Role.getList()) {%>
                    <tr>
                        <td><%= u.getNome()%></td>
                        <td><%= u.getDescricao()%></td>
                        <td>
                            <form>
                                <input type="hidden" name="nome" value="<%= u.getNome()%>">
                                <input type="hidden" name="descricao" value="<%= u.getDescricao()%>">
                                <input class="btn btn-secondary" type="submit" name="prepUpdate" value="Alterar">
                                <input class="btn btn-secondary" type="submit" name="prepDelete" value="Excluir">
                            </form>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>

