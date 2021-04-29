<%-- 
    Document   : usuario
    Created on : 21 de abr. de 2021, 14:23:25
    Author     : trize

--%>
<%@page import="model.Animal"%>
<%@page import="model.Raca"%>
<%@page import="model.Especie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String exceptionMessage = null;
    if (request.getParameter("cancelar") != null) {
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("formInsert") != null) {
        try {
            String nomeAnimal = request.getParameter("nomeAnimal");
            String corAnimal = request.getParameter("corAnimal");
            String dtResgate = request.getParameter("dtResgate");
            float pesoAnimal = Float.parseFloat(request.getParameter("pesoAnimal"));
            int idRacaFK = Integer.parseInt(request.getParameter("idRacaFK"));
            int idEspecieFK = Integer.parseInt(request.getParameter("idEspecieFK"));
            Animal.Insert(nomeAnimal, corAnimal, dtResgate, pesoAnimal, idRacaFK, idEspecieFK);
            response.sendRedirect(request.getRequestURI());

        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        }
    }

    if (request.getParameter("formUpdate") != null) {
        try {
            String nomeAnimal = request.getParameter("nomeAnimal");
            String corAnimal = request.getParameter("corAnimal");
            String dtResgate = request.getParameter("dtResgate");
            String dtAdocao = request.getParameter("dtAdocao");
            int idAnimal = Integer.parseInt(request.getParameter("idAnimal"));
            float pesoAnimal = Float.parseFloat(request.getParameter("pesoAnimal"));
            int idRacaFK = Integer.parseInt(request.getParameter("idRacaFK"));
            int idEspecieFK = Integer.parseInt(request.getParameter("idEspecieFK"));
            Animal.Update(nomeAnimal, corAnimal, dtResgate, dtAdocao, idAnimal, pesoAnimal, idRacaFK, idEspecieFK);
            response.sendRedirect(request.getRequestURI());
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        }
    }

    if (request.getParameter("formDelete") != null) {
        try {
            int idAnimal = Integer.parseInt(request.getParameter("idAnimal"));
            Animal.Delete(idAnimal);
            response.sendRedirect(request.getRequestURI());

        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();

        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Animais</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%@include file="WEB-INF/jspf/style.jspf"%>

        <h1></h1>
        <div>
            <table class="table">
                <thead class="thead-dark">
                    <tr  align="center">
                        <th colspan="4"><h2>Animais Disponíveis para adoção</h2></th>                    
                    </tr>
                </thead>
            </table>        

            <%if (exceptionMessage != null) {%>
            <div style="color: red"><%= exceptionMessage%></div>
            <%}%>
            <br/>

            <%if (request.getParameter("prepInsert") != null) {%>
            <form method="post">
                <h3 align="center">Inserir Registro de Animal</h3>
                <table class="table" style="width: 50%" align="center">
                    <th style="width: 50%">
                        <div class="form-group">

                            <div class="input-group mb-3">
                                <div>
                                    <span class="input-group-text">Nome Animal:</span>
                                </div>

                                <input class="form-control" type="text" name="nomeAnimal" required>
                            </div>

                            <div class="input-group mb-3">
                                <div>
                                    <span class="input-group-text">Cor do Animal:</span>
                                </div>

                                <input class="form-control" type="text" name="corAnimal">
                            </div>

                            <div class="input-group mb-3">
                                <div>
                                    <span class="input-group-text">Peso do Animal:</span>
                                </div>    
                                <input class="form-control" type="float" name="pesoAnimal">
                            </div>

                            <div class="input-group mb-3"> 
                                <div>
                                    <span class="input-group-text">Data de Resgate:</span>
                                </div>    
                                <input class="form-control" type="date" name="dtResgate">
                            </div>

                            <div class="input-group mb-3"> 
                                <div>    
                                    <span class="input-group-text">Raça do animal:</span>
                                </div>    

                                <select class="custom-select" name="idRacaFK">
                                    <option value=""></option>
                                    <%for (Raca r : Raca.getList()) {%>
                                    <option value="<%= r.getIdRaca()%>"><%= r.getNmRaca()%></option>
                                    <%}%>
                                </select>
                            </div>                

                            <div class="input-group mb-3"> 
                                <div>     
                                    <span class="input-group-text">Espécie do animal:</span>
                                </div>    

                                <select class="custom-select" name="idEspecieFK">
                                    <option value=""></option>
                                    <%for (Especie e : Especie.getList()) {%>
                                    <option value="<%= e.getIdEspecie()%>"><%= e.getNmEspecie()%></option>
                                    <%}%>
                                </select>
                            </div>

                            <input class="btn btn-secondary" type="submit" name="formInsert" value="Inserir">
                            <input class="btn btn-dark" type="submit" name="cancelar" value="Cancelar">

                        </div>
                    </th>
                </table>
            </form>            

            <%} else if (request.getParameter("prepUpdate") != null) {%>
            <form method="post">

                <%
                    String idAnimal = request.getParameter("idAnimal");
                    String nomeAnimal = request.getParameter("nomeAnimal");
                    String corAnimal = request.getParameter("corAnimal");
                    String dtResgate = request.getParameter("dtResgate");
                    String dtAdocao = request.getParameter("dtAdocao");
                    String pesoAnimal = request.getParameter("pesoAnimal");
                %>
                <h3 align="center">Alterar Registro</h3>
                <table class="table"  style="width: 50%" align="center">
                    <th style="width: 50%">
                        <div class="form-group">

                            <input type="hidden" name="idAnimal" value="<%= idAnimal%>">

                            <div class="input-group mb-3">
                                <div>
                                    <span class="input-group-text">Nome Animal:</span>
                                </div>
                                <input class="form-control" type="text" name="nomeAnimal" value="<%= nomeAnimal%>">
                            </div>

                            <div class="input-group mb-3">
                                <div>
                                    <span class="input-group-text">Cor Animal:</span>
                                </div>    
                                <input class="form-control" type="text" name="corAnimal" value="<%= corAnimal%>">
                            </div> 

                            <div class="input-group mb-3">
                                <div>
                                    <span class="input-group-text">Peso do Animal: </span>
                                </div>    
                                <input class="form-control" type="float" name="pesoAnimal" value="<%= pesoAnimal%>">
                            </div>

                            <div class="input-group mb-3">
                                <div>
                                    <span class="input-group-text">Data de Resgate: </span>
                                </div>    
                                <input class="form-control" type="date" name="dtResgate" value="<%= dtResgate%>">
                            </div>

                            <div class="input-group mb-3"> 
                                <div>    
                                    <span class="input-group-text">Raça do animal:</span>
                                </div>    

                                <select class="custom-select" name="idRacaFK">
                                    <option value=""></option>
                                    <%for (Raca r : Raca.getList()) {%>
                                    <option value="<%= r.getIdRaca()%>" <%= r.getNmRaca().equals(r.getNmRaca()) ? "selected" : ""%>>
                                        <%= r.getNmRaca()%></option>
                                        <%}%>
                                </select>
                            </div>

                            <div class="input-group mb-3"> 
                                <div>     
                                    <span class="input-group-text">Espécie do animal:</span>
                                </div>    

                                <select class="custom-select" name="idEspecieFK">
                                    <option value=""></option>
                                    <%for (Especie e : Especie.getList()) {%>
                                    <option value="<%= e.getIdEspecie()%>" <%= e.getNmEspecie().equals(e.getNmEspecie()) ? "selected" : ""%>>
                                        <%= e.getNmEspecie()%></option>
                                        <%}%>
                                </select>
                            </div>    

                            <input class="btn btn-secondary" type="submit" name="formUpdate" value="Alterar">
                            <input class="btn btn-dark" type="submit" name="cancelar" value="Cancelar">

                        </div>
                    </th>
                </table>
            </form>

            <%} else if (request.getParameter("prepDelete") != null) {%>

            <h3 align="center">Deletar Registro</h3>

            <form method="post" align="center">
                <%String idAnimal = request.getParameter("idAnimal");%>
                <%String nomeAnimal = request.getParameter("nomeAnimal");%>
                <input type="hidden" name="idAnimal" value="<%= idAnimal%>">
                Excluir o Registro <b><%= idAnimal%> de nome <%= nomeAnimal%></b>?
                <input class="btn btn-secondary" type="submit" name="formDelete" value="Deletar">
                <input class="btn btn-dark" type="submit" name="cancelar" value="Cancelar">
            </form>

            <%} else {%>
            <form method="post" align="center">
                <input class="btn btn-secondary" type="submit" name="prepInsert" value="Inserir">
            </form>
            <%}%>

            <br/>
            <div class=" table-responsive">
                <table class="table-bordered table-hover" align="center">
                    <thead>
                        <tr>
                            <th>Id do Animal</th>
                            <th>Nome do Animal</th>
                            <th>Cor do Animal</th>
                            <th>Espécie</th>
                            <th>Raça</th>
                            <th>Peso do Animal</th>
                            <th>Data do Resgate</th>
                            <th>Data de Adoção</th>
                            <th>Comandos Adiministrativos</th>
                        </tr>
                    </thead>
                    <%for (Animal a : Animal.getList()) {%>
                    <tbody>
                        <tr>
                            <td><%= a.getIdAnimal()%></td>
                            <td><%= a.getNomeAnimal()%></td>
                            <td><%= a.getCorAnimal()%></td>
                            <td><%= a.getNmEspecie()%></td>
                            <td><%= a.getNmRaca()%></td>               
                            <td><%= a.getPesoAnimal()%></td>
                            <td><%= a.getDtResgate()%></td>
                            <td><%= a.getDtAdocao()%></td>
                            <td>
                                <form method="post">
                                    <input type="hidden" name="idAnimal" value="<%= a.getIdAnimal()%>">
                                    <input type="hidden" name="nomeAnimal" value="<%= a.getNomeAnimal()%>">
                                    <input type="hidden" name="corAnimal" value="<%= a.getCorAnimal()%>">
                                    <input type="hidden" name="pesoAnimal" value="<%= a.getPesoAnimal()%>">
                                    <input type="hidden" name="dtResgate" value="<%= a.getDtResgate()%>">
                                    <input type="hidden" name="idE" value="<%= a.getIdEspecieFK()%>">
                                    <input type="hidden" name="idR" value="<%= a.getIdRacaFK()%>">
                                    <input class="btn btn-secondary" type="submit" name="prepUpdate" value="Alterar">
                                    <input class="btn btn-secondary" type="submit" name="prepDelete" value="Excluir">
                                </form>
                            </td>
                        </tr>
                    </tbody>
                    <%}%>
                </table>
            </div>
    </body>
</html>
