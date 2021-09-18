<%-- 
    Document   : Instalacion
    Created on : 9/05/2021, 10:43:19 PM
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
   </style>
    <body>
         <form align="center" action="controlClientes.do" method="post">
             <h1>Consultar Grupo</h1>
                <p><label>Grupo:</label>
                        <select name="grupo_consultar" id="grupo">
                                        <option value="0"></option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        </select>
                <button type="submit" name="opcion" value="BuscarGrupo" class="btn btn-outline-success">Consultar grupo</button>
                <br>
                <br>
                 <table align="center" border="5" width="50%" class="table table-dark table-bordered table-hover">
                 <thead class="bg-info"> 
                            <tr>
                                
                                <th>ID</th>
                                <th>NOMBRE</th>
                                <th>DIRECCION</th>
                                <th>MEGAS</th> 
                                <th>MATERIALES</th>
                                <th>EQUIPAMIENTO</th>
                            </tr>
                           
		         </thead>
                           <%
                             String n=request.getParameter("grupo_consultar");
                             Clientes objs = new Clientes();
                             Vector usu = new Vector();
                             usu=objs.mostrarClientes(n);
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Clientes)usu.get(i);
                             %>
                             <tr>
                            
                                <td><%= objs.getId()%></td> 
                                <td><%= objs.getNombre()%></td> 
                                <td><%= objs.getDireccion()%></td>
                                <td><%= objs.getMegas()%></td>
                           
                             <td align="center" ><a href="Formato.jsp?txtpara=M&id=<%= objs.getId()%>">
                                     <img src="IMG/formato1.png" width="25px" height="25px"> </td>
                                     
                            <td align="center" ><a href="Equipamiento.jsp?txtpara=M&id=<%= objs.getId()%>">
                                     <img src="IMG/formato1.png" width="25px" height="25px"> </td>
                                
                             </tr>
                                <%}%>
                           
                </table> 
                </form>
         <font face="Arial, Gadget, sans-serif"><a href="http://localhost:8080/SistemaDeAlecom/Wisp.jsp">Menu principal</a></font>
    </body>
</html>
