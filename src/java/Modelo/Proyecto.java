
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;


public class Proyecto {
    
    private String otiga;
    private String numSerie;
    private String nombre;
    private String region;
    private String direccion;
    private String latitud;
    private String longitud;
    private String elevacion;
    private String tecnologia;
    private String ubicacion;
    private String fecha;
    private String autorizado;
    private String tipo;
    
    
    public Proyecto(){
        
    }

    public Proyecto(String otiga, String nombre, String region, String direccion, String latitud, String longitud, String elevacion, String tecnologia, String ubicacion, String fecha, String autorizado, String tipo) {
        this.otiga = otiga;
        this.nombre = nombre;
        this.region = region;
        this.direccion = direccion;
        this.latitud = latitud;
        this.longitud = longitud;
        this.elevacion = elevacion;
        this.tecnologia = tecnologia;
        this.ubicacion = ubicacion;
        this.fecha = fecha;
        this.autorizado = autorizado;
        this.tipo = tipo;
    }

    public String getNumSerie() {
        return numSerie;
    }

    public void setNumSerie(String numSerie) {
        this.numSerie = numSerie;
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

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public String getElevacion() {
        return elevacion;
    }

    public void setElevacion(String elevacion) {
        this.elevacion = elevacion;
    }

    public String getTecnologia() {
        return tecnologia;
    }

    public void setTecnologia(String tecnologia) {
        this.tecnologia = tecnologia;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getAutorizado() {
        return autorizado;
    }

    public void setAutorizado(String autorizado) {
        this.autorizado = autorizado;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    public static Vector mostrarTablaDevolucion() throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM Proyectos WHERE status='E' ");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new Proyecto(rs.getString("otiga"),rs.getString("nombre"),rs.getString("region"),
                                                  rs.getString("direccion"),rs.getString("latitud"),rs.getString("longitud"),
                                                  rs.getString("elevacion"),rs.getString("tecnologia"),rs.getString("ubicacion"),
                                                  rs.getString("fecha"),rs.getString("autorizado"),rs.getString("tipo")));
             }               
              return proyectos;                
           }else {
            return null;
        }
    }
    
    public static Vector mostrarTablaProyectos() throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM Proyectos");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new Proyecto(rs.getString("otiga"),rs.getString("nombre"),rs.getString("region"),
                                                  rs.getString("direccion"),rs.getString("latitud"),rs.getString("longitud"),
                                                  rs.getString("elevacion"),rs.getString("tecnologia"),rs.getString("ubicacion"),
                                                  rs.getString("fecha"),rs.getString("autorizado"),rs.getString("tipo")));
             }               
              return proyectos;                
           }else {
            return null;
        }
    }
    
     public static Vector mostrarBusqueda(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM Proyectos WHERE nombre  LIKE '%" + busqueda +"%'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new Proyecto(rs.getString("otiga"),rs.getString("nombre"),rs.getString("region"),
                                                  rs.getString("direccion"),rs.getString("latitud"),rs.getString("longitud"),
                                                  rs.getString("elevacion"),rs.getString("tecnologia"),rs.getString("ubicacion"),
                                                  rs.getString("fecha"),rs.getString("autorizado"),rs.getString("tipo")));
             }               
              return proyectos;                
           }else {
            return null;
        }
    }
     public static Vector mostrarBusquedaS(String busqueda) throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM Proyectos WHERE nombre  LIKE '%" + busqueda +"%' and status = 'D'");
             proyectos  = new Vector();
             while(rs.next()){
                       proyectos.add(new Proyecto(rs.getString("otiga"),rs.getString("nombre"),rs.getString("region"),
                                                  rs.getString("direccion"),rs.getString("latitud"),rs.getString("longitud"),
                                                  rs.getString("elevacion"),rs.getString("tecnologia"),rs.getString("ubicacion"),
                                                  rs.getString("fecha"),rs.getString("autorizado"),rs.getString("tipo")));
             }               
              return proyectos;                
           }else {
            return null;
        }
    }
     public boolean buscarProyecto(String id){
        boolean res=false;
        try {
        Connection c = Conexion.conectar();
        Statement st =c.createStatement();
        ResultSet rs=st.executeQuery("select * from Proyectos where otiga='"+id+"'");
            if (rs.next()) {
                this.otiga=rs.getString("otiga");
                this.nombre=rs.getString("nombre");
                this.region=rs.getString("region");
                this.direccion=rs.getString("direccion");
                this.latitud=rs.getString("latitud");
                this.longitud=rs.getString("longitud");
                this.elevacion=rs.getString("elevacion");
                this.tecnologia=rs.getString("tecnologia");
                this.ubicacion=rs.getString("ubicacion");
                this.fecha=rs.getString("fecha");
                this.autorizado=rs.getString("autorizado");
                this.tipo=rs.getString("tipo");
                res=true;
            }
        } catch (Exception e) {
        }
        return res;
    }
    public String guardar() {
        System.out.println("guardarmetodo");
         Connection c = Conexion.conectar();
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement(" INSERT INTO Proyectos (otiga, numeroSerie, nombre, region, direccion,"
                    + " latitud, longitud, elevacion, tecnologia, ubicacion,fecha,autorizado, tipo) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, otiga);
                ps.setString(2, numSerie);
                ps.setString(3, nombre);
                ps.setString(4, region);
                ps.setString(5, direccion);
                ps.setString(6, latitud);
                ps.setString(7, longitud);
                ps.setString(8, elevacion);
                ps.setString(9, tecnologia);
                ps.setString(10, ubicacion);
                ps.setString(11, fecha);
                ps.setString(12, autorizado);
                ps.setString(13, tipo);
                ps.execute();
                return "Se han guardado los datos Correctamente";
            } catch (Exception e) {
                return "Error en guardar " + e;
            }
        } else {
            return ("No hay conexion a la base");
        }
    }
    
    
      public static Vector mostrar() throws SQLException{
        Vector proyectos = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery("select * from Proyectos ");
             proyectos  = new Vector();
             while(rs.next()){
                 proyectos.add(new Proyecto(rs.getString("otiga"),rs.getString("nombre"),rs.getString("region"),
                                                  rs.getString("direccion"),rs.getString("latitud"),rs.getString("longitud"),
                                                  rs.getString("elevacion"),rs.getString("tecnologia"),rs.getString("ubicacion"),
                                                  rs.getString("fecha"),rs.getString("aurotizado"),rs.getString("tipo")));
             }
               
              return proyectos; 
               
           }else {
            return null;
        }
          
    }
      
  public String cambioStatus(String otigaa) {
        Connection c = Conexion.conectar();
        String respuesta = "";
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement("update Proyectos set status='D' where otiga = ?");
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
    
  public String cambioStatusDevolver(String otigaa) {
        Connection c = Conexion.conectar();
        String respuesta = "";
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement("update Proyectos set status='E' where otiga = ?");
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
  public String cambioStatusDevolucionA(String otigaa) {
        Connection c = Conexion.conectar();
        String respuesta = "";
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement("update Proyectos set status='A' where otiga = ?");
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
  
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public String GenerarSerieProyecto() {
        String numeroSerie = "";
        String sql = "SELECT MAX(numeroSerie) from Proyectos";
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
}
