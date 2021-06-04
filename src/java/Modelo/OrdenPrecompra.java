
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class OrdenPrecompra {
    
    private String folio;
    private String codigo;
    private String nombre;
    private int solicitado;

    public OrdenPrecompra() {
    }

    public OrdenPrecompra(String folio, String codigo, String nombre, int solicitado) {
        this.folio = folio;
        this.codigo = codigo;
        this.nombre = nombre;
        this.solicitado = solicitado;
    }

    public String getFolio() {
        return folio;
    }

    public void setFolio(String folio) {
        this.folio = folio;
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

    public int getSolicitado() {
        return solicitado;
    }

    public void setSolicitado(int solicitado) {
        this.solicitado = solicitado;
    }
    
    
 
      public static Vector mostrar(String f) throws SQLException{
        Vector materiales = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery("select * from autorizarCompra where folio = '"+f+"'");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new OrdenPrecompra(rs.getString("folio"), rs.getString("codigo"), rs.getString("nombre"),rs.getInt("solicitado")));
             }
               
              return materiales; 
               
           }else {
            return null;
        }
          
    }
      
      public String Autorizar(String codigo,int cantidad) {
        Connection c = Conexion.conectar();

        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement(" update Materiales set existencia = existencia + "+(cantidad)+" where codigo = ? ");
                ps.setString(1, codigo);   
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
