<%-- 
    Document   : Exito_clientes
    Created on : 9/05/2021, 10:27:08 PM
    Author     : Vane
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
                String dato0=ses.getAttribute("res0").toString();
                String dato1=ses.getAttribute("res1").toString();
                String dato2=ses.getAttribute("res2").toString();
                String dato3=ses.getAttribute("res3").toString();
                String dato4=ses.getAttribute("res4").toString();
                String dato5=ses.getAttribute("res5").toString();
                String dato6=ses.getAttribute("res6").toString();
                String dato7=ses.getAttribute("res7").toString();
                String dato8=ses.getAttribute("res8").toString();
                String dato9=ses.getAttribute("res9").toString();
                String dato10=ses.getAttribute("res10").toString();
     %>
        
        <font color="#82CCED" face="Arial Black, Gadget, sans-serif"><h1>Registro Exitoso</h1></font>
        <font face="Arial, Gadget, sans-serif"><p> Se ha registrado  a <b> <%=dato1%> </b> en el sistema</p></font>
        <font face="Arial, Gadget, sans-serif"><a href="http://localhost:8080/SistemaDeAlecom/Clientes.jsp">Regresar a registro</a></font>
    </body>
</html>
