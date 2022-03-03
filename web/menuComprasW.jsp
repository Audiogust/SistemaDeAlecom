<%-- 
    Document   : menuComprasW
    Created on : 13-feb-2022, 22:55:20
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
        <title>WISP-GAL</title> 
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
    <body>
        
       <div align="center">                   
            <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
        </div>
        <form align="center" action="">
        <h1>MENU Compras</h1>
         
             <br>
             
             
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='ComprasW.jsp'"><img src="IMG/Listam.png" width="60" height="60"><br>MATERIALES</button>
                
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='comprasWE.jsp'"><img src="IMG/Listam.png" width="60" height="60"><br>EQUIPAMIENTO</button>
        
    </body>
</html>
