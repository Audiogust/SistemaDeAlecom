<%-- 
    Document   : historialSolicitaciones
    Created on : 17-jun-2021, 13:59:23
    Author     : Hp
--%>

<%@page import="Modelo.MaterialSolicitado"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FULL-SWAP 5G</title>
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
     <style>
               body {
               background-color: #B2D0EE;
               background-position: center;
               background-size: cover;
               height: 100vh;
               min-height: 600px;
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
        
        <div class="table-responsive" align="center">
                <a href="MenuPrincipal.jsp"> <img src="IMG/logotipo.png" width="250" height="100" HSPACE="20"></a>
        <h1>Historial Materiales solicitados</h1>
        </div>
         <div>
            <label align="center" class="input-group-text" width="50%">OTIGA: <%= otiga%></label>
            <label align="center" class="input-group-text" width="50%">NOMBRE Proyecto: <%= nombre%></label>    
         </div>
        
        <div class="table-responsive">
        <form align="center" action="controlFull.do" method="post">
        <td width="50%"><input type="hidden" size="53" name="otiga_1"  value="<%= otiga%>" id="textfield"></td>
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
                                <th>Existencia</th>                             
                                <th>Solicitado</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                            </tr>
		         </thead>
                            <%
                                
                             String n=request.getParameter("codigo");
                             MaterialSolicitado objs = new MaterialSolicitado();                
                            
                             Vector usu = new Vector();
                             usu=objs.mostrarHisto(otiga);                           
                             
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
 </form>
    </body>
</html>
