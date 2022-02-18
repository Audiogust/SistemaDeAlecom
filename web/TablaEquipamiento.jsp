<%-- 
    Document   : TablaEquipamiento
    Created on : 8/09/2021, 11:23:49 PM
    Author     : Vane
--%>

<%@page import="Modelo.Equipamiento"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <style>
           body {
                background-image: url("IMG/");
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
    <body>
       <div align="center">                    
            <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
        </div>
          <table align="center" border="5" width="50%" class="table table-bordered ">
               <h1>Equipamiento WISP</h1>
  	                 <thead class="bg-info"> 
                            <tr>
                                <th>Identificador</th>
                                <th>Codigo</th>
                                <th>MARCA</th>
                                <th>TIPO</th>
                                <th>DISPOSITIVO</th>
                                <th>EXISTENCIA</th>
                                <th>TOPE</th> 
                            </tr>
		         </thead>
                         <%
                             Equipamiento objs = new Equipamiento();
                             Vector usu = new Vector();
                             usu=objs.mostrarTabla();
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Equipamiento)usu.get(i);
                                 
                              double r=((20*objs.getTope()))/100;
                             %>
                             <tr>
                                <tr <% if (objs.getExistencia() <= r) { %> class="table-danger" <%}%> >
                                <td><%= objs.getIden()%></td>
                                <td><%= objs.getCodigo()%></td>
                                <td><%= objs.getMarca()%></td>
                                <td><%= objs.getTipo()%></td>
                                <td><%= objs.getDispositivo()%></td>
                                <td><%= objs.getExistencia()%></td>
                                <td><%= objs.getTope()%></td>
                                
                             </tr>
                                <%}%>
                </table> 

        
    </body>
</html>
