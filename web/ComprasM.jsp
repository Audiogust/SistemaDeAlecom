<%-- 
    Document   : ComprasM
    Created on : 17/09/2021, 08:47:18 PM
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
                      h1{
                          align: center;
                      }
   </style>
    <body>
        <div>
            <form align="center" action="controlFull.do" method="post">
            <font ><h2>MENU PRINCIPAL DE COMPRAS</h2></font><br>
            <button type="submit" name="opcion" value="botonPreorden" class="btn btn-primary btn-lg boton letra" onclick="location.href='Preorden.jsp'"><img src="IMG/Preorden.png" width="60" height="60"><br>Generar Preorden de compra</button>
            <button type="button" name="opcion" class="btn btn-primary btn-lg boton letra" onclick="location.href='folioPrecompra.jsp'"><img src="IMG/Ocompra.png" width="60" height="60"><br>Consultar Preorden de compra</button>
            <button type="button" name="opcion" class="btn btn-primary btn-lg boton letra" onclick="location.href='OrdenCompra.jsp'"><img src="IMG/Ocompra.png" width="60" height="60"><br>Orden de compra</button>
            </form>

        </div>
    </body>
</html>
