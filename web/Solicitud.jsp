<%-- 
    Document   : Solicitud
    Created on : 16/05/2021, 11:55:29 PM
    Author     : Vane
--%>

<%@page import="Modelo.Precompra"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.MaterialSolicitadoWisp"%>
<%@page import="Modelo.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">    
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
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
        <div align="center">                    
            <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
        </div>
        <form align="center" action="controlClientes.do" method="post">
            <h1>Consultar Solicitud</h1>
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
                            String numeroSerie;
                            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                            Calendar cal = Calendar.getInstance();
                            String fechaa = dateFormat.format(cal.getTime());
                            String folio = "PREOC-";
                            folio = folio + fechaa;

                            Precompra pc = new Precompra();
                            Precompra pc1 = new Precompra();
                            numeroSerie = pc.GenerarSerie();

                            if (numeroSerie == null) {
                                numeroSerie = "0001";
                                folio = folio + "-A" + numeroSerie;
                                request.setAttribute("folioo", folio);
                                request.setAttribute("numeroS", numeroSerie);
                            } else {
                                int incrementador = Integer.parseInt(numeroSerie);
                                numeroSerie = pc1.numeros(incrementador);
                                folio = folio + "-A" + numeroSerie;
                                request.setAttribute("folioo", folio);
                                request.setAttribute("numeroS", numeroSerie);
                                System.out.println(numeroSerie);
                            }
                            
                            
                            String n = request.getParameter("codigo");
                            MaterialSolicitadoWisp objs = new MaterialSolicitadoWisp();
                            int cont=0;
                            Vector usu = new Vector();
                            usu = objs.mostrarWisp(id);

                            for (int i = 0; i < usu.size(); i++) {
                                objs = (MaterialSolicitadoWisp) usu.get(i);

                        %>
                        <tr <% if (objs.getSolicitado() > objs.getExistencia()) {
                            cont++; %> class="table-danger" <%}%>>
                            <td><%= objs.getIde()%></td>
                            <td><%= objs.getID()%></td>
                            <td><label><%= objs.getCodigo()%> </label> <input type="hidden" name="codigoW" value="<%= objs.getCodigo()%>" disable></td>
                            <td><%= objs.getNombre()%></td>
                            <td><%= objs.getUnnidades()%></td>
                            <td><%= objs.getExistencia()%></td>
                            <td><%= objs.getSolicitado()%><input type="hidden"  name="numerosW" value="<%= objs.getSolicitado()%>"></td>                              
                             <% int resultado;
                                    if (objs.getExistencia() > objs.getSolicitado()) {
                                        resultado = objs.getSolicitado();
                                    } else {
                                        resultado = 0;
                                    }%>  
                            <td><input class="formulario__campo" type="number" value="<%=resultado%>"  placeholder="Cantidad" min="0" max="<%= objs.getExistencia()%>" ></td>
                        </tr>
                        <%}%>  
                        <input type="hidden" name="txtpara" value=<%=VPara%> />
                    </table>
                    <button type="submit" name="opcion" value="guardarAlmacen" class="btn btn-success">Enviar</button>
                    
                    
                    <% if (cont > 0) {%>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Generar Precompra</button>
                    <% }%>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Crear Precompra</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    ¿Quieres general el folio <%=folio%>  para el Cliente <%= id%>?
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" name="opcion" value="enviarPrecompraM" class="btn btn-success">Confirmar Precompra</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>

                                </div>
                            </div>
                        </div>
                    </div> 
                    
                </div>
            </div>
        </form>
    </center>   
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
    </body>
</html>
