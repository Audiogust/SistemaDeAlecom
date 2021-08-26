<%-- 
    Document   : RegistroMateriales
    Created on : 02-jun-2021, 13:27:53
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <style>
       body {
       background-color:rgba(0,0,255, 0.3);
       background-position: center;
       
       }
    </style>
    <body>
        <div align="center">
        <img src="IMG/logotipo.png" width="150" height="80" HSPACE="20">    
        </div>
        <div class="container flexc">
        <form align="center" action="controlFull.do" method="post">
            <h1>Materiales</h1>
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
            
            <button type="submit" name="opcion" value="registrarMaterial" class="btn btn-primary">Registrar</button>
        
        </form>
            </div>
    </body>
</html>
