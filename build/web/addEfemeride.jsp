<%-- 
    Document   : addEfemeride
    Created on : 14-may-2018, 15:12:34
    Author     : agustin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entities.Personaje"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" /> 
    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/validateSession.jsp" />

        <jsp:include page="assets/shared/models/headerBack.jsp" />
        <div class="container wrapper_container ">
            <!-- Start Row title-->
            <h5 class="titles_red_h5">A�adir Efem�ride</h5>
            <!-- End Row title-->
            <form class="character-form" action="controllers/controllerEfemeride.jsp?op=savenewefe" method="POST" name="formcharacter">

                <div class="row">
                    <!-- Start col 1-->
                    <div class="col s12 m4 l4">
                        <label for="province" class="black_taurinas">Provincia</label>
                        <input  id="province" type="text" class="validate" name="province" value="">
                        <label for="town" class="black_taurinas">Pueblo</label>
                        <input  id="town" type="text" class="validate" name="town" value="">
                        <label for="event" class="black_taurinas">Tipo de Evento</label>
                        <input  id="event" type="text" class="validate" name="event" value="">
                    </div>
                    <!-- End col 1-->
                    <!-- Start col 2-->
                    <div class="col s12 m4 l4">
                        <label for="foto" class="black_taurinas">Fotograf�a</label>
                        <input  id="foto" type="text" class="validate" name="foto" value="">
                        <label for="cartel" class="black_taurinas">Cartel</label>
                        <input  id="cartel" type="text" class="validate" name="cartel" value="">
                        <label for="ganadery" class="black_taurinas">Ganader�a</label>
                        <input  id="ganadery" type="text" class="validate" name="ganadery" value="">

                    </div>
                    <!-- End col 2-->
                    <!-- Start col 3-->
                    <div class="col s12 m4 l4">
                        <label for="date" class="black_taurinas">Fecha</label>
                        <input  id="date" type="text" class="datepicker" name="date" value="">
                        <label for="real_date" class="black_taurinas">Fecha</label>
                        <input  id="real_date" type="text" class="datepicker" name="real_date" value="">
                        <label for="report" class="black_taurinas">Reportaje</label>
                        <input id="report" type="text" class="validate" name="report" value="">
                    </div>
                    <!-- End col 3-->
                </div>
                <!-- End Row image and credentials-->
                <h5 class="titles_red_h5">M�s datos</h5>
                <div class="row">
                    <div class="s12">
                        <label class="black_taurinas" for="notes">Notas</label>
                        <textarea id="notes" class="materialize-textarea" name="notes"></textarea>
                        <label class="black_taurinas" for="fuente">Fuente</label>
                        <textarea id="fuente" class="materialize-textarea" name="fuente"></textarea>
                    </div>
                </div>

                <!-- Start select characters -->
                <div class="row margin_top_login">
                    <div class="col s10 m8 l8 offset-s1 offset-m2 offset-l2">
                        <div class="input-field col s12">
                            <!-- Start select-->
                            <select multiple required="required" id="selectcharactersefemerides"  name="idpersonajes">
                                <option value="" disabled selected>Seleccione un personaje</option>
                                <%
                                    try {
                                        List<Personaje> listaPersonaje = (List<Personaje>) session.getAttribute("listapersonajes");
                                        for (int i = 0; i < listaPersonaje.size(); i++) {%>
                                <option value="<%=listaPersonaje.get(i).getIdpersonaje()%>"><%=listaPersonaje.get(i).getNombrepersonaje()%> <%=listaPersonaje.get(i).getApellido1()%> <%=listaPersonaje.get(i).getApellido2()%></option>
                                <%
                                        }

                                    } catch (Exception e) {
                                        session.setAttribute("errormessage", "Error cargar los personajes");
                                        response.sendRedirect("../mainview.jsp");
                                    }%>
                            </select>
                            <!-- End select-->
                            <label>Selecciona un personaje</label>
                        </div>
                    </div>
                </div>
                <!-- End select characters -->
                <!-- Start row buttons -->
                <div class="row center-align">
                    <button type="submit" class="waves-effect waves-light btn grey darken-4 "><i class="material-icons left">save</i>Guardar</button>
                    <a class="waves-effect waves-light btn grey darken-4" href="efemerides.jsp"><i class="material-icons left">cancel</i>Cancelar</a>
                </div>
                <!-- End row buttons -->
            </form>
            <!-- Start Modal -->
            <jsp:include page="assets/shared/modals/modalcat.jsp" />
            <!-- End Modal -->
        </div>
        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>
