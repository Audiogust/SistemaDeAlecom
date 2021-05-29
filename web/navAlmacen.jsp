<%-- 
    Document   : navAlmacen
    Created on : 9/05/2021, 11:00:37 PM
    Author     : Vane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
          <style>
           body {
                background-image: url("IMG/fondo_4.jpg");
                background-position: center;
                background-size: cover;
                height: 100vh;
                min-height: 600px;
                }
                 .input{
                       background-repeat:no-repeat;
                 
                 background-position:right;
                 margin-right:600px!important;
                      }
                      .derecha   { float: right; }
.izquierda { float: left;  }
                
                
                table {
                      background-color: #3F9FEA;
                      }
   </style>
    <body>
         <nav class="navbar navbar-expand-lg navbar-light bg-info">
            <div class="container-fluid">
                

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                         <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="Wisp.jsp">WISP</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="Materiales.jsp" target="myFrame">Materiales</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="MaterialesSolicitados.jsp" target="myFrame">Materiales Solicitados</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="SoliicitudDev.jsp" target="myFrame">Devolucion</a>
                        </li>
                     </ul>
                    <br>
                </div>
                </div></nav>
        <div class="m-4" style="height: 550px;">
                                <iframe name="myFrame" style="height: 1940%; width: 103%; border: none"></iframe>
                            </div>
    </body>
</html>
