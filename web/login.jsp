<%-- 
    Document   : login
    Created on : 25-abr-2018, 15:11:12
    Author     : agustin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" />

    <body class="background_color_red " >        
        <jsp:include page="assets/shared/models/headerMaterialize.jsp" />
        <jsp:include page="assets/shared/models/errorMessage.jsp" />


        <div id="login-page" class="row margin_top_login">
            <div class="col card-panel s10 m8 l4 offset-s1 offset-m2 offset-l4">
                <form class="login-form" action="controllers/controller.jsp?op=sendCredentials" method="POST" name="formlogin">
                    <div class="row">
                        <div class="input-field col s12 center">
                            <img  width="150" src="assets/img/bull_icon_black.svg" alt="" class=" center s12 m10">
                            <h5 class="grey-text text-lighten-5 header_title_mainview"><span class="black_taurinas">EFEMÉRIDES TAURINAS </span><span class="color_red">TOLEDANAS</span></h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m12 l12 ">
                            <input placeholder="Usuario" id="login" value="" type="text" name="username">
                        </div>
                    </div>
                    <div class="row margin">
                        <div class="input-field col s12 m12 l12 ">
                            <input placeholder="Contraseña" id="password" value="" type="password" name="password">
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <input type="submit" class="btn waves-effect waves-light col s12 m12 l12 black" value="Enviar" />
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </body>
</html>
