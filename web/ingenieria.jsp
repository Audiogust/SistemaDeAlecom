<%-- 
    Document   : ingenieria
    Created on : 11-abr-2021, 20:55:38
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
            background-image: url("Imagenes/Fondo2.jpg");
            background-position: center;
            background-size: cover;
            height: 100vh;
            min-height: 600px;
            background-color:rgba(0,0,255, 0.3);
        }
       .boton{
             background-repeat:no-repeat;
             height:200px;
             width:200px;
             background-position:center;
             margin-right:14px!important;
             }
             .letra{
                 font-size: 19px;
             }
    </style>
    <body>      
        <form align="center" action="controlFull.do" method="post">

            <div class="table-responsive" align="center">
                <a href="MenuPrincipal.jsp"> <img src="IMG/logotipo.png" width="250" height="100" HSPACE="20"></a>
                <h1 align="center">Consultar Proyectos</h1>
                <input type="text" name="nombre" value="" class="form-control" placeholder="Nombre Proyecto"> 
                <button type="submit" name="opcion" value="BuscarProyecto" class="btn btn-primary">Buscar</button>

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

                        String n = request.getParameter("nombre");
                        Proyecto objs = new Proyecto();
                        Vector usu = new Vector();
                        usu = objs.mostrarBusqueda(n);

                        for (int i = 0; i < usu.size(); i++) {
                            objs = (Proyecto) usu.get(i);
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
                        <td align="center" ><a href="Listado.jsp?txtpara=M&id=<%= objs.getOtiga()%>">
                                <img src="IMG/peticion.svg" width="25px" height="25px"> </td>
                                </tr>
                                <%}%>
                      </table> 
                </div>           
            </form>
      </body>
 </html>
