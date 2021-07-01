
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;


public class Clientes {
    
    private int numero;
    private String id;
    private String numeroSerie;
    private String nombre;
    private String direccion;
    private String telefono;
    private String correo;
    private String tiempo;
    private String megas;
    private String tarifa;
    private String fecha;
    private int grupo;
    private String comentarios;

    public Clientes() {
    }

    public Clientes(int numero,String id, String nombre, String direccion, String telefono, String correo, String tiempo, String megas, String tarifa, String fecha, int grupo,  String comentarios) {
        this.numero = numero;
        this.id = id;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.correo = correo;
        this.tiempo = tiempo;
        this.megas = megas;
        this.tarifa = tarifa;
        this.fecha = fecha;
        this.grupo = grupo;
        this.comentarios = comentarios;
        
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNumeroSerie() {
        return numeroSerie;
    }

    public void setNumeroSerie(String numeroSerie) {
        this.numeroSerie = numeroSerie;
    }
    
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTiempo() {
        return tiempo;
    }

    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }

    public String getMegas() {
        return megas;
    }

    public void setMegas(String megas) {
        this.megas = megas;
    }

    public String getTarifa() {
        return tarifa;
    }

    public void setTarifa(String tarifa) {
        this.tarifa = tarifa;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getGrupo() {
        return grupo;
    }

    public void setGrupo(int grupo) {
        this.grupo = grupo;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    public String guardar() {
        
         Connection c = Conexion.conectar();
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement("insert into Clientes(ID,numeroSerie,nombre, direccion, telefono, correo, tiempo, megas , tarifa, fecha, grupo, comentarios) values(?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, id);
                ps.setString(2, numeroSerie);
                ps.setString(3, nombre);
                ps.setString(4, direccion);
                ps.setString(5, telefono);
                ps.setString(6, correo);
                ps.setString(7, tiempo);
                ps.setString(8, megas);
                ps.setString(9, tarifa);
                ps.setString(10, fecha);
                ps.setInt(11, grupo);
                ps.setString(12, comentarios);
                ps.execute();
                return "Se han guardado los datos correctamente";
            } catch (Exception e) {
                return "Error en guardar " + e;
            }
        } else {
            return ("No hay conexion a la base");
        }
    }
    
     public boolean buscarClientes(String id){
        boolean res=false;
        try {
        Connection c = Conexion.conectar();
        Statement st =c.createStatement();
        ResultSet rs=st.executeQuery("select * from Clientes where ID='"+id+"'");
            if (rs.next()) {
                this.id=rs.getString("ID");
                this.nombre=rs.getString("nombre");
                this.direccion=rs.getString("direccion");
                this.telefono=rs.getString("telefono");
                this.correo=rs.getString("correo");
                this.tiempo=rs.getString("tiempo");
                this.megas=rs.getString("megas");
                this.tarifa=rs.getString("tarifa");
                this.fecha=rs.getString("fecha");
                this.grupo=rs.getInt("grupo");
                this.comentarios=rs.getString("comentarios");
                res=true;
            }
        } catch (Exception e) {
        }
        return res;
    }
    
    public static Vector mostrar() throws SQLException{
        Vector clientes = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery("select * from Clientes ");
             clientes = new Vector();
             while(rs.next()){
                 clientes.add(new Clientes(rs.getInt("Numero"),rs.getString("ID"),rs.getString("nombre"), rs.getString("direccion"),rs.getString("telefono"),rs.getString("correo"),rs.getString("tiempo")
                 ,rs.getString("megas"), rs.getString("tarifa"), rs.getString("fecha"), rs.getInt("grupo"),rs.getString("comentarios")));
             }
              return clientes; 
               
           }else {
            return null;
        }
    }
    
          public static Vector mostrarClientes(String busqueda) throws SQLException {
        Vector clientes = null;
        Connection c = Conexion.conectar();
        if (c != null) {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(" SELECT * FROM Clientes WHERE grupo  LIKE '%" + busqueda + "%'");
            clientes = new Vector();
            while (rs.next()) {
                clientes.add(new Clientes(rs.getInt("Numero"), rs.getString("ID"), rs.getString("nombre"), rs.getString("direccion"), rs.getString("telefono"), rs.getString("correo"), rs.getString("tiempo"),
                         rs.getString("megas"), rs.getString("tarifa"), rs.getString("fecha"), rs.getInt("grupo"), rs.getString("comentarios")));
            }
            return clientes;

        } else {
            return null;
        }
    }
          
     public static Vector mostrarBusquedamM(String busqueda) throws SQLException{
        Vector clientes = null; 
        Connection c = Conexion.conectar();
           if (c != null) {
             Statement st = c.createStatement();
             ResultSet rs = st.executeQuery(" SELECT * FROM Clientes WHERE nombre  LIKE '%" + busqueda +"%' and status = 'D'");
             clientes  = new Vector();
             while(rs.next()){
                       clientes.add(new Clientes(rs.getInt("Numero"), rs.getString("ID"), rs.getString("nombre"), rs.getString("direccion"), rs.getString("telefono"), rs.getString("correo"), rs.getString("tiempo"),
                         rs.getString("megas"), rs.getString("tarifa"), rs.getString("fecha"), rs.getInt("grupo"), rs.getString("comentarios")));
             }               
              return clientes;                
           }else {
            return null;
        }     
     }
     
     
       public String Status(String id) {
        Connection c = Conexion.conectar();
        String respuesta = "";
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement("update Clientes set status='D' where ID = ?");
                ps.setString(1, id);
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
       
       
           public String StatusDev(String id) {
        Connection c = Conexion.conectar();
        String respuesta = "";
        if (c != null) {
            try {
                PreparedStatement ps = c.prepareStatement("update Clientes set status='E' where ID = ?");
                ps.setString(1, id);
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
           
           
          public static Vector mostrarMatDev() throws SQLException {
        Vector clientes = null;
        Connection c = Conexion.conectar();
        if (c != null) {
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(" SELECT * FROM Clientes WHERE status='E' ");
            clientes = new Vector();
            while (rs.next()) {
               clientes.add(new Clientes(rs.getInt("Numero"), rs.getString("ID"), rs.getString("nombre"), rs.getString("direccion"), rs.getString("telefono"), rs.getString("correo"), rs.getString("tiempo"),
                         rs.getString("megas"), rs.getString("tarifa"), rs.getString("fecha"), rs.getInt("grupo"), rs.getString("comentarios")));
            }
            return clientes;
        } else {
            return null;
        }
        
    }
          
    
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
          
          
    public String GenerarSerieCliente() {
        String numeroSerie = "";
        String sql = "SELECT MAX(numeroSerie) from Clientes";
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

