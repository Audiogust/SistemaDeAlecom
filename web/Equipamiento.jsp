<%-- 
    Document   : Equipamiento
    Created on : 22/08/2021, 09:51:59 PM
    Author     : Vane
--%>

<%@page import="Modelo.Material1"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.Clientes"%>
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
                background-image: url("IMG/fondo_4.jpg");
                background-position: center;
                background-size: cover;
                height: 100vh;
                min-height: 600px;
                }
                 .input{
                       background-repeat:no-repeat;
                 
                 background-position:right;
                 margin-right:600px!important;
                      }
                      .derecha   { float: right; }
.izquierda { float: left;  }
                
                
                table {
                      background-color: #3F9FEA;
                      }
                      h1{
                          align: center;
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
            String id="";
            

            if (VPara.equals("N") == false) {
                
                p.buscarClientes(idd);
                nombre = p.getNombre();
                id = p.getId();              
            }
            
        %>
        <h1> EQUIPAMIENTO </h1>
        <center>
        <form action="controlClientes.do" method="post">
            
            <div>
            <td width="50%"><input type="text" size="53" name="id_wisp"  value="<%= id%>" id="textfield"></td>
            <td width="50%"><input type="text" size="53"  value="<%= nombre%>" id="textfield"></td>          
            
            </div>
            
          
            <table align="center" border="5" width="50%" class="table table-dark table-bordered table-hover table-responsive-sm">
  	                 <thead class="bg-info"> 
                            <tr>
                                <th>ID</th>
                                <th>MARCA</th>
                                <th>TIPO</th>
                                <th>DISPOSITVO</th>
                                <th>EXISTENCIA</th>
                                <th>SOLICITADO</th>                               
                            </tr>
		         </thead>
                            <%
                             Material1 objs = new Material1();
                             Vector usu = new Vector();
                             usu=objs.mostrarE();
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Material1)usu.get(i);
                             %>
                             <tr>
                                 <td><%= objs.getId()%></td>
                                 <td><input class="table-dark" type="text" value="<%= objs.getMarca()%>" name="marca"></td>
                                 <td><%= objs.getTipo()%></td>
                                 <td><%= objs.getDispositivo()%></td>
                                 <td><%= objs.getExistencia()%></td>
                                 <td><input class="formulario__campo" type="number" name="cantidades"   placeholder="Cantidad" min="0"></td> 
                               
                             </tr>
                                <%}%>
                                
                                  
                     <input type="hidden" name="txtpara" value=<%=VPara%> />
                     
                        
                </table>
               
                 <button type="submit" name="opcion" value="guardarEquipamiento" class="btn btn-success">Solicitar Equipamiento</button>
          
        </form>
        </center>
    </body>
</html>
