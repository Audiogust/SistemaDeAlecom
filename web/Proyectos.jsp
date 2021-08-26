<%-- 
    Document   : Proyectos
    Created on : 31-mar-2021, 22:31:13
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyectos</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  
    </head>
                <style>
               body {
               background-color: #8BADC4;
               background-position: center;
               background-size: cover;
               height: 100vh;
               min-height: 600px;
               }
    </style>
    
    <style>
        .flexc {
            display: flex;
            flex-direction: column;
        }
        
    </style>
    <body>
    <div align="center">
        <a href="MenuPrincipal.jsp"> <img src="IMG/logotipo.png" width="250" height="100" HSPACE="20"></a>
        </div>
        <div class="container flexc">
        <form align="center" action="controlFull.do" method="post">
            <h1>Proyectos</h1>
            <img src="IMG/trabajar.svg" width="100" height="100"/>
            
            <div class="input-group">           
            <span class="input-group-text">Nombre</span>
            <input type="text" aria-label="First name" class="form-control" name="nombre">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Region</span>
            <input type="text" aria-label="First name" class="form-control" name="region">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Direccion</span>
            <input type="text" aria-label="First name" class="form-control" name="direccion">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Latitud</span>
            <input type="text" aria-label="First name" class="form-control" name="latitud">
            </div>
           
            <div class="input-group">
            <span class="input-group-text">Longitud</span>
            <input type="text" aria-label="First name" class="form-control" name="longitud">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Elevacion</span>
            <input type="text" aria-label="First name" class="form-control" name="elevacion">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Tecnologia</span>
            <input type="text" aria-label="First name" class="form-control" name="tecnologia">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Ubicacion</span>
            <input type="text" aria-label="First name" class="form-control" name="ubicacion">
            </div>
            
            
            <div class="input-group">
            <span class="input-group-text">Fecha</span>          	
            <input type="date" name="i_fecha">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Autorizado por: </span>
            <input type="text" aria-label="First name" class="form-control" name="i_autorizadop">
            </div>
            
            <div class="input-group">
            <span class="input-group-text">Folio</span>
            <input type="text" aria-label="First name" class="form-control" name="otigon" value="${numerito}">
            </div>
            
        
            <div>
                <fieldset>
                    <legend>Tipo de proyecto</legend>
                    <label>
                        <input type="radio" name="tipoPro" value="donado"> Donado
                    </label>
                    <label>
                        <input type="radio" name="tipoPro" value="full-swap"> Full swap
                    </label>                    
                </fieldset>
            </div>
            <button type="submit" name="opcion" value="enviarProyecto" class="btn btn-primary">Registrar</button>
        </form>
        </div>       
        
    </body>
</html>
