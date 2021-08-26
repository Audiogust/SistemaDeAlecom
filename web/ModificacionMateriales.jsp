<%-- 
    Document   : ModificacionMateriales
    Created on : 28/05/2021, 09:50:05 PM
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
       background-color:rgba(0,0,255, 0.3);
       background-position: center;
       
       }
    </style>
    <body>
        <div align="center">
            <a href="MenuPrincipal.jsp"> <img src="IMG/logotipo.png" width="250" height="100" HSPACE="20"></a>
        </div>
        <br>
        <h1>Modificar</h1>
        <table align="center" border="5" width="50%" class="table table-dark table-bordered table-hover">
            <thead class="bg-info"> 
                <tr>
                    <th>CODIGO</th>
                    <th>DESCRIPCION</th>
                    <th>UNIDAD</th>
                    <th>EXISTENCIA</th>
                    <th>TOPE</th>
                    <th>EDITAR</th>

                </tr>
            </thead>
            <%
                Material objs = new Material();
                Vector usu = new Vector();
                usu = objs.mostrar();

                for (int i = 0; i < usu.size(); i++) {
                    objs = (Material) usu.get(i);
            %>
            <tr>
                <td><%= objs.getCodigo()%></td>
                <td><%= objs.getDescripcion()%></td>
                <td><%= objs.getUnidad()%></td>
                <td><%= objs.getExistencia()%></td>
                <td><%= objs.getSalida()%></td>
                <td align="center" ><a href="EditarMat.jsp?txtpara=M&id=<%=objs.getCodigo()%>">
                        <img src="IMG/editar.svg" width="25px" height="25px"> </td>
            </tr>
                        <%}%>
        </table> 
    </body>
</html>
