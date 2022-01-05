<%-- 
    Document   : Exito
    Created on : 16-abr-2021, 19:42:25
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">             
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <style>
       body {
       background-color:rgba(0,0,255, 0.3);
       }
    </style>
    <body>
        
        <%
                HttpSession ses=request.getSession();
                String nombre=ses.getAttribute("res0").toString();
                String otiga =ses.getAttribute("res1").toString();
                

              out.print("Se ha registrado el pryecto con nombre: "+nombre+" y con la otiga " + otiga);
        %>
        <br><br>
        <button class="btn btn-primary btn-lg" onclick="location.href='MenuPrincipal.jsp'">Continuar</button>
        
    </body>
</html>
