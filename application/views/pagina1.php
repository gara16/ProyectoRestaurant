<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>:::Restaurante "Lo Nuestro":::</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="<?php echo base_url();?>jqueryMobile/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>jqueryMobile/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css">
	<script type="text/javascript" src="<?php echo base_url();?>jqueryMobile/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
	<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/style.css">
	<script type="text/javascript" src="<?php echo base_url();?>js/lista1.js"></script>
</head>
<body>
	<div id="pagina">
		<div data-role="page" id="listado">
			<!--cabecera-->
			<div data-role="header" data-id="unico" data-theme="b" disabled="disabled" data-position="fixed">
				<div id="botonM"><a href="#dialogoMesa" data-transition="pop" data-rel="dialog" data-role="button" data-iconpos="notext" data-icon="gear"></a></div>
				<div id="letrero">RESTAURANTE "LO NUESTRO"</div>
			</div>
			<!--contenido-->
			<div id="contenido" data-role="content">
				<div data-role="collapsible">
					<h1>Categorias</h1>
					<!--<a id="menu" data-role="button" data-theme="b" data-icon="bars" data-iconpos="notext"></a>-->
					<ul id="ListaTipoPlatos" data-role="listview" data-theme="b" data-inset="true"></ul>
				</div>
				<div>
					<ul id="listaPlatos" data-role="listview" data-type="horizontal" data-theme="b">
					<!--listado de Platos de la carta--></ul>
				</div>	
			</div>
			<!--pie de pagina-->
			<div data-type="vertical" data-role="footer" data-theme="b" disabled="disabled" data-position="fixed">
				<div data-role="listview" data-dividertheme="a" data-theme="b" data-filter="true" data-filter-placeholder="Buscar"></div>
			</div>
			
		</div>

		<!--pagina interna-->
		<div data-role="page" data-theme="b" id="agregar">
			<!--cabecera-->
			<div data-role="header" data-id="unico" data-theme="b" disabled="disabled" data-position="fixed">
				<div id="letrero">RESTAURANTE "LO NUESTRO"</div>
			</div>
			<!--listado de ingredientes-->
			<div data-role="content">
				<!--plato del menu-->
				<div id="listaPlato"></div>
				<h2>Ingredientes</h2>
				<ul id="ingrediente" data-role="listview" data-type="horizontal" data-theme="b"></ul>
				<a href="#dialogo" id="addPedido" data-transition="pop" data-rel="dialog" href="" data-role="button" data-theme="a">Agregar a Pedido</a>
			</div>
	    </div>

	    <!--dialogo para elegir mesa-->
	    <div data-role="page" data-theme="c" id="dialogoMesa">
	    	<div data-role="header" data-theme="b">
	    		<h1>Selección de Mesa</h1>
	    	</div>
	    	<div data-role="content" data-theme="c">
	    		<p>¿ Qué mesa desea atender ?</p>
	    		<!--listar las mesas disponibles-->
	    		<select data-theme="a" id="opcionesdemesa" data-native="false">
	    			<option>Seleccione la mesa</option>
	    		</select>
		    	<a href="#listado" data-role="button" data-theme="a">Aceptar</a>
	    	</div>
	    	<div data-role="footer" data-theme="b">
	    		<h3>Restaurante "Lo Nuestro"</h3>
	    	</div>
	    </div>

	    <!--dialogo para los pedidos-->
	    <div data-role="page" data-theme="c" id="dialogo">
	    	<div data-role="header" data-theme="b">
	    		<h1>Realizar Pedido</h1>
	    	</div>
	    	<div data-role="content" data-theme="c">
		    	<p>¿ Realmente desea realizar este Pedido ?</p>
		    	<div data-role="controlgroup" data-type="horizontal">
		    		<a id="confirmaP" href="#dConfirmacion" data-rel="dialog" data-icon="plus" data-role="button" data-theme="a">Aceptar</a>
		    		<a href="#listado" data-icon="delete" data-role="button" data-theme="a">Cancelar</a>
		    	</div>
	    	</div>
	    	<div data-role="footer" data-theme="b">
	    		<h3>Restaurante "Lo Nuestro"</h3>
	    	</div>
	    </div>

	    <!--dialogo de confirmacion-->
	    <div data-role="page" data-theme="c" id="dConfirmacion">
	    	<div data-role="header" data-theme="b">
	    		<h1>Realizar Pedido</h1>
	    	</div>
	    	<div data-role="content" data-theme="c">
	    		<p>¡Pedido realizado exitosamente!</p>
	    		<p>Le pedimos con amabilidad espere un momento su pedido</p>
	    		<p>¡Gracias!</p>
		    	<a href="#listado" data-role="button" data-theme="a">Aceptar</a>
	    	</div>
	    	<div data-role="footer" data-theme="b">
	    		<h3>Restaurante "Lo Nuestro"</h3>
	    	</div>
	    </div>
    </div>
</div>
</body>
</html>