
$(document).on('pagebeforeshow','#main',function(){
	$('#botonLoguear').unbind('click').click(loguear);
	//var variable=$('#nombre').html();
	//alert('hola');
});

function loguear(){
	var usuario=$('#nombre').val();
	var password=$('#password').val();
	$('#mensaje').html('');
	if (usuario=='' || password=='') {
		$('#mensaje').html('Ingrese usuario y contraseña');
	}else{
		$.post('/ProyectoRestaurant/index.php/clogin/logueo/'+usuario+'/'+password);
	}
}