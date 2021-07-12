<%-- 
    Document   : HistorialDevW
    Created on : 01-jul-2021, 19:06:08
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.MaterialSolicitado"%>
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
         <%
            HttpSession sesion=request.getSession();
            Clientes producto=(Clientes)sesion.getAttribute("clientes"); 
            Clientes p = new Clientes();
            String VPara = request.getParameter("txtpara");
            String idd = request.getParameter("id");
            String nombre="";
            String otiga="";
            

            if (VPara.equals("N") == false) {           
                p.buscarClientes(idd);
                nombre = p.getNombre();
                otiga = p.getId();              
            }
            
        %>
        <form align="center" method="post">
        <h1>Historial Materiales solicitados</h1>
        <div class="table-responsive">
        <td width="50%"><input type="text" size="53" name="otiga_1"  value="<%= otiga%>" id="textfield"></td>
             <!--   <input type="text" name="codigo" value="" class="form-control" placeholder="OTIGA"> 
                    <button type="submit" name="opcion" value="BuscarSolicitud" class="btn btn-outline-info">Buscar</button>
             -->
           <br>
           <div  class="table-responsive">
           <table align="right" border="5" width="50%" class="table table-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>                              
                                <th>Id</th>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Unidad</th>
                                <th>Existencia</th>                             
                                <th>Devolver</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                            </tr>
		         </thead>
                            <%
                                
                              String ide = request.getParameter("otiga_1");
                             String n=request.getParameter("codigo");
                             MaterialSolicitado objs = new MaterialSolicitado();                
                            
                             Vector usu = new Vector();
                             usu=objs.mostrarHDW(otiga);                           
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(MaterialSolicitado)usu.get(i);
                               
                             %>
                             <tr>
                                
                                <td><%= objs.getOtiga()%></td>
                                <td><%= objs.getCodigo()%></td>
                                <td><%= objs.getNombre()%></td>
                                <td><%= objs.getUnidades()%></td>                                
                                <td><%= objs.getExistencia()%></td>                                  
                                <td><%= objs.getSolicitado()%></td>
                                <td><%= objs.getFecha()%></td>                                  
                                <td><%= objs.getHora()%></td>
                             </tr>
                                <%}%>  
                   <input type="hidden" name="txtpara" value=<%=VPara%> />
                </table>
                <div>
             </div>
        </div>
    </body>
</html>
