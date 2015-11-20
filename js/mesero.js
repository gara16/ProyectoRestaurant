/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).on("pagebeforeshow", "#page_mesero", function () {
    $.getJSON('/ProyectoRestaurant/index.php/carta/listar', function (data) {
        var content = "";
        var lista = $("#carta_mesero");
        data.map(function (d) {
            var url_detalle = "/ProyectoRestaurant/index.php/mesero/detalle/"+d.idplato;
            content = "<li>\n\
                            <a href='"+url_detalle+"' data-rel='dialog'>\n\
                                <img src='../img/" + d.imagen + "'/>\n\
                                <h2>" + d.nombre + "</h2>\n\
                                <p>" + d.precio + "</p>\n\
                            </a>\n\
                        </li>";
            lista.append(content);
        });
        lista.listview("refresh");
    });
});