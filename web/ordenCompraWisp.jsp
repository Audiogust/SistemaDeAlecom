<%-- 
    Document   : ordenCompraWisp
    Created on : 07-feb-2022, 15:22:58
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Precompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
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
            <h1>Folio Orden de Compra Materiales</h1>
        </div>
         <br><table align="center" border="5" width="50%" class="table thead-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>                             
                                <th>Nummero de Serie</th>
                                <th>ID cliente</th>
                                <th>Folio de Precompra</th>
                                <th>Consulta de materiales</th>    
                            </tr>
		         </thead>
                            <%
                                                            
                             Precompra objs = new Precompra();
                             Vector usu = new Vector();
                             usu=objs.mostrartablaOrdWisp();
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Precompra)usu.get(i);                                 
                             %>
                             <tr>
                                <td><%= objs.getNumeroSerie()%></td>
                                <td><%= objs.getOtiga()%></td>
                                <td><%= objs.getFolio()%></td>
                                <td align="center" ><a href="consultaPrecompraWisp.jsp?txtpara=M&id=<%= objs.getFolio()%>">
                                     <img src="IMG/peticion.svg" width="25px" height="25px"> </td>
                             </tr>
                                <%}%>
                </table>
    </body>
</html>
