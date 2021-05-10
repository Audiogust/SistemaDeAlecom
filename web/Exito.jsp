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
    </head>
    <body>
        
        <%
                HttpSession ses=request.getSession();
                String nombre=ses.getAttribute("res0").toString();
                String otiga =ses.getAttribute("res1").toString();
                

              out.print("Se ha registrado el pryecto con nombre: "+nombre+" y con la otiga " + otiga);
        %>
        <br>
        <a href="MenuPrincipal.jsp">Continuar</a>
    </body>
</html>
