<%-- 
    Document   : MenuAlmacen
    Created on : 2/07/2021, 12:15:31 PM
    Author     : Vane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
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

       
        <a href="Wisp.jsp"> <img src="IMG/img.png" width="150" height="150" HSPACE="20"></a>

        </div>
        <form align="center" action="">
        <h1>MENU ALMACEN </h1>
         
             <br>
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='Materiales.jsp'"><img src="IMG/Listam.png" width="60" height="60"><br>MATERIALES</button>
                
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='TablaEquipamiento.jsp'"><img src="IMG/Listam.png" width="60" height="60"><br>EQUIPAMIENTO</button>
                
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='MaterialesSolicitados.jsp'"><img src="IMG/Materials.png" width="60" height="60"><br>Materiales Solicitados</button>
                
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='EquipamientosSolicitados.jsp'"><img src="IMG/Materials.png" width="60" height="60"><br>Equipamientos Solicitados</button>

                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='SoliicitudDev.jsp'"><img src="IMG/Devolucion.png" width="60" height="60"><br>Devolucion de Materiales</button> 
                
                     <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='DevolucionE.jsp'"><img src="IMG/Devolucion.png" width="60" height="60"><br>Devolucion de Equipamiento</button> 
                
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='MaterialRegistro.jsp'"><img src="IMG/RegistroM.png" width="60" height="60"><br>Registro de Material</button> 
            </form>
        
        
    </body>
</html>
