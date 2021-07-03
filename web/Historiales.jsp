<%-- 
    Document   : Historiales
    Created on : 18-jun-2021, 11:22:02
    Author     : Hp
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
        
                <div>
            <div align="center">
                <h1>HISTORIALES</h1>
                <img src="IMG/imagen 1.png" width="150" height="80" HSPACE="20">    
            </div>
            
            <form align="center" action="">
          
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='HistorialSolicitadow.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historial de Materiales solicitados</button>

                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='HistorialSalidaw.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historial de Salida de Materiales</button>

                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='HistorialDevolucionw.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historial de Devoluciones de Materiales</button> 
            </form>
        </div>
    </body>
</html>
