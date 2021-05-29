<%-- 
    Document   : usuario
    Created on : 21 de abr. de 2021, 14:23:25
    Author     : trize

--%>
<%@page import="java.awt.AlphaComposite"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.swing.JFileChooser"%>
<%@page import="model.Animal"%>
<%@page import="model.Teste"%>
<%@page import="model.Raca"%>
<%@page import="model.Especie"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.swing.JFileChooser"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    String ver = "";
    String exceptionMessage = null;
    if (request.getParameter("cancelar") != null) {
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("formInsert") != null) {
        try {
            String nomeAnimal = request.getParameter("nomeAnimal");
            String corAnimal = request.getParameter("corAnimal");
            String dtResgate = request.getParameter("dtResgate");
            String historico = request.getParameter("historico");
            float pesoAnimal = Float.parseFloat(request.getParameter("pesoAnimal"));
            int idRacaFK = Integer.parseInt(request.getParameter("idRacaFK"));
            int idEspecieFK = Integer.parseInt(request.getParameter("idEspecieFK"));

            Animal.Insert(nomeAnimal, corAnimal, dtResgate, pesoAnimal, idRacaFK, idEspecieFK, historico); //uiam
            response.sendRedirect(request.getRequestURI());

        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        }
    }

    if (request.getParameter("formUpdate") != null) {
        Connection con = null;
        PreparedStatement stmt = null;
        Exception methodException = null;
        try {
            String nomeAnimal = request.getParameter("nomeAnimal");
            String corAnimal = request.getParameter("corAnimal");
            String dtResgate = request.getParameter("dtResgate");
            String dtAdocao = request.getParameter("dtAdocao");
            String historico = request.getParameter("historico");
            int idAnimal = Integer.parseInt(request.getParameter("idAnimal"));
            float pesoAnimal = Float.parseFloat(request.getParameter("pesoAnimal"));
            int idRacaFK = Integer.parseInt(request.getParameter("idRacaFK"));
            int idEspecieFK = Integer.parseInt(request.getParameter("idEspecieFK"));
            
            Animal.Update(nomeAnimal, corAnimal, dtResgate, dtAdocao, idAnimal, pesoAnimal, idRacaFK, idEspecieFK, historico);//uiam
            response.sendRedirect(request.getRequestURI());
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        } finally {
            try {
                stmt.close();
            } catch (Exception ex2) {
                exceptionMessage = ex2.getLocalizedMessage();
            }
            try {
                con.close();
            } catch (Exception ex2) {
                exceptionMessage = ex2.getLocalizedMessage();
            }
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
        <%@include file="WEB-INF/jspf/style.jspf"%>
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/header.jspf"%>
        



        <%if (exceptionMessage != null) {%>
        <div style="color: red"><%= exceptionMessage%></div>
        <%}%>


        <%if (session.getAttribute("session.role") != null) {%>

        <div>
            <div align="center" class="h-50 p-2" style="background-color: #FFB84B; color: white"> 
                <h2>Lista de Animais</h2>
            </div>
            <br>   

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

                                <input class="form-control" type="text" name="nomeAnimal" pattern="[A-Za-z]{1,30}">
                            </div>

                            <div class="input-group mb-3">
                                <div>
                                    <span class="input-group-text">Cor do Animal:</span>
                                </div>

                                <input class="form-control" type="text" name="corAnimal" pattern="[A-Za-z]{1,50}">
                            </div>

                            <div class="input-group mb-3">
                                <div>
                                    <span class="input-group-text">Histórico:</span>
                                </div>
                                <input class="form-control" type="text" name="historico"">
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
                            <%--uiam  
                            <div class="input-group mb-3"> 
                                <div>
                                    <span class="input-group-text">Foto do Animal:</span>
                                </div>    
                                <input class="form-control" type="file" name="imgAnimal">
                            </div>
                            uiam --%>  

                            <input class="btn btn-success" type="submit" name="formInsert" value="Inserir">
                            <input class="btn btn-danger" type="submit" name="cancelar" value="Cancelar">

                        </div>
                    </th>
                </table>
            </form>            

            <%} else if (request.getParameter("prepUpdate") != null) {%>
            <form method="post" >

                <%
                    String idAnimal = request.getParameter("idAnimal");
                    String nomeAnimal = request.getParameter("nomeAnimal");
                    String nmEspecie = request.getParameter("nmEspecie");
                    String nmRaca = request.getParameter("nmRaca");
                    String corAnimal = request.getParameter("corAnimal");
                    String dtResgate = request.getParameter("dtResgate");
                    String dtAdocao = request.getParameter("dtAdocao");
                    String pesoAnimal = request.getParameter("pesoAnimal");
                    String historico = request.getParameter("historico");
                    if (historico == null){
                        historico = "";
                    }
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
                                <input class="form-control" type="text" name="nomeAnimal"  pattern="[A-Za-z]{1,30}" value="<%= nomeAnimal%>">
                            </div>

                            <div class="input-group mb-3">
                                <div>
                                    <span class="input-group-text">Cor Animal:</span>
                                </div>    
                                <input class="form-control" type="text" name="corAnimal"  pattern="[A-Za-z]{1,50}" value="<%= corAnimal%>">
                            </div> 
                            
                            <div class="input-group mb-3">
                                <div>
                                    <span class="input-group-text">Histórico:</span>
                                </div>
                                <input class="form-control" type="text" name="historico" value="<%= historico%>">
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
                                    <option value="<%= r.getIdRaca()%>" <%= r.getNmRaca().equals(nmRaca) ? "selected" : ""%>>
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
                                    <option value="<%= e.getIdEspecie()%>" <%= e.getNmEspecie().equals(nmEspecie) ? "selected" : ""%>>
                                        <%= e.getNmEspecie()%></option>
                                    <%}%>
                                </select>
                            </div>    
                            <%--uiam      
                            <div class="input-group mb-3"> 
                                <div>
                                    <span class="input-group-text">Foto do Animal:</span>
                                </div>    
                                <input class="form-control" type="file" name="imgAnimal">
                            </div>    
                            uiam --%>    
                            <input class="btn btn-info" type="submit" name="formUpdate" value="Alterar">
                            <input class="btn btn-danger" type="submit" name="cancelar" value="Cancelar">

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
                <input class="btn btn-warning" type="submit" name="formDelete" value="Deletar">
                <input class="btn btn-danger" type="submit" name="cancelar" value="Cancelar">
            </form>

            <%} else {%>
            <form method="post" align="center">
                <input class="btn btn-success" type="submit" name="prepInsert" value="Inserir">
            </form>
            <%}%>
            
            <br/>
            <main role="main">
            <div class="table d-flex p-4">
                <table class="thead-dark" align="center">
                    <thead>
                        <tr>
                            <th></th>
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
                            <td>
                                <img class="rounded-circle" src="imgs/<%=a.getNomeAnimal()%>.jpg" alt="Generic placeholder image" width="140" height="140">
                                </td>
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
                                    <input type="hidden" name="nmEspecie" value="<%= a.getNmEspecie()%>">
                                    <input type="hidden" name="nmRaca" value="<%= a.getNmRaca()%>">
                                    <input type="hidden" name="idE" value="<%= a.getIdEspecieFK()%>">
                                    <input type="hidden" name="idR" value="<%= a.getIdRacaFK()%>">
                                    <input type="hidden" name="historico" value="<%= a.getHistorico()%>">
                                    <input class="btn btn-info" type="submit" name="prepUpdate" value="Alterar">
                                    <input class="btn btn-danger" type="submit" name="prepDelete" value="Excluir">
                                </form>
                            </td>
                        </tr>
                    </tbody>
                    <%}%> 
                </table>
            </div>
        </main>
            <%-- Tabela para usuário Comum --%>

            <%} else {%>
            
            <main role="main">
            <div>
                <div align="center" class="h-50 p-2" style="background-color: #FFB84B; color: white"> 
                    <h2>Animais Disponíveis Para Adoção</h2>
               </div>
               <br>  

                <div class="d-flex p-4 justify-content-center">
                <div class="row row-cols-1 row-cols-md-6 justify-content-center">
                    <%for (Animal a : Animal.getListNadt()) {%>
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <img class="rounded-circle" src="imgs/<%=a.getNomeAnimal()%>.jpg" alt="Generic placeholder image" width="140" height="140">
                        <p class="card-text"><%= a.getNomeAnimal()%></p>
                        <p class="card-text"><%= a.getCorAnimal()%></p>
                        <p class="card-text"><%= a.getNmRaca()%></p>
                        <p class="card-text"><%= a.getPesoAnimal()%></p>
                        <p class="card-text"><%= a.getDtResgate()%></p>
                        <p class="card-text"><%= a.getNmEspecie()%></p>
                        <form method="post" action="adotar.jsp">
                            <input type="hidden" name="idAnimal" value="<%= a.getIdAnimal()%>">
                            <input type="hidden" name="nomeAnimal" value="<%= a.getNomeAnimal()%>">
                            <input type="hidden" name="corAnimal" value="<%= a.getCorAnimal()%>">
                            <input type="hidden" name="pesoAnimal" value="<%= a.getPesoAnimal()%>">
                            <input type="hidden" name="dtResgate" value="<%= a.getDtResgate()%>">
                            <input type="hidden" name="nmEspecie" value="<%= a.getNmEspecie()%>">
                            <input type="hidden" name="idE" value="<%= a.getIdEspecieFK()%>">
                            <input type="hidden" name="idR" value="<%= a.getIdRacaFK()%>">
                            <input type="hidden" name="historico" value="<%= a.getHistorico()%>">
                            <input class="btn btn-success" type="submit" name="prepAdotar" value="Adotar">
                        </form>
                    </div>
                </div>&nbsp; &nbsp;
                <%}%> 
            </div>
            <br/>
            </div>
            </main>
            <%}%>
            <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
    
</html>
