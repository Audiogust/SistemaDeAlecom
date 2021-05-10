
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;


public class Material {
    
   private String codigo;
   private String descripcion;
   private String unidad;
   private int existencia;
   private int salida;
    
   
   public Material(){
       
   }

    public Material(String codigo, String descripcion, String unidad, int existencia, int salida) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.unidad = unidad;
        this.existencia = existencia;
        this.salida = salida;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public int getSalida() {
        return salida;
    }

    public void setSalida(int salida) {
        this.salida = salida;
    }
   
   
   
   
      public static Vector mostrar() throws SQLException{
        Vector materiales = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery("select * from Materiales ORDER BY Materiales.descripcion ");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new Material(rs.getString("codigo"),rs.getString("descripcion"), rs.getString("unidad"),rs.getInt("existencia"),rs.getInt("salida")));
             }
               
              return materiales; 
               
           }else {
            return null;
        }
          
    }
      
      
      public static Vector mostrarBusqueda(String busqueda) throws SQLException{
        Vector materiales = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM Materiales WHERE descripcion  LIKE '%" + busqueda +" %'");
             materiales  = new Vector();
             while(rs.next()){
                        materiales.add(new Material(rs.getString("codigo"),rs.getString("descripcion"), rs.getString("unidad"),rs.getInt("existencia"),rs.getInt("salida")));
             }
               
              return materiales; 
               
           }else {
            return null;
        }
          
    }
    public boolean buscarMaterial(String cod){
        boolean res=false;
        try {
        Connection c = Conexion.conectar();
        Statement st =c.createStatement();
        ResultSet rs=st.executeQuery(" select * from Materiales WHERE codigo = '"+cod+"'");
            if (rs.next()) {
                this.codigo=rs.getString("codigo");
                this.descripcion=rs.getString("descripcion");
                this.unidad=rs.getString("unidad");
                this.existencia=rs.getInt("existencia");
                this.salida=rs.getInt("salida");
                
                res=true;
            }
        } catch (Exception e) {
        }
        return res;
    }
    
    public String Descripcion(String des){
        Connection c = Conexion.conectar();
       
        try {
            PreparedStatement ps = c.prepareStatement("SELECT  descripcion from Materiales where codigo=? ");
            ps.setString(1, des);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String descripcion = rs.getString("descripcion");
                return descripcion;
            }
            return "No hay datos";
        } catch (Exception e) {
            return "No se pudo";
        }
    }
    
    
      
     public String Pedidos(String cod, String des, String cantidad) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO MaterialSolicitado(otiga,nombre,solicitado)  values(?,?,?)");
                ps.setString(1, cod);
                ps.setString(2, des);
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
     
    
}
