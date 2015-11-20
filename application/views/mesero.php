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
            <ul data-role="listview" id="carta">
                <li>plato1</li>
                <li>plato2</li>
                <li>plato3</li>
                <li>plato4</li>
                <li>plato5</li>
                <li>plato6</li>
                <li>plato7</li>
                <li>plato8</li>
                <li>plato9</li>
                <li>plato10</li>
            </ul>
        </div>
    </div>
</div>
<?php include_once 'partials/footer.php'; ?>