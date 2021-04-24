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
        
        <h2>Animais Disponíveis para adoção</h2>

        <%if (exceptionMessage != null) {%>
            <div style="color: red"><%= exceptionMessage%></div>
        <%}%>
        <br/>
        <%if (request.getParameter("prepInsert") != null) {%>
        <h3>Inserir Registro de Animal</h3>
        <form method="post">
            Nome Animal: <input type="text" name="nomeAnimal" required>
            Cor Animal <input type="text" name="corAnimal" required>
            Peso Animal <input type="float" name="pesoAnimal" required>
            <br/>
            Data de Resgate <input type="date" name="dtResgate" required>
            Raça <select name="idRacaFK" required>
                        <option value=""></option>
                        <%for(Raca r: Raca.getList()){%>
                                <option value="<%= r.getIdRaca()%>"><%= r.getNmRaca()%></option>
                        <%}%>
                        </select>
                        
            Espécie <select name="idEspecieFK" required>
                        <option value=""></option>
                        <%for(Especie e: Especie.getList()){%>
                                <option value="<%= e.getIdEspecie()%>"><%= e.getNmEspecie()%></option>
                        <%}%>
                        </select>
            <input type="submit" name="formInsert" value="Inserir">
            <input type="submit" name="cancelar" value="Cancelar">
        </form>        
        <%} else if (request.getParameter("prepUpdate") != null) {%>
        
        <h3>Alterar Registro</h3>
        
        <form method="post">
            <%
                String idAnimal = request.getParameter("idAnimal");
                String nomeAnimal = request.getParameter("nomeAnimal");
                String corAnimal = request.getParameter("corAnimal");
                String dtResgate = request.getParameter("dtResgate");
                String dtAdocao = request.getParameter("dtAdocao");
                String pesoAnimal = request.getParameter("pesoAnimal");
            %>
            <input type="hidden" name="idAnimal" value="<%= idAnimal%>">
            Nome Animal: <input type="text" name="nomeAnimal" value="<%= nomeAnimal%>">
            Cor Animal: <input type="text" name="corAnimal" value="<%= corAnimal%>">
            Peso do Animal: <input type="float" name="pesoAnimal" value="<%= pesoAnimal%>">
            Data de Resgate: <input type="date" name="dtResgate" value="<%= dtResgate%>">
            Raça <select name="idRacaFK" required>
                        <option value=""></option>
                        <%for(Raca r: Raca.getList()){%>
                                <option value="<%= r.getIdRaca()%>"><%= r.getNmRaca()%></option>
                        <%}%>
                        </select>
                        
            Espécie <select name="idEspecieFK" required>
                        <option value=""></option>
                        <%for(Especie e: Especie.getList()){%>
                                <option value="<%= e.getIdEspecie()%>"><%= e.getNmEspecie()%></option>
                        <%}%>
                        </select>
            <input type="submit" name="formUpdate" value="Alterar">
            <input type="submit" name="cancelar" value="Cancelar">
        </form>
        
        <%} else if (request.getParameter("prepDelete") != null) {%>
        
        <h3>Deletar Registro</h3>
        
        <form method="post">
            <%String idAnimal = request.getParameter("idAnimal");%>
            <%String nomeAnimal = request.getParameter("nomeAnimal");%>
            <input type="hidden" name="idAnimal" value="<%= idAnimal%>">
            Excluir o Registro <b><%= idAnimal%> de nome <%= nomeAnimal%></b>?
            <input type="submit" name="formDelete" value="Deletar">
            <input type="submit" name="cancelar" value="Cancelar">
        </form>
        
        <%} else {%>
        <form method="post">
            <input type="submit" name="prepInsert" value="Inserir">
        </form>
        <%}%>
        
        <br/>
        
        <table border="1">
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
            <%for (Animal a : Animal.getList()) {%>
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
                        <input type="hidden" name="dtResgate" value="<%= a.getIdEspecieFK()%>">
                        <input type="hidden" name="dtResgate" value="<%= a.getIdRacaFK()%>">
                        <input type="submit" name="prepUpdate" value="Alterar">
                        <input type="submit" name="prepDelete" value="Excluir">
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
