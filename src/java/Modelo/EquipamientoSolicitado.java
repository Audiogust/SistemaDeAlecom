
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


}
