<%-- 
    Document   : editPersonaje
    Created on : 18-may-2018, 9:20:24
    Author     : agustin
--%>

<%@page import="Entities.Fotos"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Entities.Personaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" /> 
    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/validateSession.jsp" />

        <jsp:include page="assets/shared/models/headerBack.jsp" />
        <form class="character-form" action="controllers/controller.jsp?op=saveeditcharacter" method="POST" name="formcharacter">
            <div class="container wrapper_container">
                <!-- Start Row title-->
                <h5 class="titles_red_h5">Editar Personaje</h5>
                <!-- End Row title-->
                <!-- Start Row image and credentials-->
                <div class="row">

                    <%
                        Personaje personajeEdit = new Personaje();
                        String fechaalternativaEdit = (String) session.getAttribute("fechaalternativaEdit");
                        String fechanacimientoEdit = (String) session.getAttribute("fechanacimientoEdit");
                        String fechapicadoresEdit = (String) session.getAttribute("fechapicadoresEdit");
                        String fechapresentacionEdit = (String) session.getAttribute("fechapresentacionEdit");

                        try {
                            personajeEdit = (Personaje) session.getAttribute("personajeEdit");
                    %>
                    <!-- Start col 1-->
                    <div class="col s12 m6 l6">
                        <label for="first_name" class="black_taurinas">Nombre *</label>
                        <input id="first_name" required="true" value="<%=personajeEdit.getNombrepersonaje()%>" type="text" class="validate" name="first_name">
                        <label for="surname" class="black_taurinas">Primer Apellido *</label>
                        <input  id="frist_surname" required="true" value="<%=personajeEdit.getApellido1()%>" type="text" class="validate" name="frist_surname">
                        <label for="second_surname" class="black_taurinas">Segundo Apellido</label>
                        <input  id="surname" type="text" class="validate" value="<%=personajeEdit.getApellido2()%>" name="second_surname">
                        <label for="birth_province" class="black_taurinas">Provincia de nacimiento</label>
                        <input id="birth_province" type="text" value="<%=personajeEdit.getProvincianacimiento()%>" class="validate" name="birth_province">
                    </div>

                    <!-- End col 1-->
                    <!-- Start col 2-->
                    <div class="col s12 m6 l6">
                        <input class="hidden_display " name="idcharacter" value="<%=personajeEdit.getIdpersonaje()%>">
                        <label for="first_nickname" lass="black_taurinas">Primer Apodo *</label>
                        <input id="first_nickname" required="true" value="<%=personajeEdit.getApodo1()%>" type="text" class="validate" name="first_nickname">
                        <label for="second_nickname" class="black_taurinas">Segundo Apodo</label>
                        <input id="second_nickname" type="text" value="<%=personajeEdit.getApodo2()%>" class="validate" name="second_nickname">
                        <label for="birth_date" class="black_taurinas">Fecha Nacimiento</label>
                        <input id="birth_date" type="text" value="<%=fechanacimientoEdit%>" class="datepicker" name="birth_date">
                        <label for="birth_town" class="black_taurinas">Localidad de nacimiento</label>
                        <input id="birth_town" type="text" value="<%=personajeEdit.getPueblonacimiento()%>" class="validate" name="birth_town">
                    </div>
                    <!-- End col 2-->
                </div>
                <!-- End Row image and credentials-->
                <br/><br/><br/>
                <!-- Start row Personal details-->
                <h5 class="titles_red_h5">Mas Datos</h5>
                <div class="row">
                    <!-- Start frist col personal detail-->
                    <div class="col s12 m6 l4">
                        <label for="name_poster"  class="black_taurinas">Nombre Cartel</label>
                        <input id="name_poster" value="<%=personajeEdit.getNombrecartel()%>" type="text" class="validate" name="name_poster">
                        <label for="img" class="black_taurinas">Imagen <i id="informationimage " data-position="bottom" data-delay="10" data-tooltip="Debe colocar la URL de la imagen" class=" tooltipped material-icons information_orange_buttons">info</i></label>
                        <input  id="img" type="text" value="<%=personajeEdit.getFotografia()%>" class="validate" name="img">
                        <label for="picadores_date" class="black_taurinas">Fecha Picadores</label>
                        <input id="picadores_date" type="text" value="<%=fechapicadoresEdit%>" class="datepicker" name="picadores_date">
                    </div>
                    <!-- End frist col personal detail-->
                    <!-- Start second col personal detail-->
                    <div class="col s12 m6 l4">
                        <label for="direction" class="black_taurinas">Dirección</label>
                        <input id="direction" value="<%=personajeEdit.getDireccion()%>" type="text" class="validate" name="direction">
                        <label for="contact" class="black_taurinas">Contacto</label>
                        <input id="contact" value="<%=personajeEdit.getPersonadecontacto()%>" type="text" class="validate" name="contact">
                        <label for="presentation_date" class="black_taurinas">Fecha Presentacion</label>
                        <input id="presentation_date" type="text" value="<%=fechapresentacionEdit%>" class="datepicker" name="presentation_date">
                    </div>
                    <!-- End second col personal detail-->
                    <!-- Start third col personal detail-->
                    <div class="col s12 m6 l4">
                        <label for="phone" class="black_taurinas">Teléfono</label>
                        <input id="phone" value="<%=personajeEdit.getTelefono()%>" type="number" class="validate" name="phone">  
                        <label for="email" class="black_taurinas">Email</label>
                        <input id="email" value="<%=personajeEdit.getCorreo()%>" type="email" class="validate" name="email">
                        <label for="alternative_date" class="black_taurinas">Fecha Alternativa</label>
                        <input id="alternative_date" type="text" value="<%=fechaalternativaEdit%>" class="datepicker" name="alternative_date">
                    </div>
                    <!-- End third col personal detail-->
                </div>
                <!-- End row Personal details-->


                <div class="row margin_top_login">
                    <%for (int i = 0; i < personajeEdit.getProfesionList().size(); i++) {%>
                    <div class="col s12 m6 l3">
                        <label for="profession" class="black_taurinas"><%=i + 1%>º Profesion</label>
                        <input disabled value="<%=personajeEdit.getProfesionList().get(i).getDescripcion()%>" id="profession" type="text" class="validate">
                    </div>
                    <%}%>
                </div>

                <!-- Start row of complete and cossio -->
                <div class="row center-align margin_top_login">
                    <!-- Start col 1-->
                    <div class="col s12 m4 l4">
                        <input type="checkbox" class="" id="complete" name="checkcomplete"/>
                        <label for="complete" class="black_taurinas">Completo</label>
                        <script>
                            if (<%=personajeEdit.getCompleto()%> == true) {
                                $('#complete').prop('checked', true);
                            } else {
                                $('#complete').prop('checked', false);
                            }
                        </script>
                    </div>
                    <!-- End col 1-->
                    <div class="col s12 m4 l4">
                        <input type="checkbox" class="" id="clm" name="checkclm"/>
                        <label for="clm" class="black_taurinas">CLM</label>
                        <script>
                            if (<%=personajeEdit.getClm()%> == true) {
                                $('#clm').prop('checked', true);
                            } else {
                                $('#clm').prop('checked', false);
                            }
                        </script>
                    </div>
                    <!-- Start col 2-->
                    <div class="col s12 m4 l4">
                        <input type="checkbox" class="" id="cossio" name="checkcossio"/>
                        <label for="cossio" class="black_taurinas">Cossio</label>
                        <script>
                            if (<%=personajeEdit.getCossio()%> == true) {
                                $('#cossio').prop('checked', true);
                            } else {
                                $('#cossio').prop('checked', false);
                            }
                        </script>
                    </div>
                    <!-- End col 2-->
                </div>
                <!-- End col 1-->

                <!-- End row of complete and cossio -->   

                <!-- Start row provinces -->
                <div class="row">
                    <!-- Start col 1-->
                    <div class="col s12 m6 l6">
                        <label for="current_province" class="black_taurinas">Provincia actual</label>
                        <input id="current_province" value="<%=personajeEdit.getProvinciaactual()%>" type="text" class="validate" name="current_province">
                    </div>
                    <!-- End col 1-->
                    <!-- Start col 2-->
                    <div class="col s12 m6 l6">
                        <label for="current_town" class="black_taurinas">Localidad actual</label>
                        <input id="current_town" value="<%=personajeEdit.getPuebloactual()%>" type="text" class="validate" name="current_town">
                    </div>
                    <!-- End col 2-->
                </div>
                <!-- End row provinces -->
                <!-- Start row biograpy and image-->
                <div class="row">
                    <div class="col s12 m12 l12">
                        <label class="black_taurinas" for="biography">Biografía</label>
                        <textarea lang="es" id="biography" value="" class="materialize-textarea" name="biography"><%=personajeEdit.getBiografia()%></textarea>  
                        <label class="black_taurinas" for="notes">Notas</label>
                        <textarea lang="es" id="notes" value="" class="materialize-textarea" name="notes"><%=personajeEdit.getNotas()%></textarea>  
                    </div>
                </div>
                <!-- End row biograpy and image-->
            </div>

            <div class="row center-align margin_top">
                <button class="waves-effect waves-light btn grey darken-4" type="submit"><i class="material-icons left">save</i>Guardar</button>
                <a class="waves-effect waves-light btn grey darken-4" href="personajes.jsp"><i class="material-icons left">cancel</i>Cancelar</a>
            </div>

            <% } catch (Exception e) {
                    session.setAttribute("errormessage", "Error visualizar la edición del personaje");
                    response.sendRedirect("mainview.jsp");
                }%>
        </form>
        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>

