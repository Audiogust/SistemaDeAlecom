<%-- 
    Document   : Historiales
    Created on : 18-jun-2021, 11:22:02
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>HISTORIALES</h1>
                <div>
            <div align="center">
                <img src="IMG/logotipo.png" width="150" height="80" HSPACE="20">    
            </div>
            
            <form align="center" action="">
          
                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='HistorialSolicitadow.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historial de Materiales solicitados</button>

                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='HistorialSalidaw.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historial de Salida de Materiales</button>

                <button type="button" name="enviar" class="btn btn-primary btn-lg boton" onclick="location.href='HistorialDevolucionw.jsp'"><img src="IMG/historial.png" width="60" height="60"><br>Historial de Devoluciones de Materiales</button> 
            </form>
        </div>
    </body>
</html>
