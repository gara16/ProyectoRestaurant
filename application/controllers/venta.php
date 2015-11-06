<?php
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

defined('BASEPATH') OR exit('No direct script access allowed');

class Venta extends CI_Controller{
	
	function __construct(){
		parent:: __construct();
		$this->load->helper('url');
		$this->load->model('restaurante');
	}

	public function index(){
		$this->load->view('paginaVenta');
	}
	public function listarMesas(){
		$datos=$this->restaurante->listarMesaActiva();
		echo json_encode($datos);
	}
	public function buscarIdPedido($idmesa){
		$dato=$this->restaurante->buscarPedido($idmesa);
		settype($dato['0'],"array");
		$idPedido=$dato['0']['idPedido'];
		return $idPedido;
	}
	public function listarPedido($idmesa){
		$idPedido=$this->buscarIdPedido($idmesa);
		$plato=$this->restaurante->listarPlatoPed($idPedido);
		echo json_encode($plato);
	}
	public function calcularPrecio($idmesa){
		$idPed=$this->buscarIdPedido($idmesa);
		$precio=$this->restaurante->calcularPrecio($idPed);
		echo json_encode($precio);
	}
	public function tiposPagos(){
		$datos=$this->restaurante->listarTiposPago();
		echo json_encode($datos);
	}
}
?>