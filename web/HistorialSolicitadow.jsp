<%-- 
    Document   : HistorialSolicitadow
    Created on : 18-jun-2021, 11:39:52
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <h1>Historiales</h1>
          <form action="controlClientes.do" method="post">
           
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
                                <th>MATERIALES SOLICITADOS  </th>
                            </tr>
		         </thead>
                            <%
                                
                             String n=request.getParameter("nombre");
                             Clientes objs = new Clientes();
                             Vector usu = new Vector();
                             usu=objs.mostrar();
                             
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
                                
                                <td align="center" ><a href="HistorialSw.jsp?txtpara=M&id=<%= objs.getId()%>">
                                     <img src="IMG/formato1.png" width="25px" height="25px"> </td>
                             </tr>
                                <%}%>
                </table>
        </form>
    </body>
</html>