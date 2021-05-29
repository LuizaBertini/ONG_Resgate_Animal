<%-- 
    Document   : usuario
    Created on : 7 de abr. de 2021, 20:17:05
    Author     : uilsa

--%>
<%@page import="model.Adotados"%>
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
    if (request.getParameter("formAprove") != null) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario.AproveUser(id);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if (request.getParameter("trocaSenha") != null) {
        try {
            String username = (String) session.getAttribute("session.username");
            String senha = request.getParameter("senha");
            String novaSenha = request.getParameter("novaSenha");
            String novaSenha2 = request.getParameter("novaSenha2");
            if (Usuario.getUsuario(username, senha) == null) {
                exceptionMessage = "Senha Inválida!";
            } else if (!novaSenha.equals(novaSenha2)) {
                exceptionMessage = "Senhas não conferem";
            } else {
                Usuario.changePassword(username, novaSenha);
                response.sendRedirect(request.getRequestURI());
            }
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();

        }

    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    
        <%@include file="WEB-INF/jspf/style.jspf"%>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>

        <div align="center" class="h-50 p-2" style="background-color: #FFB84B; color: white"> 
            <h2>Portal do Usuário</h2>
        </div>
        <br>

        <%if (session.getAttribute("session.username") == null) {%>

        <div align="center"><h1>Você não tem permissão de acesso</h1></div>

        <%} else {%>

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
                            <input class="form-control" type="password" name="senha">
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
                            <input class="form-control" type="password" name="senha" value="<%= senha%>">
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
            <%String username = request.getParameter("username");
                int id = Integer.parseInt(request.getParameter("id"));%>
            <input type="hidden" name="username" value="<%= username%>">
            <input type="hidden" name="id" value="<%= id%>">
            Deseja aprovar a inscrição do usuario <b><%= username%></b>?
            <input class="btn btn-secondary" type="submit" name="formAprove" value="Aprovar">
            <input class="btn btn-dark" type="submit" name="cancelar" value="Cancelar">
        </form>
        <%} else {%>
        
        <%}%>

        <br/>

        <%if (session.getAttribute("session.role") != null) {%>
        <main role="main">
        <h3 align="center">Lista de Usuários</h3>
        <div class="table">
            <table class="thead-dark"  align="center">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Usuario</th>
                        <th>Data Aprovação</th>
                        <th>Comandos</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%for (Usuario u : Usuario.getList()) {%>
                    <tr>
                        <td><%= u.getId()%></td>
                        <td><%= u.getUsername()%></td>
                        <td><%= u.getDtAprovacao()%></td>
                        <td>
                            <form>
                                <input type="hidden" name="id" value="<%= u.getId()%>">
                                <input type="hidden" name="username" value="<%= u.getUsername()%>">
                                <input class="btn btn-info" type="submit" name="prepUpdate" value="Alterar">
                                <input class="btn btn-danger" type="submit" name="prepDelete" value="Excluir">
                                <input class="btn btn-success" type="submit" name="prepAprove" value="Aprovar">
                            </form>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <div>
                </main>
                <%} else {%>
                <main role="main">
                <h3 align="center">Configurações</h3>
                <div align="center">
                <div class="card p-4 d-flex" style="width: 45rem;">
                <div class="table-responsive">
                    <table class="table" align="center">
                            <tr>
                                <th>Nome de usuário</th>
                                <td><%= session.getAttribute("session.username")%></td>
                            </tr>    
                            <tr>    
                                <th>Email</th>
                                <td><%= session.getAttribute("session.email")%></td>
                            </tr>
                            
                            <tr>
                                <th>Alterar Senha</th>
                                <td>
                                    <form method="post">
                                        <div>Senha atual:<div> <input type="password" name="senha"></div></div>
                                        <div>Nova senha:<div> <input type="password" name="novaSenha"></div></div>
                                        <div>Confirmação nova senha:<div><input type="password" name="novaSenha2"></div></div>
                                        <br/>
                                        <input type="submit" class="btn btn-info" name="trocaSenha" value="Alterar">
                                    </form>
                                </td>
                            </tr>                            
                                
                        </tbody>
                    </table>
                </div>
                </div>
                </div>
                                </hr>
                                </br>
                    <h3 align="center">Animais Adotados:</h3>
                    <div class="d-flex p-4 table-responsive">
                        <table class="table table-bordered table-hover" align="center">
                            <thead align="center">
                                <tr>
                                    <th>Nome do Animal</th>
                                    <th>Cor do Animal</th>
                                    <th>Data de Adoção</th>
                                </tr>
                            </thead>
                            <%int id = (int) session.getAttribute("session.id");
                              for (Adotados ad : Adotados.getListADT(id)) { %>
                            <tbody align="center">
                                <tr>
                                    <td><%= ad.getNomeAnimal()%></td>
                                    <td><%= ad.getCorAnimal()%></td>
                                    <td><%= ad.getDtAdocao()%></td>
                                </tr>
                               
                            </tbody>
                             <%}%>
                        </table>
                        </main>
                        <br>
                        <br>
                        <br>

                        <%}%>


                        <%}%>
                                                <%@include file="WEB-INF/jspf/footer.jspf"%>

                        </body>
                        </html>
