
package Modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class OrdenPrecompra {
    
    private String id;
    private String folio;
    private String nombre;
    private int solicitado;

    public OrdenPrecompra() {
    }

    public OrdenPrecompra(String id, String folio, String nombre, int solicitado) {
        this.id = id;
        this.folio = folio;
        this.nombre = nombre;
        this.solicitado = solicitado;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFolio() {
        return folio;
    }

    public void setFolio(String folio) {
        this.folio = folio;
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
             ResultSet rs = st.executeQuery("select * from OrdenPreCompra where folio = '"+f+"'");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new OrdenPrecompra(rs.getString("id"),rs.getString("folio"), rs.getString("nombre"),rs.getInt("solicitado")));
             }
               
              return materiales; 
               
           }else {
            return null;
        }
          
    }   
    
}
