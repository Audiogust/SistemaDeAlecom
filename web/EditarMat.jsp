<%-- 
    Document   : EditarMat
    Created on : 28/05/2021, 10:07:39 PM
    Author     : Vane
--%>

<%@page import="Modelo.Material"%>
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
       background-color:rgba(0,0,255, 0.3);
       background-position: center;
       
       }
    </style>
    <body>
        <h1 align="center">Editar Material</h1>
        <center>
    <%
            
            HttpSession sesion=request.getSession();
            Material producto=(Material)sesion.getAttribute("material"); 
            Material objs = new Material();
            String VPara = request.getParameter("txtpara");
            String idd = request.getParameter("id");
            String codigo = "";
            String descripcion = "";
            String unidad = "";
            int existencia = 0;
            int salida = 0;
            Material m = new Material();

            if (VPara.equals("N") == false) {
                objs.buscarMaterial(idd);
                codigo = idd;
                descripcion = m.Descripcion(idd);
                System.out.println("prueba"+descripcion);
                unidad = m.Unidades(idd);
                existencia = objs.getExistencia();
                salida = objs.getSalida();
            }
        %>
       
        <br>
        <form action="controlFull.do" method="POST">
             
            
            <table border="0" cellpadding="0" cellspacing="0" width="40%"  align="center" class=" thead-dark table-bordered table-hover">                                         

                <tr>
                    <td width="90%"><b>Codigo:</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_codigo" value="<%=codigo%>" id="textfield"></td>
                </tr>
                <tr>
                    <td width="90%"><b>Descripcion:</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_descripcion" value="<%=descripcion%>" id="textfield"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Unidad:</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_unidad" value="<%=unidad%>" id="textfield"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Existencia:</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_existencia" value="<%=existencia%>" id="textfield"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Salida:</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_salida" value="<%=salida%>" id="textfield"></td>
                </tr>
                
             <input type="hidden" name="txtpara" value=<%=VPara%> />
            </table>
            <br>
            <input type="submit"  name="opcion" value="Modificar" class="btn btn-success"> 
            <input type="submit"  name="opcion" value="Eliminar" class="btn btn-danger">          
        </form>        
    </center>
    </body>
</html>
