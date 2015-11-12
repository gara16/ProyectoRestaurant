/**
 * Recomendación!
 * NO uses rutas absolutas en las peticiones
 * usa la ruta relativa desde la raiz de tu proyecto,
 * si cambias de host, tienes que cambiar TODO
 * --------------------------------------------------
 * 
 * Cambié las rutas de las imágenes porque no cargaban desde img/archivo.jpg
 * la puse en ../img/archivo
 * */

var numMesa;
var idPlatoSelec;

$(document).on('pagebeforeshow','#pagina',function(){
	
	$.getJSON('/ProyectoRestaurant/index.php/carta/listar',
	function(data){
		$('#listaPlatos').html("");
		for (var i = 0; i < data.length; i++) {
			$('#listaPlatos').append('<div class="carta"><input type="hidden" value='+data[i].idplato+'></input><a class="agregarPedido" href="#agregar" data-role="button" data-transition="slide"><div data-theme="b"><div><img height="200px" width="285px" src="../img/'+data[i].imagen+'"></div><div>'+data[i].nombre+'</div><div>S/.'+data[i].precio+'</div></div></a></div>');
			$(".carta").unbind('click').click(cargar);
			$('#listaPlatos').listview('refresh');
		}
	});

	$.getJSON('/ProyectoRestaurant/index.php/carta/listarPlatos',
	function(data){
		$('#ListaTipoPlatos').html("");
		for (var i = 0; i < data.length; i++) {
			$('#ListaTipoPlatos').append('<li class="tipo"><input type="hidden" value='+data[i].idTipoPlato+'><a data-role="button">'+data[i].tipoPlato+'</a></li>');
			$(".tipo").unbind('click').click(listarPorTipos);
			$('#ListaTipoPlatos').listview('refresh');
		}
	});

	$('#addPedido').unbind('click').click(valSelMesa);
	$("#botonM").unbind('click').click(seleccionaMesa);
});

function cargar(){
	var objeto=$(this).children("input").val();

	$.getJSON('/ProyectoRestaurant/index.php/carta/listarPlato/'+objeto,
	function(data){
		$('#listaPlato').html("");
		for (var i = 0; i < data.length; i++) {
			$('#listaPlato').append('<div><input id="platoSelec" type="hidden" value='+data[i].idplato+'></input><a class="agregarPedido" href="#agregar" data-role="button" data-transition="slide"><div data-theme="b"><div><img height="200px" width="285px" src="../img/'+data[i].imagen+'"></div><div>'+data[i].nombre+'</div><div>S/.'+data[i].precio+'</div></div></a></div>');
		}
	});
	
	$.getJSON('/ProyectoRestaurant/index.php/carta/listarInsumos/'+objeto,
	function(data){
		$('#ingrediente').html("");
		for (var i = 0; i < data.length; i++) {
			$('#ingrediente').append('<li>'+data[i].insumo+' : '+data[i].cantidad+' '+data[i].unidad+'</li>');
		}
	});
}

function listarPorTipos(){
	var objeto=$(this).children("input").val();

	$.getJSON('/ProyectoRestaurant/index.php/carta/listarPorTipoPlato/'+objeto,
	function(data){
		$('#listaPlatos').html("");
		for (var i = 0; i < data.length; i++) {
			$('#listaPlatos').append('<div class="carta"><input type="hidden" value='+data[i].idplato+'></input><a class="agregarPedido" href="#agregar" data-role="button" data-transition="slide"><div data-theme="b"><div><img height="200px" width="285px" src="img/'+data[i].imagen+'"></div><div>'+data[i].nombre+'</div><div>S/.'+data[i].precio+'</div></div></a></div>');
			$(".carta").unbind('click').click(cargar);
			$('#listaPlatos').listview('refresh');
		}
	});
}

function seleccionaMesa(){
	$.getJSON('/ProyectoRestaurant/index.php/carta/listarMesa/',
	function(data){
		$('#opcionesdemesa').html('');
		for (var i = 0 ; i < data.length ; i++) {
			$('#opcionesdemesa').append('<option class="OptionMesa" value="'+data[i].idMesa+'">'+data[i].mesa+'</option>');
		};
	});
}

function valSelMesa(){
	numMesa=$('#opcionesdemesa').val();
    /*
	if (numMesa=="Seleccione la mesa") {
		window.location="http://127.0.0.1:1234/restaurante/";	
	}*/
}