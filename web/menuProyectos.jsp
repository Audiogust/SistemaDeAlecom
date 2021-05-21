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
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <style>
        *,
        *:before,
        *:after {
            box-sizing: inherit;
        }
        .redondo{
            background-image: url("IMG/mundo1.jpg"); 
            display: block;
            width: 250px;
            height: 250px;
            border-radius: 50%; 
            background-repeat:no-repeat;
            background-size: cover;
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
        
        h2{
            
            font-size: 1.6rem;
            line-height: 2;
        }
    </style>
    <body> 
    <div align="center">
        <h1> PROYECTOS </h1>  
    </div>
        <div class="container alinear"  align="center">    
            <button class="redondo btn btn-primary btn-lg boton" name="opcion" onclick="location.href='Wisp.jsp'"> 
                <font color="#ffffff"> <h1>WISP GAL</h1></font>
            </button>
            
            <button class="redondo btn btn-primary btn-lg boton" name="opcion" onclick="location.href='MenuPrincipal.jsp'"> 
                <font color="#ffffff"> <h1>FULL SWAP 
                    5G </h1></font>
            </button>
        </div>
    </body>
</html>
