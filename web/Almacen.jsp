<%-- 
    Document   : Almacen
    Created on : 31-mar-2021, 22:25:04
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">          
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div>
            <div align="center">
                <a href="MenuPrincipal.jsp"> <img src="IMG/logotipo.png" width="250" height="100" HSPACE="20"></a> 
            </div>
            <br>
            
            <form align="center" action="">
                <font color="#ffffff"><h2>MENU Almacen</h2></font>  
                <br>

                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='Tabla.jsp'"><img src="IMG/almacen.svg" width="60" height="60"><br>Inventario</button>

                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='busquedaSM.jsp'"><img src="IMG/solicitud.svg" width="60" height="60"><br>Consultar Solicitud de Materiales</button>

                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='SolicitudMaterial.jsp'"><img src="IMG/solicitud.svg" width="60" height="60"><br>Devolucion de Materiales</button>                
                
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='MenuHistoriales.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historial de Materiales solicitados</button>
            </form>
        </div>
    </body>
</html>
