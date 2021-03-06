<%@page import="Modelo.MaterialSolicitado"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.Material"%>
<%@page import="Modelo.Precompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Preorden de compra</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
    </head>
    <body>
        
        <%
            HttpSession sesion=request.getSession();
            MaterialSolicitado producto=(MaterialSolicitado)sesion.getAttribute("proyectos"); 
            MaterialSolicitado p = new MaterialSolicitado();
            String VPara = request.getParameter("txtpara");
            String idd = request.getParameter("id");
            String nombre="";
            String otiga="";
            String codigo="";
            String unidad="";
            int existencia=0;
            String solicitado="";

            if (VPara.equals("N") == false) {           
                p.buscarSolicitudPrecompra(idd);
                nombre = p.getNombre();
                otiga = p.getOtiga();
                codigo = p.getCodigo();
                unidad = p.getUnidades();
                existencia = p.getExistencia();
                solicitado = p.getSolicitado();
            }
            
        %>
        
        <h1>Preorden</h1>
        
        <center>
            <form action="controlFull.do" method="post">
            
            <div>
            <td width="50%"><input type="text" size="53" name="folioextraer"  value="${folioo}" id="textfield"></td>
          
            <td width="50%"><input type="text" size="53" name="folionumeros"  value="${numeroS}" id="textfield"></td>
            </div>
            
          
            <table align="center" border="5" width="50%" class="table table-light table-bordered table-hover table-responsive-sm">
  	                 <thead class="bg-info"> 
                            <tr>
                                <th>CODIGO</th>
                                <th>MATERIAL</th>
                                <th>UNIDAD</th>
                                <th>SOLICITADO</th>                               
                            </tr>
		         </thead>
                            <%
                             Material objs = new Material();
                             Vector usu = new Vector();
                             usu=objs.mostrar();
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Material)usu.get(i);
                                 
                               double r=((20*objs.getSalida()))/100;
                             %>
                             <tr <% if (objs.getExistencia() <= r) { %> class="table-danger" <%}%> >
                                 
                                 <td><input  type="text" value="<%= objs.getCodigo()%>" name="codC"></td>
                                 <td><%= objs.getDescripcion()%></td>
                                 <td><%= objs.getUnidad()%></td>
                                 <td><input class="formulario__campo" type="number" name="numerosC"  <% if(Integer.parseInt(solicitado) > objs.getExistencia()) {%> value="<%= (Integer.parseInt(solicitado) - objs.getExistencia())%>" <% } %>placeholder="Cantidad" min="0"></td> 
                               
                             </tr>
                                <%}%>
                                           
                        
                </table>
               
                 <button type="submit" name="opcion" value="botonPreordenAccion" class="btn btn-success">Generar</button>
          
        </form>
        </center>
    </body>
</html>
