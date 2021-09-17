
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
public class Material1 {
    
    private int id;
    private String marca;
    private String tipo;
    private String dispositivo;
    private int existencia;
    private int tope;

    public Material1() {
    }

    public Material1(int id, String marca, String tipo, String dispositivo, int existencia, int tope) {
        this.id = id;
        this.marca = marca;
        this.tipo = tipo;
        this.dispositivo = dispositivo;
        this.existencia = existencia;
        this.tope = tope;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getTope() {
        return tope;
    }

    public void setTope(int tope) {
        this.tope = tope;
    }
    
    
    
          public static Vector mostrarE() throws SQLException{
        Vector materiales = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery("select * from Equipamiento ORDER BY Equipamiento.dispositivo");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new Material1(rs.getInt("id"),rs.getString("marca"),rs.getString("tipo"), rs.getString("dispositivo"),rs.getInt("existencia"),rs.getInt("tope")));
             }
               
              return materiales; 
               
           }else {
            return null;
        }
          
    }
    
          
          public String Tipo(String tip){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT  tipo from Equipamiento where marca=?");
            ps.setString(1, tip);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String descripcion = rs.getString("tipo");
                return descripcion;
            }
            return "No hay datos";
        } catch (Exception e) {
            return "No se pudo";
        }
    }
    
    public String Dispo(String di){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT dispositivo from Equipamiento where marca=? ");
            ps.setString(1, di);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String dispo = rs.getString("dispositivo");
                return dispo;
            }
            return "No hay datos";
        } catch (Exception e) {
            return "No se pudo";
        }
    }
    
    public String Existencia(String ex){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT  existencia from Equipamiento where marca=? ");
            ps.setString(1, ex);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String descripcion = rs.getString("existencia");
                return descripcion;
            }
            return "No hay datos";
        } catch (Exception e) {
            return "No se pudo";
        }
    }
    
    public String Equi(String marca, String disp, String cantidad) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO EquipamientoSolicitadoW(ID,nombre,solicitado)  values(?,?,?)");
                ps.setString(1, marca);
                ps.setString(2, disp);
                ps.setInt(3,Integer.parseInt(cantidad));
                ps.execute();
                return "Modificación realizada";
            } else {
                return "No hay conexion a la base ";
            }
        } catch (Exception e) {
            return "Error al modificar " + e;
        }
     }
    
    public static Vector mostrarTabla() throws SQLException{
        Vector materiales = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery("select * from Equipamiento ORDER BY Equipamiento.dispositivo ");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new Material1(rs.getInt("id"),rs.getString("marca"),rs.getString("tipo"), rs.getString("dispositivo"),rs.getInt("existencia"),rs.getInt("tope")));
             }
               
              return materiales; 
                          }else {
            return null;
        }
          
    }
    
    public String insertarHistoE(String ot, String mar, String tip,String disp,
                                  int exis,int sol,String fecha, String hora) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO historialSolicitadoE(otiga,marca,tipo,dispositivo,existencia,solicitado,fecha,hora)  values(?,?,?,?,?,?,?,?)");
                ps.setString(1, ot);
                ps.setString(2, mar);
                ps.setString(3, tip);
                ps.setString(4, disp);
                ps.setInt(5,exis);
                ps.setInt(6,sol);
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
}


