<%-- 
    Document   : adotar
    Created on : 9 de mai de 2021, 18:23:57
    Author     : trize
--%>

<%@page import="java.util.Date"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="web.dbListener"%>
<%@page import="model.Usuario"%>
<%@page import="model.Animal"%>
<%@page import="model.Raca"%>
<%@page import="model.Especie"%>
<%@page import="model.Adocao"%>

<%
    String exceptionMessage = null;
    
    if (request.getParameter("Adotar") != null) {
        try {
            /*String nomeAnimal = request.getParameter("nomeAnimal");
            String corAnimal = request.getParameter("corAnimal");
            String dtResgate = request.getParameter("dtResgate");
            float pesoAnimal = Float.parseFloat(request.getParameter("pesoAnimal"));
            int idRacaFK = Integer.parseInt(request.getParameter("idRacaFK"));
            int idEspecieFK = Integer.parseInt(request.getParameter("idEspecieFK"));*/
            int idAnimal = Integer.parseInt(request.getParameter("idAnimal"));
            int idUsuario = (int) session.getAttribute("session.id");
            String dataAdc = request.getParameter("dataAdc");
            Adocao.InsertList(idAnimal, idUsuario);
            //Adocao.InsertDtAdocao(dataAdc, idAnimal);
           response.sendRedirect("animais.jsp");

        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if (request.getParameter("cancelar") != null) {
        response.sendRedirect("animais.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adotar</title>
        
    </head>
            <%@include file="WEB-INF/jspf/style.jspf"%>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%if (session.getAttribute("session.username") != null) {%>
        <main role="main">
        <h1></h1>
        <div>
            <table class="table">
                <thead class="text-light" style="background-color: #FFB84B">
                    <tr  align="center">
                        <th colspan="4"><h2>Adotar</h2></th>                    
                    </tr>
                </thead>
            </table>   
            
        <h4 align="center">Adoção é um assunto de extrema importância e deve ser levado com cautela.</h4>
        <h4 align="center">Ao clicar no botão abaixo você deverá ter completa certeza pois um animal é uma vida, e uma vida deve ser espeitada.</h4>
        <h4 align="center">Por-favor, se não tiver certeza que irá cuidar do seu novo amigo, não continue.</h4>
        
        <form method="POST">
            <%
                    String idAnimal = request.getParameter("idAnimal");
                    String nomeAnimal = request.getParameter("nomeAnimal");
                    String corAnimal = request.getParameter("corAnimal");
                    String dtResgate = request.getParameter("dtResgate");
                    String pesoAnimal = request.getParameter("pesoAnimal");
                    String nmEspecie = request.getParameter("nmEspecie");
                %>
                <table class="table"  style="width: 50%" align="center">
                    <th style="width: 50%">
                      
                            <input type="hidden" name="idAnimal" value="<%= idAnimal%>">                                                     

                            <div>
                                Nome do Animal: <%= nomeAnimal%>
                            </div>
                            
                            <div>
                                Cor do Animal: <%= corAnimal%>
                            </div>
                            
                            <div>
                                Peso do Animal: <%= pesoAnimal%>
                            </div>
                            
                            <div>
                                Raça do Animal: <%= nmEspecie%>
                            </div>
                                
                            <div>
                                Data de resgate do Animal: <%= dtResgate%>
                            </div>
                            
                            <div>
                                Data atual para o registro da adoção do Animal: <%= new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>
                            </div>
                            <input type="hidden" name="dataAdc" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>">   
                            <input class="btn btn-success" type="submit" name="Adotar" value="Adotar">
                            <input class="btn btn-danger" type="submit" name="cancelar" value="Cancelar">
                        </div>
                    </th>
                </table>
            </form>
            
        </form>
        </main>
        <%}else{%>
        <h1 align="center">Você precisa estar cadastrado para adotar!!!</h1>
        <%}%>
        
        <%@include file="WEB-INF/jspf/footer.jspf"%>
        
        
    </body>
</html>
