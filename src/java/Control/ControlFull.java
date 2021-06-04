/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.Material;
import Modelo.MaterialSolicitado;
import Modelo.OrdenPrecompra;
import Modelo.Precompra;
import Modelo.Proyecto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vane
 */
public class ControlFull extends HttpServlet {

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
     /* TODO output your page here. You may use following sample code. */
            
     
            String opcion = request.getParameter("opcion");
            String numeroSerie;
            
            if (opcion.equals("BuscarSolicitud")) {
                MaterialSolicitado ms = new MaterialSolicitado();
                
               request.getRequestDispatcher("consultaSolicitud.jsp").forward(request, response);
                               
            }
            
            if (opcion.equals("enviarDatos")) {
               Proyecto pr = new Proyecto();
               Material m = new Material();
               Material m1 = new Material();
               String ar[] = request.getParameterValues("numeros");
               String arr[] = request.getParameterValues("cod");
               String otiga = request.getParameter("otiga");               
               pr.cambioStatus(otiga);
               for (int i = 0; i < ar.length; i++) {
                    if (ar[i].length() > 0) {
                    String descripciones = m.Descripcion(arr[i]);
                    m1.Pedidos(otiga, descripciones, ar[i]);
                    System.out.println(arr[i]+"  || "+ar[i]);    
                    }                    
                }
           
            request.getRequestDispatcher("MenuPrincipal.jsp").forward(request, response);
                
            }
            if (opcion.equals("enviarAlmacen")) {   
                
                Proyecto pr = new Proyecto();
                String idProyecto=request.getParameter("otiga_1");
                MaterialSolicitado mat = new MaterialSolicitado();
                String soli[] = request.getParameterValues("solicitudes");
                String nombres[] = request.getParameterValues("codigosS");
                for (int i = 0; i < soli.length; i++) {
                    if (soli[i].length() > 0) {
                    mat.Operacion(nombres[i],Integer.parseInt(soli[i]));                    
                    System.out.println(soli[i]+" "+nombres[i]);
                        System.out.println("hoooola");
                    }
                pr.cambioStatusDevolver(idProyecto);
                    
                    
                }
                
                
                 request.getRequestDispatcher("MenuPrincipal.jsp").forward(request, response);
            }
            
             if (opcion.equals("autorizarExistencia")) {
                 
                String idProyecto=request.getParameter("otiga_1");
                OrdenPrecompra op = new OrdenPrecompra();
                String codigoe[] = request.getParameterValues("codigosEx");
                String numeros[] = request.getParameterValues("numeroExi");
                for (int i = 0; i < codigoe.length; i++) {    
                    op.Autorizar(codigoe[i],Integer.parseInt(numeros[i]));                    
                    System.out.println(codigoe[i]+" "+numeros[i]);                   
                }
                
                
                request.getRequestDispatcher("Compras.jsp").forward(request, response);  
             }  
            
              
             if (opcion.equals("BuscarProyecto")) {
                 request.getRequestDispatcher("ingenieria.jsp").forward(request, response);  
             }  
             
             if (opcion.equals("BuscarProyectoS")) {
                 request.getRequestDispatcher("busquedaSM.jsp").forward(request, response);  
             }  
              
            if (opcion.equals("enviarProyecto")) {
                String otiga = "";

                String nombre = request.getParameter("nombre");
                String region = request.getParameter("region");
                String direccion = request.getParameter("direccion");
                String latitud = request.getParameter("latitud");
                String longitud = request.getParameter("longitud");
                String elevacion = request.getParameter("elevacion");
                String tecnologia = request.getParameter("tecnologia");
                String ubicacion = request.getParameter("ubicacion");
                String fecha = request.getParameter("i_fecha");
                String autoriza = request.getParameter("i_autorizadop");
                String otigon = request.getParameter("otigon");
                String tipo = request.getParameter("tipoPro");

                if (nombre.equals("") || region.equals("") || region.equals("")
                        || direccion.equals("") || latitud.equals("") || longitud.equals("")
                        || elevacion.equals("") || tecnologia.equals("") || ubicacion.equals("")
                        || fecha.equals("") || autoriza.equals("") || tipo.equals("")) {

                    request.getRequestDispatcher("Error.jsp").forward(request, response);
                } else {

                    if (tipo.equals("donado")) {
                        otiga += "Do";
                    } else {
                        otiga += "Fs";
                    }
                    otiga += "_" + nombre;
                    otiga += fecha;
                    otiga += otigon;

                    System.out.println(tipo);
                    /* DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");          
         LocalDate ahora = LocalDate.now();
       
                     */

                    Date fechad = new Date(Calendar.getInstance().getTimeInMillis());

                    Proyecto p = new Proyecto();

                    p.setOtiga(otiga);
                    p.setNombre(nombre);
                    p.setRegion(region);
                    p.setDireccion(direccion);
                    p.setLatitud(latitud);
                    p.setLongitud(longitud);
                    p.setElevacion(elevacion);
                    p.setTecnologia(tecnologia);
                    p.setUbicacion(ubicacion);
                    p.setFecha(fecha);
                    p.setAutorizado(autoriza);
                    p.setTipo(tipo);
                    

                    p.guardar();

                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("res0", nombre);
                    sesion.setAttribute("res1", otiga);
                    request.getRequestDispatcher("Exito.jsp").forward(request, response);
                }

            }

            if (opcion.equals("BuscarMaterial")) {
                request.getRequestDispatcher("Consulta.jsp").forward(request, response);
            }
            
            if (opcion.equals("botonPreorden")) {
             DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
             Calendar cal = Calendar.getInstance();  
             String fechaa = dateFormat.format(cal.getTime());    
             String folio ="PREOC-";   
             folio = folio+fechaa;
             
                Precompra pc = new Precompra();
                Precompra pc1 = new Precompra();
                numeroSerie = pc.GenerarSerie();
                
                if (numeroSerie == null) {
                    numeroSerie = "0001";
                    folio =folio + "-A"+numeroSerie;               
                    request.setAttribute("folioo", folio);
                    request.setAttribute("numeroS", numeroSerie);
                }else{
                    int incrementador = Integer.parseInt(numeroSerie);
                    numeroSerie = pc1.numeros(incrementador);
                    folio =folio + "-A"+numeroSerie;
                    request.setAttribute("folioo", folio);
                    request.setAttribute("numeroS", numeroSerie);
                }
                
                request.getRequestDispatcher("Preorden.jsp").forward(request, response);
            }
            
            if (opcion.equals("botonPreordenAccion")) {
             Material m = new Material();
             Material m1 = new Material();
             Precompra p = new Precompra();
             String foliosito = request.getParameter("folioextraer");
             String num = request.getParameter("folionumeros");
             
             String codigos[] = request.getParameterValues("codC");
             String numeros[] = request.getParameterValues("numerosC");
             int c=0;
                for (int i = 0; i < codigos.length; i++) {
                    if (numeros[i].length() > 0) {
                    c++;
                    } 
                }              
                if (c > 0) {
                    p.precompra(num, foliosito);
                    System.out.println(c);
                    for (int i = 0; i < codigos.length; i++) {
                        if (numeros[i].length() > 0) {
                            String descripciones = m.Descripcion(codigos[i]);
                            m1.precompra(foliosito, descripciones, numeros[i]);
                            System.out.println(descripciones + "sd" + numeros[i]);
                        }
                    }
                    request.getRequestDispatcher("Compras.jsp").forward(request, response);
                }
                else if(c ==0){
                    request.getRequestDispatcher("Preorden.jsp").forward(request, response);
                }
            }
            if (opcion.equals("Modificar")) {
               Material mt = new Material();
              
                mt.setCodigo(request.getParameter("n_codigo"));
                mt.setDescripcion(request.getParameter("n_descripcion").toString());
                mt.setUnidad(request.getParameter("n_unidad").toString());
                mt.setExistencia(Integer.parseInt(request.getParameter("n_existencia").toString()));
                mt.setSalida(Integer.parseInt(request.getParameter("n_salida").toString()));
                mt.cambio();
                request.getRequestDispatcher("ModificacionMateriales.jsp").forward(request, response);
                        
            }
               if (opcion.equals("enviarDevolucion")) {
                Material m = new Material();
                Proyecto p = new Proyecto();
                String otiga = request.getParameter("otiga_1");
                String devolucion[] = request.getParameterValues("devoluciones");
                String codigodev[] = request.getParameterValues("codigosDev");
                MaterialSolicitado ma = new MaterialSolicitado();

                for (int i = 0; i < devolucion.length; i++) {
                    if (devolucion[i].length() > 0) {

                        ma.Devolver(codigodev[i], Integer.parseInt(devolucion[i]));
                    }
                }

                p.cambioStatusDevolucionA(otiga);
                request.getRequestDispatcher("SolicitudMaterial.jsp").forward(request, response);

            }
                if (opcion.equals("registrarMaterial")) {

                String codigo = request.getParameter("codigo");
                String descripcion = request.getParameter("descripcion");
                String unidad = request.getParameter("unidad");
                String existencia = request.getParameter("existencia");
                String tope = request.getParameter("tope");
                
                
                
                
                if (codigo.equals("") || descripcion.equals("") || unidad.equals("") || existencia.equals("")
                     || tope.equals("")   ) {
                    Material m = new Material();
                    String x = m.registrar();
                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("res0", x);
                    request.getRequestDispatcher("Material_error.jsp").forward(request, response);
                } else {                                       
                    Material m = new Material();
                    m.setCodigo(codigo);
                    m.setDescripcion(descripcion);
                    m.setUnidad(unidad);
                    m.setExistencia(Integer.parseInt(existencia));
                    m.setSalida(Integer.parseInt(tope));
                   

                    String x = m.registrar();
                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("res0", codigo);
                    sesion.setAttribute("res1", descripcion);
                    sesion.setAttribute("res2", unidad);
                    sesion.setAttribute("res3", existencia);
                    sesion.setAttribute("res4", tope);
                   
                    request.getRequestDispatcher("ExitoM.jsp").forward(request, response);

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
