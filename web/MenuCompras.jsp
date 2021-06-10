<%-- 
    Document   : MenuCompras
    Created on : 26/05/2021, 08:55:00 PM
    Author     : Vane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div>
            
            <form align="center" action="controlFull.do" method="post">
            <font color="#ffffff"><h2>MENU PRINCIPAL DE COMPRAS</h2></font><br>
            <button type="submit" name="opcion" value="botonPreorden" class="btn btn-primary btn-lg boton" onclick="location.href='Preorden.jsp'"><img src="IMG/Preorden.png" width="60" height="60"><br>PREORDEN DE COMPRA </button>
            <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='OrdenCompra.jsp'"><img src="IMG/Ocompra.png" width="60" height="60"><br>ORDEN DE COMPRA</button>    
            </form>
        </div>
    </body>
</html>
