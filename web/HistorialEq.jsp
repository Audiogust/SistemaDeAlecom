<%-- 
    Document   : HistorialEq
    Created on : 9/09/2021, 12:36:56 AM
    Author     : Vane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
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
        <div align="center">
            <a href="Wisp.jsp"> <img src="IMG/img.png" width="150" height="150" HSPACE="20"></a>
        </div>
        <form align="center" action="">

        <h1>HISTORIALES</h1>
        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='HistorialSoliE.jsp'"><img src="IMG/historial.png" width="60" height="60"><br> Materiales solicitados</button>

        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='HistorialSalidaE.jsp'"><img src="IMG/historial.png" width="60" height="60"><br> Salida de Materiales</button>

        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='HistorialDevolucionw.jsp'"><img src="IMG/historial.png" width="60" height="60"><br> Devoluciones de Materiales</button> 
          
    </body>
</html>
