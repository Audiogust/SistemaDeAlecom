<%-- 
    Document   : Materiales
    Created on : 12/05/2021, 02:25:03 PM
    Author     : Vane
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Material"%>
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
   </style>
    <body>
        <table align="center" border="5" width="50%" class="table table-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>
                                <th>CODIGO</th>
                                <th>DESCRIPCION</th>
                                <th>UNIDAD</th>
                                <th>EXISTENCIA</th>
                                <th>TOPE</th>
                                
                            </tr>
		         </thead>
                            <%
                             Material objs = new Material();
                             Vector usu = new Vector();
                             usu=objs.mostrar();
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Material)usu.get(i);
                                 
                              double r=((20*objs.getSalida()))/100;
                             %>
                             <tr>
                                <tr <% if (objs.getExistencia() <= r) { %> class="table-danger" <%}%> >
                                <td><%= objs.getCodigo()%></td>
                                <td><%= objs.getDescripcion()%></td>
                                <td><%= objs.getUnidad()%></td>
                                <td><%= objs.getExistencia()%></td>
                                <td><%= objs.getSalida()%></td>
                                
                                            
                             </tr>
                                <%}%>
                </table> 
    </body>
</html>
