<%-- 
    Document   : consultaPrecompra
    Created on : 26-may-2021, 13:42:22
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.OrdenPrecompra"%>
<%@page import="Modelo.Precompra"%>
<%@page import="Modelo.Proyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="table-responsive" align="center">
            <a href="MenuPrincipal.jsp"> <img src="IMG/logotipo.png" width="250" height="100" HSPACE="20"></a>
          <h1>Consulta Orden de Compra</h1>
        </div>
        <%
            HttpSession sesion = request.getSession();
            Precompra producto = (Precompra) sesion.getAttribute("precompra");
            Precompra p = new Precompra();
            String VPara = request.getParameter("txtpara");
            String idd = request.getParameter("id");
            String serie = "";
            String folio = "";

            if (VPara.equals("N") == false) {
                String id = idd;
                p.buscarPre(idd);
                serie = p.getNumeroSerie();
                folio = p.getFolio();
            }

        %>

    <center>
        <form action="controlFull.do" method="post">

            <div>
                <label align="center" class="input-group-text" width="50%">Folio para la Precompra: <%= folio%></label>
                <label align="center" class="input-group-text" width="50%">Numero : <%= serie%></label>
            
                <td width="50%"><input type="hidden" size="53" name="otiga"  value="<%= folio%>" id="textfield"></td>
                <td width="50%"><input type="hidden" size="53"  value="<%= serie%>" id="textfield"></td>        
            </div>


            <table align="center" border="5" width="50%" class="table table-dark table-bordered table-hover table-responsive-sm">
                <thead class="bg-info"> 
                    <tr>

                        <th>FOLIO</th>
                        <th>CODIGO</th>
                        <th>MATERIAL</th>
                        <th>SOLICITADO</th>     
                        <th>AITORIZAR</th>
                    </tr>
                </thead>
                <%
                    OrdenPrecompra objs = new OrdenPrecompra();
                    Vector usu = new Vector();
                    usu = objs.mostrarPre(folio);

                    for (int i = 0; i < usu.size(); i++) {
                        objs = (OrdenPrecompra) usu.get(i);
                %>
                <tr>                            
                    <td><%= objs.getFolio()%></td>
                    <td><%= objs.getCodigo()%><input type="hidden" name="codigosOrd" value="<%= objs.getCodigo()%>" disable></td>
                    <td><%= objs.getNombre()%></td>
                    <td><%= objs.getSolicitado()%></td>
                    <td><input class="formulario__campo" type="number" name="solicitadoOrd"   placeholder="Cantidad" min="0" ></td> 

                </tr>
                <%}%>

                <input type="hidden" name="txtpara" value=<%=VPara%> />

            </table>

            <button type="submit" name="opcion" value="autorizarExistencia" class="btn btn-success">validar Materiales</button>

        </form>
    </center>
        
    </body>
</html>
