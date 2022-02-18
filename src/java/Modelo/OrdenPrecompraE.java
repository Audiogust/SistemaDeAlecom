package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class OrdenPrecompraE {
    
    private String folio;
    private int iden;
    private String marca;
    private String nombre;
    private String tipo;
    private int solicitado;

    public OrdenPrecompraE() {
    }

    public OrdenPrecompraE(String folio, int iden, String marca, String nombre, String tipo, int solicitado) {
        this.folio = folio;
        this.iden = iden;
        this.marca = marca;
        this.nombre = nombre;
        this.tipo = tipo;
        this.solicitado = solicitado;
    }

    public String getFolio() {
        return folio;
    }

    public void setFolio(String folio) {
        this.folio = folio;
    }

    public int getIden() {
        return iden;
    }

    public void setIden(int iden) {
        this.iden = iden;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getSolicitado() {
        return solicitado;
    }

    public void setSolicitado(int solicitado) {
        this.solicitado = solicitado;
    }
    
    
    public static Vector mostrarPreE(String f) throws SQLException{
        Vector materiales = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery("select * from precompraEVista where folio = '"+f+"'");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new OrdenPrecompraE(rs.getString("folio"), rs.getInt("iden"), rs.getString("marca"),
                         rs.getString("nombre"),rs.getString("tipo"),rs.getInt("solicitado")));
             }
               
              return materiales; 
               
           }else {
            return null;
        }
          
    }
    
    public String Autorizar(int iden,int cantidad) {
        Connection c = Conexion.conectar();

        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement(" update Equipamiento set existencia = existencia + "+(cantidad)+" where iden = ? ");
                ps.setInt(1, iden);   
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
