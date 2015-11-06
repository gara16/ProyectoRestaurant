<?php
/*Script para Habilitar CORS en el código a través de PHP*/
/*CORS (Cross-Origin-Resource-Sharing) es un mecanismo o protocolo de seguridad que permite hacer 
peticiones de forma asincrónica a través de Javascript desde un servidor a otro, con el fin de 
obtener información o recursos para usar en el servidor de origen (que realiza la petición original).
Si bien por defecto los navegadores rechazan este tipo de peticiones, a través de CORS es factible 
tanto habilitarlas como especificar que tipo de peticiones y desde donde son permitidas.*/

if (isset($_SERVER['HTTP_ORIGIN'])) {  
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");  
    header('Access-Control-Allow-Credentials: true');  
    header('Access-Control-Max-Age: 86400');   
}  
      
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {  
      
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))  
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");  
      
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))  
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");  
}  
/*fin de script*/

defined('BASEPATH') OR exit('No direct script access allowed');

class Carta extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->helper('url');
		date_default_timezone_set('America/Bogota');
		$this->load->model('restaurante');
	}
	
	public function index(){
		$this->load->view('pagina1');
	}

	public function listar(){
		$datos=$this->restaurante->listarPlatos();
		echo json_encode($datos);
	}

	public function listarPlatos(){
		$datosTipos=$this->restaurante->listarTipo_plato();
		echo json_encode($datosTipos);
	}

	public function listarPlato($codigo){
		$datos=$this->restaurante->listarPlato($codigo);
		echo json_encode($datos);
	}

	public function listarPorTipoPlato($tipo){
		$plato=$this->restaurante->listarPorTipo_plato($tipo);
		echo json_encode($plato);
	}

	public function listarInsumos($codigo){
		$listaInsumos=$this->restaurante->listarIngrediente($codigo);
		echo json_encode($listaInsumos);
	}

	public function listarMesa(){
		$listaMesa=$this->restaurante->listarMesa();
		echo json_encode($listaMesa);
	}
}
?>