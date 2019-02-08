<%-- 
    Document   : controllerEfemeride
    Created on : 25-may-2018, 9:36:53
    Author     : agustin
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="methods.Inform"%>
<%@page import="Entities.Profesion"%>
<%@page import="org.eclipse.persistence.exceptions.DatabaseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Personaje"%>
<%@page import="Entities.Efemeride"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="jpautil.JPAUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="assets/img/icon_bullfighter.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Efemérides Taurinas</title>
        <link rel="shortcut icon" href="../assets/img/icon_bullfighter.ico" />
    </head>
    <body>
        <%

            EntityManager em = (EntityManager) session.getAttribute("em");
            DateFormat dateFormat = new SimpleDateFormat("dd MMM, yyyy");

            if (em == null) {

                try {
                    em = JPAUtil.getEntityManagerFactory().createEntityManager();
                    session.setAttribute("em", em);
                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error al conectar con la base de datos");
                    response.sendRedirect("../login.jsp");
                }

            }
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
            String op = null;
            String sql = null;
            Query q = null;
            op = request.getParameter("op");

            List<Efemeride> listaefemerides = null;
            List<Personaje> listapersonajes = null;

            if (op.equals("detailefemeride")) {

                try {
                    String fechaefemerideEdit = "";
                    String fecharealEdit = "";

                    String idefemeride = (String) request.getParameter("idefemeride");

                    sql = "SELECT E FROM Efemeride E where e.idefemeride =" + idefemeride;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    Efemeride efem = (Efemeride) q.getSingleResult();

                    if (efem.getFechaefemeride() != null) {
                        fechaefemerideEdit = dateFormat.format(efem.getFechaefemeride());
                    }

                    if (efem.getFechareal() != null) {
                        fecharealEdit = dateFormat.format(efem.getFechareal());
                    }

                    session.setAttribute("efem", efem);
                    session.setAttribute("fecharealEdit", fecharealEdit);
                    session.setAttribute("fechaefemerideEdit", fechaefemerideEdit);
                    response.sendRedirect("../detailEfemeride.jsp");

                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error cargando la efemeride");
                    response.sendRedirect("../mainview.jsp");
                }
            } else if (op.equals("loadallefems")) {
                try {
                    sql = "SELECT E FROM Efemeride E GROUP BY E.idefemeride";
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    listaefemerides = (List<Efemeride>) q.getResultList();
                    session.setAttribute("listaefemerides", listaefemerides);

                    response.sendRedirect("../efemerides.jsp");

                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error cargando las efemerides");
                    response.sendRedirect("../mainview.jsp");
                }
            } else if (op.equals("deleteefemeride")) {
                try {

                    String idefemeride = (String) request.getParameter("idefemeride");

                    sql = "SELECT E FROM Efemeride E WHERE E.idefemeride = " + idefemeride;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");

                    Efemeride e = (Efemeride) q.getSingleResult();

                    em.getTransaction().begin();
                    em.remove(e);
                    em.getTransaction().commit();

                    response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    session.setAttribute("correctmessage", "Efeméride eliminada correctamente");

                } catch (Exception e) {
                    session.setAttribute("errormessage", e.toString());
                    response.sendRedirect("../mainview.jsp");
                }
            } else if (op.equals("savenewefe")) {
                try {

                    String pueblo = new String(request.getParameter("town").getBytes("ISO-8859-1"), "UTF-8");
                    String provincia = new String(request.getParameter("province").getBytes("ISO-8859-1"), "UTF-8");
                    String tipoevento = new String(request.getParameter("event").getBytes("ISO-8859-1"), "UTF-8");
                    String foto = new String(request.getParameter("foto").getBytes("ISO-8859-1"), "UTF-8");
                    String cartel = new String(request.getParameter("cartel").getBytes("ISO-8859-1"), "UTF-8");
                    String ganaderia = new String(request.getParameter("ganadery").getBytes("ISO-8859-1"), "UTF-8");
                    String fechaefemeride = new String(request.getParameter("date").getBytes("ISO-8859-1"), "UTF-8");
                    String fechareal = new String(request.getParameter("real_date").getBytes("ISO-8859-1"), "UTF-8");
                    String reportaje = new String(request.getParameter("report").getBytes("ISO-8859-1"), "UTF-8");
                    String notas = new String(request.getParameter("notes").getBytes("ISO-8859-1"), "UTF-8");
                    String fuente = new String(request.getParameter("fuente").getBytes("ISO-8859-1"), "UTF-8");
                    String lista[] = request.getParameterValues("idpersonajes");

                    List<Personaje> listPersonajesSelect = new ArrayList<>();
                    
                    for (int i = 0; i < lista.length; i++) {
                        sql = "SELECT P FROM Personaje P WHERE P.idpersonaje =" + lista[i];
                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        Personaje personaje = (Personaje) q.getSingleResult();
                        listPersonajesSelect.add(personaje);
                    }

                    Efemeride efemeride = new Efemeride();
                    efemeride.setIdefemeride(-1);
                    efemeride.setPueblo(pueblo);
                    efemeride.setProvincia(provincia);
                    efemeride.setTipoevento(tipoevento);
                    efemeride.setFoto(foto);
                    efemeride.setCartel(cartel);
                    efemeride.setGanaderia(ganaderia);

                    efemeride.setReportaje(reportaje);
                    efemeride.setNotas(notas);
                    efemeride.setFuente(fuente);

                    if (fechaefemeride.length() != 0) {
                        efemeride.setFechaefemeride(formatter.parse(fechaefemeride));
                    }

                    if (fechareal.length() != 0) {
                        efemeride.setFechareal(formatter.parse(fechareal));
                    }

                    if (efemeride.getPersonajeList() == null) { //si es nulo creo una nueva lista en la que añado el personaje y le meto la lista de persoanjes a la efemeride
                        efemeride.setPersonajeList(listPersonajesSelect);
                    } else {//si no es nulo le cojo el array y le añado el personaje directamente
                        for (Personaje p : listPersonajesSelect) {
                            efemeride.getPersonajeList().add(p);
                        }
                    }

                    em.getTransaction().begin();
                    em.persist(efemeride);
                    em.getTransaction().commit();
                    response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    session.setAttribute("errormessage", "Guardada correctamente la efeméride");
                } catch (Exception e) {
                    response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    session.setAttribute("errormessage", "Error al crear la efemeride ");
                    e.printStackTrace();
                }

            } else if (op.equals("loadllcharactersforefemerides")) {
                try {
                    sql = "SELECT P FROM Personaje P";
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    listapersonajes = (List<Personaje>) q.getResultList();
                    session.setAttribute("listapersonajes", listapersonajes);

                    response.sendRedirect("../addEfemeride.jsp");
                } catch (Exception e) {
                }

            } else if (op.equals("createinformpdf")) {
                String idefemeride = (String) request.getParameter("idefem");
                sql = "SELECT E FROM Efemeride E WHERE E.idefemeride = " + idefemeride;
                q = em.createQuery(sql);
                q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                Efemeride efemeride = (Efemeride) q.getSingleResult();

                Inform i = new Inform();
                i.generateInformPDFEfemeride(request, response, efemeride);
                response.sendRedirect("../detailPersonajes.jsp");
                session.setAttribute("correctmessage", "Informe generado correctamente");

            } else if (op.equals("loadllcharactersforeditefemerides")) {
                try {

                    String fechaefemerideEdit = "";
                    String fecharealEdit = "";

                    sql = "SELECT P FROM Personaje P";
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    listapersonajes = (List<Personaje>) q.getResultList();
                    session.setAttribute("listapersonajes", listapersonajes);

                    String idefemeride = (String) request.getParameter("idefemeride");
                    sql = "SELECT E FROM Efemeride E WHERE E.idefemeride =" + idefemeride;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    Efemeride efemeride = (Efemeride) q.getSingleResult();

                    if (efemeride.getFechaefemeride() != null) {
                        fechaefemerideEdit = dateFormat.format(efemeride.getFechaefemeride());
                    }

                    if (efemeride.getFechareal() != null) {
                        fecharealEdit = dateFormat.format(efemeride.getFechareal());
                    }

                    session.setAttribute("efemeride", efemeride);
                    session.setAttribute("fecharealEdit", fecharealEdit);
                    session.setAttribute("fechaefemerideEdit", fechaefemerideEdit);
                    response.sendRedirect("../editEfemeride.jsp");
                } catch (Exception e) {
                    response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    session.setAttribute("errormessage", "Error al intetar cargar la edición del personaje" + e);
                }

            } else if (op.equals("saveeditefe")) {

                try {
                    String idefemeride = new String(request.getParameter("idefemeride").getBytes("ISO-8859-1"), "UTF-8");
                    String pueblo = new String(request.getParameter("town").getBytes("ISO-8859-1"), "UTF-8");
                    String provincia = new String(request.getParameter("province").getBytes("ISO-8859-1"), "UTF-8");
                    String tipoevento = new String(request.getParameter("event").getBytes("ISO-8859-1"), "UTF-8");
                    String foto = new String(request.getParameter("foto").getBytes("ISO-8859-1"), "UTF-8");
                    String cartel = new String(request.getParameter("cartel").getBytes("ISO-8859-1"), "UTF-8");
                    String ganaderia = new String(request.getParameter("ganadery").getBytes("ISO-8859-1"), "UTF-8");
                    String fechaefemeride = new String(request.getParameter("date").getBytes("ISO-8859-1"), "UTF-8");
                    String fechareal = new String(request.getParameter("real_date").getBytes("ISO-8859-1"), "UTF-8");
                    String reportaje = new String(request.getParameter("report").getBytes("ISO-8859-1"), "UTF-8");
                    String notas = new String(request.getParameter("notes").getBytes("ISO-8859-1"), "UTF-8");
                    String fuente = new String(request.getParameter("fuente").getBytes("ISO-8859-1"), "UTF-8");
                    String lista[] = request.getParameterValues("idpersonajes");

                    ArrayList<Personaje> listPersonajesSelect = new ArrayList<>();

                    for (int i = 0; i < lista.length; i++) {
                        sql = "SELECT P FROM Personaje P WHERE P.idpersonaje =" + lista[i];
                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        Personaje personaje = (Personaje) q.getSingleResult();
                        listPersonajesSelect.add(personaje);
                    }

                    Efemeride efemeride = new Efemeride();
                    efemeride.setIdefemeride(Integer.parseInt(idefemeride));
                    efemeride.setPueblo(pueblo);
                    efemeride.setProvincia(provincia);
                    efemeride.setTipoevento(tipoevento);
                    efemeride.setFoto(foto);
                    efemeride.setCartel(cartel);
                    efemeride.setGanaderia(ganaderia);
                    efemeride.setReportaje(reportaje);
                    efemeride.setNotas(notas);
                    efemeride.setFuente(fuente);

                    if (fechaefemeride.length() != 0) {
                        efemeride.setFechaefemeride(formatter.parse(fechaefemeride));
                    }

                    if (fechareal.length() != 0) {
                        efemeride.setFechareal(formatter.parse(fechareal));
                    }

                    if (efemeride.getPersonajeList() == null) { //si es nulo creo una nueva lista en la que añado el personaje y le meto la lista de persoanjes a la efemeride
                        efemeride.setPersonajeList(listPersonajesSelect);
                    } else {//si no es nulo le cojo el arry y le añado el personaje directamente
                        for (Personaje p : listPersonajesSelect) {
                            efemeride.getPersonajeList().add(p);
                        }
                    }

                    EntityTransaction tx = em.getTransaction();
                    tx.begin();
                    em.merge(efemeride);
                    tx.commit();

                    response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    session.setAttribute("errormessage", "Editada correctamente la efeméride");
                } catch (Exception e) {
                    response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    session.setAttribute("errormessage", "Error al editar la efeméride");

                    out.print(e);
                }

            } else if (op.equals("searchEfemerdeByDate")) {
                try {

                    String fecha = request.getParameter("date");

                    if (fecha == null || fecha.length() <= 0) {
                        response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                        session.setAttribute("errormessage", "Escriba una fecha");
                    } else {
                        String[] cadena = fecha.split("/");
                        String auxDate = cadena[2] + "-" + cadena[1] + "-" + cadena[0];

                        sql = "SELECT E FROM Efemeride E WHERE E.fechaefemeride ='" + auxDate + "'";
                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        listaefemerides = (List<Efemeride>) q.getResultList();
                        session.setAttribute("listaefemerides", listaefemerides);

                        response.sendRedirect("../efemerides.jsp");
                    }

                } catch (Exception e) {
                    response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    session.setAttribute("errormessage", "Error al intetar buscar por fecha");
                }
            }
        %>
    </body>
</html>


