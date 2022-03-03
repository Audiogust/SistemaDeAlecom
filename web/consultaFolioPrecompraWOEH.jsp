<%-- 
    Document   : consultaFolioPrecompraWOEH
    Created on : 27-feb-2022, 21:08:02
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.EquipamientoSolicitado"%>
<%@page import="Modelo.PrecompraE"%>
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
        <%HttpSession sesion = request.getSession();
            PrecompraE producto = (PrecompraE) sesion.getAttribute("precompra");
            PrecompraE p = new PrecompraE();
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
        
        <div align="center">                   
            <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
        <h1>Historiales Folio de Precompras</h1>
        </div>
        
        <div class="table-responsive">
        <form align="center" action="controlFull.do" method="post">
            <div>
                <label align="center" class="input-group-text" width="50%">Folio para la Precompra: <%= folio%></label>
                <label align="center" class="input-group-text" width="50%">Numero : <%= serie%></label>
                <label align="center" class="input-group-text" width="50%">Otiga: <%= otiga %></label>
            </div>
                  
           <br>
           <div  class="table-responsive">
           <table align="right" border="5" width="50%" class="table table-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>                              
                               
                                <th>Folio</th>
                                <th>Id de equipo</th>
                                <th>CODIGO</th>
                                <th>NOMBRE</th>
                                <th>MARCA</th>
                                <th>EXISTENCIA ANTERIOR</th>
                                <th>SOLICITADO</th>
                                <th>EXISTENCIA ACTUAL</th>
                                <th>FECHA</th>
                                <th>HORA</th>
                                
                            </tr>
		         </thead>
                            <%
                                
                             String n=request.getParameter("folio");
                             EquipamientoSolicitado objs = new EquipamientoSolicitado();                
                            
                             Vector usu = new Vector();
                             usu=objs.mostrarHistoPreocompraWO(folio);                           
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(EquipamientoSolicitado)usu.get(i);
                               
                             %>
                             <tr>
                                
                               
                                <td><%= objs.getFolio()%></td>
                                <td><%= objs.getIde()%></td>
                                <td><%= objs.getCodigo()%></td>
                                <td><%= objs.getDispositivo()%></td>
                                <td><%= objs.getMarca()%></td>
                                <td><%= objs.getExistencia()%></td>
                                <td><%= objs.getSolicitado()%></td>
                                <td><%= objs.getExistencia_act()%></td>
                                <td><%= objs.getFecha()%></td>                                  
                                <td><%= objs.getHora()%></td>
                             </tr>
                                <%}%>  
                   <input type="hidden" name="txtpara" value=<%=VPara%> />
                </table>
                <div>
             </div>
        </div>
 </form>
    </body>
</html>
