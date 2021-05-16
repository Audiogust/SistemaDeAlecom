
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
private String nombre;
private String unidades;
private int existencia;
private String solicitado;


    public MaterialSolicitado(){
        
    }

    public MaterialSolicitado(int id, String otiga, String nombre, String unidades, int existencia, String solicitado) {
        this.id = id;
        this.otiga = otiga;
        this.nombre = nombre;
        this.unidades = unidades;
        this.existencia = existencia;
        this.solicitado = solicitado;
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

   

public static Vector mostrarBusqueda(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM solicitudMat WHERE otiga  = '" + busqueda +"'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new MaterialSolicitado(rs.getInt("id"),
                         rs.getString("otiga"), rs.getString("nombre"),rs.getString("unidad"),
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
                PreparedStatement ps = c.prepareStatement(" update Materiales set existencia = existencia + "+(-cantidad)+" where descripcion = ? ");
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
    
}




