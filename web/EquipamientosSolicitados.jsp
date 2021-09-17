<%-- 
    Document   : EquipamientosSolicitados
    Created on : 6/09/2021, 09:20:53 PM
    Author     : Vane
--%>

<%@page import="Modelo.Clientes"%>
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
    <body>
        <style>
               body {
               background-color: #8BADC4;
               background-position: center;
               background-size: cover;
               height: 100vh;
               min-height: 600px;
               }
    </style>
        
        <form action="controlClientes.do" method="post" align="center">
            <h1>Equipamientos Solicitados</h1>
            <div class="container" align="center">
                <input type="text" name="nombre" value="" class="form-control" placeholder="Equipamiento"> 
                <br>
                <button type="submit" name="opcion" value="BuscarClientesS" class="btn btn-info">Buscar</button>
            </div>
            <br><table align="center" border="5" width="50%" class="table thead-dark table-bordered table-hover">
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
                                <th>SELECCIONAR</th>
                            </tr>
		         </thead>
                            <%
                                
                             String n=request.getParameter("nombre");
                             Clientes objs = new Clientes();
                             Vector usu = new Vector();
                             usu=objs.mostrarBusquedamM(n);
                             
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
                                
                                <td align="center" ><a href="SolicitudEqui.jsp?txtpara=M&id=<%= objs.getId()%>">
                                     <img src="IMG/formato1.png" width="25px" height="25px"> </td>
                             </tr>
                                <%}%>
                </table>
        </form>
    </body>
</html>
