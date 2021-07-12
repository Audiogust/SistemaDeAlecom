<%-- 
    Document   : Solicitud
    Created on : 16/05/2021, 11:55:29 PM
    Author     : Vane
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.MaterialSolicitadoWisp"%>
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
        <form align="center" action="controlClientes.do" method="post">
            <h1>Consultar Solicitud</h1>
            <td width="50%"><input type="text" size="53" name="idt_1"  value="<%= id%>" id="textfield"></td>
             
            <div class="form-group d-flex">
                <div class="col-sm-6 ">

                    <br>
                    <table align="center" border="5" width=
                           "50%" class="table table-dark table-bordered table-hover">
                        <thead class="bg-info"> 
                            <tr>
                                <th>No</th>
                                <th>ID</th>
                                <th>CODIGO</th>
                                <th>NOMBRE</th>
                                <th>UNIDADES</th>  
                                <th>EXISTENCIA</th>                             
                                <th>SOLICITADO</th>
                                <th>CANTIDADES</th>
                                
                            </tr>
                        </thead>
                        <%                                
                            String n = request.getParameter("codigo");
                            MaterialSolicitadoWisp objs = new MaterialSolicitadoWisp();

                            Vector usu = new Vector();
                            usu = objs.mostrarWisp(id);

                            for (int i = 0; i < usu.size(); i++) {
                                objs = (MaterialSolicitadoWisp) usu.get(i);

                        %>
                        <tr <% if (objs.getSolicitado() > objs.getExistencia()) { %> class="table-danger" <%}%>>
                            <td><%= objs.getIde()%></td>
                            <td><%= objs.getID()%></td>
                            <td><input type="text" name="codigoW" value="<%= objs.getCodigo()%>" disable></td>
                            <td><%= objs.getNombre()%></td>
                            <td><%= objs.getUnnidades()%></td>
                            <td><%= objs.getExistencia()%></td>
                            <td><%= objs.getSolicitado()%></td>                              

                            <td><input class="formulario__campo" type="number" name="numerosW"   placeholder="Cantidad" min="0" max="<%= objs.getExistencia()%>" ></td>
                        </tr>
                        <%}%>  
                        <input type="hidden" name="txtpara" value=<%=VPara%> />
                    </table>
                    <button type="submit" name="opcion" value="guardarAlmacen" class="btn btn-success">Enviar</button>
                    <button type="submit" name="opcion" value="guardarPrecompra" class="btn btn-primary">Generar Precompra</button>
                </div>
            </div>
        </form>
    </center>   

        
    </body>
</html>
