/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.Clientes;
import Modelo.EquipamientoSolicitado;
import Modelo.Material;
import Modelo.Material1;
import Modelo.MaterialSolicitadoWisp;
import Modelo.Precompra;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
             String numeroSerie="";
             String opcion = request.getParameter("opcion");

             
             
            if (opcion.equals("v_registrar_clientes")) {
                String iden="WISP-";
                String id = request.getParameter("id");
                String nombre = request.getParameter("n_nombre");
                String direccion = request.getParameter("direccion");
                String telefono = request.getParameter("n_telefono");
                String correo = request.getParameter("n_correo");
                String tiempo = request.getParameter("n_tiempo");
                String megas = request.getParameter("n_megas");
                String tarifa = request.getParameter("n_tarifa");
                String fecha = request.getParameter("n_fecha");
                int grupo = Integer.parseInt(request.getParameter("n_grupo"));
                String comentarios = request.getParameter("n_comentarios");
                
                String OLD_FORMAT = "yyyy-MM-dd"; 
                String NEW_FORMAT = "dd/MM/yyyy";

                String oldDateString = fecha;
                String newDateString;
                SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                java.util.Date d = sdf.parse(oldDateString);
                sdf.applyPattern(NEW_FORMAT);
                newDateString = sdf.format(d);
  
                iden=iden+direccion;
                iden=iden+"-"+newDateString+"/";
                iden=iden+id;
                
                System.out.println(iden+" "+id+" "+direccion+" "+newDateString );
                
                if (id.equals("") || nombre.equals("") || direccion.equals("") || telefono.equals("") || correo.equals("")
                        || tiempo.equals("") || megas.equals("") || tarifa.equals("") || fecha.equals("")) {
                    Clientes cl1 = new Clientes();
                    String x = cl1.guardar();
                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("res0", x);
                    request.getRequestDispatcher("Clientes_error.jsp").forward(request, response);
                } else {                                       
                    Clientes cl1 = new Clientes();
                    cl1.setId(iden);
                    cl1.setNumeroSerie(id);
                    cl1.setNombre(nombre);
                    cl1.setDireccion(direccion);
                    cl1.setTelefono(telefono);
                    cl1.setCorreo(correo);
                    cl1.setTiempo(tiempo);
                    cl1.setMegas(megas);
                    cl1.setTarifa(tarifa);
                    cl1.setFecha(newDateString);
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
            if (opcion.equals("GenerarNumeroW")) {
                    Clientes pc = new Clientes();
                    Clientes pc1 = new Clientes();
                    numeroSerie = pc.GenerarSerieCliente();

                    if (numeroSerie == null) {
                        numeroSerie = "0001";                                        
                        request.setAttribute("numeritow", numeroSerie);
                    } else {
                        int incrementador = Integer.parseInt(numeroSerie);
                        numeroSerie = pc1.numeros(incrementador);
                    
                        request.setAttribute("numeritow", numeroSerie);
                    }
                    request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                
            }
            if (opcion.equals("BuscarGrupo")) {
                 
                  request.getRequestDispatcher("Instalacion.jsp").forward(request, response);
              }
            if (opcion.equals("guardarDatos")) {
                String cantidad[] = request.getParameterValues("cantidades");
                String codigo[] = request.getParameterValues("codigo");  
                String id = request.getParameter("id_wisp");
                Clientes cl1 = new Clientes();
                Material m = new Material();
                Material m1 = new Material();
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                Material ms = new Material();
                Material jeje = new Material();
                String c = cl1.Status(id);
                for (int i = 0; i < cantidad.length; i++) {
                    if (cantidad[i].length() > 0) {
                        String material = m.Descripcion(codigo[i]);
                        String unidad = ms.Unidades(codigo[i]);
                        String existencias = ms.Existencia(codigo[i]);
                        String fecha = dtf.format(LocalDateTime.now());
                        String hora = dtf1.format(LocalDateTime.now());
                        m1.Wisp(id, codigo[i], cantidad[i]);
                        jeje.insertarHistoW(id, codigo[i] , material, unidad,Integer.parseInt(existencias) ,Integer.parseInt(cantidad[i]), fecha, hora);
                        System.out.println(codigo[i] + " " + cantidad[i]);
                    }
                }

                request.getRequestDispatcher("Wisp.jsp").forward(request, response);
            }
            
              if (opcion.equals("guardarEquipamiento")) {
                String cantidad[] = request.getParameterValues("cantidades");
                String marca[] = request.getParameterValues("marca");  
                String id = request.getParameter("id_wisp");
                Clientes cl1 = new Clientes();
                Material m = new Material();
                Material m1 = new Material();
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                Material ms = new Material();
                Material1 mat1 = new Material1();
                Material1 ms1 = new Material1();
                Material jeje = new Material();
                Material1 mt= new Material1();
                String c = cl1.Status(id);
                for (int i = 0; i < cantidad.length; i++) {
                    if (cantidad[i].length() > 0) {
                        String material = mat1.Tipo(marca[i]);
                        String disp = ms1.Dispo(marca[i]);
                        String existencias = ms1.Existencia(marca[i]);
                        String fecha = dtf.format(LocalDateTime.now());
                        String hora = dtf1.format(LocalDateTime.now());
                        m1.Wisp(id, material, cantidad[i]);
                        mat1.Equi(id, disp, cantidad[i]);
                        mt.insertarHistoE(id, marca[i] , material, disp,Integer.parseInt(existencias) ,Integer.parseInt(cantidad[i]), fecha, hora);
                        System.out.println(marca[i] + " " + cantidad[i]);
                    }
                }

                request.getRequestDispatcher("Wisp.jsp").forward(request, response);
            }
            
             if (opcion.equals("BuscarClientesW")) {
                 
                  request.getRequestDispatcher("MaterialesSolicitados.jsp").forward(request, response);
              }
             
              if (opcion.equals("BuscarClientesS")) {
                 
                  request.getRequestDispatcher("EquipamientosSolicitados.jsp").forward(request, response);
              }
             if (opcion.equals("guardarAlmacen")) {
                Material ms = new Material();
                MaterialSolicitadoWisp mts = new MaterialSolicitadoWisp();
                String id1 = request.getParameter("idt_1");
                MaterialSolicitadoWisp wisp = new MaterialSolicitadoWisp();
                Clientes cli = new Clientes();
                String soli[] = request.getParameterValues("numerosW");
                String codigos[] = request.getParameterValues("codigoW");
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                int cont=0;
                for (int i = 0; i < soli.length; i++) {
                    if (soli[i].length() > 0) {
                    cont++;
                    String nombre = ms.Descripcion(codigos[i]);
                    String unidad =ms.Unidades(codigos[i]);
                    String existencias = ms.Existencia(codigos[i]);
                    String fecha = dtf.format(LocalDateTime.now());
                    String hora = dtf1.format(LocalDateTime.now());
                    wisp.OperacionWisp(codigos[i],Integer.parseInt(soli[i]));                    
                    mts.insertarHistoSalida(id1, codigos[i], nombre, unidad,Integer.parseInt(existencias),Integer.parseInt(soli[i]),Integer.parseInt(existencias)-Integer.parseInt(soli[i]) , fecha, hora);
                    System.out.println(soli[i]+" "+codigos[i]);
                    }
                }
                 if (cont > 0 ) {
                     cli.StatusDev(id1);
                    request.getRequestDispatcher("MaterialesSolicitados.jsp").forward(request, response);
                 }
                
                  request.getRequestDispatcher("Wisp.jsp").forward(request, response);
              }
             
             if (opcion.equals("guardarAlmacenE")) {
                Material ms = new Material();
                Material1 ma1 = new Material1();
                MaterialSolicitadoWisp mts = new MaterialSolicitadoWisp();
                String id1 = request.getParameter("idt_1");
                MaterialSolicitadoWisp wisp = new MaterialSolicitadoWisp();
                EquipamientoSolicitado eqs = new EquipamientoSolicitado();
                Clientes cli = new Clientes();
                String soli[] = request.getParameterValues("numerosW");
                String marcas[] = request.getParameterValues("marcas");
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                int cont=0;
                for (int i = 0; i < soli.length; i++) {
                    if (soli[i].length() > 0) {
                    cont++;
                    String tipo = ma1.Tipo(marcas[i]);
                    String dispositivos =ma1.Dispo(marcas[i]);
                    String existencias = ma1.Existencia(marcas[i]);
                    String fecha = dtf.format(LocalDateTime.now());
                    String hora = dtf1.format(LocalDateTime.now());
                    eqs.OperacionE(marcas[i],Integer.parseInt(soli[i]));                    
                    
                    System.out.println(soli[i]+" "+marcas[i]);
                    }
                }
                 if (cont > 0 ) {
                     cli.StatusDev(id1);
                    request.getRequestDispatcher("EquipamientosSolicitados.jsp").forward(request, response);
                 }
                
                  request.getRequestDispatcher("Wisp.jsp").forward(request, response);
              }
             
                if(opcion.equals("guardarDevolucion")) {
                Material m = new Material();
                String id = request.getParameter("idt_1");
                Clientes cl1 = new Clientes();
                String dev[] = request.getParameterValues("devolucionw");
                String codev[] = request.getParameterValues("codigosw");
                MaterialSolicitadoWisp mw = new MaterialSolicitadoWisp();
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                int cont=0;
                for (int i = 0; i < dev.length; i++) {
                    if (dev[i].length() > 0) {
                    String descripciones = m.Descripcion(codev[i]);
                    String unidad =m.Unidades(codev[i]);
                    String existencias = m.Existencia(codev[i]);
                    String fecha = dtf.format(LocalDateTime.now());
                    String hora = dtf1.format(LocalDateTime.now());
                    mw.DevolverMaterial(codev[i], Integer.parseInt(dev[i]));
                    m.insertarHistoDevolucionW(id, codev[i], descripciones, unidad,Integer.parseInt(existencias),Integer.parseInt(dev[i]),Integer.parseInt(existencias)+Integer.parseInt(dev[i]), fecha, hora);              
                    cont = cont+1;
                    }
                }
                m.eliminarPedidoWisp(id);
                cl1.CambioSw(id);
                request.getRequestDispatcher("MenuAlmacen.jsp").forward(request, response);

            }
                
               if (opcion.equals("guardarPrecompra")) {

                String otiga = request.getParameter("idt_1");

                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                Calendar cal = Calendar.getInstance();
                String fechaa = dateFormat.format(cal.getTime());
                String folio = "PREOC-";
                folio = folio + fechaa;
                Precompra p = new Precompra();
                Precompra pc = new Precompra();
                Precompra pc1 = new Precompra();
                numeroSerie = pc.GenerarSerie();
                String proyecto = request.getParameter("pro");
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
                String soli[] = request.getParameterValues("numerosW");
                String codigos[] = request.getParameterValues("codigoW");
               p.precompra(numeroSerie, proyecto,folio);
                for (int i = 0; i < soli.length; i++) {
                    String existencia = m.Existencia(codigos[i]);
                    String solicitado = m.SolicitadoWisp(codigos[i]);
                    String descripciones = m.Descripcion(codigos[i]);
                    System.out.println(existencia+" "+solicitado+descripciones);
                    if (Integer.parseInt(solicitado) > Integer.parseInt(existencia)) {
                        m1.precompra(folio, descripciones, String.valueOf(Integer.parseInt(solicitado) - Integer.parseInt(existencia)));
                    }
                }
            }

            if (opcion.equals("MaterialR")) {

                String codigo = request.getParameter("codigo");
                String descripcion = request.getParameter("descripcion");
                String unidad = request.getParameter("unidad");
                String existencia = request.getParameter("existencia");
                String tope = request.getParameter("tope");

                if (codigo.equals("") || descripcion.equals("") || unidad.equals("") || existencia.equals("")
                        || tope.equals("")) {
                    Material mat = new Material();
                    String x = mat.registrar();
                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("res0", x);
                    request.getRequestDispatcher("Material_error.jsp").forward(request, response);
                } else {
                    Material ma1 = new Material();
                    ma1.setCodigo(codigo);
                    ma1.setDescripcion(descripcion);
                    ma1.setUnidad(unidad);
                    ma1.setExistencia(Integer.parseInt(existencia));
                    ma1.setSalida(Integer.parseInt(tope));

                    String x = ma1.registrar();
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ControlClientes.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ControlClientes.class.getName()).log(Level.SEVERE, null, ex);
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
