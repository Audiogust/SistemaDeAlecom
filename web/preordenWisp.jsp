<%-- 
    Document   : preordenWisp
    Created on : 06-feb-2022, 22:31:57
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Material"%>
<%@page import="Modelo.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/f90d3bf50d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>FULL-SWAP 5G</title>
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
    </head>
    <body>
        <style>
            .select-css {
  display: block;
  font-size: 16px;
  font-family: 'Verdana', sans-serif;
  font-weight: 400;
  color: #444;
  line-height: 1.3;
  padding: .4em 1.4em .3em .8em;
  width: 400px;
  max-width: 100%; 
  box-sizing: border-box;
 margin: 20px auto;
  border: 1px solid #aaa;
  box-shadow: 0 1px 0 1px rgba(0,0,0,.03);
  border-radius: .3em;
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  background-color: #fff;
  background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E'),
    linear-gradient(to bottom, #ffffff 0%,#f7f7f7 100%);
  background-repeat: no-repeat, repeat;
  background-position: right .7em top 50%, 0 0;
  background-size: .65em auto, 100%;
}
.select-css::-ms-expand {
  display: none;
}
.select-css:hover {
  border-color: #888;
}
.select-css:focus {
  border-color: #aaa;
  box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
  box-shadow: 0 0 0 3px -moz-mac-focusring;
  color: #222; 
  outline: none;
}
.select-css option {
  font-weight:normal;
}


.classOfElementToColor:hover {background-color:red; color:black}

.select-css option[selected] {
    background-color: orange;
}
 body {
            background-image: url("IMG/fondo_4.jpg");
            background-position: center;
            height: 100vh;                
            min-height: 600px;
        }

        </style>
        <div align="center">                   
            <a href="Wisp.jsp"> <img src="IMG/Wispgal.png" width="150" height="150" HSPACE="20"></a>
            <h1>Precompra WISP-GAL</h1>
        </div>
        
        <center>
            <form action="controlClientes.do" method="post">
            
            <div>
           
            <label align="center" class="input-group-text" width="50%">Folio para la Precompra: ${folioo}</label>
            <label align="center" class="input-group-text" width="50%">Numero : ${numeroS}</label>
            
            <td width="50%"><input type="hidden" size="53" name="folioextraer"  value="${folioo}" id="textfield"></td>
          
            <td width="50%"><input type="hidden" size="53" name="folionumeros"  value="${numeroS}" id="textfield"></td>
            </div>
            <div>
                <label align="center" class="input-group-text" width="50%">Proyecto</label>
                <select name="pro" id="pro" onchange="mifuncion()" style="width:413px" class="select-css">
                    <option selected>Elige un proyecto</option>
                    <option>PedidoGeneral</option>
                    <%
                        
                        String sql = "SELECT ID FROM Clientes";
                        Connection c = Conexion.conectar();
                        PreparedStatement ps = c.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                    %>
                    <option><%=rs.getString(1)%></option>                            
                    <%
                        }
                    %>
                </select>
            </div>
          
            <table align="center" border="5" width="50%" class="table table-light table-bordered table-hover table-responsive-sm">
  	                 <thead class="bg-info"> 
                            <tr>
                                <th>CODIGO</th>
                                <th>MATERIAL</th>
                                <th>UNIDAD</th>
                                <th>EXISTENCIA</th>
                                <th>SOLICITADO</th>                               
                            </tr>
		         </thead>
                            <%
                             String opcional="";
                             Material objs = new Material();
                             Vector usu = new Vector();
                             usu=objs.mostrar();
                             String valor = "", re, typee="", name="",toggle="",target="";
                             for(int i=0; i<usu.size();i++){
                                 objs=(Material)usu.get(i);
                                 
                               double r=((20*objs.getSalida()))/100;
                             %>
                             <tr <% if (objs.getExistencia() <= r) { %> class="table-danger" <%}%> >
                                 
                                 <td><%= objs.getCodigo()%> <input  type="hidden" value="<%= objs.getCodigo()%>" name="codC"></td>
                                 <td><%= objs.getDescripcion()%></td>
                                 <td><%= objs.getUnidad()%></td>
                                 <td><%= objs.getExistencia() %></td>
                                 <td><input class="formulario__campo" type="number" name="numerosC" placeholder="Cantidad" min="1"></td> 
                               
                             </tr>
                                <%}%>                                                                   
                </table>
                 
                <label id="boton" name="boton" style="display: none"></label>
                
                 
                <script>
                    function mifuncion(){
                        var opcion = document.getElementById("pro").value;       
                        var si = document.getElementById("botonSi");
                        var no = document.getElementById("botonNo");
                        console.log(opcion);                  
                        if(opcion != "Elige un proyecto"){
                            document.getElementById("boton").innerHTML = opcion;
                            
                            si.style.display = 'inline';
                            no.style.display = 'none';
                        }else if(opcion == "Elige un proyecto"){
                             document.getElementById("boton").innerHTML = opcion;
                            si.style.display = 'none';
                            no.style.display = 'inline';
                        }
                    }
                </script>
                
                <button id ="botonSi" style="display: none" type="submit" name="opcion" value="botonPreordenAccion" class="btn btn-success">Generar</button>
                <button id ="botonNo"  type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">Generar</button>
              
                
                <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Selecciona un Proyecto</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Debes Seleccionar un Proyecto
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div> 
            
                 
        </form>
        </center>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
