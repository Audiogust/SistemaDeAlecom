<%-- 
    Document   : OrdenCompra
    Created on : 24-may-2021, 15:14:34
    Author     : Hp
--%>

<%@page import="Modelo.Precompra"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Folios</h1>
         <br><table align="center" border="5" width="50%" class="table thead-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>
                                
                                <th>Nummero de Serie</th>
                                <th>Folio</th>
                                <th>Consulta de materiales</th>
                                
                            </tr>
		         </thead>
                            <%
                                                            
                             Precompra objs = new Precompra();
                             Vector usu = new Vector();
                             usu=objs.mostrartabla();
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Precompra)usu.get(i);
                                 
                             %>
                             <tr>
                                <td><%= objs.getNumeroSerie()%></td>
                                <td><%= objs.getFolio()%></td>
                                <td align="center" ><a href="consultaPrecompra.jsp?txtpara=M&id=<%= objs.getFolio()%>">
                                     <img src="IMG/peticion.svg" width="25px" height="25px"> </td>
                             </tr>
                                <%}%>
                </table>
        
    </body>
</html>
