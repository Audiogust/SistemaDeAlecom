
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
private String otiga;
private String marca;
private String tipo;
private String nombre;
private int existencia;
private int solicitado;
private String fecha;
private String hora;

    public EquipamientoSolicitado() {
    }

    public EquipamientoSolicitado(int ide, String ID, String marca, String tipo, String nombre, int existencia, int solicitado) {
        this.ide = ide;
        this.ID = ID;
        this.marca = marca;
        this.tipo = tipo;
        this.nombre = nombre;
        this.existencia = existencia;
        this.solicitado = solicitado;
    }

    public EquipamientoSolicitado(int ide, String otiga, String marca, String tipo, String nombre, int existencia, int solicitado, String fecha, String hora) {
        this.ide = ide;
        this.otiga = otiga;
        this.marca = marca;
        this.tipo = tipo;
        this.nombre = nombre;
        this.existencia = existencia;
        this.solicitado = solicitado;
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

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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
    
    

public static Vector mostrarEQ(String busqueda) throws SQLException{
        Vector clientes = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM solicitudE WHERE ID  = '" + busqueda +"'");
             clientes  = new Vector();
             while(rs.next()){
                       clientes.add(new EquipamientoSolicitado(rs.getInt("ide"),
                         rs.getString("ID"),rs.getString("marca"), rs.getString("nombre"),rs.getString("tipo"),
                         rs.getInt("existencia"),rs.getInt("solicitado")));                       
             }               
              return clientes;                
           }else {
            return null;
        }
    }

 public String OperacionE(String marca,int cantidad) {
        Connection c = Conexion.conectar();
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement(" update Equipamiento set existencia = existencia + "+(-cantidad)+" where dispositivo = ? ");
                ps.setString(1, marca);   
                ps.execute();   
                return "Equipamiento Anexado";
            } catch (Exception e) {
                return "Error en guardar " + e;
            }
        } else {
            return ("No hay conexion a la base");
        }
    }
 
 
 public static Vector mostrarHistoE(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM historialSolicitadoE WHERE otiga  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new EquipamientoSolicitado(rs.getInt("id"),
                         rs.getString("otiga"),rs.getString("marca"), rs.getString("tipo"),rs.getString("dispositivo"),
                         rs.getInt("existencia"),rs.getInt("solicitado"),rs.getString("fecha"),rs.getString("hora") ));                       
             }               
              return proyectos;                
           }else {
            return null;
        }
    }

   


}
