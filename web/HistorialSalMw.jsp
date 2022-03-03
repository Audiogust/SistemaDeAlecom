<%-- 
    Document   : HistorialSalMw
    Created on : 01-jul-2021, 18:27:00
    Author     : Hp
--%>

<%@page import="Modelo.EquipamientoSolicitado"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.MaterialSolicitado"%>
<%@page import="Modelo.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
        <title>WISP-GAL</title>
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
        
        <div align="center">                   
                <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
                <h1>Historial  Salida</h1>
        </div>
        <form align="center" method="post">
        
        
        <div>
            <label align="center" class="input-group-text" width="50%">ID Cliente: <%= otiga%></label>
            <label align="center" class="input-group-text" width="50%">NOMBRE Cliente: <%= nombre%></label>    
        </div>
        <div class="table-responsive">
        <td width="50%"><input type="hidden" size="53" name="otiga_1"  value="<%= otiga%>" id="textfield"></td>
             <!--   <input type="text" name="codigo" value="" class="form-control" placeholder="OTIGA"> 
                    <button type="submit" name="opcion" value="BuscarSolicitud" class="btn btn-outline-info">Buscar</button>
             -->
           <br>
           <div  class="table-responsive">
           <h1>Materiales</h1>
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
                                
                              String ide = request.getParameter("otiga_1");
                             String n=request.getParameter("codigo");
                             MaterialSolicitado objs = new MaterialSolicitado();                
                            
                             Vector usu = new Vector();
                             usu=objs.mostrarHSW(otiga);                           
                             
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
                
           <h1>Equipamiento</h1>
           <table align="right" border="5" width="50%" class="table table-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>                              
                                <th>otiga</th>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Existencia Anterior</th>                             
                                <th>Solicitado</th>
                                <th>Existencia Actual</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                            </tr>
		         </thead>
                            <%
                                
                             EquipamientoSolicitado objss = new EquipamientoSolicitado();
                            
                             Vector usue = new Vector();
                             usue=objss.mostrarHistoWE(otiga);                           
                             
                             for(int i=0; i<usue.size();i++){
                                 objss=(EquipamientoSolicitado)usue.get(i);
                               
                             %>
                             <tr>
                                
                                 <td><%= objss.getID()%></td>
                                <td><%= objss.getCodigo()%></td>
                                <td><%= objss.getDispositivo()%></td>                                  
                                <td><%= objss.getExistencia()%></td>                                  
                                <td><%= objss.getSolicitado()%></td>
                                <td><%= objss.getExistencia_act()%></td>
                                <td><%= objss.getFecha()%></td>                                  
                                <td><%= objss.getHora()%></td>
                             </tr>
                                <%}%>  
                  
           </table>
                <div>
             </div>
        </div>
    </body>
</html>
