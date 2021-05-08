/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Vane
 */
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
