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
    private String folio;

    public Precompra() {
    }

    public Precompra(String numeroSerie, String folio) {
        this.numeroSerie = numeroSerie;
        this.folio = folio;
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
        public String precompra(String numSerie, String folio) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO PreCompra(numeroSerie,folio)  values(?,?)");
                ps.setString(1, numSerie);
                ps.setString(2, folio);               
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
             ResultSet rs = st.executeQuery(" SELECT * FROM PreCompra ");
             materiales  = new Vector();
             while(rs.next()){
                 materiales.add(new Precompra(rs.getString("numeroSerie"),rs.getString("folio")));
             }
               
              return materiales; 
               
           }else {
            return null;
        }
          
    }
     
   
    
}
