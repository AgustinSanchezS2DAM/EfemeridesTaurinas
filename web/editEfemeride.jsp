<%-- 
    Document   : addEfemeride
    Created on : 14-may-2018, 15:12:34
    Author     : agustin
--%>

<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Entities.Efemeride"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entities.Personaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" /> 
    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/validateSession.jsp" />

        <jsp:include page="assets/shared/models/headerBack.jsp" />
        <div class="container wrapper_container ">
            <!-- Start Row title-->
            <% try {

                    Efemeride efemeride = (Efemeride) session.getAttribute("efemeride");
                    String fechaefemerideEdit = (String) session.getAttribute("fechaefemerideEdit");
                    String fecharealEdit = (String) session.getAttribute("fecharealEdit");

                    //cojo los dos arrays resto el completo con el array que efemreides y me salen los personajes no seleccionados
                    List<Personaje> listaPersonajesCompleta = (List<Personaje>) session.getAttribute("listapersonajes");
                    List<Personaje> listaPersonajesEfemeride = (List<Personaje>) efemeride.getPersonajeList();

                    listaPersonajesCompleta.removeAll(listaPersonajesEfemeride);

            %>
            <h5 class="titles_red_h5">Editar Efeméride: </h5>

            <!-- End Row title-->
            <!-- Start Row image and credentials-->
            <form class="character-form" action="controllers/controllerEfemeride.jsp?op=saveeditefe" method="POST" name="formcharacter">
                <input  id="idefemeride" type="text" class="validate hidden_display" name="idefemeride" value="<%=efemeride.getIdefemeride()%>">
                <div class="row">
                    <!-- Start col 1-->
                    <div class="col s12 m4 l4">
                        <label for="date" required="true" class="black_taurinas">Fecha de la efeméride *</label>
                        <input  id="date" type="text" class="datepicker" name="date" value="<%=fechaefemerideEdit%>">
                        <label for="town" required="true" class="black_taurinas">Localidad *</label>
                        <input  id="town" type="text" class="validate" name="town" value="<%=efemeride.getPueblo()%>">
                        <label for="ganadery" class="black_taurinas">Ganadería</label>
                        <input  id="ganadery" type="text" class="validate" name="ganadery" value="<%=efemeride.getGanaderia()%>">
                    </div>
                    <!-- End col 1-->
                    <!-- Start col 2-->
                    <div class="col s12 m4 l4">
                        <label for="event"required="true"  class="black_taurinas">Titulo de Evento *</label>
                        <input  id="event" type="text" class="validate" name="event" value="<%=efemeride.getTipoevento()%>">
                        <label for="province" required="true" class="black_taurinas">Provincia *</label>
                        <input id="province" type="text" class="validate" name="province" value="<%=efemeride.getProvincia()%>">
                        <label for="report" class="black_taurinas">Reportaje</label>
                        <input  id="report" type="text" class="validate" name="report" value="<%=efemeride.getReportaje()%>">
                    </div>
                    <!-- End col 2-->
                    <!-- Start col 3-->
                    <div class="col s12 m4 l4">
                        <label for="foto" class="black_taurinas">Fotografía</label>
                        <input  id="foto" type="text" class="validate" name="foto" value="<%=efemeride.getFoto()%>">
                        <label for="cartel" class="black_taurinas">Cartel</label>
                        <input  id="cartel" type="text" class="validate" name="cartel" value="<%=efemeride.getCartel()%>">
                        <label for="real_date" class="black_taurinas">Fecha real</label>
                        <input  id="real_date" type="text" class="datepicker" name="real_date" value="<%=fecharealEdit%>">
                    </div>
                    <!-- End col 3-->
                </div>
                <!-- End Row image and credentials-->
                <h5 class="titles_red_h5">Más datos</h5>
                <div class="row">
                    <div class="s12">
                        <label class="black_taurinas" for="notes">Notas</label>
                        <textarea  id="notes" class="materialize-textarea" name="notes"><%=efemeride.getNotas()%></textarea>
                        <label class="black_taurinas" for="fuente">Fuente</label>
                        <textarea id="fuente" class="materialize-textarea" name="fuente"><%=efemeride.getFuente()%></textarea>
                    </div>
                </div>


                <div class="row margin_top_login">
                    <div class="col s12 m8 l8 offset-m2 offset-l2">
                        <div class="input-field col s12">
                            <select multiple required="required" id="selectcharactersefemerides"  name="idpersonajes">
                                <%for (int i = 0; i < efemeride.getPersonajeList().size(); i++) {%>
                                <option value="<%=efemeride.getPersonajeList().get(i).getIdpersonaje()%>" selected="<%=efemeride.getPersonajeList().get(i).getNombrepersonaje()%> <%=efemeride.getPersonajeList().get(i).getApellido1()%> <%=efemeride.getPersonajeList().get(i).getApellido2()%>"><%=efemeride.getPersonajeList().get(i).getNombrepersonaje()%> <%=efemeride.getPersonajeList().get(i).getApellido1()%> <%=efemeride.getPersonajeList().get(i).getApellido2()%></option>

                                <%}%>
                                <% for (int i = 0; i < listaPersonajesCompleta.size(); i++) {%>
                                <option value="<%=listaPersonajesCompleta.get(i).getIdpersonaje()%>"><%=listaPersonajesCompleta.get(i).getNombrepersonaje()%> <%=listaPersonajesCompleta.get(i).getApellido1()%> <%=listaPersonajesCompleta.get(i).getApellido2()%></option>
                                <%}%>
                            </select>
                            <label>Selecciona un personaje</label>
                        </div>
                    </div>

                </div>

                <div class="row center-align">
                    <button type="submit" class="waves-effect waves-light btn grey darken-4 "><i class="material-icons left">save</i>Guardar</button>
                </div>
            </form>

            <% } catch (Exception e) {
                    session.setAttribute("errormessage", "Error visualizar la edición de la efemeride");
                    response.sendRedirect("mainview.jsp");
                }%>
            <!-- Start Modal -->
            <jsp:include page="assets/shared/modals/modalcat.jsp" />
            <!-- End Modal -->
        </div>
        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>
