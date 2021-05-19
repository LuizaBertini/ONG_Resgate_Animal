<%-- 
    Document   : aprovarAdocao
    Created on : 18 de mai. de 2021, 20:02:57
    Author     : uilsa
--%>

<%@page import="model.AguardaAdocao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Adotados"%>
<%@page import="model.Adocao"%>
<%@page import="java.time.*"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<%
    String exceptionMessage = null;
    
    if (request.getParameter("Aprovar") != null) {
        try {            
            int idAnimal = Integer.parseInt(request.getParameter("idAnimal"));
            exceptionMessage = "ponto A";                  
            AguardaAdocao.InsertDtAdocao(idAnimal);
            //response.sendRedirect("aprovarAdocao.jsp");
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
        <table class="table" align="center">
            <thead align="center">
                 <tr>
                    <th>Nome do Animal</th>
                    <th>Data de Requisição</th>
                    <th>Requisitante</th>
                    <th></th>
                </tr>
            </thead>            
            <% for (AguardaAdocao ad : AguardaAdocao.getListAguarAdocao()) { %>
            <tbody align="center">
                <tr>
                    <td><%= ad.getNomeAnimal()%></td>
                    <td><%= ad.getDtRequisicao()%></td>
                    <td><%= ad.getNmUsuario()%></td>
                    <td>
                    <form>
                        <input type="hidden" name="idUsuario" value="<%= ad.getIdUsuario()%>">
                        <input type="hidden" name="idAnimal" value="<%= ad.getIdAnimal()%>">
                        <input class="btn btn-success" type="submit" name="Aprovar" value="Aprovar Adoção">
                    </form>
                        </td>
                </tr>                               
            </tbody>
            <%}%>
        </table>
        <%@include file="WEB-INF/jspf/footer.jspf"%>   
    </body>  
</html>

