<%-- 
Document   : addPersonaje
Created on : 14-may-2018, 13:02:23
Author     : agustin
--%>

<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
    <jsp:include page="assets/shared/head.jsp" /> 
    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/validateSession.jsp" />

        <jsp:include page="assets/shared/models/headerBack.jsp" />
        <form class="character-form" action="controllers/controller.jsp?op=savenewcharacter" method="POST" name="formcharacter">
            <div class="container wrapper_container">
                <!-- Start Row title-->
                <h5 class="titles_red_h5">Añadir Personaje</h5>
                <!-- End Row title-->
                <!-- Start Row image and credentials-->
                <div class="row">
                    <!-- Start col 1-->
                    <div class="col s12 m6 l6">
                        <label for="first_name" class="black_taurinas">Nombre *</label>
                        <input id="first_name" required="true" type="text" class="validate" name="first_name"/>
                        <label for="surname" class="black_taurinas">Primer Apellido *</label>
                        <input  id="frist_surname" required="true" type="text" class="validate" name="frist_surname"/>
                        <label for="second_surname"  class="black_taurinas">Segundo Apellido</label>
                        <input  id="surname" type="text" class="validate" name="second_surname">
                            <label for="birth_province" class="black_taurinas">Provincia de nacimiento</label>
                            <input id="birth_province" type="text" class="validate" name="birth_province"/>
                            <label for="picadores_date" class="black_taurinas">Fecha Picadores</label>
                            <input id="picadores_date" type="text" class="datepicker" name="picadores_date"/>
                    </div>
                    <!-- End col 1-->
                    <!-- Start col 2-->
                    <div class="col s12 m6 l6">
                        <label for="first_nickname" class="black_taurinas">Primer Apodo *</label>
                        <input id="first_nickname" required="true" type="text" class="validate" name="first_nickname"/>
                        <label for="second_nickname" class="black_taurinas">Segundo Apodo</label>
                        <input id="second_nickname" type="text" class="validate" name="second_nickname"/>
                        <label for="birth_date" class="black_taurinas">Fecha Nacimiento</label>
                        <input id="birth_date" type="text" class="datepicker" name="birth_date"/>
                        <label for="birth_town" class="black_taurinas">Localidad de nacimiento</label>
                        <input id="birth_town" type="text" class="validate" name="birth_town"/>
                        <label for="presentation_date"  class="black_taurinas">Fecha Presentación</label>
                        <input id="presentation_date" type="text" class="datepicker" name="presentation_date"/>
                    </div>
                    <!-- End col 2-->
                    <div class="col s12 m6 l6 offset-m3 offset-l3">
                        <label for="alternative_date"  class="black_taurinas">Fecha Alternativa</label>
                        <input id="alternative_date" type="text" class="datepicker" name="alternative_date"/>
                    </div>
                </div>
                <!-- End Row image and credentials-->


                <br/><br/><br/>
                <!-- Start row Personal details-->
                <h5 class="titles_red_h5">Mas Datos</h5>
                <div class="row">
                    <!-- Start frist col personal detail-->
                    <div class="col s12 m6 l4">
                        <label for="name_poster"  class="black_taurinas">Nombre Cartel</label>
                        <input id="name_poster" type="text" class="validate" name="name_poster"/>
                        <label for="img" class="black_taurinas">Imagen <i id="informationimage " data-position="bottom" data-delay="10" data-tooltip="Debe colocar la URL de la imagen" class=" tooltipped material-icons information_orange_buttons">info</i></label>
                        <input  id="img" type="text" class="validate" name="img"/>
                    </div>
                    <!-- End frist col personal detail-->
                    <!-- Start second col personal detail-->
                    <div class="col s12 m6 l4">
                        <label for="direction" class="black_taurinas">Dirección</label>
                        <input id="direction" type="text" class="validate" name="direction"/>
                        <label for="contact" class="black_taurinas">Contacto</label>
                        <input id="contact" type="text" class="validate" name="contact"/>
                    </div>
                    <!-- End second col personal detail-->
                    <!-- Start third col personal detail-->
                    <div class="col s12 m6 l4">
                        <label for="phone" class="black_taurinas">Teléfono</label>
                        <input id="phone" type="number" class="validate" name="phone"/>  
                        <label for="email" class="black_taurinas">Email</label>
                        <input id="email" type="email" class="validate" name="email"/>
                    </div>
                    <!-- End third col personal detail-->
                </div>
                <!-- End row Personal details-->

                <!-- Start row of complete and cossio -->
                <div class="row center-align">
                    <!-- Start col 1-->
                    <div class="col s12 m4 l4">
                        <input type="checkbox" class="" id="complete" name="checkcomplete"/>
                        <label for="complete" class="black_taurinas">Completo</label>
                    </div>
                    <!-- End col 1-->
                    <!-- Start col 2-->
                    <div class="col s12 m4 l4">
                        <input type="checkbox" class="" id="cossio" name="checkcossio"/>
                        <label for="cossio" class="black_taurinas">Cossio</label>
                    </div>
                    
                    <div class="col s12 m4 l4">
                        <input type="checkbox" class="" id="clm" name="checkclm"/>
                        <label for="clm" class="black_taurinas">CLM</label>
                    </div>
                    <!-- End col 2-->
                </div>
                <!-- End row of complete and cossio -->   

                <!-- Start row provinces -->
                <div class="row">
                    <!-- Start col 1-->
                    <div class="col s12 m6 l6">
                        <label for="current_province" class="black_taurinas">Provincia actual</label>
                        <input id="current_province" type="text" class="validate" name="current_province"/>
                    </div>
                    <!-- End col 1-->
                    <!-- Start col 2-->
                    <div class="col s12 m6 l6">
                        <label for="current_town" class="black_taurinas">Localidad actual</label>
                        <input id="current_town" type="text" class="validate" name="current_town"/>
                    </div>
                    <!-- End col 2-->
                </div>
                <!-- End row provinces -->


                <!-- Start row biograpy and image-->
                <div class="row">
                    <div class="col s12 m12 l12">
                        <label class="black_taurinas" for="biography">Biografía</label>
                        <textarea lang="es" id="biography" class="materialize-textarea" name="biography"></textarea>  
                        <label class="black_taurinas" for="notes">Notas</label>
                        <textarea lang="es" id="notes" class="materialize-textarea" name="notes"></textarea>
                    </div>
                </div>
                <!-- End row biograpy and image-->

                <div class="row center-align">
                    <button   class="waves-effect waves-light btn grey darken-4" type="submit"><i class="material-icons left">save</i>Guardar</button>
                    <a class="waves-effect waves-light btn grey darken-4" href="personajes.jsp"><i class="material-icons left">cancel</i>Cancelar</a>
                </div>

            </div>
        </form>
        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>
