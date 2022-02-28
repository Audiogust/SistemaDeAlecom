<%-- 
    Document   : ComprasW
    Created on : 07-feb-2022, 0:04:22
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
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
        <title>JSP Page</title>
    </head>
    <style>
        h2{
            font-size: 40px;
            color: white;
        }
        body {
            background-image: url("IMG/fondo_4.jpg");
            background-position: center;
            height: 100vh;                
            min-height: 600px;
        }
        .boton{
            background-repeat:no-repeat;
            height:170px;
            width:170px;
            background-position:center;
            margin-right:10px!important;
        }
        .letra{
            font-size: 19px;
        }
        </style>
         <div align="center">                  
            <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
         </div>
    <body>
        
        <div>
            <form align="center" action="controlClientes.do" method="post">
            <font color="#ffffff"><h2>MENU COMPRAS DE MATERIALES</h2></font><br>
            <button type="submit" name="opcion" value="botonPreorden" class="btn btn-primary btn-lg boton letra" ><img src="IMG/Preorden.png" width="60" height="60"><br>Generar Preorden de compra</button>
            <button type="button" name="opcion" class="btn btn-primary btn-lg boton letra" onclick="location.href='folioPrecompraWisp.jsp'"><img src="IMG/Ocompra.png" width="60" height="60"><br>Consultar Preorden de compra</button>
            <button type="button" name="opcion" class="btn btn-primary btn-lg boton letra" onclick="location.href='ordenCompraWisp.jsp'"><img src="IMG/Ocompra.png" width="60" height="60"><br>Orden de compra</button>
            </form>
        </div>
        
    </body>
</html>
