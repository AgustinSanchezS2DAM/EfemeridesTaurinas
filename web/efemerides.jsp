<%-- 
    Document   : toreros
    Created on : 08-may-2018, 11:50:37
    Author     : agustin
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entities.Efemeride"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <jsp:include page="assets/shared/head.jsp" /> 

    <script language="javascript" type="text/javascript">
        function poncombo(combo, valor)
        {
            for (i = 0; i < combo.options.length; i++)
                if (combo.options[i].value == valor)
                    combo.options[i].selected = true;
        }
    </script>
    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/validateSession.jsp" />
        <jsp:include page="assets/shared/models/headerBack.jsp" />

        <div class="container margin_top_login">
            <div class="row">
                <div class="col s12">
                    <h4 class="titles_red_h5">Efemérides</h4>
                </div>
            </div>

            <div class="row">
                <div class="col s12 m4 l4">
                    <form class="filter-form-efe" action="controllers/controller.jsp?op=sendfilterefe" method="POST" name="formfilterefe">
                        <select  id="sendfilter" onchange="this.form.submit()"  name="sendfilterefe">
                            <!-- controllers/controller.jsp?op=loadallefemerides -->
                            <option value="" disabled selected>Ordenar por</option>
                            <option value="1">Fecha</option>
                            <option value="2">Provincia</option>
                            <option value="3">Localidad</option>
                        </select>
                    </form>
                    <script language="javascript" type="text/javascript">
                        poncombo(document.formfilterefe.sendfilterefe, '<%=session.getAttribute("sendfilterefe")%>');
                    </script>
                </div>
                <div class="col s12 m5 l5 center-align">
                    <form class="search-form" action="controllers/controllerEfemeride.jsp?op=searchEfemerdeByDate" method="POST" name="formsearch">
                        <!--<input  id="date" type="text" class="datepicker" name="date">-->
                        <div class="col s12 m6 l6">
                            <input placeholder="dd/mm/yyyy" id="date" name="date" type="text" class="validate">
                        </div>
                        <div class="col s12 m4 l4">
                            <button type="submit"  class="waves-effect waves-light btn background_color_red button_search tooltipped" data-position="bottom" data-delay="50" data-tooltip="Busca por nombre o apodo" ><i class="material-icons left">search</i></button>
                        </div>
                    </form>
                </div>
                <div class="col s12 m3 l3 margin_top right">
                    <a class="waves-effect waves-light btn grey darken-4" style="margin-top: -18px;" href="controllers/controllerEfemeride.jsp?op=loadllcharactersforefemerides">añadir efeméride</a>
                </div>
            </div>

            <div class="row">

                <%
                    try {

                        List<Efemeride> listaefemerides = (List<Efemeride>) session.getAttribute("listaefemerides");
                        DateFormat dateFormat = new SimpleDateFormat("dd MMM, yyyy");

                        String date = "";

                        for (int i = 0; i < listaefemerides.size(); i++) {
                            if (listaefemerides.get(i).getFechaefemeride() != null) {
                                date = dateFormat.format(listaefemerides.get(i).getFechaefemeride());
                            }

                %>
                <div class="col s12 m6 l4" style="margin-bottom: 10px;">
                    <div class="card">
                        <div class="card-content min_height_card_efemeride">
                            <h5>Evento: <%=listaefemerides.get(i).getTipoevento()%></h5>
                            <p>Fecha: <%=date%></p>
                            <p>Localidad: <%=listaefemerides.get(i).getPueblo()%></p>
                            <p>Provincia: <%=listaefemerides.get(i).getProvincia()%></p>
                        </div>
                        <div class="card-action">
                            <div class="row">
                                <div class="col s2 offset-s3">
                                    <form class="filter-form" action="controllers/controllerEfemeride.jsp?op=detailefemeride" method="POST" name="formfilter">
                                        <input class="hidden_display" name="idefemeride" value="<%=listaefemerides.get(i).getIdefemeride()%>">

                                        <button type="submit" class="waves-effect waves-light btn-floating blue-grey lighten-3"><i class="material-icons">remove_red_eye</i></button>
                                    </form>
                                </div>
                                <div class="col s2">
                                    <form class="filter-form" action="controllers/controllerEfemeride.jsp?op=loadllcharactersforeditefemerides" method="POST" name="formfilter">
                                        <input class="hidden_display" name="idefemeride" value="<%=listaefemerides.get(i).getIdefemeride()%>">

                                        <button type="submit" class="waves-effect waves-light btn-floating background_color_red"><i class="material-icons">edit</i></button>
                                    </form>
                                </div>
                                <div class="col s2">
                                    <form class="filter-form" action="controllers/controllerEfemeride.jsp?op=deleteefemeride" method="POST" name="formfilter">
                                        <input class="hidden_display" name="idefemeride" value="<%=listaefemerides.get(i).getIdefemeride()%>">
                                        <button type="submit" class="waves-effect waves-light btn-floating blue-grey darken-3"><i class="material-icons">delete</i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%}

                    } catch (Exception e) {
                        //session.setAttribute("errormessage", "Error visualizar las efemerides");
                        //response.sendRedirect("mainview.jsp");

                    }%>
            </div>
        </div>
    </div>


    <jsp:include page="assets/shared/body.jsp" />
</body>
</html>
