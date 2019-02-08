<%-- 
    Document   : mainview
    Created on : 03-may-2018, 17:26:07
    Author     : agustin
--%>

<%@page import="Entities.Fotos"%>
<%@page import="Entities.Personaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>



    <jsp:include page="assets/shared/head.jsp" /> 

    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/validateSession.jsp" />
        <jsp:include page="assets/shared/models/headerBack.jsp" />

        <div class="container wrapper_container">

            <div class="row ">
                <div class="col s6">
                    <h5 class="titles_red_h5 ">Galería</h5>
                </div>
            </div>

            <%
                List<Personaje> listaPersonajeImage = (List<Personaje>) session.getAttribute("listaPersonajeImage");
                String idCharacter = (String) request.getParameter("id");
            %>


            <form action="controllers/controller.jsp?op=saveimage&id=<%=idCharacter%>" enctype="multipart/form-data" accept="image/*" method="POST" class="addimage-form" name="addimage">
                <div class="row">
                    <div class="col m8 l8 s12 offset-m2 offset-l2">
                        <div class="card">
                            <div class="card-content">

                                <div class="file-field input-field">
                                    <div class="btn grey darken-2">
                                        <span><i class="material-icons">file_upload</i></span>
                                        <input type="file" name="file" multiple>
                                    </div>
                                    <div class="file-path-wrapper">
                                        <input class="file-path validate" type="text">
                                    </div>
                                </div>  


                            </div>
                            <div class="card-action center">
                                <button class="btn waves-effect waves-light black" type="submit" name="action">Guardar
                                    <i class="material-icons right">save</i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <% Personaje personajeEdit = (Personaje) session.getAttribute("personajeEdit");%>

            <table cellpadding="1" cellspacing="1" class="striped table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th>Personaje</th>
                        <th>Apodo</th>
                        <th>Imagen</th>
                        <th>Borrar</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Fotos f : personajeEdit.getFotosList()) {%>
                    <tr>
                        <td><%=personajeEdit.getNombrepersonaje()%> <%=personajeEdit.getApellido1()%> <%=personajeEdit.getApellido2()%></td>
                        <td>"<%=personajeEdit.getApodo1()%>"</td>
                        <td><img class="materialboxed" onerror="this.src='assets/img/no-photo.png';" width="60" src="<%=f.getImagen()%>"></td>

                        <td>
                            <form class="delete-profesion" action="controllers/controller.jsp?op=deleteImage" method="POST" name="deleteImage">
                                <input class="hidden_display" name="idImagenDelete" value="<%=f.getFotosPK().getIdimagen()%>">
                                <button class="waves-effect waves-light btn small_button red" type="submit" name="action"><i class="material-icons center">delete</i></button>
                            </form>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <div class="col-md-12 center text-center">
                <span class="left" id="total_reg"></span>
                <ul class="pagination pager" id="myPager"></ul>
            </div>
        </div>







        <jsp:include page="assets/shared/body.jsp" />

    </body>
</html>
