<%-- 
    Document   : Error
    Created on : 16-abr-2021, 19:43:15
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
       body {
       background-color:rgba(0,0,255, 0.3);
       }
    </style>
    <body>
        <h1>Error!</h1>
              
        <%
            out.print("Llena todos los campos");
        %>
        <br>
        <a href="Proyectos.jsp">Regresar a Registro</a>
        
    </body>
</html>
