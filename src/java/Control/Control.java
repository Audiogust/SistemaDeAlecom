/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.Conexion;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class Control extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          String opcion = request.getParameter("opcion");
          
          if (opcion.equals("enviar")) {
                Connection c = Conexion.conectar();
                try {
                    
                    String usuario = request.getParameter("usuario");
                    String password = request.getParameter("password");
                    
                   
                    if (c != null) {

                        PreparedStatement ps = c.prepareStatement("select * from usuarios where nombre=? and contrasena=?");
                        ps.setString(1, usuario);
                        ps.setString(2, password);
                        ResultSet rs = ps.executeQuery();
                        HttpSession sesion = request.getSession();
                        if (rs.next()) {
                            int t = rs.getInt("tipo");
                            switch (t) {
                                case 1:
                                    
                                    sesion.setAttribute("user", usuario);
                                    sesion.setAttribute("nivel", "1");
                                    request.getRequestDispatcher("menuProyectos.jsp").forward(request, response);
                                    break;
                                case 2:
                                    request.getRequestDispatcher("MenuPrincipal_1.jsp").forward(request, response);
                                    break;
                                case 3:
                                    request.getRequestDispatcher("MenuPrincipal_2.jsp").forward(request, response);
                                    break;
                            }
                        } else {                 
                            System.out.println("Usuario o Password Incorrecta!");

                        }
                    } else {                     
                        System.out.println("No hay conexion a la base");
                    }
                } catch (Exception e) {                  
                    System.out.println(e);
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
