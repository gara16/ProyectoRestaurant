<?php include_once 'partials/header.php'; ?>
<h2>Lista de Pedidos pendientes</h2>
<strong>Click para atender pedido.</strong>
<ul id="listPedidosCocinero">
    
</ul>
<script>
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
                    var theme = d.Estado == 0 ? "a":"b";
                    var plato = d.Plato;
                    var servido = d.Estado == 1 ? "Servido":"No Servido";
                    var id = d.id;

                    content += "<li data-theme="+theme+" data-id="+id+"><a>"+ plato
                            +"<span class='ui-li-count'>"+servido+" - Mesa "+mesa
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
</script>
<?php include_once 'partials/footer.php'; ?>