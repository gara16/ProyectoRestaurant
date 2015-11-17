<?php include_once 'partials/header.php'; ?>
	<div id="pagina">
		<!--pagina principal de la vista venta-->
		<div data-role="page" id="listado">
			<!--cabecera-->
			<div data-role="header" data-id="unico" data-theme="b" disabled="disabled" data-position="fixed">
				<div id="letrero">RESTAURANTE "LO NUESTRO"</div>
			</div>
			<!--contenido-->
			<div id="contenido" data-role="content">
				<div data-role="collapsible">
					<h1>Mesa</h1>
					<!--<a id="menu" data-role="button" data-theme="b" data-icon="bars" data-iconpos="notext"></a>-->
					<ul id="listaMesa" data-role="listview" data-theme="b" data-inset="true"></ul>
				</div>
				<div>
					<ul id="listaPlatos" data-role="listview" data-type="horizontal" data-theme="b">
					<!--listado de Platos de la carta--></ul>
				</div>
				<div id="botonPagar">
				</div>
			</div>
			<!--pie de pagina
			<div data-type="vertical" data-role="footer" data-theme="b" data-position="fixed"></div>-->
		</div>

		<!--esta pagina es para realizar la compra-->
		<div data-role="page" id="realizarPago">
			<!--cabecera-->
			<div data-role="header" data-id="unico" data-theme="b" disabled="disabled" data-position="fixed">
				<div id="letrero">RESTAURANTE "LO NUESTRO"</div>
			</div>
			<div data-role="content">
				<div id="precioPagar"></div>
				<div>
					<h2>FORMA DE PAGO</h2>
					<select id="tipoPago" data-theme="b" data-native="false">
						<option>Seleccione Tipo de Pago</option>
					</select>
				</div>
				<div id="rVenta">
					<a data-role="button" data-rel="dialog" data-theme="b" href="#dConfirmacion">Realizar Venta</a>
				</div>
			</div>
		</div>

		<!--dialogo de confirmación de venta-->
		<div data-role="page" data-theme="c" id="dConfirmacion">
	    	<div data-role="header" data-theme="b">
	    		<h1>Realizar Venta</h1>
	    	</div>
	    	<div data-role="content" data-theme="c">
	    		<p>¡Venta realizada exitosamente!</p>
		    	<a href="#listado" data-role="button" data-theme="a">Aceptar</a>
	    	</div>
	    	<div data-role="footer" data-theme="b">
	    		<h3>Restaurante "Lo Nuestro"</h3>
	    	</div>
	    </div>
    </div><?php include_once 'partials/footer.php'; ?>