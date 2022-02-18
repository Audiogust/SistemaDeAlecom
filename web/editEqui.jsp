<%-- 
    Document   : editEqui
    Created on : 12-feb-2022, 23:54:34
    Author     : Hp
--%>

<%@page import="Modelo.Equipamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
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
            height:140px;
            width:140px;
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
            <h1>Modificar</h1>
        </div>
        <center>
    <%
            
            HttpSession sesion=request.getSession();
            Equipamiento producto=(Equipamiento)sesion.getAttribute("material"); 
            Equipamiento objs = new Equipamiento();
            String VPara = request.getParameter("txtpara");
            String idd = request.getParameter("id");
            String codigo = "";
            String codigoEq = "";
            String marca = "";
            String tipo = "";
            String dispositivo = "";
            int tope =0;
            int existencia = 0;
            int salida = 0;
            Equipamiento m = new Equipamiento();

            if (VPara.equals("N") == false) {
                objs.buscarMaterial(idd);
                codigo = idd;
                codigoEq = m.codigoEqu(idd);
                marca = m.Marca(idd);                
                tipo = m.TipoE(idd);
                dispositivo = m.Dispo(idd);
                existencia = m.Existencia(idd);
                tope = m.Tope(idd);
               
            }
        %>
       
        <br>
        <form action="controlClientes.do" method="POST">
             
            <td  width="50%"><input type="hidden" size="53" name="id" value="<%=idd%>"></td>
            
            <table border="0" cellpadding="0" cellspacing="0" width="40%"  align="center" class=" thead-dark table-bordered table-hover">                                         

                <tr>
                    <td width="90%"><b>Codigo:</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_codigo" value="<%=codigoEq%>" id="textfield"></td>
                </tr>
                <tr>
                    <td width="90%"><b>Marca</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_marca" value="<%=marca%>" id="textfield"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Tipo</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_tipo" value="<%=tipo%>" id="textfield"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Dispositivo</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_dispositivo" value="<%=dispositivo%>" id="textfield"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Existencia</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_existencia" value="<%=existencia%>" id="textfield"></td>
                </tr>
                <tr>
                    <td width="70%"><b>Tope</b> </td>
                    <td width="50%"><input type="text" size="53" name="n_tope" value="<%=tope%>" id="textfield"></td>
                </tr>
                
             <input type="hidden" name="txtpara" value=<%=VPara%> />
            </table>
            <br>
            <input type="submit"  name="opcion" value="Modificar" class="btn btn-success"> 
             
        </form>        
    </center>
    </body>
</html>
