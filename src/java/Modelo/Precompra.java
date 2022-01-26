package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;


public class Precompra {
    
    
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    
    private String numeroSerie;
    private String otiga;
    private String folio;

    public Precompra() {
    }

    public Precompra(String numeroSerie, String otiga, String folio) {
        this.numeroSerie = numeroSerie;
        this.otiga = otiga;
        this.folio = folio;
    }

    public String getOtiga() {
        return otiga;
    }

    public void setOtiga(String otiga) {
        this.otiga = otiga;
    }

    

    public String getNumeroSerie() {
        return numeroSerie;
    }

    public void setNumeroSerie(String numeroSerie) {
        this.numeroSerie = numeroSerie;
    }

    public String getFolio() {
        return folio;
    }

    public void setFolio(String folio) {
        this.folio = folio;
    }
    
    
    
        public boolean buscarPre(String id){
        boolean res=false;
        try {
        Connection c = Conexion.conectar();
        Statement st =c.createStatement();
        ResultSet rs=st.executeQuery("select * from PreCompra where folio='"+id+"'");
            if (rs.next()) {
                this.numeroSerie=rs.getString("numeroSerie");
                this.otiga = rs.getString("otiga");
                this.folio=rs.getString("folio");
                
                res=true;
            }
        } catch (Exception e) {
        }
        return res;
    }
    public String GenerarSerie(){
        String numeroSerie="";
        String sql="SELECT MAX(numeroSerie) from PreCompra";
        
        try {
            con =cn.conectar();
            ps= con.prepareStatement(sql);
            rs =ps.executeQuery();
            while (rs.next()) {
               numeroSerie = rs.getString(1);        
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return numeroSerie;
    }
    public String GenerarSerieProyecto(){
        String numeroSerie="";
        String sql="SELECT MAX(numeroSerie) from Proyectos";
        
        try {
            con =cn.conectar();
            ps= con.prepareStatement(sql);
            rs =ps.executeQuery();
            while (rs.next()) {
               numeroSerie = rs.getString(1);        
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return numeroSerie;
    }
    public String GenerarSerieWisp(){
        String numeroSerie="";
        String sql="SELECT MAX(folio) from Clientes";
        
        try {
            con =cn.conectar();
            ps= con.prepareStatement(sql);
            rs =ps.executeQuery();
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
        String res="";
        if (num >= 1000 && num < 10000) {
            res =""+ num;
        }
        if (num >= 100 && num < 1000) {
            res ="0"+ num;
        }
        if (num >= 10 && num < 100) {
            res ="00"+ num;
        }
        if (num >= 1 && num < 10) {
            res ="000"+ num;
        }
        return res;
    }
        
        public String numerosWisp(int num){
        num = num + 1;
        String res="";
        if (num >= 1000 && num < 10000) {
            res =""+ num;
        }
        if (num >= 100 && num < 1000) {
            res ="0"+ num;
        }
        if (num >= 10 && num < 100) {
            res ="00"+ num;
        }
        if (num >= 1 && num < 10) {
            res ="000"+ num;
        }
        return res;
    }
        public String precompra(String numSerie,String otiga, String folio) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO PreCompra(numeroSerie,otiga,folio)  values(?,?,?)");
                ps.setString(1, numSerie);
                ps.setString(2, otiga);
                ps.setString(3, folio);
                ps.execute();
                return "Modificación realizada";
            } else {
                return "No hay conexion a la base ";
            }
        } catch (Exception e) {
            return "Error al modificar " + e;
        }
     }
        
     public static Vector mostrartabla() throws SQLException{
        Vector materiales = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM PreCompra WHERE status = 'A' ");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new Precompra(rs.getString("numeroSerie"),rs.getString("otiga"),rs.getString("folio")));
             }
               
              return materiales; 
               
           }else {
            return null;
        }
          
    }
     
   public static Vector mostrartablaOrd() throws SQLException{
        Vector materiales = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM PreCompra WHERE status = 'D' ");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new Precompra(rs.getString("numeroSerie"),rs.getString("otiga"),rs.getString("folio")));
             }
               
              return materiales; 
               
           }else {
            return null;
        }
          
    }
   
   public String cambioStatusPrecompra(String otigaa) {
        Connection c = Conexion.conectar();
        String respuesta = "";
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement("update PreCompra set status='D' where folio = ?");
                ps.setString(1, otigaa);
                ps.execute();
                respuesta = "Habilitado";
                return respuesta;

            } catch (Exception e) {
                respuesta = "Error";
                return respuesta;
            }

        } else {
        }
        return "error de conexion";
     }
   public String cambioStatusOrden(String otigaa) {
        Connection c = Conexion.conectar();
        String respuesta = "";
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement("update PreCompra set status='E' where folio = ?");
                ps.setString(1, otigaa);
                ps.execute();
                respuesta = "Habilitado";
                return respuesta;

            } catch (Exception e) {
                respuesta = "Error";
                return respuesta;
            }

        } else {
        }
        return "error de conexion";
     }
   
   public String cambioCantidadSolicitada(String cod, int sol) {
        Connection c = Conexion.conectar();
        String respuesta = "";
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement("update precompraVista set solicitado = ?  where codigo = ?");
                ps.setInt(1, sol);
                ps.setString(2, cod);
                ps.execute();
                respuesta = "Habilitado";
                return respuesta;

            } catch (Exception e) {
                respuesta = "Error";
                return respuesta;
            }

        } else {
        }
        return "error de conexion";
     }
   public static Vector mostrartablaPre() throws SQLException{
        Vector materiales = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM PreCompra ");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new Precompra(rs.getString("numeroSerie"),rs.getString("otiga"),rs.getString("folio")));
             }
               
              return materiales; 
               
           }else {
            return null;
        }
          
    }
   public String precompraHistorial(String folio,String cod,String nom,String uni,String exis,String sol,String aut,String fecha,String hor) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO historialPreordenCompra(folio,codigo,nombre,unidad,existencia,solicitado,autorizado,hora,fecha)  values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, folio);
                ps.setString(2, cod);
                ps.setString(3, nom);
                ps.setString(4, uni);
                ps.setString(5, exis);
                ps.setString(6, sol);
                ps.setString(7, aut);
                ps.setString(8, hor);
                ps.setString(9, fecha);
                ps.execute();
                return "Modificación realizada";
            } else {
                return "No hay conexion a la base ";
            }
        } catch (Exception e) {
            return "Error al modificar " + e;
        }
     }
   
   public String OrdencompraHistorial(String folio, String cod,String nom,String uni,String exisant,
                                      String sol, String aut, String exisact,String fecha,String hor) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO historialOrdenCompra(folio,codigo,nombre,unidad,"
                        + "existencia_ant,solicitado,autorizado,existencia_act,hora,fecha)  values(?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, folio);
                ps.setString(2, cod);
                ps.setString(3, nom);
                ps.setString(4, uni);
                ps.setString(5, exisant);
                ps.setString(6, sol);
                ps.setString(7, aut);
                ps.setString(8, exisact);
                ps.setString(9, fecha);
                ps.setString(10, hor);
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
