<%-- 
    Document   : header
    Created on : 03-may-2018, 17:30:17
    Author     : agustin
--%>
<nav class="background_color_red">
    <div class="container" >
         <div class="nav-wrapper">
            <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
            <ul class="right hide-on-med-and-down">
                <li><a  href="controllers/controllerEfemeride.jsp?op=loadallefems">Efemérides</a></li>
                <li><a  href="controllers/controller.jsp?op=loadallcharacters">Personajes</a></li>
                <li><a href="controllers/controllerProfesion.jsp?op=loadallprofession">Profesiones</a></li>
                <li><a href="controllers/controller.jsp?op=logout">Salir</a></li>
            </ul>
            <ul class="side-nav center background_color_grey" id="mobile-demo">
                <li><div class="input-field col s12 center">
                        <img width="100" src="assets/img/bull_icon_black.svg" alt="" class=" center s12 m10 margin_top">
                        <h5 class="grey-text text-lighten-5 header_title_mainview"><span class="black_taurinas">EFEMÉRIDES </span><span class="color_red">TAURINAS</span></h5>
                    </div>
                </li>   
                <li><a class="margin_top" href="controllers/controllerEfemeride.jsp?op=loadallefems">EFEMÉRIDES</a></li>
                <li><hr width="70px"></li>
                <li><a href="controllers/controllerProfesion.jsp?op=loadallprofession">PROFESIONES</a></li>
                <li><hr width="70px"></li>
                <li><a  href="controllers/controller.jsp?op=loadallcharacters">PERSONAJES</a></li>
                <li><hr width="70px"></li>
                <li><a href="controllers/controller.jsp?op=logout">SALIR</a></li>               
            </ul>
        </div>
    </div>
</nav>