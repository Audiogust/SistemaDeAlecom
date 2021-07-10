<%-- 
    Document   : MaterialRegistro
    Created on : 7/07/2021, 10:11:25 AM
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
        <form align="center" action="controlClientes.do" method="post">
            <h1>REGISTRAR MATERIAL</h1>

            <img src="IMG/trabajar.svg" width="100" height="100"/>
            
            <div class="input-group">           
            <span class="input-group-text">Codigo</span>
            <input type="text" aria-label="First name" class="form-control" name="codigo">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Descripcion</span>
            <input type="text" aria-label="First name" class="form-control" name="descripcion">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Unidad</span>
            <input type="text" aria-label="First name" class="form-control" name="unidad">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Existencia</span>
            <input type="text" aria-label="First name" class="form-control" name="existencia">
            </div>
            
            
            <div class="input-group">
            <span class="input-group-text">Tope</span>
            <input type="text" aria-label="First name" class="form-control" name="tope">
            </div>
            
            <button type="submit" name="opcion" value="MaterialR" class="btn btn-outline-info">Registrar</button>
        
        </form>
        
    </body>
</html>
