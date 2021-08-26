<%-- 
    Document   : DevolucionFull
    Created on : 22-may-2021, 23:52:46
    Author     : Hp
--%>

<%@page import="Modelo.Proyecto"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.MaterialSolicitado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
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
        <h1>DEVOLUCION</h1>
        <div class="table-responsive">
        <form align="center" action="controlFull.do" method="post">
        <td width="50%"><input type="text" size="53" name="otiga_1"  value="<%= otiga%>" id="textfield"></td>
             <!--   <input type="text" name="codigo" value="" class="form-control" placeholder="OTIGA"> 
                    <button type="submit" name="opcion" value="BuscarSolicitud" class="btn btn-outline-info">Buscar</button>
             -->
           <br>
           <div  class="table-responsive">
           <table align="right" border="5" width="50%" class="table table-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr> 
                                <th>otiga</th>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Unidad</th>
                                <th>Solicitado</th>                             
                                <th>Devolucion</th>
                            </tr>
		         </thead>
                            <%
                                
                             String n=request.getParameter("codigo");
                             MaterialSolicitado objs = new MaterialSolicitado();                
                            
                             
                             Vector usu = new Vector();
                             usu=objs.mostrarDev(otiga);                           
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(MaterialSolicitado)usu.get(i);
                               
                             %>
                             <tr>
                                
                                <td ><%= objs.getOtiga()%></td>
                                <td><label><input type="text" name="codigosDev" value="<%= objs.getCodigo()%>" disable></label></td>
                                <td><%= objs.getNombre()%></td>
                                <td><%= objs.getUnidades()%></td>                                
                                <td><%= objs.getSolicitado()%></td>                              
                             
                                <td><input class="formulario__campo" type="number"  name="devoluciones"   placeholder="Cantidad" min="0" max="<%= objs.getSolicitado() %>" ></td>
                             </tr>
                                <%}%>  
                   <input type="hidden" name="txtpara" value=<%=VPara%> />
                </table>
                <div>
                   <button type="submit" name="opcion" value="enviarDevolucion" class="btn btn-success">Enviar</button>
             </div>
        </div>
 </form>
                                
    </body>
</html>
