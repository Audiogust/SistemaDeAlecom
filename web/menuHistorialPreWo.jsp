<%-- 
    Document   : menuHistorialPreWo
    Created on : 27-feb-2022, 2:46:19
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Precompra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
        <title>WISP-GAL</title>
    </head>
<style>
       body {
       background-color:rgba(0,0,255, 0.3);
       }
    </style>
   
    <body>
        <div align="center">                   
            <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
        <h1>Historiales Folio de Precompras</h1>
        </div>
        <br><table align="center" border="5" width="50%" class="table thead-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>                             
                                <th>Nummero de Serie</th>
                                <th>Otiga</th>
                                <th>Folio</th>
                                <th>Consulta de materiales</th>    
                            </tr>
		         </thead>
                            <%                         
                             Precompra objs = new Precompra();
                             Vector usu = new Vector();
                             usu=objs.mostrartablaPreMW();
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Precompra)usu.get(i);
                                 
                             %>
                             <tr>
                                <td><%= objs.getNumeroSerie()%></td>
                                <td><%= objs.getOtiga()%></td>
                                <td><%= objs.getFolio()%></td>
                                <td align="center" ><a href="tablaFolioPrecompraW.jsp?txtpara=M&id=<%= objs.getFolio()%>">
                                     <img src="IMG/peticion.svg" width="25px" height="25px"> </td>
                             </tr>
                                <%}%>
                </table>
    
    </body>
</html>