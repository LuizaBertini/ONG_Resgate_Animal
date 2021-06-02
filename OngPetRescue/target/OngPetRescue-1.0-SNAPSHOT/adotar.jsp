<%-- 
    Document   : adotar
    Created on : 9 de mai de 2021, 18:23:57
    Author     : trize
--%>

<%@page import="java.util.Date"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Ong Resgate Animal | Adotar</title>
        
    </head>
            <%@include file="WEB-INF/jspf/style.jspf"%>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%if (session.getAttribute("session.username") != null) {%>
        <main role="main">
        <div>
            <div align="center" class="h-50 p-2" style="background-color: #FFB84B; color: white"> 
                <h2>Adotar</h2>
            </div>
            <br>     
            
        <h4 align="center">Adoção é um assunto de extrema importância e deve ser levado com cautela.</h4>
        <h4 align="center">Ao clicar no botão abaixo você deverá ter completa certeza pois um animal é uma vida, e uma vida deve ser respeitada.</h4>
        <h4 align="center">Por-favor, se não tiver certeza que irá cuidar do seu novo amigo, não continue.</h4>
        
        <form method="POST">
            <%
                    String idAnimal = request.getParameter("idAnimal");
                    String nomeAnimal = request.getParameter("nomeAnimal");
                    String corAnimal = request.getParameter("corAnimal");
                    String dtResgate = request.getParameter("dtResgate");
                    String pesoAnimal = request.getParameter("pesoAnimal");
                    String nmEspecie = request.getParameter("nmEspecie");
                    String historico = request.getParameter("historico");
                %>
                <table class="table"  style="width: 50%" align="center">
                    <td style="width: 50%">
                                
                            <input type="hidden" name="idAnimal" value="<%= idAnimal%>">                                                     
                            
                            <div>
                                <p><b>Nome do Animal: </b><%= nomeAnimal%></p>
                            </div>
                            
                            <div>
                                <p><b>Cor do Animal: </b><%= corAnimal%>
                            </div>
          
                            <div>
                                <p><b>Histórico do Animal: </b><%= historico%>
                            </div>
                            
                            <div>
                                <p><b>Peso do Animal: </b><%= pesoAnimal%>
                            </div>
                            
                            <div>
                                <p><b>Raça do Animal: </b><%= nmEspecie%>
                            </div>
                                
                            <div>
                                <p><b>Data de resgate do Animal: </b><%= dtResgate%>
                            </div>
                            
                            <div>
                                <p><b>Data atual para o registro da adoção do Animal: </b><%= new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>
                            </div>
                            <input type="hidden" name="dataAdc" value="<%= new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>">   
                            <input class="btn btn-success" type="submit" name="Adotar" value="Adotar" onclick="return demo();">
                            <input class="btn btn-danger" type="submit" name="cancelar" value="Cancelar">
                        </div>
                    </td>
                </table>
            </form>
            
        </form>
        </main>
        <%}else{%>
        <h1 align="center">Você precisa estar cadastrado para adotar!!!</h1>
        <%}%>
        
        <%@include file="WEB-INF/jspf/footer.jspf"%>
        
        
    </body>
    
    
<script>
    function demo(){
    alert ("Parabéns!!!! Agora é só esperar a aprovação ;)" );
    }
</script>
    
    
</html>
