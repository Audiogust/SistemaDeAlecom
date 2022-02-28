<%-- 
    Document   : consultaFolioPrecompra
    Created on : 23-ago-2021, 22:43:24
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.OrdenPrecompra"%>
<%@page import="Modelo.Precompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>FULL-SWAP 5G</title>
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
    </head>
    <body>
        <div class="table-responsive" align="center">
            <a href="MenuPrincipal.jsp"> <img src="IMG/logotipo.png" width="250" height="100" HSPACE="20"></a>
           <h1>Consulta Folio Preorden</h1>
        </div>
       
        <%
            HttpSession sesion = request.getSession();
            Precompra producto = (Precompra) sesion.getAttribute("precompra");
            Precompra p = new Precompra();
            String VPara = request.getParameter("txtpara");
            String idd = request.getParameter("id");
            String serie = "";
            String otiga="";
            String folio = "";

            if (VPara.equals("N") == false) {
                String id = idd;
                p.buscarPre(idd);
                serie = p.getNumeroSerie();
                otiga = p.getOtiga();
                folio = p.getFolio();
            }

        %>

        <style>
        body {
                background-image: url("Imagenes/Fondo2.jpg");
                background-position: center;
                background-size: cover;
                height: 100vh;
                min-height: 600px;     
                }
           .boton{
                 background-repeat:no-repeat;
                 height:200px;
                 width:200px;
                 background-position:center;
                 margin-right:14px!important;
                 }
                 .letra{
                     font-size: 20px;
                 }
    </style>
    <center>
        <form action="controlFull.do" method="post">

            <div>
                
                <label align="center" class="input-group-text" width="50%">Folio para la Precompra: <%= folio %></label>
                <label align="center" class="input-group-text" width="50%">Numero : <%= serie %></label>
                <label align="center" class="input-group-text" width="50%">Otiga: <%= otiga %></label>
            
                <td width="50%"><input type="hidden" size="53" name="otiga"  value="<%= folio%>" id="textfield"></td>
                <td width="50%"><input type="hidden" size="53" nmae="otigaP" value="<%= otiga%>" id="textfield"></td>
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
                    <td><%= objs.getCodigo()%><input type="hidden" name="codigosSolP" value="<%= objs.getCodigo()%>" disable></td>
                    <td><%= objs.getNombre()%></td>
                    <td><%= objs.getSolicitado()%></td>
                    <td><input class="formulario__campo" type="number" name="numeroSolP"  value="<%= objs.getSolicitado()%>" placeholder="Cantidad" min="0" ></td> 

                </tr>
                <%}%>

                <input type="hidden" name="txtpara" value=<%=VPara%> />

            </table>

            <button type="submit" name="opcion" value="cambiarEstadoPrecompra" class="btn btn-success">validar Materiales</button>

        </form>
    </center>
    </body>
</html>
