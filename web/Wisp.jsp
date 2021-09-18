<%-- 
    Document   : Wisp
    Created on : 8/05/2021, 11:10:17 PM
    Author     : Vane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Last-Modified" content="0">
        <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <style>
        h2{
            font-size: 40px;
            
        }
        body {
            background-image: url("IMG/fondo_4.jpg");
            background-position: center;
            height: 100vh;                
            min-height: 600px;
        }
        .boton{
            background-repeat:no-repeat;
            height:140px;
            width:140px;
            background-position:center;
            margin-right:10px!important;
        }
        .letra{
            font-size: 19px;
        }
        </style>
    <body>
            <div align="center">
         <img src="IMG/img.png" width="200" height="200" HSPACE="50">
        </div>
            <form align="center" action="controlClientes.do">
                <font color="#1D049B"><h2>MENU PRINCIPAL</h2></font>
                        <button type="submit" name="opcion" value="GenerarNumeroW" class="btn btn-success btn-sm  boton letra" onclick="location.href='Clientes.jsp'"><img src="IMG/clientes1.svg" width="60" height="60"><br>Clientes </button>
                        <button type="button" name="enviar" class="btn btn-success btn-sm  boton letra" onclick="location.href='Instalacion.jsp'"><img src="IMG/orden.svg" width="60" height="60"><br>Orden de instalacion</button>
                        <button type="button" name="enviar" class="btn btn-dark btn-sm boton letra" onclick="location.href='MenuAlmacen.jsp'"><img src="IMG/almacen1.svg" width="60" height="60"><br>Almacen</button>
                        <button type="button" name="enviar" class="btn btn-success btn-sm  boton letra" onclick="location.href='MenuHistorial.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historiales</button>
                        <br><br><br><br><br><button type="button" name="enviar" class="btn btn btn-success btn-sm boton letra" onclick="location.href='ComprasW.jsp'"><img src="IMG/compras.svg" width="60" height="60"><br>Compras</button>
                        <button type="button" name="enviar" class="btn btn btn-success btn-sm boton letra" onclick="location.href='Orden2.jsp'"><img src="IMG/reporte1.svg" width="60" height="60"><br>Orden de servicio</button>
                        <button type="button" name="enviar" class="btn btn-success btn-sm boton letra"  onclick="location.href='Calidad.jsp'"><img src="IMG/graficas.svg" width="50" height="50"/><br>Control de calidad de servicio</button>  
            </form> 
    </body>
</html>
