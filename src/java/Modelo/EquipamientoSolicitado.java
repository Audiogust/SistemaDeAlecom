
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

/**
 *
 * @author Vane
 */
public class EquipamientoSolicitado {

private int ide;
private String ID;
private String iden;
private String dispositivo;
private int existencia;
private int solicitado;
private String codigo;
private String fecha;
private String hora;
private int existencia_act;
private String folio;
private String marca;

    public EquipamientoSolicitado() {
    }

    public EquipamientoSolicitado(int ide, String ID, String iden, String dispositivo, int existencia, int solicitado) {
        this.ide = ide;
        this.ID = ID;
        this.iden = iden;
        this.dispositivo = dispositivo;
        this.existencia = existencia;
        this.solicitado = solicitado;
    }
    
    public EquipamientoSolicitado(int ide, String idCliente, String codigo,
            String nombre, int existencia, int solicitado, String fecha, String hora) {
        this.ide = ide;
        this.ID = idCliente;
        this.codigo = codigo;
        this.dispositivo = nombre;
        this.existencia = existencia;
        this.solicitado = solicitado;
        this.fecha = fecha;
        this.hora = hora;
    }
    
    public EquipamientoSolicitado(int ide, String idCliente, String codigo,
            String nombre, int existencia_ant, int solicitado,int existencia_act,
            String fecha, String hora) {
        this.ide = ide;
        this.ID = idCliente;
        this.codigo = codigo;
        this.dispositivo = nombre;
        this.existencia = existencia_ant;
        this.solicitado = solicitado;
        this.existencia_act= existencia_act;
        this.fecha = fecha;
        this.hora = hora;
    }
    
    
    public EquipamientoSolicitado(int ide,String folio, int idCliente, String codigo,
            String nombre,String marca, int existencia, int solicitado,
            String fecha, String hora) {
        this.ide = ide;
        this.folio= folio;
        this.ide = idCliente;
        this.codigo=codigo;
        this.dispositivo = nombre;
        this.marca=marca;
        this.existencia = existencia;
        this.solicitado = solicitado;
        this.fecha = fecha;
        this.hora = hora;
    }
    
    public EquipamientoSolicitado(int ide,String folio, int idCliente, String codigo,
            String nombre,String marca, int existencia_ant, int solicitado,int existencia_act,
            String fecha, String hora) {
        this.ide = ide;
        this.folio= folio;
        this.ide = idCliente;
        this.codigo=codigo;
        this.dispositivo = nombre;
        this.marca=marca;
        this.existencia = existencia_ant;
        this.solicitado = solicitado;
        this.existencia_act=existencia_act;
        this.fecha = fecha;
        this.hora = hora;
    }
    

    public int getIde() {
        return ide;
    }

    public void setIde(int ide) {
        this.ide = ide;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getIden() {
        return iden;
    }

    public void setIden(String iden) {
        this.iden = iden;
    }

    public String getDispositivo() {
        return dispositivo;
    }

    public void setDispositivo(String dispositivo) {
        this.dispositivo = dispositivo;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public int getSolicitado() {
        return solicitado;
    }

    public void setSolicitado(int solicitado) {
        this.solicitado = solicitado;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
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

    public int getExistencia_act() {
        return existencia_act;
    }

    public void setExistencia_act(int existencia_act) {
        this.existencia_act = existencia_act;
    }

    public String getFolio() {
        return folio;
    }

    public void setFolio(String folio) {
        this.folio = folio;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }
    
    
 
    
    
 

   public static Vector mostrarEquiWisp(String busqueda) throws SQLException{
        Vector clientes = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM solicituEquiWisp WHERE ID  = '" + busqueda +"'");
             clientes  = new Vector();
             while(rs.next()){
                       clientes.add(new EquipamientoSolicitado(rs.getInt("ide"),
                       rs.getString("ID"),rs.getString("iden"), rs.getString("dispositivo"),
                       rs.getInt("existencia"),rs.getInt("solicitado")));                       
             }               
              return clientes;                
           }else {
            return null;
        }
    }
   
   public String OperacionEquiWisp(String material,int cantidad) {
        Connection c = Conexion.conectar();
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement(" update Equipamiento set existencia = existencia + "+(-cantidad)+" where iden = ? ");
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
   
   public String DevolverEquipamiento(int matw,int cantw) {
        Connection c = Conexion.conectar();

        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement(" update Equipamiento set existencia = existencia + "+ cantw +" where iden = ? ");
                ps.setInt(1, matw);   
                ps.execute();   
                return "Material Anexado";
            } catch (Exception e) {
                return "Error en guardar " + e;
            }
        } else {
            return ("No hay conexion a la base");
        }
    }
   
   public static Vector mostrarHistoW(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialSolicitadoWE WHERE otiga  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new EquipamientoSolicitado(rs.getInt("id"),
                         rs.getString("otiga"),rs.getString("codigo"), rs.getString("nombre"),
                         rs.getInt("existencia"),rs.getInt("solicitado"),rs.getString("fecha"),rs.getString("hora")));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }
   
   public static Vector mostrarHistoWE(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialSalidaWE WHERE otiga  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new EquipamientoSolicitado(rs.getInt("id"),
                         rs.getString("otiga"),rs.getString("codigo"), rs.getString("nombre"),
                         rs.getInt("existencia_ant"),rs.getInt("solicitado"),rs.getInt("existencia_act"),rs.getString("fecha"),rs.getString("hora")));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }
   
   public static Vector mostrarHistoDev(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialDevolucionWE WHERE otiga  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new EquipamientoSolicitado(rs.getInt("id"),
                         rs.getString("otiga"),rs.getString("codigo"), rs.getString("nombre"),
                         rs.getInt("existencia_ant"),rs.getInt("solicitado"),rs.getInt("existencia_act"),rs.getString("fecha"),rs.getString("hora")));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }
   
   public String insertarHistoSalidaE(String ot, String cod, String nom,
                                         int exis, int sol, int ea, String fecha, String hora) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO historialSalidaWE(otiga,codigo,nombre,"
                                    + "existencia_ant,solicitado,existencia_act,fecha,hora)  values(?,?,?,?,?,?,?,?)");
                ps.setString(1, ot);
                ps.setString(2, cod);
                ps.setString(3, nom);
                ps.setInt(4,exis);
                ps.setInt(5,sol);
                ps.setInt(6,ea);
                ps.setString(7, fecha);
                ps.setString(8, hora);
                ps.execute();
                return "Modificación realizada";
            } else {
                return "No hay conexion a la base ";
            }
        } catch (Exception e) {
            return "Error al modificar " + e;
        }
     }
   
   
   public String insertarHistoDevoE(String ot, String cod, String nom,
                                         int exis, int sol, int ea, String fecha, String hora) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO historialDevolucionWE(otiga,codigo,nombre,"
                                    + "existencia_ant,solicitado,existencia_act,fecha,hora)  values(?,?,?,?,?,?,?,?)");
                ps.setString(1, ot);
                ps.setString(2, cod);
                ps.setString(3, nom);
                ps.setInt(4,exis);
                ps.setInt(5,sol);
                ps.setInt(6,ea);
                ps.setString(7, fecha);
                ps.setString(8, hora);
                ps.execute();
                return "Modificación realizada";
            } else {
                return "No hay conexion a la base ";
            }
        } catch (Exception e) {
            return "Error al modificar " + e;
        }
     }
   
   
   public static Vector mostrarHistoPreocompraW(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialPreordenEquipamiento WHERE folio  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new EquipamientoSolicitado(
                         rs.getInt("id"),rs.getString("folio"),rs.getInt("iden"), 
                         rs.getString("codigo"),rs.getString("nombre"),rs.getString("marca"),
                         rs.getInt("existencia"),rs.getInt("solicitado"),
                         rs.getString("hora"),rs.getString("fecha")));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }

   public static Vector mostrarHistoPreocompraWO(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialOrdenCompraEquipamiento WHERE folio  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new EquipamientoSolicitado(
                         rs.getInt("id"),rs.getString("folio"),rs.getInt("iden"), 
                         rs.getString("codigo"),rs.getString("nombre"),rs.getString("marca"),
                         rs.getInt("existencia_ant"),rs.getInt("solicitado"),rs.getInt("existencia_act"),
                         rs.getString("hora"),rs.getString("fecha")));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }

}
