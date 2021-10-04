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
                 .letra{
                     font-size: 20px;
                 }
    </style>
    <body>
        <h1>Menu Compras</h1>
        <div class="table-responsive" align="center">
                <a href="MenuPrincipal.jsp"> <img src="IMG/logotipo.png" width="250" height="100" HSPACE="20"></a>
        </div>
        <br><br>
        <div>         
            <form align="center" action="controlFull.do" method="post">
            <font color="#ffffff"><h2>MENU PRINCIPAL DE COMPRAS</h2></font><br>
            <button type="submit" name="opcion" value="botonPreorden" class="btn btn-primary btn-lg boton letra" onclick="location.href='Preorden.jsp'"><img src="IMG/Preorden.png" width="60" height="60"><br>Generar Preorden de compra</button>
            <button type="button" name="opcion" class="btn btn-primary btn-lg boton letra" onclick="location.href='folioPrecompra.jsp'"><img src="IMG/Ocompra.png" width="60" height="60"><br>Consultar Preorden de compra</button>
            <button type="button" name="opcion" class="btn btn-primary btn-lg boton letra" onclick="location.href='OrdenCompra.jsp'"><img src="IMG/Ocompra.png" width="60" height="60"><br>Orden de compra</button>
            </form>
        </div>
    </body>
</html>
