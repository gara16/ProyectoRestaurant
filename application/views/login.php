<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>:::Restaurante "Lo Nuestro":::</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="<?php echo base_url();?>jqueryMobile/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>jqueryMobile/jquery.mobile-1.4.5/jquery.mobile-1.4.5.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url();?>css/style.css">
    <script type="text/javascript" src="<?php echo base_url();?>jqueryMobile/jquery.mobile-1.4.5/jquery.mobile-1.4.5.js"></script>
    <script type="text/javascript" src="<?php echo base_url();?>js/eventosLogueo.js"></script>
</head>
<body>
    <div data-role="page" id="main">
    	<!--cabecera-->
    	<div data-role="header" data-theme="b" disabled="disabled" data-position="fixed">
			<div id="letrero">RESTAURANTE "LO NUESTRO"</div>
		</div>
		<!--contenido-->
		<div data-role="content" data-theme="c">
            <form>
                <label for="alias">Usuario: </label><br>
                <input type="text" name="nombre" id="nombre"><br>
                <label for="password">Contraseña: </label><br>
                <input type="password" name="password" id="password">
                <a id="botonLoguear" data-role="button" data-theme="b">Ingresar</a>
                <div id="mensaje"></div>
            </form>
        </div>
        <!--footer-->
        <div data-role="footer" data-theme="b" id="footerLogueo" data-position="fixed">
            <p>Av. Ramón Castilla #458</p>
            <p>Teléfono: 950568958</p>
            <p></p>
        </div>
    </div>
</body>
</html>