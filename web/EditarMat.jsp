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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Editar Material</h1>
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
           

            if (VPara.equals("N") == false) {
                objs.buscarMaterial(idd);
                codigo = objs.getCodigo();
                descripcion = objs.getDescripcion();
                unidad = objs.getUnidad();
                existencia = objs.getExistencia();
                salida = objs.getSalida();
            }
        %>
       
        <br>
        <form action="controlFull.do" method="POST">
             
            
            <table border="0" cellpadding="0" cellspacing="0" width="40%"  align="center">                                         

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
