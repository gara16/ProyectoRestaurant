<?php include_once 'partials/header.php'; ?>
<div data-role="page">
    <div data-role="header">
        <h1>Detalle</h1>
    </div>
    <div data-role="content">
        <h2><?php echo $carta[0]->nombre; ?></h2>
        <p>S./<?php echo $carta[0]->precio; ?></p>
        <img src="<?php echo base_url()."/img/".$carta[0]->imagen ?>" style="max-width: 100%">
        
        <ul data-role="listview" data-inset="true">
            <li><strong>Insumos</strong></li>
            <?php foreach ($insumos as $i): ?>
                <li>
                    <strong><?php echo $i->insumo; ?></strong> : 
                    <?php echo $i->cantidad;?>
                    <em><?php echo $i->unidad;?></em>
                </li>
            <?php endforeach; ?>
        </ul>
        <a href="#" data-role="button">Agregar al Pedido</a>
    </div>
</div>
<?php include_once 'partials/footer.php'; ?>