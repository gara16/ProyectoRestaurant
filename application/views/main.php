<?php include_once 'partials/header.php'; ?>
<div data-role="page">
    <div data-role="header">
        <h1>Restaurante "Lo Nuestro"</h1>
    </div>
    <div data-role="content">
        <h2>Bienvenidos</h2>
        <a href="<?php echo base_url(); ?>index.php/cocinero" data-role="button">Cocinero</a>
        <a href="<?php echo base_url(); ?>index.php/mesero" data-role="button">Mesero</a>
        <a href="<?php echo base_url(); ?>index.php/cajero" data-role="button">Cajero</a>
    </div>
</div>
<?php include_once 'partials/footer.php'; ?>