<%-- 
    Document   : MenuPrincipal
    Created on : 8/05/2021, 11:11:58 PM
    Author     : Vane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <title>Proyecto full-swap</title>
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
        <div align="center">
        <img src="IMG/logotipo.png" width="250" height="100" HSPACE="20">    
        </div>
        <br><br>
        <div>            
            <form align="center" action="controlFull.do">
            <font color="#ffffff"><h2>MENU PRINCIPAL ADMINISTRADOR</h2></font><br>
                        <button type="submit" name="opcion" value="botonGenerarNumero" class="btn btn-primary btn-lg boton letra" ><img src="IMG/trabajar.svg" width="60" height="60"><br>Proyectos </button>
                        <button type="button" name="enviar" class="btn btn-primary btn-lg boton letra" onclick="location.href='ingenieria.jsp'"><img src="IMG/ingenieria.svg" width="60" height="60"><br>Ingenieria</button> 
                        <button type="button" name="enviar" class="btn btn-primary btn-lg boton letra" onclick="location.href='Almacen.jsp'"><img src="IMG/almacen.svg" width="60" height="60"><br>Almacen</button>
                        <button type="button" name="enviar" class="btn btn-primary btn-lg boton letra" onclick="location.href='Compras.jsp'"><img src="IMG/compra.png" width="60" height="60"><br>Compras</button>
                        <button type="button" name="enviar" class="btn btn-primary btn-lg boton letra" onclick="location.href='ModificacionMateriales.jsp'"><img src="IMG/EditarMaterial.png" width="60" height="60"><br>Editar materiales</button>
                        <button type="button" name="enviar" class="btn btn-primary btn-lg boton letra" onclick="location.href='RegistroMateriales.jsp'"><img src="IMG/RegistroM.png" width="60" height="60"><br>Registrar material</button>               
            </form>
        </div>
    </body>
</html>
