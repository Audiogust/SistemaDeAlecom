<%-- 
    Document   : Clientes
    Created on : 9/05/2021, 09:46:20 PM
    Author     : Vane
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="IMG/style.css">
        <title>JSP Page</title>
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
    <body>
        <form align="center" action="controlClientes.do">
            <h1>Registro Clientes</h1>
            <div align="center">
                <img src="IMG/clientes.svg" width="250" height="100" HSPACE="20">    
            </div>
            <table border="0" cellpadding="0" cellspacing="0" width="40%"  align="center">
                <tr>
                    <td width="70%"><b>Folio:</b> </td>
                    <td  width="50%"><input type="text" size="53" name="id" value="${numeritow}"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Nombre:</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_nombre"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Direccion:</b> </td>
                    
                    <td width="50%"><select name="direccion">
                            <option value="VLLAGX">Villas de Guadalupe Xalostoc </option>
                            <option value="OJAG">Ojo de Agua</option>
                            <option value="SGR">Sagitario</option>
                            <option value="BE">Barrio de España</option>
                        </select></td>
                </tr>
                <tr>
                    <td width="70%"><b>Telefono:</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_telefono"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Correo:</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_correo"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Tiempo:</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_tiempo"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Megas:</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_megas"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Tarifa:</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_tarifa"></td>
                </tr>
                <tr>
                <td width="70%"><b>Fecha:</b> </td>	
                <td width="50%"><input type="date" name="n_fecha"></td>
                
                </tr>
                <tr>
                    
                <td width="70%"><b>Grupo:</b> </td>
                    <td width="50%"><select name="n_grupo" id="grupo">                        
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                    </select>
                </td>
                    
                </tr>
                <tr>
                    <td width="70%"><b>Comentarios:</b> </td>
                    <td width="60%"><input type="text" size="53" name="n_comentarios"></td>
                </tr>    
            </table>

            <br><button type="submit" name="opcion" value="v_registrar_clientes" class="btn btn-primary btn-lg">Registrar</button> 
            
            
            
             <br>
       <br>
         <table align="center" border="5" width="50%" class="table table-dark table-bordered table-hover">
  	                 <thead class="bg-info"> 
                            <tr>
                                <th>NO</th>
                                <th>ID</th>
                                <th>NOMBRE</th>
                                <th>DIRECCION</th>
                                <th>TELEFONO</th>
                                <th>CORREO</th>
                                <th>TIEMPO</th>
                                <th>MEGAS</th>
                                <th>TARIFA</th>
                                <th>FECHA</th>
                                <th>GRUPO</th>
                                <th>COMENTARIOS</th>
                                
                            </tr>
		         </thead>
                            <%
                             Clientes objs = new Clientes();
                             Vector usu = new Vector();
                             usu=objs.mostrar();
                             
                             for(int i=0; i<usu.size();i++){
                                 objs=(Clientes)usu.get(i);
                             %>
                             <tr>
                                <td><%= objs.getNumero()%></td> 
                                <td><%= objs.getId()%></td>
                                <td><%= objs.getNombre()%></td>
                                <td><%= objs.getDireccion()%></td>
                                <td><%= objs.getTelefono()%></td>
                                <td><%= objs.getCorreo()%></td>
                                <td><%= objs.getTiempo()%></td>
                                <td><%= objs.getMegas()%></td>
                                <td><%= objs.getTarifa()%></td>
                                <td><%= objs.getFecha()%></td>
                                <td><%= objs.getGrupo()%></td>
                                <td><%= objs.getComentarios()%></td>
                                  </tr>
                                <%}%>
                </table> 
        </form>
    </body>
</html>
