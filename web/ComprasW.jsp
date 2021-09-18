<%-- 
    Document   : ComprasW
    Created on : 26/05/2021, 11:40:22 PM
    Author     : Vane
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
           body {
                background-image: url("IMG/fondo_4.jpg");
                background-position: center;
                background-size: cover;
                height: 100vh;
                min-height: 600px;
                }
                 .input{
                       background-repeat:no-repeat;
                 
                 background-position:right;
                 margin-right:600px!important;
                      }
                      .derecha   { float: right; }
.izquierda { float: left;  }
                
                
                table {
                      background-color: #3F9FEA;
                      }
                      h1{
                          align: center;
                      }
   </style>
    <body>
        <div>
            <form align="center" action="controlFull.do">
            <h2>MENU PRINCIPAL DE COMPRAS</h2>
            <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='ComprasM.jsp'"><img src="IMG/Preorden.png" width="60" height="60"><br>MATERIALES  </button>
            <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='ComprasE.jsp'"><img src="IMG/Ocompra.png" width="60" height="60"><br>EQUIPAMIENTO </button>    
            </form>
        </div>
    </body>
</html>
