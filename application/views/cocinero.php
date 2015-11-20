<?php include_once 'partials/header.php'; ?>
<div data-role="page">
    <div data-role="header" data-add-back-btn="true">
        <h1>Restaurante "Lo Nuestro"</h1>
        <a href="#menuDialog" data-rel="dialog" class="ui-btn-right">Menu</a>
    </div>
    <div data-role="content">
        <h2>Lista de Pedidos pendientes</h2>
        <strong>Click para atender pedido.</strong>
        <ul id="listPedidosCocinero"></ul>
    </div>
</div>
<?php include_once 'partials/footer.php'; ?>