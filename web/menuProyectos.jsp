<%-- 
    Document   : menuProyectos
    Created on : 08-may-2021, 0:39:03
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
    <style>
        *,
        *:before,
        *:after {
            box-sizing: inherit;
        }
        .redondo{
            background-image: url("IMG/imagen 1.png"); 
            display: block;
            width: 250px;
            height: 250px;
            border-radius: 50%; 
            background-repeat:no-repeat;
            background-position:center;
            margin-right: 14px!important;
        }
        .alinear{
            display: flex;
            justify-content: center;
            margin-top: 40px;
            padding: 40px;
        }
        body{
            background-color: #999A9D;     
        }
    </style>
    <body> 
    <div align="center">
        <h1> PROYECTOS </h1>  
    </div>
        <div class="container alinear"  align="center">    
            <button class="redondo btn btn-primary btn-lg boton" name="opcion" onclick="location.href='Wisp.jsp'">                                
            </button>
            
            <button class="redondo btn btn-primary btn-lg boton" name="opcion" onclick="location.href='MenuPrincipal.jsp'">     
            </button>
        </div>
    </body>
</html>
