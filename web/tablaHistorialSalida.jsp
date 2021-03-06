<%-- 
    Document   : tablaHistorialSalida
    Created on : 17-jun-2021, 17:26:29
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">    
    </head>
    <style>
               body {
               background-color: #B2D0EE;
               background-position: center;
               background-size: cover;
               height: 100vh;
               min-height: 600px;
               }
    </style>
    <body>
        <div class="table-responsive" align="center">
                <a href="MenuPrincipal.jsp"> <img src="IMG/logotipo.png" width="250" height="100" HSPACE="20"></a>
        <h1>Historiales Salida de Materiales</h1>
        </div>
        
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
                                <td align="center" ><a href="historialSalida.jsp?txtpara=M&id=<%= objs.getOtiga()%>">
                                     <img src="IMG/historialico.png" width="25px" height="25px"> </td>
                             </tr>
                                <%}%>
                </table>
    </body>
</html>
