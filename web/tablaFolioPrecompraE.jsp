<%-- 
    Document   : tablaFolioPrecompraE
    Created on : 26-feb-2022, 22:14:27
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.MaterialSolicitado"%>
<%@page import="Modelo.PrecompraE"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
        <title>JSP Page</title>
    </head>
    <body>
         <div class="table-responsive" align="center">
            <a href="MenuPrincipal.jsp"> <img src="IMG/logotipo.png" width="250" height="100" HSPACE="20"></a>
            <h1>Historiales de Precompra</h1>
        </div>
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
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Unidad</th>
                                <th>Existencia</th>
                                <th>Solicitado</th>
                                <th>Autorizado</th>
                                <th>Hora</th>
                                <th>Fecha</th>
                                
                            </tr>
		         </thead>
                            <%
                                
                             String n=request.getParameter("folio");
                             MaterialSolicitado objs = new MaterialSolicitado();                
                            
                             Vector usu = new Vector();
                             usu=objs.mostrarHistoPreocompra(folio);                           
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(MaterialSolicitado)usu.get(i);
                               
                             %>
                             <tr>
                                
                                <td><%= objs.getOtiga()%></td>
                                <td><%= objs.getCodigo()%></td>
                                <td><%= objs.getNombre()%></td>
                                <td><%= objs.getUnidades()%></td>
                                <td><%= objs.getExistencia()%></td>
                                <td><%= objs.getSolicitado()%></td>
                                <td><%= objs.getAutorizado()%></td>
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
