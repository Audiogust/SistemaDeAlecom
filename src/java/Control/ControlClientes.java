/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.Clientes;
import Modelo.Material;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vane
 */
public class ControlClientes extends HttpServlet {

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

            if (opcion.equals("v_registrar_clientes")) {

                String id = request.getParameter("id");
                String nombre = request.getParameter("n_nombre");
                String direccion = request.getParameter("n_direccion");
                String telefono = request.getParameter("n_telefono");
                String correo = request.getParameter("n_correo");
                String tiempo = request.getParameter("n_tiempo");
                String megas = request.getParameter("n_megas");
                String tarifa = request.getParameter("n_tarifa");
                String fecha = request.getParameter("n_fecha");
                int grupo = Integer.parseInt(request.getParameter("n_grupo"));
                String comentarios = request.getParameter("n_comentarios");

                if (id.equals("") || nombre.equals("") || direccion.equals("") || telefono.equals("") || correo.equals("")
                        || tiempo.equals("") || megas.equals("") || tarifa.equals("") || fecha.equals("")) {
                    Clientes cl1 = new Clientes();
                    String x = cl1.guardar();
                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("res0", x);
                    request.getRequestDispatcher("Clientes_error.jsp").forward(request, response);
                } else {
                    Clientes cl1 = new Clientes();
                    cl1.setId(id);
                    cl1.setNombre(nombre);
                    cl1.setDireccion(direccion);
                    cl1.setTelefono(telefono);
                    cl1.setCorreo(correo);
                    cl1.setTiempo(tiempo);
                    cl1.setMegas(megas);
                    cl1.setTarifa(tarifa);
                    cl1.setFecha(fecha);
                    cl1.setGrupo(grupo);
                    cl1.setComentarios(comentarios);

                    String x = cl1.guardar();
                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("res0", id);
                    sesion.setAttribute("res1", nombre);
                    sesion.setAttribute("res2", direccion);
                    sesion.setAttribute("res3", telefono);
                    sesion.setAttribute("res4", correo);
                    sesion.setAttribute("res5", tiempo);
                    sesion.setAttribute("res6", megas);
                    sesion.setAttribute("res7", tarifa);
                    sesion.setAttribute("res8", fecha);
                    sesion.setAttribute("res9", grupo);
                    sesion.setAttribute("res10", comentarios);
                    request.getRequestDispatcher("Exito_clientes.jsp").forward(request, response);

                }

            }
            if (opcion.equals("BuscarGrupo")) {
                 
                  request.getRequestDispatcher("Instalacion.jsp").forward(request, response);
              }
            if (opcion.equals("guardarDatos")) {
                String codigo[] = request.getParameterValues("codigo");
                String cantidad[] = request.getParameterValues("cantidades");
                Material m = new Material();

                for (int i = 0; i < codigo.length; i++) {
                    if (codigo[i].length() > 0) {

                        String material = m.Descripcion(codigo[i]);

                        System.out.println(codigo[i] + " " + cantidad[i] + " " + material);

                    }
                }

                request.getRequestDispatcher("Wisp.jsp").forward(request, response);
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
