<%-- 
    Document   : MenuHistoriales
    Created on : 17-jun-2021, 15:49:38
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">      
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        
        <div>
            <div align="center">
                <img src="IMG/logotipo.png" width="150" height="80" HSPACE="20">    
            </div>
            
            <form align="center" action="">
                <font color="#ffffff"><h2>MENU Historiales</h2></font>
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='tablaHistorial.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historial de Materiales solicitados</button>

                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='tablaHistorialSalida.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historial de Salida de Materiales</button>

                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='tablaHistorialDevolucion.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historial de Devoluciones de Materiales</button> 
                
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='menuHistorialPre.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historial de Preorden de Compra</button> 
                
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='foliosOrdenCompra.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historial de Orden de Compra</button> 
            </form>
        </div>
    </body>
</html>
