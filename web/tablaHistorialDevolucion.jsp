<%-- 
    Document   : tablaHistorialDevolucion
    Created on : 25-jun-2021, 10:45:07
    Author     : Hp
--%>

<%@page import="Modelo.Proyecto"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
       
        <h1>Historiales Devoluciones</h1>
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
                             usu=objs.mostrarTablaProyectos();
                             
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
                                <td align="center" ><a href="historialDevolucion.jsp?txtpara=M&id=<%= objs.getOtiga()%>">
                                     <img src="IMG/historialico.png" width="25px" height="25px"> </td>
                             </tr>
                                <%}%>
                </table>
    </body>
</html>
