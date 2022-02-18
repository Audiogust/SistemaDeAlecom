
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
public class Equipamiento {
    
    private int iden;
    private String codigo;
    private String marca;
    private String tipo;
    private String dispositivo;
    private int existencia;
    private int tope;

    public Equipamiento() {
    }

    public Equipamiento(int iden, String codigo, String marca, String tipo,
            String dispositivo, int existencia, int tope) {
        this.iden = iden;
        this.codigo = codigo;
        this.marca = marca;
        this.tipo = tipo;
        this.dispositivo = dispositivo;
        this.existencia = existencia;
        this.tope = tope;
        this.con = con;
        this.ps = ps;
        this.rs = rs;
    }

    public int getIden() {
        return iden;
    }

    public void setIden(int iden) {
        this.iden = iden;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
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

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public Conexion getCn() {
        return cn;
    }

    public void setCn(Conexion cn) {
        this.cn = cn;
    }

    public PreparedStatement getPs() {
        return ps;
    }

    public void setPs(PreparedStatement ps) {
        this.ps = ps;
    }

    public ResultSet getRs() {
        return rs;
    }

    public void setRs(ResultSet rs) {
        this.rs = rs;
    }
    
    
    
    
    
    public static Vector mostrarE() throws SQLException{
        Vector materiales = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery("select * from Equipamiento ORDER BY Equipamiento.dispositivo");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new Equipamiento(rs.getInt("iden"),rs.getString("codigo"),rs.getString("marca"),
                         rs.getString("tipo"),rs.getString("dispositivo"),rs.getInt("existencia"),rs.getInt("tope")));
             }
               
              return materiales; 
               
           }else {
            return null;
        }
          
    }
    
         
    
  
    
    public String EquiInsertar(String id, String cod, String marca,String tip, String disp, int exi, int tope) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO Equipamiento(iden,codigo,marca,tipo,dispositivo,existencia,tope)  values(?,?,?,?,?,?,?)");
                ps.setString(1, id);
                ps.setString(2, cod);
                ps.setString(3,marca);
                ps.setString(4,tip);
                ps.setString(5,disp);
                ps.setInt(6,exi);
                ps.setInt(7,tope);
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
             ResultSet rs = st.executeQuery("select * from Equipamiento ");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new Equipamiento(rs.getInt("iden"),rs.getString("codigo"),rs.getString("marca"),
                         rs.getString("tipo"),rs.getString("dispositivo"),rs.getInt("existencia"),rs.getInt("tope")));
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
    
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    public String GenerarNumeroE() {
        String numeroSerie = "";
        String sql = "SELECT MAX(iden) from Equipamiento";
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                numeroSerie = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return numeroSerie;
    }
    
    public String numeros(int num){
        num = num + 1;
        String res=String.valueOf(num);       
        return res;
    }
    
    public String EquiSolicitado(String codigo, String descripcion, String cantidad) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO EquipamientoSolicitadoWisp(ID,codigo,solicitado)  values(?,?,?)");
                ps.setString(1, codigo);
                ps.setString(2, descripcion);
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
    
    
    public static Vector mostrar() throws SQLException{
        Vector materiales = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery("select * from Equipamiento ORDER BY Equipamiento.dispositivo ");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new Equipamiento(rs.getInt("iden"),rs.getString("codigo"),rs.getString("marca"),
                         rs.getString("tipo"),rs.getString("dispositivo"),rs.getInt("existencia"),rs.getInt("tope")));
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
        ResultSet rs=st.executeQuery(" select * from Equipamiento WHERE iden = '" + cod + "'");
            if (rs.next()) {
                this.iden=rs.getInt("iden");
                this.codigo=rs.getString("codigo");
                this.marca=rs.getString("marca");
                this.tipo=rs.getString("tipo");
                this.dispositivo=rs.getString("dispositivo");
                this.existencia=rs.getInt("existencia");
                this.tope=rs.getInt("tope");
                res=true;
            }
        } catch (Exception e) {
        }
        return res;
    }
    
    public String codigoEqu(String des){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT  codigo from Equipamiento where iden=?");
            ps.setString(1, des);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String descripcion = rs.getString("codigo");
                return descripcion;
            }
            return "No hay datos";
        } catch (Exception e) {
            return "No se pudo";
        }
    }
    
    public String Marca(String des){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT  marca from Equipamiento where iden=?");
            ps.setString(1, des);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String descripcion = rs.getString("marca");
                return descripcion;
            }
            return "No hay datos";
        } catch (Exception e) {
            return "No se pudo";
        }
    }
    
    
    public String TipoE(String des){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT  tipo from Equipamiento where iden=?");
            ps.setString(1, des);
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
            PreparedStatement ps = c.prepareStatement("SELECT dispositivo from Equipamiento where iden=? ");
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
    
    public int Existencia(String ex){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT  existencia from Equipamiento where iden=? ");
            ps.setString(1, ex);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int descripcion = rs.getInt("existencia");
                return descripcion;
            }
            return 0;
        } catch (Exception e) {
            return 0;
        }
    }
    
    public int Tope(String ex){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT  tope from Equipamiento where iden=? ");
            ps.setString(1, ex);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int descripcion = rs.getInt("tope");
                return descripcion;
            }
            return 0;
        } catch (Exception e) {
            return 0;
        }
    }
    
    public String cambio() {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" update Equipamiento set codigo = ?, marca = ?, tipo = ?, dispositivo = ?, existencia = ?, tope = ? where iden = ? ");    
                ps.setString(1, codigo);
                ps.setString(2, marca);
                ps.setString(3, tipo);
                ps.setString(4, dispositivo);
                ps.setInt(5, existencia);
                ps.setInt(6, tope);
                ps.setInt(7, iden);
                ps.execute();
                return "modificacion realizada";
            }
            else{
                return "no se realizo";
            }
        } catch (Exception e) {
            return "Error al modificar " + e;
        }
    }
    
    public String precompra(String fol, String nom, String cantidad) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO OrdenPreCompraE(folio,marca,nombre,tipo,solicitado) values(?,?,?,?,?)");
                ps.setString(1, fol);
                ps.setString(2, nom);
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
    
    
    public String ordenPrecompraE(String fol, int iden, String marca, String nom, String tipo, int cantidad) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO OrdenPreCompraE(folio,iden,marca,nombre,tipo,solicitado) values(?,?,?,?,?,?)");
                ps.setString(1, fol);
                ps.setInt(2, iden);
                ps.setString(3, marca);
                ps.setString(4, nom);
                ps.setString(5, tipo);
                ps.setInt(6,cantidad);
                ps.execute();
                return "Modificación realizada";
            } else {
                return "No hay conexion a la base ";
            }
        } catch (Exception e) {
            return "Error al modificar " + e;
        }
     }
    
     public String EquiSolicitadoHistorial(String idcliente,int iden,String nom,String marca,
                                String tipo,String existencia,String sol, String fecha,String hora) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO historialSalidaWE(idCliente,iden,nombre,marca,"
                        + "tipo,existencia,solicitado,fecha,hora)  values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, idcliente);
                ps.setInt(2, iden);
                ps.setString(3,nom);
                ps.setString(4,marca);
                ps.setString(5,tipo);
                ps.setString(6,existencia);
                ps.setString(7,sol);
                ps.setString(8,fecha);
                ps.setString(9,hora);
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


