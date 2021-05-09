
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
public static Connection conectar (){
        
        Connection cn = null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            cn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=AlecomBD;user=sa;password=sasa;");
            
        }catch(Exception e){
            System.out.println("Error al conectar:" + e);
            return (cn);
        }
 
         return (cn);
    }    
    
}
