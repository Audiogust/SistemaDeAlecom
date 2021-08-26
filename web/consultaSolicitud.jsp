<%-- 
    Document   : consultaSolicitud
    Created on : 21-abr-2021, 10:32:25
    Author     : Hp
--%>

<%@page import="Modelo.Proyecto"%>
<%@page import="Modelo.Material"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.MaterialSolicitado"%>
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
       background-color:rgba(0,0,255, 0.3);
       }
    </style>
    <body>
        
        <%
            HttpSession sesion=request.getSession();
            Proyecto producto=(Proyecto)sesion.getAttribute("proyectos"); 
            Proyecto p = new Proyecto();
            String VPara = request.getParameter("txtpara");
            String idd = request.getParameter("id");
            String nombre="";
            String otiga="";
            

            if (VPara.equals("N") == false) {           
                p.buscarProyecto(idd);
                nombre = p.getNombre();
                otiga = p.getOtiga();              
            }
            
        %>
        <h1>Consultar solicitudes de Materiales</h1>
        
   
        <form align="center" action="controlFull.do" method="post">
        <td width="50%"><input type="text" size="53" name="otiga_1"  value="<%= otiga%>" id="textfield"></td>
            
                
             <!--   <input type="text" name="codigo" value="" class="form-control" placeholder="OTIGA"> 
                    <button type="submit" name="opcion" value="BuscarSolicitud" class="btn btn-outline-info">Buscar</button>
             -->
           <br>
           <table align="right" border="5" width="50%" class="table table-light table-bordered table-hover">
               <thead class="bg-info"> 
                   <tr>
                       <th>id</th>
                       <th>otiga</th>
                       <th>Codigo</th>
                       <th>Nombre</th>
                       <th>Unidad</th>
                       <th>Existencia</th>
                       <th>Solicitado</th>                             
                       <th>Salida</th>
                   </tr>
               </thead>
               <%

                   String n = request.getParameter("codigo");
                   MaterialSolicitado objs = new MaterialSolicitado();

                   Vector usu = new Vector();
                   usu = objs.mostrarBusqueda(otiga);

                   for (int i = 0; i < usu.size(); i++) {
                       objs = (MaterialSolicitado) usu.get(i);

               %>

               <tr <% if (Integer.parseInt(objs.getSolicitado()) > objs.getExistencia()) { %> class="table-danger" <%}%>>
                   <td><%= objs.getId()%></td>
                   <td><%= objs.getOtiga()%></td>
                   <td><input type="text" name="codigosS" value="<%= objs.getCodigo()%>" ></td>
                   <td><%= objs.getNombre()%></td>
                   <td><%= objs.getUnidades()%></td>
                   <td><%= objs.getExistencia()%></td>
                   <td><input type="text" name="solicitadoF" value="<%= objs.getSolicitado()%>"></td>                                                          
                   <td><input class="formulario__campo" type="number" name="solicitudes"   placeholder="Cantidad" min="0" max="<%= objs.getExistencia()%>" ></td>
               </tr>
               <%}%>  
               <input type="hidden" name="txtpara" value=<%=VPara%> />
           </table>
           <button type="submit" name="opcion" value="enviarAlmacen" class="btn btn-success">Enviar</button>
           <button type="submit" name="opcion" value="enviarPrecompra" class="btn btn-primary">Generar Precompra</button>
           
 </form> 
    </body>
</html>
