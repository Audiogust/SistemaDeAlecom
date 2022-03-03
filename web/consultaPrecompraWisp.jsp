<%-- 
    Document   : consultaPrecompraWisp
    Created on : 07-feb-2022, 16:44:19
    Author     : Hp
--%>

<%@page import="Modelo.Precompra"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.OrdenPrecompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
        <title>WISP-GAL</title>
    </head>
    <body>
        <style>
             h2{
            font-size: 40px;
            color: white;
        }
        body {
            background-image: url("IMG/fondo_4.jpg");
            background-position: center;
            height: 100vh;                
            min-height: 600px;
        }
        .boton{
            background-repeat:no-repeat;
            height:170px;
            width:170px;
            background-position:center;
            margin-right:10px!important;
        }
        .letra{
            font-size: 19px;
        }
        </style>
        <div align="center">                   
            <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
            <h1>Precompra WISP-GAL</h1>
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

    <center>
        <form action="controlClientes.do" method="post">

            <div>
                <label align="center" class="input-group-text" width="50%">Folio para la Precompra: <%= folio%></label>
                <label align="center" class="input-group-text" width="50%">Numero : <%= serie%></label>
                <label align="center" class="input-group-text" width="50%">ID cliente: <%= otiga %></label>
                
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
                    <td><%= objs.getCodigo()%><input type="hidden" name="codigosOrd" value="<%= objs.getCodigo()%>" disable></td>
                    <td><%= objs.getNombre()%></td>
                    <td><%= objs.getSolicitado()%></td>
                    <td><input class="formulario__campo" type="number" name="solicitadoOrd"  value="<%= objs.getSolicitado()%>"  placeholder="Cantidad" min="0" ></td> 
                </tr>
                <%}%>

                <input type="hidden" name="txtpara" value=<%=VPara%> />

            </table>

                <button type="submit" name="opcion" value="autorizarExistencia" class="btn btn-success">validar Materiales</button>

        </form>
    </center>
        
    </body>
</html>
