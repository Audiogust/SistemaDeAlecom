<%-- 
    Document   : SolicitudMaterial
    Created on : 21-abr-2021, 9:54:57
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Proyecto"%>
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
       background-size: cover;
       height: 100vh;
       min-height: 600px;
       }
    </style>
    <body>
        <h1>Devolucion de Materiales</h1>
         <br><table align="center" border="5" width="50%" class="table thead-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>
                                <th>OTIGA</th>
                                <th>NOMBRE</th>
                                <th>REGION</th>
                                <th>DIRECCION</th>
                                <th>LATITUD</th>
                                <th>LONGITUD</th>
                                <th>ELEVACION</th>
                                <th>TECNOLOGIA</th>
                                <th>UBICACION</th>
                                <th>FECHA</th>
                                <th>AUTORIZADO-POR</th>
                                <th>TIPO</th>
                                <th>SOLICITUD DE MATERIALES</th>
                            </tr>
		         </thead>
                            <%
                                                            
                             Proyecto objs = new Proyecto();
                             Vector usu = new Vector();
                             usu=objs.mostrarTablaDevolucion();
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Proyecto)usu.get(i);
                                 
                             %>
                             <tr>
                                <td><%= objs.getOtiga()%></td>
                                <td><%= objs.getNombre()%></td>
                                <td><%= objs.getRegion()%></td>
                                <td><%= objs.getDireccion()%></td>
                                <td><%= objs.getLatitud()%></td>
                                <td><%= objs.getLongitud()%></td>
                                <td><%= objs.getElevacion()%></td>
                                <td><%= objs.getTecnologia()%></td>
                                <td><%= objs.getUbicacion()%></td>
                                <td><%= objs.getFecha()%></td>
                                <td><%= objs.getAutorizado()%></td>                                
                                <td><%= objs.getTipo()%></td>   
                                <td align="center" ><a href="DevolucionFull.jsp?txtpara=M&id=<%= objs.getOtiga()%>">
                                     <img src="IMG/peticion.svg" width="25px" height="25px"> </td>
                             </tr>
                                <%}%>
                </table>
    </body>
</html>
