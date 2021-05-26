<%-- 
    Document   : Compras
    Created on : 24-may-2021, 15:03:18
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">      
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <style>
        body {
                background-image: url("Imagenes/Fondo2.jpg");
                background-position: center;
                background-size: cover;
                height: 100vh;
                min-height: 600px;
                }
           .boton{
                 background-repeat:no-repeat;
                 height:200px;
                 width:200px;
                 background-position:center;
                 margin-right:14px!important;
                 }
    </style>
    <body>
        <h1>Compras</h1>
        <div align="center">
        <img src="IMG/logotipo.png" width="150" height="80" HSPACE="20">    
        </div>
        <br><br>
        <div>
            
            <form align="center" action="controlFull.do">
            <font color="#ffffff"><h2>MENU PRINCIPAL DE COMPRAS</h2></font><br>
            <button type="submit" name="opcion" value="botonPreorden" class="btn btn-primary btn-lg boton" onclick="location.href='Preorden.jsp'"><img src="IMG/Preorden.png" width="60" height="60"><br>Preorden de compra </button>
            <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='OrdenCompra.jsp'"><img src="IMG/Ocompra.png" width="60" height="60"><br>Orden de compra</button>    
            </form>
        </div>
    </body>
</html>
