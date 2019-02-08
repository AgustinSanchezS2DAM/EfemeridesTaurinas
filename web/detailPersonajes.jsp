<%--
    Document   : torerosdetail
    Created on : 08-may-2018, 13:56:33
    Author     : agustin
--%>

<%@page import="Entities.Fotos"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Efemeride"%>
<%@page import="Entities.Personaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" />
    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/validateSession.jsp" />

        <jsp:include page="assets/shared/models/headerBack.jsp" />
        <div class="container wrapper_container">

            <%
                Personaje personajedatail = (Personaje) session.getAttribute("personajedatail");
                String fechaalternativaEdit = (String) session.getAttribute("fechaalternativaEdit");
                String fechanacimientoEdit = (String) session.getAttribute("fechanacimientoEdit");
                String fechapicadoresEdit = (String) session.getAttribute("fechapicadoresEdit");
                String fechapresentacionEdit = (String) session.getAttribute("fechapresentacionEdit");
                DateFormat dateFormat = new SimpleDateFormat("dd MMM, yyyy");

                String img = "";
                if (personajedatail.getFotosList().size() > 0) {
                    img = personajedatail.getFotosList().get(0).getImagen();
                }
            %>
            <!-- Start Row title-->
            <div class="row">
                <div class="col s12 m4 l4">
                    <h5 class="titles_red_h5">Personaje</h5>
                </div>
                <div class="col s12 m4 l4">
                    <form class="filter-form" action="controllers/controller.jsp?op=deletecharacter&idperonajedelete=<%=personajedatail.getIdpersonaje()%>" method="POST">
                        <button data-position="bottom" data-tooltip="Si elimina el personaje se eliminarán todo lo asociado a él" class="tooltipped btn waves-effect waves-light blue-grey darken-3" type="submit" name="action">Eliminar
                            <i class="material-icons right">delete</i>
                        </button>
                    </form> 
                </div>

                <div class="col s12 m4 l4">
                    <form target="_blank" class="filter-form" action="controllers/controller.jsp?op=createinformpdf" method="POST" name="formfilter">
                        <input class="hidden_display " name="idcharacter" value="<%=personajedatail.getIdpersonaje()%>">
                        <button class="btn waves-effect waves-light green" type="submit" name="action">Informe Personaje<i class="material-icons right">picture_as_pdf</i></button>
                    </form>
                </div>
            </div>

            <!-- End Row title-->
            <!-- Start Row image and credentials-->
            <div class="row">

                <!-- Start col image-->
                <div class="col s12 m4 l5">
                    <div class="mate wrapper-image">
                        <img onerror="this.src='assets/img/no-photo.png';" class="image_character_detail" src="<%=img%>" >
                    </div>
                </div>
                <!-- End col image-->
                <!-- Start col credentials-->
                <div class="col s12 m8 l7">
                    <label for="first_name" class="black_taurinas">Nombre</label>
                    <input disabled="true" value="<%=personajedatail.getNombrepersonaje()%>" id="first_name" type="text" class="validate">
                    <label for="surname" class="black_taurinas">Apellidos</label>
                    <input disabled="" value="<%=personajedatail.getApellido1()%> <%=personajedatail.getApellido2()%>" id="surname" type="text" class="validate">
                    <label for="first_nickname" class="black_taurinas">Primer Apodo</label>
                    <input disabled="" value="<%=personajedatail.getApodo1()%>" id="first_nickname" type="text" class="validate">
                    <label for="second_nickname" class="black_taurinas">Segundo Apodo</label>
                    <input disabled="" id="second_nickname" value="<%=personajedatail.getApodo2()%>" type="text" class="validate">
                </div>
                <!-- End col credentials-->
            </div>
            <!-- End Row image and credentials-->
            <!-- Start row Personal details-->
            <h5 class="titles_red_h5">Más Datos</h5>
            <div class="row">
                <!-- Start frist col personal detail-->
                <div class="col s12 m6 l4">
                    <label for="name_poster" class="black_taurinas">Nombre Cartel</label>
                    <input disabled value="<%=personajedatail.getNombrecartel()%>" id="name_poster" type="text" class="validate">
                    <label for="birth_date" class="black_taurinas">Fecha Nacimiento</label>
                    <input disabled value="<%=fechanacimientoEdit%>" id="birth_date" type="text" class="datepicker">
                    <label for="brith_province" class="black_taurinas">Provincia de nacimiento</label>
                    <input disabled value="<%=personajedatail.getProvincianacimiento()%>" id="brith_province" type="text" class="validate">
                    <label for="alternative_date" class="black_taurinas">Fecha Alternativa</label>
                    <input disabled value="<%=fechaalternativaEdit%>" id="alternative_date" type="text" class="validate">
                </div>
                <!-- End frist col personal detail-->
                <!-- Start second col personal detail-->
                <div class="col s12 m6 l4">
                    <label for="direction" class="black_taurinas">Dirección</label>
                    <input disabled value="<%=personajedatail.getDireccion()%>" id="direction" type="text" class="validate">
                    <label for="contact" class="black_taurinas">Contacto</label>
                    <input disabled value="<%=personajedatail.getPersonadecontacto()%>" id="contact" type="text" class="validate">
                    <label for="brith_town" class="black_taurinas">Localidad de nacimiento</label>
                    <input disabled value="<%=personajedatail.getPueblonacimiento()%>" id="brith_town" type="text" class="validate">
                </div>
                <!-- End second col personal detail-->
                <!-- Start third col personal detail-->
                <div class="col s12 m6 l4">
                    <label for="phone" class="black_taurinas">Teléfono</label>
                    <input disabled value="<%=personajedatail.getTelefono()%>" id="phone" type="number" class="validate" >
                    <label for="email" class="black_taurinas">Email</label>
                    <input disabled value="<%=personajedatail.getCorreo()%>" id="email" type="email" class="validate">
                    <label for="picadores_date" class="black_taurinas">Fecha Picadores</label>
                    <input disabled value="<%=fechapicadoresEdit%>" id="picadores_date" type="text" class="validate">
                    <label for="presentation_date" class="black_taurinas">Fecha Presentacion</label>
                    <input disabled value="<%=fechapresentacionEdit%>" id="presentation_date" type="text" class="validate">
                </div>
                <!-- End third col personal detail-->
            </div>

            <div class="row">
                <%for (int i = 0; i < personajedatail.getProfesionList().size(); i++) {%>
                <div class="col s12 m6 l3">
                    <label for="profession" class="black_taurinas"><%=i + 1%>º Profesion</label>
                    <input disabled value="<%=personajedatail.getProfesionList().get(i).getDescripcion()%>" id="profession" type="text" class="validate">
                </div>
                <%}%>
            </div>
            <!-- End row Personal details-->
            <div class="row">
                <div class="col s12 m6 l6">
                    <label for="current_province" class="black_taurinas">Provincia actual</label>
                    <input disabled value="<%=personajedatail.getProvinciaactual()%>" id="current_province" type="text" class="validate">
                    <label for="current_town" class="black_taurinas">Localidad actual</label>
                    <input disabled value="<%=personajedatail.getPuebloactual()%>" id="current_town" type="text" class="validate">

                </div>
                <div class="col s12 m6 l6 center">
                    <div class="row">
                        <input disabled="disabled" type="checkbox" class="" id="complete" name="checkcomplete"/>
                        <label for="complete" class="black_taurinas">Completo</label>
                        <script>
                            if (<%=personajedatail.getCompleto()%> == true) {
                                $('#complete').prop('checked', true);
                            } else {
                                $('#complete').prop('checked', false);
                            }
                        </script>
                    </div>
                    <div class="row">
                        <input disabled="disabled" type="checkbox" class="" id="clm" name="checkclm"/>
                        <label for="clm" class="black_taurinas">CLM</label>
                        <script>
                            if (<%=personajedatail.getClm()%> == true) {
                                $('#clm').prop('checked', true);
                            } else {
                                $('#clm').prop('checked', false);
                            }
                        </script>
                    </div>
                    <div class="row">
                        <input disabled="disabled" type="checkbox" class="" id="cossio" name="checkcossio"/>
                        <label for="cossio" class="black_taurinas">Cossio</label>
                        <script>
                            if (<%=personajedatail.getCossio()%> == true) {
                                $('#cossio').prop('checked', true);
                            } else {
                                $('#cossio').prop('checked', false);
                            }
                        </script>
                    </div>
                </div>
            </div>
            <!-- Start col personal biograpy-->
            <div class="row margin_top_login">
                <div class="col s12">
                    <label for="biography">Biografía</label>
                    <textarea disabled value=""  id="biography" class="materialize-textarea"><%=personajedatail.getBiografia()%></textarea>
                    <label for="notes">Notas</label>
                    <textarea disabled value=""  id="notes" class="materialize-textarea"><%=personajedatail.getNotas()%></textarea>
                </div>
            </div>
            <!-- End col personal biograpy-->
            <!-- Start Table efemerides -->
            <h5 class="titles_red_h5">Efemérides</h5>

            <%
                List<Efemeride> listaEfemeridesPersonaje = (List<Efemeride>) session.getAttribute("listaEfemeridesPersonaje");
                if (listaEfemeridesPersonaje.size() != 0) {%>
            <table class="highlight striped">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Año</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < listaEfemeridesPersonaje.size(); i++) {
                            String date = "";
                            if (listaEfemeridesPersonaje.get(i).getFechaefemeride() != null) {
                                date = dateFormat.format(listaEfemeridesPersonaje.get(i).getFechaefemeride());
                            }

                    %>
                    <tr>
                        <td><%=personajedatail.getNombrepersonaje()%> <%=personajedatail.getApellido1()%> <%=personajedatail.getApellido2()%></td>
                        <td><%=date%></td>
                        <td>
                            <form class="filter-form" action="controllers/controllerEfemeride.jsp?op=detailefemeride" method="POST" name="formfilter">
                                <input class="hidden_display " name="idcharacter" value="<%=personajedatail.getIdpersonaje()%>">
                                <input class="hidden_display " name="idefemeride" value="<%=listaEfemeridesPersonaje.get(i).getIdefemeride()%>">
                                <button type="submit" class="waves-effect waves-light btn small_button background_color_red" >Ver más</button>
                            </form>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <%
            } else {%>
            <p>El personaje no tiene asignadas efemerides</p>
            <%}%>
            <!-- End Table efemerides -->
            <h5 class="titles_red_h5">Galería</h5>
            <div class="row">
                <div class="contenedor-imagenes">
                    <%for (Fotos f : personajedatail.getFotosList()) {%>
                    <img onerror="this.src='assets/img/no-photo.png';" src="<%=f.getImagen()%>" data-caption="<%=personajedatail.getNombrepersonaje()%> <%=personajedatail.getApellido1()%> <%=personajedatail.getApodo2()%>" width="200" class="materialboxed galeria_imagen">
                    <% }%>
                </div>
            </div>
        </div>
        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>
