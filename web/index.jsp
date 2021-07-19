<%-- 
    Document   : index
    Created on : 07-may-2021, 22:19:02
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <style>
                  body{
                          background-color:rgba(0,0,255, 0.3);
                            
                       }
        </style>
               <form align="center"  method="post" action="control.do">
            <br>
            <div>
                 <img src="IMG/logotipo.png" width="250" height="100" >
            </div>
            <br>
            <img src="IMG/login_1.svg" width="70" height="70" >
            <font  face="Arial Black" color="100E0E"><h1>INICIO DE SESION</h1></font>
            <img src="IMG/usuario.svg" width="25" height="25" > <input type="text" name="usuario" placeholder="Usuario" >
            <br>
            <br>
            <img src="IMG/pass.svg" width="25" height="25" > <input type="password" name="password" placeholder="Contraseña" > 
            <br>
            <br>
            <button type="submit" name="opcion"  value="enviar" class="btn btn-success">Ingresar</button>
        </form>
    </body>
</html>
