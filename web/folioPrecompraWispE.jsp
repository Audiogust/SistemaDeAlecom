<%-- 
    Document   : folioPrecompraWispE
    Created on : 14-feb-2022, 9:53:02
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.PrecompraE"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">    
        <title>JSP Page</title>
    </head>
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
    <body>
       <div align="center">                    
            <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
        </div>
        
         <br><table align="center" border="5" width="50%" class="table thead-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>                             
                                <th>Nummero de Serie</th>
                                <th>Folio</th>
                                <th>ID Ciente</th>
                                <th>Consulta de materiales</th>    
                            </tr>
		         </thead>
                            <%                         
                             PrecompraE objs = new PrecompraE();
                             Vector usu = new Vector();
                             usu=objs.mostrartablaWispE();
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(PrecompraE)usu.get(i);
                                 
                             %>
                             <tr>
                                <td><%= objs.getNumeroSerie()%></td>
                                <td><%= objs.getFolio()%></td>
                                <td><%= objs.getOtiga()%></td>
                                <td align="center" ><a href="consultaFolioPrecompraWE.jsp?txtpara=M&id=<%= objs.getFolio()%>">
                                     <img src="IMG/peticion.svg" width="25px" height="25px"> </td>
                             </tr>
                                <%}%>
                </table>
        
    </body>
</html>
