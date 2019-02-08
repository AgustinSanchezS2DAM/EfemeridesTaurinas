<%-- 
    Document   : detailEfemeride
    Created on : 09-may-2018, 23:06:12
    Author     : agustin
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Personaje"%>
<%@page import="Entities.Efemeride"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" /> 
    <body class="body_html_mainview margin_botton">

        <jsp:include page="assets/shared/models/headerBack.jsp" />
        <jsp:include page="assets/shared/models/validateSession.jsp" />

        <div class="container wrapper_container">

            <%

                Efemeride efemeride = (Efemeride) session.getAttribute("efem");
                String fechaefemerideEdit = (String) session.getAttribute("fechaefemerideEdit");
                String fecharealEdit = (String) session.getAttribute("fecharealEdit");
                
                

                DateFormat dateFormat = new SimpleDateFormat("dd MMM, yyyy");%>
            <div class="row">
                <div class="col s6">
                    <h5 class="titles_red_h5 ">Editar Efeméride</h5>
                </div>
                <div class="col s6">
                    <form target="_blank" class="filter-form" action="controllers/controllerEfemeride.jsp?op=createinformpdf" method="POST" name="formfilter">
                        <input class="hidden_display " name="idefem" value="<%=efemeride.getIdefemeride()%>">
                        <button class="btn waves-effect waves-light green right" type="submit" name="action">Informe Efemeride<i class="material-icons right">picture_as_pdf</i></button>
                    </form>
                </div>
            </div>

            <div class="row">
                <!-- Start col 1-->
                <div class="col s12 m4 l4">
                     <label for="date" class="black_taurinas">Fecha efeméride</label>
                    <input disabled="true" id="date" type="text" class="datepicker" name="date" value="<%=fechaefemerideEdit%>">
                    <label for="town" class="black_taurinas">Localidad</label>
                    <input disabled="true" id="town" type="text" class="validate" name="town" value="<%=efemeride.getPueblo()%>">
                     <label for="ganadery" class="black_taurinas">Ganadería</label>
                    <input disabled="true" id="ganadery" type="text" class="validate" name="ganadery" value="<%=efemeride.getGanaderia()%>">
                </div>
                <!-- End col 1-->
                <!-- Start col 2-->
                <div class="col s12 m4 l4">
                    <label for="event" class="black_taurinas">Título del evento</label>
                    <input disabled="true" id="event" type="text" class="validate" name="event" value="<%=efemeride.getTipoevento()%>">
                    <label for="province" class="black_taurinas">Provincia</label>
                    <input disabled="true" id="province" type="text" class="validate" name="province" value="<%=efemeride.getProvincia()%>">
                    <label for="real_date" class="black_taurinas">Fecha Real</label>
                    <input disabled="true" id="real_date" type="text" class="datepicker" name="real_date" value="<%=fecharealEdit%>">
                </div>
                <!-- End col 2-->
                <!-- Start col 3-->
                <div class="col s12 m4 l4">
                    <label for="foto" class="black_taurinas">Fotografía</label>
                    <input disabled="true" id="foto" type="text" class="validate" name="foto" value="<%=efemeride.getFoto()%>">
                    <label for="cartel" class="black_taurinas">Cartel</label>
                    <input disabled="true" id="cartel" type="text" class="validate" name="cartel" value="<%=efemeride.getCartel()%>">  
                    <label for="report" class="black_taurinas">Reportaje</label>
                    <input disabled="true" id="report" type="text" class="validate" name="report" value="<%=efemeride.getReportaje()%>">
                </div>
                <!-- End col 3-->
            </div>
            <!-- End Row image and credentials-->
            <h5 class="titles_red_h5">Más datos</h5>
            <div class="row">
                <div class="s12">
                    <label class="black_taurinas" for="notes">Notas</label>
                    <textarea disabled="true" id="notes" class="materialize-textarea" name="notes"><%=efemeride.getNotas()%></textarea>
                    <label class="black_taurinas" for="fuente">Fuente</label>
                    <textarea disabled="true" id="fuente" class="materialize-textarea" name="fuente"><%=efemeride.getFuente()%></textarea>
                </div>
            </div>
            <h5 class="titles_red_h5">Personajes asociados</h5>

            <div class="row">
                <div class="col s12 center">
                    <table cellpadding="1" cellspacing="1" class="table table-hover"
                           id="myTable">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Apodo</th>
                                <th>Fecha de Nacimiento</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%String date = "";
                                for (Personaje p : efemeride.getPersonajeList()) {
                                if(p.getFechanacimiento()!=null){
                                    date = dateFormat.format(p.getFechanacimiento());
                                }
                            %>
                            <tr>
                                <td><%=p.getNombrepersonaje()%> <%=p.getApellido1()%> <%=p.getApellido2()%></td>
                                <td><%=p.getApodo1()%></td>
                                <td><%=date%></td>   
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <div class="col-md-12 center text-center">
                        <span class="left" id="total_reg"></span>
                        <ul class="pagination pager" id="myPager"></ul>
                    </div>
                </div>

            </div>
        </div>


        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>
