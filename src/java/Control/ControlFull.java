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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.jni.Local;

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
            throws ServletException, IOException, ParseException {
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
               Material m2 = new Material();
               String ar[] = request.getParameterValues("numeros");
               String arr[] = request.getParameterValues("cod");
               String otiga = request.getParameter("otiga");  
               DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy ");
               DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
               pr.cambioStatus(otiga);
               for (int i = 0; i < ar.length; i++) {
                    if (ar[i].length() > 0) {
                    String descripciones = m.Descripcion(arr[i]);
                    String unidad =m.Unidades(arr[i]);
                    String existencias = m.Existencia(arr[i]);
                    String fecha = dtf.format(LocalDateTime.now());
                    String hora = dtf1.format(LocalDateTime.now());
                    m1.Pedidos(otiga, descripciones, ar[i]);
                    m2.insertarHisto(otiga, arr[i] , descripciones, unidad,Integer.parseInt(existencias) ,Integer.parseInt(ar[i]), fecha, hora);
                    System.out.println(arr[i]+"  || "+ar[i]);    
                    }                    
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

                String OLD_FORMAT = "yyyy-MM-dd"; 
                String NEW_FORMAT = "dd/MM/yyyy";

                String oldDateString = fecha;
                String newDateString;
                SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                java.util.Date d = sdf.parse(oldDateString);
                sdf.applyPattern(NEW_FORMAT);
                newDateString = sdf.format(d);
  
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
                    otiga += newDateString;
                    otiga += otigon;

                    System.out.println(tipo);
                    /* DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");          
                       LocalDate ahora = LocalDate.now();       
                     */

                    Date fechad = new Date(Calendar.getInstance().getTimeInMillis());

                    Proyecto p = new Proyecto();
                    
                    p.setOtiga(otiga);
                    p.setNumSerie(otigon);
                    p.setNombre(nombre);
                    p.setRegion(region);
                    p.setDireccion(direccion);
                    p.setLatitud(latitud);
                    p.setLongitud(longitud);
                    p.setElevacion(elevacion);
                    p.setTecnologia(tecnologia);
                    p.setUbicacion(ubicacion);
                    p.setFecha(newDateString);
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
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                for (int i = 0; i < devolucion.length; i++) {
                    if (devolucion[i].length() > 0) {
                        String descripciones = m.Descripcion(codigodev[i]);
                        String unidad =m.Unidades(codigodev[i]);
                        String existencias = m.Existencia(codigodev[i]);
                        String fecha = dtf.format(LocalDateTime.now());
                        String hora = dtf1.format(LocalDateTime.now());
                        ma.Devolver(codigodev[i], Integer.parseInt(devolucion[i]));
                        m.insertarHistoDevolucion(otiga, codigodev[i], descripciones, unidad,Integer.parseInt(existencias),Integer.parseInt(devolucion[i]),Integer.parseInt(existencias)+Integer.parseInt(devolucion[i]) , fecha, hora);                   
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
            if (opcion.equals("botonGenerarNumero")) {
                
                    Proyecto pc = new Proyecto();
                    Proyecto pc1 = new Proyecto();
                    numeroSerie = pc.GenerarSerieProyecto();

                    if (numeroSerie == null) {
                        numeroSerie = "0001";                                        
                        request.setAttribute("numerito", numeroSerie);
                    } else {
                        int incrementador = Integer.parseInt(numeroSerie);
                        numeroSerie = pc1.numeros(incrementador);
                    
                        request.setAttribute("numerito", numeroSerie);
                    }
                    request.getRequestDispatcher("Proyectos.jsp").forward(request, response);
            }
            if (opcion.equals("botonPreorden")) {
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                Calendar cal = Calendar.getInstance();
                String fechaa = dateFormat.format(cal.getTime());
                String folio = "PREOC-";
                folio = folio + fechaa;

                Precompra pc = new Precompra();
                Precompra pc1 = new Precompra();
                numeroSerie = pc.GenerarSerie();

                if (numeroSerie == null) {
                    numeroSerie = "0001";
                    folio = folio + "-A" + numeroSerie;
                    request.setAttribute("folioo", folio);
                    request.setAttribute("numeroS", numeroSerie);
                } else {
                    int incrementador = Integer.parseInt(numeroSerie);
                    numeroSerie = pc1.numeros(incrementador);
                    folio = folio + "-A" + numeroSerie;
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
            if (opcion.equals("enviarAlmacen")) {   
                Material ms = new Material();
                Proyecto pr = new Proyecto();
                String idProyecto=request.getParameter("otiga_1");
                MaterialSolicitado mat = new MaterialSolicitado();
                String soli[] = request.getParameterValues("solicitudes");
                String nombres[] = request.getParameterValues("codigosS");
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                for (int i = 0; i < soli.length; i++) {
                    if (soli[i].length() > 0) {
                    String nombre = ms.Descripcion(nombres[i]);
                    
                    String unidad =ms.Unidades(nombres[i]);
                    String existencias = ms.Existencia(nombres[i]);
                    String fecha = dtf.format(LocalDateTime.now());
                    String hora = dtf1.format(LocalDateTime.now());
                    mat.Operacion(nombres[i],Integer.parseInt(soli[i]));
                    ms.insertarHistoSalida(idProyecto, nombres[i], nombre, unidad,Integer.parseInt(existencias),Integer.parseInt(soli[i]),Integer.parseInt(existencias)-Integer.parseInt(soli[i]) , fecha, hora);
                    System.out.println(soli[i]+" "+nombres[i]);
                    }
                pr.cambioStatusDevolver(idProyecto);
                    
                    
                }
                
                
                 request.getRequestDispatcher("MenuPrincipal.jsp").forward(request, response);
            }
                
            if (opcion.equals("enviarPrecompra")) {
                Material mat = new Material();
                
                String codigos[] = request.getParameterValues("codigosS");
                String solicitado[] = request.getParameterValues("solicitadoF");
                String otiga = request.getParameter("otiga_1");

                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                Calendar cal = Calendar.getInstance();
                String fechaa = dateFormat.format(cal.getTime());
                String folio = "PREOC-";
                folio = folio + fechaa;
                Precompra p = new Precompra();
                Precompra pc = new Precompra();
                Precompra pc1 = new Precompra();
                numeroSerie = pc.GenerarSerie();

                if (numeroSerie == null) {
                    numeroSerie = "0001";
                    folio = folio + "-A" + numeroSerie;
                    request.setAttribute("folioo", folio);
                    request.setAttribute("numeroS", numeroSerie);
                } else {
                    int incrementador = Integer.parseInt(numeroSerie);
                    numeroSerie = pc1.numeros(incrementador);
                    folio = folio + "-A" + numeroSerie;
                    request.setAttribute("folioo", folio);
                    request.setAttribute("numeroS", numeroSerie);
                }
                Material m = new Material();
                Material m1 = new Material();                
                p.precompra(numeroSerie, folio);
                for(int i = 0; i < codigos.length; i++) {
                    
                    String existencia = m.Existencia(codigos[i]);
                    //String solicitado = m.Solicitado(codigos[i],otiga);    
                    String descripciones = m.Descripcion(codigos[i]);
                    
                    System.out.println(descripciones+"  "+ existencia+" "+solicitado[i]);
                    
                    if (Integer.parseInt(solicitado[i]) > Integer.parseInt(existencia)) {
                        System.out.println("jeje "+descripciones);
                        m1.precompra(folio, descripciones, String.valueOf(Integer.parseInt(solicitado[i]) - Integer.parseInt(existencia)));
                    }                   
                    
                }
                request.getRequestDispatcher("OrdenCompra.jsp").forward(request, response);         
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ControlFull.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ControlFull.class.getName()).log(Level.SEVERE, null, ex);
        }
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
