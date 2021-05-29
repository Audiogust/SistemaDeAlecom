/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class MaterialSolicitadoWisp {
    
   private int ide;
   private String ID;
   private String codigo;
   private String nombre;
   private String unnidades;
   private int existencia;
   private int solicitado;

    public MaterialSolicitadoWisp() {
    }

    public MaterialSolicitadoWisp(int ide, String ID, String codigo, String nombre, String unnidades, int solicitado) {
        this.ide = ide;
        this.ID = ID;
        this.codigo = codigo;
        this.nombre = nombre;
        this.unnidades = unnidades;
        this.solicitado = solicitado;
    }
    
    

    public MaterialSolicitadoWisp(int ide, String ID, String codigo, String nombre, String unnidades, int existencia, int solicitado) {
        this.ide = ide;
        this.ID = ID;
        this.codigo = codigo;
        this.nombre = nombre;
        this.unnidades = unnidades;
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

    public String getUnnidades() {
        return unnidades;
    }

    public void setUnnidades(String unnidades) {
        this.unnidades = unnidades;
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
   
   public static Vector mostrarWisp(String busqueda) throws SQLException{
        Vector clientes = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM solicitudWisp WHERE ID  = '" + busqueda +"'");
             clientes  = new Vector();
             while(rs.next()){
                       clientes.add(new MaterialSolicitadoWisp(rs.getInt("ide"),
                         rs.getString("ID"),rs.getString("codigo"), rs.getString("nombre"),rs.getString("unidad"),
                         rs.getInt("existencia"),rs.getInt("solicitado")));                       
             }               
              return clientes;                
           }else {
            return null;
        }
    }
   
   
   public String OperacionWisp(String material,int cantidad) {
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
   
   public String DevolverMaterial(String matw,int cantw) {
        Connection c = Conexion.conectar();

        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement(" update Materiales set existencia = existencia + "+ cantw +" where codigo = ? ");
                ps.setString(1, matw);   
                ps.execute();   
                return "Material Anexado";
            } catch (Exception e) {
                return "Error en guardar " + e;
            }
        } else {
            return ("No hay conexion a la base");
        }
    }
   
   public static Vector mostrarMatDevo(String busqueda) throws SQLException{
        Vector clientes = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM devolucionWisp  WHERE ID  = '" + busqueda +"'");
             clientes  = new Vector();
             while(rs.next()){
                       clientes.add(new MaterialSolicitadoWisp(rs.getInt("ide"),
                         rs.getString("ID"),rs.getString("codigo"), rs.getString("nombre"),rs.getString("unidad"),
                         rs.getInt("solicitado")));                       
             }               
              return clientes;                
           }else {
            return null;
        }
    }
   

   
          

   
    
    
    
    
}
