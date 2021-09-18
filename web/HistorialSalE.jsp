<%-- 
    Document   : HistorialSalE
    Created on : 17/09/2021, 08:17:01 PM
    Author     : Vane
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.EquipamientoSolicitado"%>
<%@page import="Modelo.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
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
        
        <form   align="center" method="post"">
        <h1>Historial Materiales solicitados</h1>
        <div class="table-responsive">
        <td width="50%"><input type="text" size="53" name="idt_1"  value="<%= otiga%>" id="textfield"></td>

             <!--   <input type="text" name="codigo" value="" class="form-control" placeholder="OTIGA"> 
                    <button type="submit" name="opcion" value="BuscarSolicitud" class="btn btn-outline-info">Buscar</button>
             -->
           <br>
           <div  class="table-responsive">
           <table align="right" border="5" width="50%" class="table table-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>   
                                    
                                    <th>OTIGA</th>
                                    <th>MARCA</th>
                                    <th>TIPO</th>
                                    <th>DISPOSITIVO</th>  
                                    <th>EXISTENCIA</th>                             
                                    <th>SOLICITADO</th>
                                    <th>FECHA</th>
                                    <th>HORA</th>

                            </tr>
                        </thead>

                            <%
                                String n = request.getParameter("codigo");
                                EquipamientoSolicitado objs = new EquipamientoSolicitado();

                                Vector usu = new Vector();
                                usu = objs.mostrarHistoE(otiga);

                                for (int i = 0; i < usu.size(); i++) {
                                    objs = (EquipamientoSolicitado) usu.get(i);

                            %>
                            <tr>
                                
                                <td><%= objs.getID()%></td>
                                <td><%= objs.getMarca()%></td>
                                <td><%= objs.getNombre()%></td>
                                <td><%= objs.getTipo()%></td>
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
