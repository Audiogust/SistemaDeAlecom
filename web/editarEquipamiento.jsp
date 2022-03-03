<%-- 
    Document   : editarEquipamiento
    Created on : 12-feb-2022, 23:08:32
    Author     : Hp
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Equipamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
        <link rel="shortcut icon" type="image/jpg" href="IMG/mundo.png"/>
        <title>WISP-GAL</title>
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
        <br>
        
        <table align="center" border="5" width="50%" class="table table-dark table-bordered table-hover">
            <thead class="bg-info"> 
                <tr>
                    <th>Identificador</th>
                    <th>CODIGO</th>
                    <th>MARCA</th>
                    <th>TIPO</th>
                    <th>DISPOSITIVO</th>
                    <th>EXISTENCIA</th>
                    <th>TOPE</th>
                    <th>EDITAR</th>
                </tr>
            </thead>
            <%
                Equipamiento objs = new Equipamiento();
                Vector usu = new Vector();
                usu = objs.mostrar();

                for (int i = 0; i < usu.size(); i++) {
                    objs = (Equipamiento) usu.get(i);
            %>
            <tr>
                <td><%= objs.getIden()%></td>
                <td><%= objs.getCodigo()%></td>
                <td><%= objs.getMarca()%></td>
                <td><%= objs.getTipo()%></td>
                <td><%= objs.getDispositivo()%></td>
                <td><%= objs.getExistencia()%></td>
                <td><%= objs.getTope()%></td>
                <td align="center" ><a href="editEqui.jsp?txtpara=M&id=<%=objs.getIden()%>">
                        <img src="IMG/editar.svg" width="25px" height="25px"> </td>
            </tr>
                        <%}%>
        </table>
    </body>
</html>
