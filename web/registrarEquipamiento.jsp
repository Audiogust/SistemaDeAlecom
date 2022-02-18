<%-- 
    Document   : registrarEquipamiento
    Created on : 08-feb-2022, 12:30:59
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
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
        <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
            <h1>Registro de Equipamiento</h1>
        </div>
        <div class="container flexc">
        <form align="center" action="controlClientes.do" method="post">            
            <img src="IMG/trabajar.svg" width="100" height="100"/>                 
            
            <td  width="50%"><input type="hidden" size="53" name="id" value="${numeritow}"></td>
            
            <div class="input-group">           
            <span class="input-group-text">Codigo</span>
            <input type="text" aria-label="First name" class="form-control" name="codigo">
            </div>
            
            <div class="input-group">           
            <span class="input-group-text">Marca</span>
            <input type="text" aria-label="First name" class="form-control" name="marca">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Tipo de Equipamiento</span>
            <input type="text" aria-label="First name" class="form-control" name="tipo">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Dispositivo</span>
            <input type="text" aria-label="First name" class="form-control" name="dispositivo">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Existencia</span>
            <input type="text" aria-label="First name" class="form-control" name="existencia">
            </div>
            
            
            <div class="input-group">
            <span class="input-group-text">Tope</span>
            <input type="text" aria-label="First name" class="form-control" name="tope">
            </div>
            
            <button type="submit" name="opcion" value="registrarEquipamiento" class="btn btn-primary">Registrar</button>
        
        </form>
    </body>
</html>
