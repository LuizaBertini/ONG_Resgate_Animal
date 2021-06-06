<%@page import="model.JavaMailApp"%>
<%@page import="web.dbListener"%>
<%@page import="model.Usuario"%>
<%@page import="model.Role"%>
<%@page import="model.Animal"%>
<%@page import="model.Teste"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/style.jspf"%>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


        <title>ONG Resgate Animal</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/carousel/">

        <!-- Bootstrap core CSS -->
        <link href="./Carousel Template for Bootstrap_files/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="./Carousel Template for Bootstrap_files/carousel.css" rel="stylesheet">
    </head>
    <body>

        <main role="main">
            <%@include file="WEB-INF/jspf/header.jspf"%>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <div class="carousel-caption d-none d-md-block">
                    <div class="card" style="background-color: #FFB84B">
                        <div class="card-body">
                            <h4 class="">ONG Resgate Animal</h4>
                            <p class="">Somos uma ONG rec�m formada para o resgate de animais abandonados ou com provas de maus tratos</p>
                            <p>Cadastre-se no nosso site e voc� ver� aquele que poder� ser seu novo(a) melhor amigo(a)</p>
                        </div>
                    </div>
                </div>
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="imgs/a1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="imgs/a2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="imgs/a3.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <br>
            <!-- Marketing messaging and featurettes
            ================================================== -->
            <!-- Wrap the rest of the page in another container to center all the content. -->

            <div class="container marketing">

                <!-- Three columns of text below the carousel -->
                <div class="row">
                   <%--<div class="col-lg-4">
                        <img class="rounded-circle" src="imgs/cao1.jpg" alt="Generic placeholder image" width="140" height="140">
                        <h2>Esse � o Tony</h2>
                        <p>Ele foi resgatado ap�s comer carne estragada dada por seu dono e encontrado com marcas de agress�o</p>
                        <p>Foi rec�m adotado e est� sendo muito bem tratado! Recebemos ele na nossa sede semana passada para brincar com seus antigos amigos</p>
                    </div><!-- /.col-lg-4 -->
                    <div class="col-lg-4">
                        <img class="rounded-circle" src="imgs/gato1.jpg" alt="Generic placeholder image" width="140" height="140">
                        <h2>Esse � o Camelo</h2>
                        <p>Foi resgatado ap�s ser abandonado na rodovia por seus ex-donos</p>

                    </div><!-- /.col-lg-4 -->
                    <div class="col-lg-4">
                        <img class="rounded-circle" src="imgs/cao2.jpg" alt="Generic placeholder image" width="140" height="140">
                        <h2>Essa � a Bela</h2>
                        <p>Encontramos ela perdida no centro da cidade, ligamos para seus donos e eles recusaram n�s devolvermos ela</p>
                        <p>Foi adotada semana passada por um casal</p>
                    </div><!-- /.col-lg-4 --> 
                    --%>
                    <%for (Animal a : Animal.getListTop3()) { %>
                    <div class="col-lg-4">
                        <img class="rounded-circle" src="https://docs.google.com/uc?id=<%=a.getImgAnimal()%>" onerror="this.src='imgs/not_found.png';" alt="Generic placeholder image" width="140" height="140">
                        <h2>Esse � <%=a.getNomeAnimal()%></h2>
                        <p><%=a.getHistorico()%> <a  href='<%= request.getContextPath()%>/animais.jsp'>ver mais...</a> </p>
                       
                    </div><!-- /.col-lg-4 -->
                    <%}%>
                </div><!-- /.row -->
                 
            </div></main><!-- /.container -->
            <%@include file="WEB-INF/jspf/footer.jspf"%>

            <!-- Bootstrap core JavaScript
            ================================================== -->
            <!-- Placed at the end of the document so the pages load faster -->
            <script src="./Carousel Template for Bootstrap_files/jquery-3.2.1.slim.min.js.baixados" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
            <script src="./Carousel Template for Bootstrap_files/popper.min.js.baixados"></script>
            <script src="./Carousel Template for Bootstrap_files/bootstrap.min.js.baixados"></script>
            <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
            <script src="./Carousel Template for Bootstrap_files/holder.min.js.baixados"></script>


            <svg xmlns="http://www.w3.org/2000/svg" width="500" height="500" viewBox="0 0 500 500" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;">
        
    </body>
</html>