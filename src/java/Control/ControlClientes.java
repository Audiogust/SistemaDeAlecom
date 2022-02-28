/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.Clientes;
import Modelo.EquipamientoSolicitado;
import Modelo.Material;
import Modelo.Equipamiento;
import Modelo.MaterialSolicitadoWisp;
import Modelo.OrdenPrecompra;
import Modelo.OrdenPrecompraE;
import Modelo.Precompra;
import Modelo.PrecompraE;
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
            if (opcion.equals("generarNumeroid")) {
                    Equipamiento e = new Equipamiento();    
                    String numeroE="";
                    numeroE = e.GenerarNumeroE();
                    if (numeroE == null) {
                        numeroE = "1";                                        
                        request.setAttribute("numeritow", numeroE);
                    } else {
                        int incrementador = Integer.parseInt(numeroE);
                        numeroE = e.numeros(incrementador);
                        request.setAttribute("numeritow", numeroE);
                    }
                    request.getRequestDispatcher("registrarEquipamiento.jsp").forward(request, response);
                
            }
            if (opcion.equals("registrarEquipamiento")) {
                 
                
                Equipamiento e = new Equipamiento();
                String id = request.getParameter("id");
                String codigo = request.getParameter("codigo");
                String marca = request.getParameter("marca");
                String tipo = request.getParameter("tipo");
                String dispositivo = request.getParameter("dispositivo");
                int existencia = Integer.parseInt(request.getParameter("existencia"));
                int tope = Integer.parseInt(request.getParameter("tope"));
                
                e.EquiInsertar(id, codigo,marca ,tipo,dispositivo,existencia,tope);
                
                  request.getRequestDispatcher("registrarEquipamiento.jsp").forward(request, response);
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
                String identificadores[] = request.getParameterValues("identificador");  
                String id = request.getParameter("id_wisp");
                
                Clientes cl1 = new Clientes();
                
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
               
                Material ms = new Material();
                Equipamiento equi = new Equipamiento();
                cl1.StatusEquip(id);
                for (int i = 0; i < cantidad.length; i++) {
                    if (cantidad[i].length() > 0) {
                        
                        String nom =equi.Dispo(identificadores[i]);
                        String mar =equi.Marca(identificadores[i]);
                        String tipo =equi.TipoE(identificadores[i]);
                        int existencia = equi.Existencia(identificadores[i]);
                        String fecha = dtf.format(LocalDateTime.now());
                        String hora = dtf1.format(LocalDateTime.now());
                        
                        
                     equi.EquiSolicitado(id, identificadores[i], cantidad[i]);
                     equi.EquiSolicitadoHistorial(id,Integer.parseInt(identificadores[i]),nom,
                             mar,tipo,String.valueOf(existencia),cantidad[i],fecha,hora);
                     equi.insertarHistoWEq(id, identificadores[i], nom, existencia,Integer.parseInt(cantidad[i]), fecha, hora);
                        System.out.println(id+""+identificadores[i]+" "+nom+" "+existencia+" "+Integer.parseInt(cantidad[i])+fecha+" "+hora);
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
                     cli.StatusDevMat(id1);
                    request.getRequestDispatcher("Wisp.jsp").forward(request, response);
                 }
                
                  request.getRequestDispatcher("Wisp.jsp").forward(request, response);
              }
             
             if (opcion.equals("guardarAlmacenE")) {
               
                String id1 = request.getParameter("idt_1");
                MaterialSolicitadoWisp wisp = new MaterialSolicitadoWisp();
                Equipamiento eq = new Equipamiento();
                EquipamientoSolicitado eqs = new EquipamientoSolicitado();
                Clientes cli = new Clientes();
                String soli[] = request.getParameterValues("numerosW");
                String identificador[] = request.getParameterValues("identificador");
                
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                String fecha = dtf.format(LocalDateTime.now());
                String hora = dtf1.format(LocalDateTime.now());
                int cont=0;                
                for (int i = 0; i < soli.length; i++) {
                    if (soli[i].length() > 0) {
                    cont++;
                    String descripciones = eq.Dispo(identificador[i]);
                    String marca= eq.Marca(identificador[i]);
                    String tipo= eq.TipoE(identificador[i]);
                    int eant= eq.Existencia(identificador[i]);
                    
                    eqs.OperacionEquiWisp(identificador[i],Integer.parseInt(soli[i]));
                    eqs.insertarHistoSalidaE(id1, identificador[i], descripciones,
                           eant ,Integer.parseInt(soli[i]), (eant -Integer.parseInt(soli[i])), fecha, hora);
                    System.out.println(id1+" "+identificador[i]+" "+descripciones+" "+eant+soli[i]+" "+(eant -Integer.parseInt(soli[i]))+" "+ fecha+" "+hora);
                    }
                }
                 if (cont > 0 ) {
                    cli.StatusDev(id1);
                    request.getRequestDispatcher("Wisp.jsp").forward(request, response);
                 }
                 
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
                cl1.CambioSw(id);
                for (int i = 0; i < dev.length; i++) {
                    if (dev[i].length() > 0) {
                    String descripciones = m.Descripcion(codev[i]);
                    String unidad =m.Unidades(codev[i]);
                    String existencias = m.Existencia(codev[i]);
                    String fecha = dtf.format(LocalDateTime.now());
                    String hora = dtf1.format(LocalDateTime.now());
                    mw.DevolverMaterial(codev[i], Integer.parseInt(dev[i]));
                    m.insertarHistoDevolucionW(id, codev[i], descripciones, unidad,Integer.parseInt(existencias),Integer.parseInt(dev[i]),Integer.parseInt(existencias)+Integer.parseInt(dev[i]), fecha, hora);              
                    cont++;
                    }
                }
                m.eliminarPedidoWisp(id);                
                request.getRequestDispatcher("MenuAlmacen.jsp").forward(request, response);
            }
                if(opcion.equals("devolverEquipamiento")) {
                Material m = new Material();
                String id = request.getParameter("idt_1");
                Clientes cl1 = new Clientes();
                String dev[] = request.getParameterValues("numerosW");
                String codev[] = request.getParameterValues("identificador");                
                EquipamientoSolicitado es = new EquipamientoSolicitado();
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                String fecha = dtf.format(LocalDateTime.now());
                String hora = dtf1.format(LocalDateTime.now());
                Equipamiento eq = new Equipamiento();
                int cont=0;
                cl1.CambioSE(id);
                for (int i = 0; i < dev.length; i++) {
                    if (dev[i].length() > 0) {                    
                    cont++;
                    String descripciones = eq.Dispo(codev[i]);
                    String marca= eq.Marca(codev[i]);
                    String tipo= eq.TipoE(codev[i]);
                    int eant= eq.Existencia(codev[i]);
                    es.DevolverEquipamiento( Integer.parseInt(codev[i]) ,Integer.parseInt(dev[i]));
                    
                    es.insertarHistoDevoE(id,codev[i], descripciones,
                           eant ,Integer.parseInt(dev[i]), (eant + Integer.parseInt(dev[i])), fecha, hora);
                    
                    
                    }
                }
                m.eliminarPedidoWispE(id);                
                request.getRequestDispatcher("MenuAlmacen.jsp").forward(request, response);
            }
                
                if (opcion.equals("cambiarEstadoPrecompra")) {
                
                Precompra p = new Precompra();
                PrecompraE pw = new PrecompraE();
                Material m = new Material();
                OrdenPrecompra o = new OrdenPrecompra();
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                String idProyecto=request.getParameter("otiga");
                String otigaProyecto=request.getParameter("otigaP");
                String codigos[] = request.getParameterValues("codigosSolP");
                String solicitado[] = request.getParameterValues("numeroSolP");
                String fecha = dtf.format(LocalDateTime.now());
                String hora = dtf1.format(LocalDateTime.now());                
                for (int i = 0; i < codigos.length; i++) {
                    p.cambioCantidadSolicitada(codigos[i], Integer.parseInt(solicitado[i]));
                    String nom = m.Descripcion(codigos[i]);
                    String unidad = m.Unidades(codigos[i]);
                    String existencia = m.Existencia(codigos[i]);
                    String ordenSol = o.solicitadoOrden(idProyecto, nom);
                    System.out.println(idProyecto+"  "+codigos[i]+"  "+nom+" "+ existencia+"  "+unidad+"  "+ ordenSol+"  "+ solicitado[i]+"  "+ hora+"  "+ fecha);
                    pw.precompraHistorial(idProyecto, codigos[i], nom, unidad,existencia ,ordenSol, solicitado[i], hora, fecha);
                }                
                p.cambioStatusPrecompra(idProyecto);                
               request.getRequestDispatcher("ComprasW.jsp").forward(request, response);                       
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
               p.precompra(numeroSerie, proyecto,folio,"Full");
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
                request.getRequestDispatcher("preordenWisp.jsp").forward(request, response);
            }
            if (opcion.equals("botonPreordenAccion")) {
             Material m = new Material();
             Material m1 = new Material();
             Precompra p = new Precompra();
             
             String foliosito = request.getParameter("folioextraer");
             String num = request.getParameter("folionumeros");
             
             String codigos[] = request.getParameterValues("codC");
             String numeros[] = request.getParameterValues("numerosC");
             String proyecto = request.getParameter("pro");
             
                if (proyecto != "Elige un proyecto") {
                    int c = 0;
                    for (int i = 0; i < codigos.length; i++) {
                        if (numeros[i].length() > 0) {
                            c++;
                        }
                    }
                    if (c > 0) {
                        p.precompra(num, proyecto, foliosito,"Wisp");
                        System.out.println(proyecto);
                        for (int i = 0; i < codigos.length; i++) {
                            if (numeros[i].length() > 0) {
                                String descripciones = m.Descripcion(codigos[i]);
                                m1.precompra(foliosito, descripciones, numeros[i]);
                                System.out.println(descripciones + "sd" + numeros[i]);
                            }
                        }
                        request.getRequestDispatcher("ComprasW.jsp").forward(request, response);
                    } else if (c == 0) {
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
                        request.getRequestDispatcher("preordenWisp.jsp").forward(request, response);
                    }
                }              
            }
            
            if (opcion.equals("botonPreordenAccionE")) {
                
             Equipamiento eq = new Equipamiento();
             PrecompraE pe = new PrecompraE();
             Material m = new Material();
             Material m1 = new Material();
             Precompra p = new Precompra();
             
             String foliosito = request.getParameter("folioextraer");
             String num = request.getParameter("folionumeros");
             
             String codigos[] = request.getParameterValues("codC");
             String numeros[] = request.getParameterValues("numerosC");
             String proyecto = request.getParameter("pro");
             
                if (proyecto != "Elige un proyecto") {
                    int c = 0;
                    for (int i = 0; i < codigos.length; i++) {
                        if (numeros[i].length() > 0) {
                            c++;
                        }
                    }
                    if (c > 0) {
                        pe.precompraE(num, proyecto, foliosito);
                        System.out.println(proyecto);
                        for (int i = 0; i < codigos.length; i++) {
                            if (numeros[i].length() > 0) {
                                String descripciones = eq.Dispo(codigos[i]);
                                String marca= eq.Marca(codigos[i]);
                                String tipo= eq.TipoE(codigos[i]);
                                eq.ordenPrecompraE(foliosito,Integer.parseInt(codigos[i]),
                                        marca, descripciones, tipo,Integer.parseInt(numeros[i]));
                                System.out.println(foliosito+" "+codigos[i] + " | " +marca +descripciones +" " +tipo+" | "+ numeros[i]);
                            }
                        }
                        request.getRequestDispatcher("comprasWE.jsp").forward(request, response);
                    } else if (c == 0) {
                        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                        Calendar cal = Calendar.getInstance();
                        String fechaa = dateFormat.format(cal.getTime());

                        String folio = "PREOC-";
                        folio = folio + fechaa;
                        PrecompraE pc = new PrecompraE();
                        PrecompraE pc1 = new PrecompraE();
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
                        request.getRequestDispatcher("preordenWispE.jsp").forward(request, response);
                    }
                }              
            }
            
            if (opcion.equals("enviarPrecompra")) {
                Material mat = new Material();
                
                String codigos[] = request.getParameterValues("identificador");
                String solicitado[] = request.getParameterValues("numerosW");
                String otiga = request.getParameter("idt_1");

                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                Calendar cal = Calendar.getInstance();
                String fechaa = dateFormat.format(cal.getTime());
                String folio = "PREOC-";
                folio = folio + fechaa;
                PrecompraE p = new PrecompraE();
                PrecompraE pc = new PrecompraE();
                PrecompraE pc1 = new PrecompraE();
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
                Equipamiento m = new Equipamiento();
                    Equipamiento m1 = new Equipamiento();
                   p.precompraE(numeroSerie,otiga, folio);
                  System.out.println("hooola");  
                  for (int i = 0; i < codigos.length; i++) {
                        int existencia = m.Existencia(codigos[i]);
                        String marca = m.Marca(codigos[i]);    
                        String descripciones = m.Dispo(codigos[i]);
                        String tipo= m.TipoE(codigos[i]);
                        //System.out.println("hola perro");
                        if (Integer.parseInt(solicitado[i]) > existencia) {
                           //m1.precompra(folio, descripciones, String.valueOf(Integer.parseInt(solicitado[i]) - existencia));
                        m1.ordenPrecompraE(folio,Integer.parseInt(codigos[i]),
                                        marca, descripciones, tipo,Integer.parseInt(solicitado[i])-existencia);
                            System.out.println("hola "+descripciones);
                        }

                    }
               
                request.getRequestDispatcher("MenuAlmacen.jsp").forward(request, response);         
            }
            
            
            if (opcion.equals("autorizarExistencia")) {
                 System.out.println("cambio");
                Precompra p = new Precompra();
                OrdenPrecompra o = new OrdenPrecompra();
                Material m = new Material();
                String idProyecto=request.getParameter("otiga");
                OrdenPrecompra op = new OrdenPrecompra();
                String codigoe[] = request.getParameterValues("codigosOrd");
                String numeros[] = request.getParameterValues("solicitadoOrd");
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                String fecha = dtf.format(LocalDateTime.now());
                String hora = dtf1.format(LocalDateTime.now());                
                for (int i = 0; i < codigoe.length; i++) {    
                    String nom = m.Descripcion(codigoe[i]);
                    String unidad = m.Unidades(codigoe[i]);
                    String existencia = m.Existencia(codigoe[i]);
                    String ordenSol = o.solicitadoOrden(idProyecto, nom);
                    op.Autorizar(codigoe[i],Integer.parseInt(numeros[i]));                    
                    p.OrdencompraHistorialW(idProyecto, codigoe[i], nom, unidad,existencia, ordenSol, numeros[i], String.valueOf(Integer.parseInt(existencia) + Integer.parseInt(numeros[i])) , hora, fecha);
                    System.out.println(codigoe[i]+" "+numeros[i]);                   
                }
                p.cambioStatusOrden(idProyecto);
                
                request.getRequestDispatcher("ComprasW.jsp").forward(request, response);
             }
            
            if (opcion.equals("Modificar")) {              
               Equipamiento eq = new Equipamiento();
               
               eq.setCodigo(request.getParameter("n_codigo").toString());
               eq.setMarca(request.getParameter("n_marca").toString());
               eq.setTipo(request.getParameter("n_tipo").toString());
               eq.setDispositivo(request.getParameter("n_dispositivo").toString());
               eq.setExistencia(Integer.parseInt(request.getParameter("n_existencia").toString()));
               eq.setTope(Integer.parseInt(request.getParameter("n_tope").toString()));
               eq.setIden(Integer.parseInt(request.getParameter("id").toString()));
               
               eq.cambio();
               request.getRequestDispatcher("editarEquipamiento.jsp").forward(request, response);
                        
            }
            
            if (opcion.equals("botonPreordenE")) {
                DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                Calendar cal = Calendar.getInstance();
                String fechaa = dateFormat.format(cal.getTime());
                String folio = "PREOC-";
                folio = folio + fechaa;

                PrecompraE pc = new PrecompraE();
                PrecompraE pc1 = new PrecompraE();
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
                request.getRequestDispatcher("preordenWispE.jsp").forward(request, response);
            }
            
            if (opcion.equals("cambiarEstadoPrecompraE")) {
                
                Precompra p = new Precompra();
                
                PrecompraE pe = new PrecompraE();
                Equipamiento eq = new Equipamiento();
                OrdenPrecompraE oe = new OrdenPrecompraE();
                
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                           
                
                String idCliente=request.getParameter("otiga");
                String codigosE[] = request.getParameterValues("codigosSolP");
                String solicitadoE[] = request.getParameterValues("numeroSolP");
                
                String fecha = dtf.format(LocalDateTime.now());
                String hora = dtf1.format(LocalDateTime.now());                
                for (int i = 0; i < codigosE.length; i++) {
                    pe.cambioCantidadSolicitada(codigosE[i], Integer.parseInt(solicitadoE[i]));
                    String nom = eq.Dispo(codigosE[i]);
                    String cod = eq.codigoEqu(codigosE[i]);
                    String marca = eq.Marca(codigosE[i]);
                    int existencia = eq.Existencia(codigosE[i]);
                    
                   pe.precompraHistorialEquipamiento(idCliente,Integer.parseInt(codigosE[i]), cod,
                           nom,marca, existencia,Integer.parseInt(solicitadoE[i]), hora, fecha);
                    
                }                
                pe.cambioStatusPrecompra(idCliente);                
               request.getRequestDispatcher("comprasWE.jsp").forward(request, response);                       
            }
           
            
            if (opcion.equals("autorizarExistenciaEqui")) {               
                
                PrecompraE pe = new PrecompraE();
                Equipamiento oe = new Equipamiento();
                OrdenPrecompraE me = new OrdenPrecompraE();
                
                //String idProyecto=request.getParameter("otiga");
                String idProyecto=request.getParameter("otiga");
                OrdenPrecompra op = new OrdenPrecompra();
                String codigoe[] = request.getParameterValues("codigosSolP");
                String numeros[] = request.getParameterValues("solicitadoOrd");
                
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
                String fecha = dtf.format(LocalDateTime.now());
                String hora = dtf1.format(LocalDateTime.now());                
                System.out.println("hooola"+idProyecto);
                pe.cambioStatusOrden(idProyecto);
                for (int i = 0; i < codigoe.length; i++) {    
                    String nom = oe.Dispo(codigoe[i]);
                    String cod = oe.codigoEqu(codigoe[i]);
                    int existencia = oe.Existencia(codigoe[i]);
                    String marca = oe.Marca(codigoe[i]);
                    me.Autorizar(Integer.parseInt(codigoe[i]),Integer.parseInt(numeros[i]));                    
                    //p.OrdencompraHistorial(idProyecto, codigoe[i], nom, unidad,existencia, ordenSol, numeros[i], String.valueOf(Integer.parseInt(existencia) + Integer.parseInt(numeros[i])) , hora, fecha);
                    pe.precompraHistorialO(idProyecto,Integer.parseInt(codigoe[i]), cod, nom,
                            marca, existencia,Integer.parseInt(numeros[i]), existencia+Integer.parseInt(numeros[i]), hora, fecha);
                    System.out.println(numeros[i]);
                }
                
                
                request.getRequestDispatcher("comprasWE.jsp").forward(request, response);
             }
            
            if (opcion.equals("enviarPrecompraM")) {
                Material mat = new Material();
                
                String codigos[] = request.getParameterValues("codigoW");
                String solicitado[] = request.getParameterValues("numerosW");
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
                    System.out.println(numeroSerie); 
                    Material m = new Material();
                    Material m1 = new Material();
                    p.precompra(numeroSerie,otiga, folio,"Wisp");
                    for (int i = 0; i < codigos.length; i++) {
                        String existencia = m.Existencia(codigos[i]);
                        //String solicitado = m.Solicitado(codigos[i],otiga);    
                        String descripciones = m.Descripcion(codigos[i]);
                        
                        if (Integer.parseInt(solicitado[i]) > Integer.parseInt(existencia)) {
                            m1.precompra(folio, descripciones, String.valueOf(Integer.parseInt(solicitado[i]) - Integer.parseInt(existencia)));
                        }

                    }
                }
               
                request.getRequestDispatcher("MenuAlmacen.jsp").forward(request, response);         
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
