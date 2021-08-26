<%-- 
    Document   : busquedaSM
    Created on : 05-may-2021, 13:16:13
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
            <style>
               body {
               background-color: #8BADC4;
               background-position: center;
               background-size: cover;
               height: 100vh;
               min-height: 600px;
               background-color:rgba(0,0,255, 0.3);
               }
    </style>
    <body>
       <h1 align="center">Busqueda Proyectos</h1>
        <form align="center" action="controlFull.do" method="post">
        <div class="form-group d-flex">
            <div>
                <div class="container" align="center">
                <input align="center" type="text" name="nombre" value="" class="form-control" placeholder="Nombre de Proyecto"> 
                <button type="submit" name="opcion" value="BuscarProyectoS" class="btn btn-primary">Buscar</button>
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
                                <th>TIPO prueba</th>
                                <th>SOLICITUD DE MATERIALES</th>
                            </tr>
		         </thead>
                            <%
                                
                             String n=request.getParameter("nombre");
                             Proyecto objs = new Proyecto();
                             Vector usu = new Vector();
                             usu=objs.mostrarBusquedaS(n);
                             
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
                                <td align="center" ><a href="consultaSolicitud.jsp?txtpara=M&id=<%= objs.getOtiga()%>">
                                     <img src="IMG/peticion.svg" width="25px" height="25px"> </td>
                             </tr>
                                <%}%>
                </table> 
            
             </div>
        </div>
 </form>
    </body>
</html>
