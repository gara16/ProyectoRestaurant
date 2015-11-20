/**
 * Variable bandera [pedir], sirve para que solo se haga peticiones cuando
 * se esté visualizando la página y evitar sobrecarga al servidor
 */
var pedir = true;
$(document).on("pagebeforeshow", "#page_cocinero", function () {
    pedir = true;
    cargarPedidos();
    setInterval(cargarPedidos, 3000);
    function cargarPedidos() {
        if (pedir) {
            $("#listPedidosCocinero").listview({
                inset: true
            });
            var content = "";
            $.getJSON("/ProyectoRestaurant/index.php/cocinero/listaPedidos", function (data) {
                data.map(function (d) {
                    var mesa = d.Mesa;
                    var t = d.Estado == 0 ? "a" : "b";
                    var plato = d.Plato;
                    var i = d.Estado == 1 ? "check" : "delete";
                    var id = d.id;

                    content += "<li data-theme=" + t + " data-id=" + id + " data-icon=" + i + "><a>" + plato
                            + "<span class='ui-li-count'>Mesa " + mesa
                            + "</span></a></li>";
                });
                $("#listPedidosCocinero").html(content).listview("refresh");
                $("#listPedidosCocinero>li").on("click", function () {
                    var id = $(this).attr("data-id");
                    servirPedido(id);
                });
            });
        }
    }
    function servirPedido(id) {
        $.ajax({
            url: "/ProyectoRestaurant/index.php/cocinero/servirPedido/" + id,
            type: "post",
            success: function (data) {
            },
            error: function (xhr, status, err) {
                console.error("error ", status, err.toString());
            }
        });
    }
});

$(document).on("pagebeforehide", "#page_cocinero", function () {
    pedir = false;
});