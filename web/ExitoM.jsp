<%-- 
    Document   : ExitoM
    Created on : 02-jun-2021, 14:41:09
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
       }
    </style>
    <body>
        <h1>Registro exitoso!</h1>
         <% 
                HttpSession ses=request.getSession();
                String dato0=ses.getAttribute("res0").toString();
                String dato1=ses.getAttribute("res1").toString();
                String dato2=ses.getAttribute("res2").toString();
                String dato3=ses.getAttribute("res3").toString();
                String dato4=ses.getAttribute("res4").toString();         

     %>
    
      <font color="#82CCED" face="Arial Black, Gadget, sans-serif"><h1>Registro Exitoso</h1></font>
      <font face="Arial, Gadget, sans-serif"><p> Se ha registrado  a <b> <%=dato1%> </b> en el sistema</p></font>
    </body>
</html>
