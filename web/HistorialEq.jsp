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
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
        <title>WISP-GAL</title>
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
            <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
            <h1>Historial de Compras</h1> 
        </div>
   
        <form align="center" action="">

       
        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='menuHistorialPreW.jsp'"><img src="IMG/historial.png" width="60" height="60"><br> Precompra de Materiales</button>

        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='menuHistorialPreWo.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Orden de Compra Materiales</button>

        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='tablaFolioPrecompraWoH.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Precompra de Equipamiento</button> 
        
        <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='tablaFolioPrecompraWOC.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Orden de Compra Equipamiento</button>
          
    </body>
</html>
