
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class MaterialSolicitado {


private int id;
private String otiga;
private String codigo;
private String nombre;
private String unidades;
private int existencia;
private String solicitado;
private String fecha;
private String hora;
private int existenciaant;
private int autorizado;

    public MaterialSolicitado(){
        
    }

    public MaterialSolicitado(int id, String otiga, String codigo, String nombre, String unidades, String solicitado) {
        this.id = id;
        this.otiga = otiga;
        this.codigo = codigo;
        this.nombre = nombre;
        this.unidades = unidades;
        this.solicitado = solicitado;
    }
    
    

    public MaterialSolicitado(int id, String otiga, String codigo, String nombre, String unidades, int existencia, String solicitado) {
        this.id = id;
        this.otiga = otiga;
        this.codigo = codigo;
        this.nombre = nombre;
        this.unidades = unidades;
        this.existencia = existencia;
        this.solicitado = solicitado;
    }

    public MaterialSolicitado(int id, String otiga, String codigo,
            String nombre, String unidades, int existencia, String solicitado, String fecha, String hora) {
        this.id = id;
        this.otiga = otiga;
        this.codigo = codigo;
        this.nombre = nombre;
        this.unidades = unidades;
        this.existencia = existencia;
        this.solicitado = solicitado;
        this.fecha = fecha;
        this.hora = hora;
    }
    public MaterialSolicitado(int id, String otiga, String codigo,
            String nombre, String unidades, int existencia, String solicitado,int autorizado,
            String fecha, String hora) {
        this.id = id;
        this.otiga = otiga;
        this.codigo = codigo;
        this.nombre = nombre;
        this.unidades = unidades;
        this.existencia = existencia;
        this.solicitado = solicitado;
        this.autorizado = autorizado;
        this.fecha = fecha;
        this.hora = hora;
    }

    public MaterialSolicitado(int id, String otiga, String codigo, String nombre,
                              String unidades, int existencia, String solicitado, 
                              String fecha, String hora, int existenciaant) {
        this.id = id;
        this.otiga = otiga;
        this.codigo = codigo;
        this.nombre = nombre;
        this.unidades = unidades;
        this.existencia = existencia;
        this.solicitado = solicitado;
        this.fecha = fecha;
        this.hora = hora;
        this.existenciaant = existenciaant;
    }
    
    public MaterialSolicitado(int id, String otiga, String codigo, 
                              String nombre,String unidades,int existenciaant, 
                              String solicitado,int autorizado,int existencia,
                              String hora,String fecha) {
        this.id = id;
        this.otiga = otiga;
        this.codigo = codigo;
        this.nombre = nombre;
        this.unidades = unidades;
        this.existenciaant = existenciaant;
        this.solicitado = solicitado;
        this.autorizado = autorizado;
        this.existencia = existencia;
        this.hora = hora;
        this.fecha = fecha;
    }
    
    
    
    public int getAutorizado() {
        return autorizado;
    }

    public void setAutorizado(int autorizado) {
        this.autorizado = autorizado;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOtiga() {
        return otiga;
    }

    public void setOtiga(String otiga) {
        this.otiga = otiga;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUnidades() {
        return unidades;
    }

    public void setUnidades(String unidades) {
        this.unidades = unidades;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public String getSolicitado() {
        return solicitado;
    }

    public void setSolicitado(String solicitado) {
        this.solicitado = solicitado;
    }

    public int getExistenciaant() {
        return existenciaant;
    }

    public void setExistenciaant(int existenciaant) {
        this.existenciaant = existenciaant;
    }
    
    

   
public static Vector mostrarDev(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM devolucionMat WHERE otiga  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new MaterialSolicitado(rs.getInt("id"),
                         rs.getString("otiga"),rs.getString("codigo"), rs.getString("descripcion"),rs.getString("unidad"),
                         rs.getString("solicitado")));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }

public static Vector mostrarHisto(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialSolicitado WHERE otiga  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new MaterialSolicitado(rs.getInt("id"),
                         rs.getString("otiga"),rs.getString("codigo"), rs.getString("nombre"),rs.getString("unidad"),
                         rs.getInt("existencia"),rs.getString("solicitado"),rs.getString("fecha"),rs.getString("hora") ));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }
public static Vector mostrarHistoW(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialSolicitadoW WHERE otiga  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new MaterialSolicitado(rs.getInt("id"),
                         rs.getString("otiga"),rs.getString("codigo"), rs.getString("nombre"),rs.getString("unidad"),
                         rs.getInt("existencia"),rs.getString("solicitado"),rs.getString("fecha"),rs.getString("hora") ));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }

public static Vector mostrarHSW(String busqueda) throws SQLException {
        Vector proyectos = null;
        Connection c = Conexion.conectar();
        if (c != null) {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(" SELECT * FROM historialSalidaW WHERE otiga  = '" + busqueda + "'");
            proyectos = new Vector();
            while (rs.next()) {
                proyectos.add(new MaterialSolicitado(
                        rs.getInt("id"), rs.getString("otiga"), rs.getString("codigo"),
                        rs.getString("nombre"), rs.getString("unidad"), rs.getInt("existencia_ant"),
                        rs.getString("solicitado"), rs.getString("fecha"), rs.getString("hora"),
                        rs.getInt("existencia_act")));
            }
            return proyectos;
        } else {
            return null;
        }
    }


    public static Vector mostrarHDW(String busqueda) throws SQLException {
        Vector proyectos = null;
        Connection c = Conexion.conectar();
        if (c != null) {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(" SELECT * FROM historialDevolucionW WHERE otiga  = '" + busqueda + "'");
            proyectos = new Vector();
            while (rs.next()) {
                proyectos.add(new MaterialSolicitado(
                        rs.getInt("id"), rs.getString("otiga"), rs.getString("codigo"),
                        rs.getString("nombre"), rs.getString("unidad"), rs.getInt("existencia_ant"),
                        rs.getString("solicitado"), rs.getString("fecha"), rs.getString("hora"),
                        rs.getInt("existencia_act")));
            }
            return proyectos;
        } else {
            return null;
        }
    }

    public static Vector mostrarHistoSalidas(String busqueda) throws SQLException {
        Vector proyectos = null;
        Connection c = Conexion.conectar();
        if (c != null) {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(" SELECT * FROM historialSalida WHERE otiga  = '" + busqueda + "'");
            proyectos = new Vector();
            while (rs.next()) {
                proyectos.add(new MaterialSolicitado(
                        rs.getInt("id"), rs.getString("otiga"), rs.getString("codigo"),
                        rs.getString("nombre"), rs.getString("unidad"), rs.getInt("existencia_ant"),
                        rs.getString("solicitado"), rs.getString("fecha"), rs.getString("hora"),
                        rs.getInt("existencia_act")));
            }
            return proyectos;
        } else {
            return null;
        }
    }

public static Vector mostrarHistoDevolucion(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialDevolucion WHERE otiga  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new MaterialSolicitado(
                         rs.getInt("id"),rs.getString("otiga"),rs.getString("codigo"), 
                         rs.getString("nombre"),rs.getString("unidad"),rs.getInt("existencia_ant"),
                         rs.getString("solicitado"),rs.getString("fecha"),rs.getString("hora"),
                         rs.getInt("existencia_act")));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }

public static Vector mostrarBusqueda(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM solicitudMat WHERE otiga  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new MaterialSolicitado(rs.getInt("id"),
                         rs.getString("otiga"),rs.getString("codigo"), rs.getString("descripcion"),rs.getString("unidad"),
                         rs.getInt("existencia"),rs.getString("solicitado")));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }

public String Operacion(String material,int cantidad) {
        Connection c = Conexion.conectar();

        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement(" update Materiales set existencia = existencia + "+(-cantidad)+" where codigo = ? ");
                ps.setString(1, material);   
                ps.execute();   
                return "Material Anexado";
            } catch (Exception e) {
                return "Error en guardar " + e;
            }
        } else {
            return ("No hay conexion a la base");
        }
    }

public String Devolver(String material,int cantidad) {
        Connection c = Conexion.conectar();

        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement(" update Materiales set existencia = existencia + "+ cantidad +" where codigo = ? ");
                ps.setString(1, material);   
                ps.execute();   
                return "Material Anexado";
            } catch (Exception e) {
                return "Error en guardar " + e;
            }
        } else {
            return ("No hay conexion a la base");
        }
    }
public boolean buscarSolicitudPrecompra(String id){
        boolean res=false;
        try {
        Connection c = Conexion.conectar();
        Statement st =c.createStatement();
        ResultSet rs=st.executeQuery("select * from solicitudMat where otiga='"+id+"' and solicitado > existencia");
            if (rs.next()) {
                this.otiga=rs.getString("otiga");
                this.codigo =rs.getString("codigo");
                this.nombre=rs.getString("nombre");
                this.unidades=rs.getString("unidad");
                this.existencia=rs.getInt("existencia");
                this.solicitado=rs.getString("solicitado");
                res=true;
            }
        } catch (Exception e) {
        }
        return res;
    }
public static Vector mostrarHistoPrecompra(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialOrdenCompra WHERE folio  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new MaterialSolicitado(
                         rs.getInt("id"),rs.getString("folio"),rs.getString("codigo"), 
                         rs.getString("nombre"),rs.getString("unidad"),rs.getInt("existencia_ant"),
                         rs.getString("solicitado"),rs.getInt("autorizado"),rs.getInt("existencia_act"),
                         rs.getString("hora"),rs.getString("fecha")));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }

public static Vector mostrarHistoPreocompra(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialPreordenCompra WHERE folio  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new MaterialSolicitado(
                         rs.getInt("id"),rs.getString("folio"),rs.getString("codigo"), 
                         rs.getString("nombre"),rs.getString("unidad"),rs.getInt("existencia"),
                         rs.getString("solicitado"),rs.getInt("autorizado"),
                         rs.getString("hora"),rs.getString("fecha")));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }


public static Vector mostrarHistoPreocompraW(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialPreordenCompraW WHERE folio  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new MaterialSolicitado(
                         rs.getInt("id"),rs.getString("folio"),rs.getString("codigo"), 
                         rs.getString("nombre"),rs.getString("unidad"),rs.getInt("existencia"),
                         rs.getString("solicitado"),rs.getInt("autorizado"),
                         rs.getString("hora"),rs.getString("fecha")));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }


public static Vector mostrarHistoPreocompraWo(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialOrdenCompraW WHERE folio  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new MaterialSolicitado(
                         rs.getInt("id"),rs.getString("folio"),rs.getString("codigo"), 
                         rs.getString("nombre"),rs.getString("unidad"),rs.getInt("existencia"),
                         rs.getString("solicitado"),rs.getInt("autorizado"),
                         rs.getString("hora"),rs.getString("fecha")));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }
    
}




