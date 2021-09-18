<%-- 
    Document   : DevolucionE
    Created on : 17/09/2021, 08:35:07 PM
    Author     : Vane
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <style>
          body {
               background-image: url("IMG/fondo_4.jpg");
               background-position: center;
               background-size: cover;
               height: 100vh;
               min-height: 600px;
               }
                .input{
                      background-repeat:no-repeat;
                 
                background-position:right;
                margin-right:600px!important;
                     }
                     .derecha   { float: right; }
.izquierda { float: left;  }
                
                
               table {
                     background-color: #3F9FEA;
                     }
                     h1{
                         align: center;
                     }
    </style>
    <body>
        <h1>Hello World!</h1>
        <form align="center">
        <h1>DEVOLUCION Equipamiento</h1>
        <table align="center" border="5" width="50%" class="table table-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>
                                <th>NO</th>
                                <th>ID</th>
                                <th>NOMBRE</th>
                                <th>DIRECCION</th>
                                <th>TELEFONO</th>
                                <th>CORREO</th>
                                <th>TIEMPO</th>
                                <th>MEGAS</th>
                                <th>TARIFA</th>
                                <th>FECHA</th>
                                <th>GRUPO</th>
                                <th>COMENTARIOS</th>
                                <th>DEVOLVER</th>
                                
                            </tr>
		         </thead>
                            <%
                             Clientes objs = new Clientes();
                             Vector usu = new Vector();
                             usu=objs.mostrarMatDev();
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Clientes)usu.get(i);
                             %>
                             <tr>
                                <td><%= objs.getNumero()%></td> 
                                <td><%= objs.getId()%></td>
                                <td><%= objs.getNombre()%></td>
                                <td><%= objs.getDireccion()%></td>
                                <td><%= objs.getTelefono()%></td>
                                <td><%= objs.getCorreo()%></td>
                                <td><%= objs.getTiempo()%></td>
                                <td><%= objs.getMegas()%></td>
                                <td><%= objs.getTarifa()%></td>
                                <td><%= objs.getFecha()%></td>
                                <td><%= objs.getGrupo()%></td>
                                <td><%= objs.getComentarios()%></td>
                                <td align="center" ><a href="DevolucionWisp.jsp?txtpara=M&id=<%= objs.getId()%>">
                                     <img src="IMG/peticion.svg" width="25px" height="25px"> </td>
                                  </tr>
                                <%}%>
                </table> 
        </form>
    </body>
</html>
