<%-- 
    Document   : consultaSolicitud
    Created on : 21-abr-2021, 10:32:25
    Author     : Hp
--%>

<%@page import="Modelo.Precompra"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Modelo.Proyecto"%>
<%@page import="Modelo.Material"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.MaterialSolicitado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/f90d3bf50d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <style>
       body {
       background-color:rgba(0,0,255, 0.3);
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
        <h1>Consultar solicitudes de Materiales</h1>
        </div>
        
        
        <form align="center" action="controlFull.do" method="post">
            <td width="50%"><input type="text" size="53" name="otiga_1"  value="<%= otiga%>" id="textfield"></td>

            <!--   <input type="text" name="codigo" value="" class="form-control" placeholder="OTIGA"> 
                   <button type="submit" name="opcion" value="BuscarSolicitud" class="btn btn-outline-info">Buscar</button>
            -->
            <br>
            <table align="right" border="5" width="50%" class="table table-light table-bordered table-hover">
                <thead class="bg-info"> 
                    <tr>
                        <th>id</th>
                        <th>otiga</th>
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Unidad</th>
                        <th>Existencia</th>
                        <th>Solicitado</th>                             
                        <th>Salida</th>
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
                    MaterialSolicitado objs = new MaterialSolicitado();
                    int cont=0;
                    Vector usu = new Vector();
                    usu = objs.mostrarBusqueda(otiga);

                    for (int i = 0; i < usu.size(); i++) {
                        objs = (MaterialSolicitado) usu.get(i);

                %>

                <tr <% if (Integer.parseInt(objs.getSolicitado()) > objs.getExistencia()) {
                    cont++;
                    %> class="table-danger" <%}%>>
                    <td><%= objs.getId()%></td>
                    <td><%= objs.getOtiga()%></td>
                    <td> <%= objs.getCodigo()%> <input type="hidden" name="codigosS" value="<%= objs.getCodigo()%>" ></td>
                    <td><%= objs.getNombre()%></td>
                    <td><%= objs.getUnidades()%></td>
                    <td><%= objs.getExistencia()%></td>
                    <td> <%= objs.getSolicitado()%> <input type="hidden" name="solicitadoF" value="<%= objs.getSolicitado()%>"></td>                                                          
                    <td><input class="formulario__campo" type="number" name="solicitudes"   placeholder="Cantidad" min="1" max="<%= objs.getExistencia()%>" ></td>
                </tr>
                <%}%>  
                <input type="hidden" name="txtpara" value=<%=VPara%> />
            </table>

            <button type="submit" name="opcion" value="enviarAlmacen" class="btn btn-success">Enviar</button>  
            <% if(cont>0) {%>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                Generar Precompra
            </button>
            <%}%>
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
                            ¿Quieres general el folio <%=folio %>?
                        </div>
                        <div class="modal-footer">
                            <button type="submit" name="opcion" value="enviarPrecompra" class="btn btn-success">Confirmar Precompra</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                            
                        </div>
                    </div>
                </div>
            </div> 

        </form> 
           
           
           <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
