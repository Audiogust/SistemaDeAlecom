<%-- 
    Document   : Listado
    Created on : 18-abr-2021, 19:55:18
    Author     : Hp
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Proyecto"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.Material"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <style>
        body{
        background-color:rgba(0,0,255, 0.3);    
        }
        
    </style>
    <body>
        <h1 align="center">Solicitar Materiales</h1>
        <%
            HttpSession sesion=request.getSession();
            Proyecto producto=(Proyecto)sesion.getAttribute("proyectos"); 
            Proyecto p = new Proyecto();
            String VPara = request.getParameter("txtpara");
            String idd = request.getParameter("id");
            String nombre="";
            String otiga="";
            

            if (VPara.equals("N") == false) {
                String id = idd;
                p.buscarProyecto(idd);
                nombre = p.getNombre();
                otiga = p.getOtiga();              
            }
            
        %>
        <center>
        <form action="controlFull.do" method="post">
            <div>
            <td width="50%"><input type="text" size="53" name="otiga"  value="<%= otiga%>" id="textfield"></td>
            <td width="50%"><input type="text" size="53"  value="<%= nombre%>" id="textfield"></td>          
            </div>
            
            <table align="center" border="5" width="50%" class="table table-dark table-bordered table-hover table-responsive-sm">
  	                 <thead class="bg-info"> 
                            <tr>
                                <th>CODIGO</th>
                                <th>MATERIAL</th>
                                <th>UNIDAD</th>
                                <th>EXISTENCIA</th>
                                <th>SOLICITADO</th>                               
                            </tr>
		         </thead>
                            <%
                             Material objs = new Material();
                             Vector usu = new Vector();
                             usu=objs.mostrar();
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Material)usu.get(i);
                             %>
                             <tr>

                                 <td><label><input class="table-dark" type="text" value="<%= objs.getCodigo()%>" name="cod"></label></td>
                                 <td><%= objs.getDescripcion()%></td>
                                 <td><%= objs.getUnidad()%></td>
                                 <td><%= objs.getExistencia()%></td>
                                 <td><input class="formulario__campo" type="number" name="numeros"   placeholder="Cantidad" min="0"></td> 
                               
                             </tr>
                                <%}%>
                                  
                     <input type="hidden" name="txtpara" value=<%=VPara%> />
                     
                </table>
               
                 <button type="submit" name="opcion" value="enviarDatos" class="btn btn-success">Solicitar Materiales</button>
        </form>
        </center>
    </body>
</html>
