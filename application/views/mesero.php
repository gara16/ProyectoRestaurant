<?php include_once 'partials/header.php'; ?>
<div data-role="page">
    <div data-role="header" data-add-back-btn="true">
        <h1>Restaurante "Lo Nuestro"</h1>
        <a href="#menuDialog" data-rel="dialog" class="ui-btn-right">Menu</a>
    </div>
    <div data-role="content">
        <div>
            <select name="mesa" id="mesa" data-native-menu="false">
                <option>Seleccione una Mesa</option>
                <?php foreach ($mesas as $m):?>
                    <option value=<?php echo $m->idMesa; ?>>
                        <?php echo $m->mesa; ?>
                    </option>
                <?php endforeach;?>
            </select>
        </div>
        <div>
            <h4>Lista de Platos y bebidas</h4>
            <ul data-role="listview" id="carta"></ul>
        </div>
    </div>
</div>
<?php include_once 'partials/footer.php'; ?>