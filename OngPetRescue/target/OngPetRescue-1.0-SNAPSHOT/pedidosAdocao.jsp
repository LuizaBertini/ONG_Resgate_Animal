<%-- 
    Document   : aprovarAdocao
    Created on : 18 de mai. de 2021, 20:02:57
    Author     : uilsa
--%>

<%@page import="model.JavaMailApp"%>
<%@page import="model.AguardaAdocao"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
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
            String email = request.getParameter("email");
             try {
                JavaMailApp lmail = new JavaMailApp();
                lmail.SendEmailAprovacaoA(email);
            } catch (Exception mex) {
                mex.printStackTrace();
            }
            //response.sendRedirect("aprovarAdocao.jsp");
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        }
    }    
    if (request.getParameter("Reprovar") != null) {
        try {            
            int idAnimal = Integer.parseInt(request.getParameter("idAnimal"));
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            String email = request.getParameter("email");
            exceptionMessage = "ponto A";                  
            AguardaAdocao.DeleteRequisicao(idUsuario, idAnimal);
             try {
                JavaMailApp lmail = new JavaMailApp();
                lmail.SendEmailReprovacaoA(email);
            } catch (Exception mex) {
                mex.printStackTrace();
            }
            //response.sendRedirect("aprovarAdocao.jsp");
        } catch (Exception ex) {
            exceptionMessage = ex.getLocalizedMessage();
        }
    }    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Ong Resgate Animal | Pedidos de Adoção</title>    
        <%@include file="WEB-INF/jspf/style.jspf"%>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%if(session.getAttribute("session.role")==null){%>
            <div align="center"><h4>Você não tem permissão de acesso</h4></div>
        <%}else{%>
        <div class="table p-4">
        <table class="table thead-light table-hover" align="center">
            <thead align="center">
                 <tr>
                    <th>Nome do Animal</th>
                    <th>Data de Requisição</th>
                    <th>Requisitante</th>
                    <th>Comandos</th>
                </tr>
            </thead>            
            <% for (AguardaAdocao ad : AguardaAdocao.getListAguarAdocao()) { %>
            <tbody align="center">
                <tr>
                    <td><%= ad.getNomeAnimal()%></td>
                    <td><%= ad.getDtRequisicao()%></td>
                    <td><%= ad.getNmUsuario()%>
                    <hr><%= ad.getEmailUsuario()%></td>
                    <td>
                    <form>
                        <input type="hidden" name="idUsuario" value="<%= ad.getIdUsuario()%>">
                        <input type="hidden" name="idUsuario" value="<%= ad.getIdUsuario()%>">
                        <input type="hidden" name="idAnimal" value="<%= ad.getIdAnimal()%>">
                        <input type="hidden" name="email" value="<%= ad.getEmailUsuario()%>">
                        <input class="btn btn-success" type="submit" name="Aprovar" value="Aprovar Adoção">
                        <input class="btn btn-danger" type="submit" name="Reprovar" value="Reprovar Adoção">
                    </form>
                        </td>
                </tr>                               
            </tbody>
            <%}%>
        </table>
        </div>
        <%}%>
        <%@include file="WEB-INF/jspf/footer.jspf"%>   
    </body>  
</html>

