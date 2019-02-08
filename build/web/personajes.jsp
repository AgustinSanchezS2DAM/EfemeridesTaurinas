<%-- 
    Document   : toreros
    Created on : 08-may-2018, 11:50:37
    Author     : agustin
--%>
<%@page import="Entities.Personaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
    <jsp:include page="assets/shared/head.jsp" /> 

    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/validateSession.jsp" />
        <!-- Start Header with back-->
        <jsp:include page="assets/shared/models/headerBack.jsp" />
        <!-- End Header with back-->


        <div class="container margin_top_login">
            <!-- Start Row title and add-->
            <div class="row">
                <div class="col s12">
                    <h4 class="titles_red_h5">Personajes</h4>
                </div>
            </div>

            <div class="row">
                <div class="col s12 m4 l4">
                    <form class="filter-form" action="controllers/controller.jsp?op=sendfilter" method="POST" name="formfilter">
                        <select  id="sendfilter" onchange="this.form.submit()"  name="sendfilter">
                            <option value="" disabled selected> Ordenar por</option>
                            <option value="1">Fecha de nacimiento</option>
                            <option value="2">Localidad</option>
                            <option value="3">Nombre</option>
                            <option value="4">Apodo</option>
                            <option value="5">Pendiente</option>
                        </select>
                    </form>
                </div>

                <div class="col s12 m4 l4 center-align">
                    <form class="search-form" action="controllers/controller.jsp?op=searchcharacter" method="POST" name="formsearch">
                        <input placeholder="Buscar" id="search" type="text" class="validate input_search" name="search"/> 
                        <button type="submit"  class="waves-effect waves-light btn background_color_red button_search tooltipped" data-position="bottom" data-delay="50" data-tooltip="Busca por nombre o apodo" ><i class="material-icons left">search</i></buttom>
                    </form>
                </div>
                <div class="col s12 m4 l4 margin_top " >
                    <a class="waves-effect waves-light btn grey darken-4 right button_add_character " href="addPersonaje.jsp">añadir personaje</a>
                </div>
            </div>

            <!-- End row title and add-->
            <!-- Start row of characters-->
            <div class="row">
                <%
                    List<Personaje> listaPersonaje = (List<Personaje>) session.getAttribute("listaPersonaje");
                    for (Personaje p : listaPersonaje) {
                        String img = "";
                        if (p.getFotosList().size() > 0) {
                            img = p.getFotosList().get(0).getImagen();
                        }

                %>

                <!-- onerror="this.src='assets/img/no-photo.png';"> -->

                <div class="col s12 m6 l4">
                    <div class="card" style="min-height: 500px">
                        <div class="card-content min_height_card_character">
                            <div class="img card_bullfighter"><img onerror="this.src='assets/img/no-photo.png';" class="image_card_bullfighter" src="<%=img%>"/></div>
                            <h5><%=p.getNombrepersonaje()%> <%=p.getApellido1()%> <%=p.getApellido2()%></h5>
                            <p>"<%=p.getApodo1()%>"</p>

                        </div>
                        <div class="card-action margin_top_card_action">

                            <div class="row">
                                <div class="col s2 offset-s3">
                                    <form class="filter-form" action="controllers/controller.jsp?op=detailcharacter" method="POST" name="formfilter">
                                        <input class="hidden_display " name="idcharacter" value="<%=p.getIdpersonaje()%>"/>
                                        <button type="submit" class="waves-effect waves-light btn-floating  blue-grey lighten-3"><i class="material-icons">remove_red_eye</i></button>
                                    </form>
                                </div>
                                <div class="col s2">
                                    <form class="filter-form" action="controllers/controller.jsp?op=editcharacter" method="POST" name="formfilter">
                                        <input class="hidden_display " name="idcharacter" value="<%=p.getIdpersonaje()%>"/>
                                        <button type="submit" class="waves-effect waves-light btn-floating background_color_red"><i class="material-icons">edit</i></button>
                                    </form>
                                </div>
                                
                                <div class="col s2">
                                    <form class="filter-form" action="controllers/controller.jsp?op=editImageCharacter&id=<%=p.getIdpersonaje()%>" method="POST" name="formfilter">
                                        <input class="hidden_display " name="idcharacter" value="<%=p.getIdpersonaje()%>"/>
                                        <button type="submit" class="waves-effect waves-light btn-floating blue-grey darken-3"><i class="material-icons">image</i></button>
                                    </form>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
                <%}
                    if (listaPersonaje.size() == 0) {%>
                <span style="max-height: auto"> No se ha encontrado ningún personaje</span>
                <% }%>
            </div>
        </div>
        <!-- End row of character-->

        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>
