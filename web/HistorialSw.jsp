<%-- 
    Document   : HistorialSw
    Created on : 18-jun-2021, 11:50:46
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
        <title>JSP Page</title>
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
                <h1>Historial Material Solicitado</h1>
            </div> 
        <form   align="center" method="post"">
        <div class="table-responsive">
            <div>
            <label align="center" class="input-group-text" width="50%">ID Cliente: <%= otiga%></label>
            <label align="center" class="input-group-text" width="50%">NOMBRE Cliente: <%= nombre%></label>    
            </div>
            
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
                             usu=objs.mostrarHistoW(otiga);                           
                             
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
