
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
        ResultSet rs=st.executeQuery(" select * from Materiales WHERE codigo = '" + cod + "'");
            if (rs.next()) {
                this.codigo=rs.getString("codigo");
                this.descripcion=rs.getString("descripcion");
                this.unidad=rs.getString("unidad");
                this.existencia=rs.getInt("existencia");
                this.salida=rs.getInt("salida");
                System.out.println(codigo+descripcion+unidad+existencia);
                res=true;
            }
        } catch (Exception e) {
        }
        return res;
    }
    
    public String Descripcion(String des){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT  descripcion from Materiales where codigo=?");
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
    
    public String Unidades(String des){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT  unidad from Materiales where codigo=? ");
            ps.setString(1, des);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String descripcion = rs.getString("unidad");
                return descripcion;
            }
            return "No hay datos";
        } catch (Exception e) {
            return "No se pudo";
        }
    }
    public String Existencia(String exi){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT  existencia from Materiales where codigo=? ");
            ps.setString(1, exi);
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
    
      public String Solicitado(String soli,String ot){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT  solicitado from solicitudMat where codigo=? and otiga=? ");
            ps.setString(1, soli);
            ps.setString(2, ot);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String descripcion = rs.getString("solicitado");
                return descripcion;
            }
            return "No hay datos";
        } catch (Exception e) {
            return "No se pudo";
        }
    }
      
        public String SolicitadoWisp(String soli){
        Connection c = Conexion.conectar();
       
        try{
            PreparedStatement ps = c.prepareStatement("SELECT  solicitado from solicitudWisp where codigo=? ");
            ps.setString(1, soli);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String descripcion = rs.getString("solicitado");
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
                PreparedStatement ps = c.prepareStatement(" INSERT INTO MaterialSolicitado(otiga,codigo,solicitado)  values(?,?,?)");
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
     public String insertarHisto(String ot, String cod, String nom,String uni,
             int exis,int sol,String fecha, String hora) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO historialSolicitado(otiga,codigo,nombre,unidad,existencia,solicitado,fecha,hora)  values(?,?,?,?,?,?,?,?)");
                ps.setString(1, ot);
                ps.setString(2, cod);
                ps.setString(3, nom);
                ps.setString(4, uni);
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
     public String insertarHistoW(String ot, String cod, String nom,String uni,
                                  int exis,int sol,String fecha, String hora) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO historialSolicitadoW(otiga,codigo,nombre,unidad,existencia,solicitado,fecha,hora)  values(?,?,?,?,?,?,?,?)");
                ps.setString(1, ot);
                ps.setString(2, cod);
                ps.setString(3, nom);
                ps.setString(4, uni);
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
     
       public String insertarHistoSalida(String ot, String cod, String nom,String uni,
                                         int exis, int sol, int ea, String fecha, String hora) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO historialSalida(otiga,codigo,nombre,unidad,"
                                    + "existencia_ant,solicitado,existencia_act,fecha,hora)  values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, ot);
                ps.setString(2, cod);
                ps.setString(3, nom);
                ps.setString(4, uni);
                ps.setInt(5,exis);
                ps.setInt(6,sol);
                ps.setInt(7,ea);
                ps.setString(8, fecha);
                ps.setString(9, hora);
                ps.execute();
                return "Modificación realizada";
            } else {
                return "No hay conexion a la base ";
            }
        } catch (Exception e) {
            return "Error al modificar " + e;
        }
     }
       public String insertarHistoDevolucion(String ot, String cod, String nom,String uni,
                                         int exis, int sol, int ea, String fecha, String hora) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO historialDevolucion(otiga,codigo,nombre,unidad,"
                                    + "existencia_ant,solicitado,existencia_act,fecha,hora)  values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, ot);
                ps.setString(2, cod);
                ps.setString(3, nom);
                ps.setString(4, uni);
                ps.setInt(5,exis);
                ps.setInt(6,sol);
                ps.setInt(7,ea);
                ps.setString(8, fecha);
                ps.setString(9, hora);
                ps.execute();
                return "Modificación realizada";
            } else {
                return "No hay conexion a la base ";
            }
        } catch (Exception e) {
            return "Error al modificar " + e;
        }
     }
       public String insertarHistoDevolucionW(String ot, String cod, String nom,String uni,
                                         int exis, int sol, int ea, String fecha, String hora) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO historialDevolucionW(otiga,codigo,nombre,unidad,"
                                    + "existencia_ant,solicitado,existencia_act,fecha,hora)  values(?,?,?,?,?,?,?,?,?)");
                ps.setString(1, ot);
                ps.setString(2, cod);
                ps.setString(3, nom);
                ps.setString(4, uni);
                ps.setInt(5,exis);
                ps.setInt(6,sol);
                ps.setInt(7,ea);
                ps.setString(8, fecha);
                ps.setString(9, hora);
                ps.execute();
                return "Modificación realizada";
            } else {
                return "No hay conexion a la base ";
            }
        } catch (Exception e) {
            return "Error al modificar " + e;
        }
     }
     public String precompra(String fol, String nom, String cantidad) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO OrdenPreCompra(folio,nombre,solicitado) values(?,?,?)");
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
     
        public String Wisp(String codigo, String descripcion, String cantidad) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO MaterialSolicitadoWisp(ID,codigo,solicitado)  values(?,?,?)");
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
        public String eliminarPedido(String ot) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement("delete from MaterialSolicitado WHERE otiga=?");    
                ps.setString(1, ot);
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
        
        public String eliminarPedidoWisp(String id) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement("delete from MaterialSolicitadoWisp WHERE ID=?");    
                ps.setString(1, id);
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
        
        public String eliminarPedidoWispE(String id) {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement("delete from EquipamientoSolicitadoWisp WHERE ID=?");    
                ps.setString(1, id);
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
        
        public String cambio() {
        Connection c = Conexion.conectar();
        try {
            if (c != null) {
                PreparedStatement ps = c.prepareStatement("update Materiales set descripcion=?, unidad=?, existencia=?, salida=? where codigo=?");    
                ps.setString(1, descripcion);
                ps.setString(2, unidad);
                ps.setInt(3, existencia);
                ps.setInt(4, salida);
                ps.setString(5, codigo);
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
        
        
         public String registrar() {
        
         Connection c = Conexion.conectar();
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement("insert into Materiales(codigo, descripcion, unidad, existencia, salida) values(?,?,?,?,?)");
                ps.setString(1, codigo);
                ps.setString(2, descripcion);
                ps.setString(3, unidad);
                ps.setInt(4, existencia);
                ps.setInt(5, salida);
                ps.execute();
                return "Se han guardado los datos correctamente";
            } catch (Exception e) {
                return "Error en guardar " + e;
            }
        } else {
            return ("No hay conexion a la base");
        }
        }
      
    
}
