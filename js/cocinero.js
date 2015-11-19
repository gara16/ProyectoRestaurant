/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function(){
    cargarPedidos();
    setInterval(cargarPedidos, 3000);
    function cargarPedidos(){
        $("#listPedidosCocinero").listview({
            inset : true
        });
        var content = "";
        $.getJSON("/ProyectoRestaurant/index.php/cocinero/listaPedidos", function(data){
            data.map(function(d){
                var mesa = d.Mesa;
                var t = d.Estado == 0 ? "a":"b";
                var plato = d.Plato;
                var i = d.Estado == 1 ? "check":"delete";
                var id = d.id;

                content += "<li data-theme="+t+" data-id="+id+" data-icon="+i+"><a>"+ plato
                        +"<span class='ui-li-count'>Mesa "+mesa
                        +"</span></a></li>";
            });
            $("#listPedidosCocinero").html(content).listview("refresh");
            $("#listPedidosCocinero>li").on("click", function(){
                var id = $(this).attr("data-id");
                servirPedido(id);
            });
        });
    }
    function servirPedido(id){
        $.ajax({
            url : "/ProyectoRestaurant/index.php/cocinero/servirPedido/"+id,
            type : "post",
            success : function(data){
            },
            error : function(xhr, status, err){
                console.error("error ", status, err.toString());
            }
        });
    }
});
