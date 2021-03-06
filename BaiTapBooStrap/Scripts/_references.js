/// <autosync enabled="true" />
/// <reference path="../assets/bootstrap-daterangepicker/date.js" />
/// <reference path="../assets/bootstrap-daterangepicker/daterangepicker.js" />
/// <reference path="../assets/bootstrap-inputmask/bootstrap-inputmask.js" />
/// <reference path="../assets/bootstrap-wizard/jquery.bootstrap.wizard.js" />
/// <reference path="../assets/bootstrap-wizard/prettify.js" />
/// <reference path="../assets/bootstrap-wysihtml5/bootstrap-wysihtml5.js" />
/// <reference path="../assets/bootstrap-wysihtml5/wysihtml5-0.3.0.js" />
/// <reference path="../assets/ckeditor/build-config.js" />
/// <reference path="../assets/ckeditor/ckeditor.js" />
/// <reference path="../assets/ckeditor/config.js" />
/// <reference path="../assets/ckeditor/styles.js" />
/// <reference path="../assets/data-tables/DT_bootstrap.js" />
/// <reference path="../assets/data-tables/jquery.dataTables.js" />
/// <reference path="../assets/flot/excanvas.js" />
/// <reference path="../assets/flot/jquery.colorhelpers.js" />
/// <reference path="../assets/flot/jquery.flot.crosshair.js" />
/// <reference path="../assets/flot/jquery.flot.fillbetween.js" />
/// <reference path="../assets/flot/jquery.flot.image.js" />
/// <reference path="../assets/flot/jquery.flot.js" />
/// <reference path="../assets/flot/jquery.flot.navigate.js" />
/// <reference path="../assets/flot/jquery.flot.pie.js" />
/// <reference path="../assets/flot/jquery.flot.resize.js" />
/// <reference path="../assets/flot/jquery.flot.selection.js" />
/// <reference path="../assets/flot/jquery.flot.stack.js" />
/// <reference path="../assets/flot/jquery.flot.symbol.js" />
/// <reference path="../assets/flot/jquery.flot.threshold.js" />
/// <reference path="../assets/flot/jquery.js" />
/// <reference path="../assets/jquery-slimscroll/jquery.slimscroll.js" />
/// <reference path="../assets/jquery-slimscroll/jquery-ui-1.9.2.custom.min.js" />
/// <reference path="../assets/jquery-tags-input/jquery.tagsinput.js" />
/// <reference path="../assets/uniform/jquery.uniform.js" />
/// <reference path="bootstrap.js" />
/// <reference path="jquery.validate.js" />
/// <reference path="jquery.validate.unobtrusive.js" />
/// <reference path="jquery-1.10.2.js" />
/// <reference path="modernizr-2.6.2.js" />
/// <reference path="respond.js" />
$(document).ready(function () {
    var date_input = $('input[name="date"]'); //our date input has the name "date"
    var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
    var options = {
        format: 'mm/dd/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
    };
    date_input.datepicker(options);
})

$(document).ready(function () {
    var i = 1;
    $("#add_row").click(function () {
        $('#addr' + i).html("<td>" + (i + 1) + "</td><td><input name='name" + i + "' type='text' placeholder='Name' class='form-control input-md'  /> </td><td><input  name='mail" + i + "' type='text' placeholder='Mail'  class='form-control input-md'></td><td><input  name='mobile" + i + "' type='text' placeholder='Mobile'  class='form-control input-md'></td>");

        $('#tab_logic').append('<tr id="addr' + (i + 1) + '"></tr>');
        i++;
    });
    $("#delete_row").click(function () {
        if (i > 1) {
            $("#addr" + (i - 1)).html('');
            i--;
        }
    });

});

$(document).ready(function () {
    $(':radio[value=0]').click(function () {
        $(".table_tuan").css("display", "block")
        $(".table_thang").css("display", "none")
    });
    $(':radio[value=1]').click(function () {
        $(".table_thang").css("display", "block")
        $(".table_tuan").css("display", "none")

    });


});