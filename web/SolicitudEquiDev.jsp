<%-- 
    Document   : newjspSolicitudEquiDev
    Created on : 11-feb-2022, 17:32:29
    Author     : Hp
--%>

<%@page import="Modelo.Clientes"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.EquipamientoSolicitado"%>
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
   </style>
    <body>
      
         <%
            HttpSession sesion=request.getSession();
            Clientes producto=(Clientes)sesion.getAttribute("proyectos"); 
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
    <center>
        <form action="controlClientes.do" method="post">
            <div align="center">                   
            <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
            <h1>Devolucion de Equipamiento</h1>
            </div>            
            <label align="center" class="input-group-text" width="50%">ID Cliente: <%= id%></label>
            <label align="center" class="input-group-text" width="50%">Nombre Cliente: <%= nombre%></label>
            <td width="50%"><input type="hidden" size="53" name="idt_1"  value="<%= id%>" id="textfield"></td>
            <div>
                <div>

                    <br>
                    <table align="center" border="5" width=
                           "50%" class="table table-dark table-bordered table-hover">
                        <thead class="bg-info"> 
                            <tr>
                                    <th>IDE</th>
                                    <th>ID CLIENTE</th>
                                    <th>Identificador</th>
                                    <th>DISPOSITIVO</th>  
                                    <th>EXISTENCIA</th>                             
                                    <th>SOLICITADO</th>
                                    <th>CANTIDADES</th>

                            </tr>
                        </thead>

                            <%
                                
                                EquipamientoSolicitado objs = new EquipamientoSolicitado();
                                int cont=0;
                                Vector usu = new Vector();
                                usu = objs.mostrarEquiWisp(id);

                                for (int i = 0; i < usu.size(); i++) {
                                    objs = (EquipamientoSolicitado) usu.get(i);

                            %>
                            <tr <% if (objs.getIde() > objs.getExistencia()) { 
                                cont++; %> class="table-danger" <%}%>>
                                <td><%= objs.getIde()%></td>
                                <td><%= objs.getID()%></td>
                                <td><%= objs.getIden()%><input type="hidden" name="identificador" value="<%= objs.getIden()%>" disable></td>
                                <td><%= objs.getDispositivo()%></td>
                                <td><%= objs.getExistencia()%></td>                            
                                <td><%= objs.getSolicitado()%></td>                              

                                <td><input class="formulario__campo" type="number" name="numerosW"  placeholder="Cantidad" min="0" max="<%= objs.getExistencia()%>" ></td>
                            </tr>
                            <%}%>  
                            <input type="hidden" name="txtpara" value=<%=VPara%> />
                        </table>

                        <button type="submit" name="opcion" value="devolverEquipamiento" class="btn btn-success">Enviar</button>
                        
                        
                </div>
            </div>
        </form>
    </center>
    </body>
</html>
