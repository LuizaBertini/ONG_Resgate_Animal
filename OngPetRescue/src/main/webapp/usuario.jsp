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
    if (request.getParameter("cancelar") != null) {
        response.sendRedirect(request.getRequestURI());

    }
    if (request.getParameter("formInsert") != null) {
        try {
            String username = request.getParameter("username");
            String senha = request.getParameter("senha");
            Usuario.Insert(username, senha);
            response.sendRedirect(request.getRequestURI());

        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();

        }
    }
    if (request.getParameter("formUpdate") != null) {
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
    if (request.getParameter("formDelete") != null) {
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

        <h1></h1>
        <div>
            <table class="table">
                <thead class="thead-dark">
                    <tr  align="center">
                        <th colspan="4"><h2>Usuarios</h2></th>                    
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
                            <input class="form-control" type="text" name="username">
                        </div>    

                        <div class="input-group mb-3">
                            <div>
                                <span class="input-group-text">Senha:</span> 
                            </div>
                            <input class="form-control" type="text" name="senha">
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
                        <%int id = Integer.parseInt(request.getParameter("id"));
                            String senha = request.getParameter("senha");
                            String username = request.getParameter("username");
                        %>                   
                        <div class="input-group mb-3">
                            <div>
                                <span class="input-group-text">Username:</span> 
                            </div>    
                            <input class="form-control" type="text" name="username" value="<%= username%>">
                        </div>
                        <div class="input-group mb-3">
                            <div>
                                <span class="input-group-text">Senha:</span>
                            </div>  
                                <input class="form-control" type="text" name="senha" value="<%= senha%>">
                            </div>
                        <input type="hidden" name="id" value="<%= id%>">
                        <input class="btn btn-secondary" type="submit" name="formUpdate" value="Alterar">
                        <input class="btn btn-dark" type="submit" name="cancelar" value="Cancelar">
                    </div>
                </th>
            </table>
        </form>
        <%} else if (request.getParameter("prepDelete") != null) {%>
        <h3 align="center">Deletar Registro</h3>
        <form align="center">
            <%String username = request.getParameter("username");
                int id = Integer.parseInt(request.getParameter("id"));%>
            <input type="hidden" name="id" value="<%= id%>">
            Excluir o Registro <b><%= username%></b>?
            <input class="btn btn-secondary" type="submit" name="formDelete" value="Deletar">
            <input class="btn btn-dark" type="submit" name="cancelar" value="Cancelar">
        </form>
        <%} else if (request.getParameter("prepAprove") != null) {%>
        <h3 align="center">Aprovar Usuário</h3>
        <form align="center">
            <%String username = request.getParameter("username");%>
            <input type="hidden" name="username" value="<%= username%>">
            Deseja aprovar a inscrição do usuario? <b><%= username%></b>?
            <input class="btn btn-secondary" type="submit" name="formAprove" value="Aprovar">
            <input class="btn btn-dark" type="submit" name="cancelar" value="Cancelar">
        </form>
        <%} else {%>
        <form method="post" align="center">
            <input class="btn btn-secondary" type="submit" name="prepInsert" value="Inserir">
        </form>
        <%}%>
        <br/>
        <h3 align="center">Lista</h3>
        <div class="table-responsive">
        <table class="table-bordered table-hover" align="center">
            <thead>
            <tr>
                <th>Id</th>
                <th>Usuario</th>
                <th>Senha</th>
                <th>Comandos</th>
            </tr>
            </thead>
            <tbody>
            <%for (Usuario u : Usuario.getList()) {%>
            <tr>
                <td><%= u.getId()%></td>
                <td><%= u.getUsername()%></td>
                <td><%= u.getSenha()%></td>
                <td>
                    <form>
                        <input type="hidden" name="id" value="<%= u.getId()%>">
                        <input type="hidden" name="username" value="<%= u.getUsername()%>">
                        <input type="hidden" name="senha" value="<%= u.getSenha()%>">
                        <input class="btn btn-secondary" type="submit" name="prepUpdate" value="Alterar">
                        <input class="btn btn-secondary" type="submit" name="prepDelete" value="Excluir">
                        <input class="btn btn-secondary" type="submit" name="prepAprove" value="Aprovar">
                    </form>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
        <div>
    </body>
</html>
