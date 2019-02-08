/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*$(function (){*/
$(document).ready(function () {
    console.log('ready');
    init();



});


function init() {

    // menú collapse
    $(".button-collapse").sideNav();

    //media
    $('.materialboxed').materialbox();

    //chips
    $('.chips').material_chip();

    // select
    $('select').material_select();

    //modales
    $('#modalcat').modal();
    $('#modalcharacter').modal();
    $('#modalefem').modal();
    $('#modalprof').modal({
        endingTop: '25%', // Ending top style attribute
    });



    $('.carousel').carousel({
        fullWidth: true,
        duration: 400,
        shift: 100
    });
    autoplay();
    function autoplay() {
        $('.carousel').carousel('next');
        setTimeout(autoplay, 6000);
    }



    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 400, // Creates a dropdown of 15 years to control year,
        monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        weekdaysShort: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
        formatSubmit: 'yyyy/mm/dd',
        format: 'yyyy/mm/dd',
        clear: 'Limpiar',
        close: 'Ok',
        closeOnSelect: false, // Close upon selecting a date,
        container: undefined

    });
    ;

    $(".delete-cartel").click(function () {
        console.log($(this));
        console.log(this.id);
        console.log($("#" + this.id).parent().parent());

        $("#" + this.id).parent().parent().remove();
        console.log(sessionStorage);
    });

}

