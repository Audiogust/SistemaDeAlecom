<%-- 
    Document   : Consulta
    Created on : 01-abr-2021, 8:26:54
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Material"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <h1>Consultar un material por codigo</h1>
        
   
       
 <form align="center" action="controlFull.do">
        <div class="form-group d-flex">
            <div class="col-sm-6 ">
                
                <input type="text" name="codigo" value="" class="form-control" placeholder="Nombre Material"> 
                <button type="submit" name="opcion" value="BuscarMaterial" class="btn btn-outline-info">Buscar</button>

           <br>
           <table align="center" border="5" width="50%" class="table table-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>
                                <th>CODIGO</th>
                                <th>DESCRIPCION</th>
                                <th>UNIDAD</th>
                                <th>EXISTENCIA</th>
                                <th>SALIDA</th>                                
                            </tr>
		         </thead>
                            <%
                                
                             String n=request.getParameter("codigo");
                             Material objs = new Material();
                             Vector usu = new Vector();
                             usu=objs.mostrarBusqueda(n);
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Material)usu.get(i);
                             %>
                             <tr>
                                <td><%= objs.getCodigo()%></td>
                                <td><%= objs.getDescripcion()%></td>
                                <td><%= objs.getUnidad()%></td>
                                <td><%= objs.getSalida()%></td>
                                <td><%= objs.getExistencia()%></td>
                                <td><%= objs.getSalida()%></td>                                           
                             </tr>
                                <%}%>
                </table>
            
             </div>
        </div>
 </form>
        
    </body>
</html>
