<%-- 
    Document   : DevolucrionWisp
    Created on : 23/05/2021, 09:19:37 PM
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
                      h1{
                          align: center;
                      }
   </style>
    <body>
       
        <%
            HttpSession sesion = request.getSession();
            Clientes producto = (Clientes) sesion.getAttribute("clientes");
            Clientes c = new Clientes();
            String VPara = request.getParameter("txtpara");
            String idd = request.getParameter("id");
            String nombre = "";
            String id = "";

            if (VPara.equals("N") == false) {
                c.buscarClientes(idd);
                nombre = c.getNombre();
                id = c.getId();
            }

        %>
        <h1>DEVOLUCION MATERIALES</h1>
    <center>
        <form align="center" action="controlClientes.do" method="post">
            <td width="50%"><input type="text" size="53" name="idt_1"  value="<%= id%>" id="textfield"></td>
            <div class="form-group d-flex">
                <div class="col-sm-6 ">

                   
                    <br>
                    <table align="center" border="5" width="50%" class="table table-dark table-bordered table-hover">
                        <thead class="bg-info"> 
                            <tr>
                                <th>No</th>
                                <th>ID</th>
                                <th>CODIGO</th>
                                <th>NOMBRE/th>
                                <th>UNIDAD</th>
                                <th>SOLICITADO</th>                             
                                <th>SALIDA</th>
                                
                            </tr>
                        </thead>
                        <%

                            String n = request.getParameter("codigo");
                            MaterialSolicitadoWisp objs = new MaterialSolicitadoWisp();

                            Vector usu = new Vector();
                            usu = objs.mostrarMatDevo(id);

                            for (int i = 0; i < usu.size(); i++) {
                                objs = (MaterialSolicitadoWisp) usu.get(i);

                        %>
                        <tr>
                            <td><%= objs.getIde()%></td>
                            <td><%= objs.getID()%></td>
                            <td><input type="text" name="codigosw" value="<%= objs.getCodigo()%>" disable></td>
                            <td><%= objs.getNombre()%></td>
                            <td><%= objs.getUnnidades()%></td>                                
                            <td><%= objs.getSolicitado()%></td>                              

                            <td><input class="formulario__campo" type="number" name="devolucionw"   placeholder="Cantidad" min="0" max="" ></td>
                        </tr>
                        <%}%>  
                        <input type="hidden" name="txtpara" value=<%=VPara%> />
                    </table>
                    <button type="submit" name="opcion" value="guardarDevolucion" class="btn btn-success">Devolucion</button>
                </div>
            </div>
        </form>
    </center>
    </body>
</html>
