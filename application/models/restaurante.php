<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Restaurante extends CI_Model{
	
	function __construct(){
		parent::__construct();
		$this->load->database();
	}

	function listarTipo_plato(){
		$datos=$this->db->select('idTipoPlato,tipoPlato')->from('tipo_plato')->get()->result();
		return $datos;
	}
	function listarPorTipo_plato($tipo){
		$datos=$this->db->select('idplato,nombre,precio,imagen')
		->from('plato')
		->where('idTipoPlato',$tipo)
		->get()->result();
		return $datos;
	}
	function listarPlatos(){
		$datos=$this->db->select('idplato,nombre,precio,imagen')->from('plato')->get()->result();
		return $datos;
	}
	function listarPlato($dato){
		$datos=$this->db->select('idplato,nombre,precio,imagen')->from('plato')->where('idplato',$dato)->get()->result();
		return $datos;
	}
	function listarIngrediente($dato){
		$datos=$this->db->select('in.insumo,pi.cantidad,un.unidad')
		->from('plato_insumo pi')
		->join('insumo in','in.idInsumo=pi.idInsumo')
		->join('unidadmedida un','un.id=pi.unidadMedida')
		->where('pi.idPlato',$dato)
		->get()->result();
		return $datos;
	}
	function listarMesa(){
		$datos=$this->db->select('idMesa,mesa')->from('mesa')->get()->result();
		return $datos;
	}
	function listarMesaActiva(){
		$datos=$this->db->select('idMesa,mesa')->where('estado',1)->from('mesa')->get()->result();
		return $datos;
	}
	function agregarPedido($datos){
		if ($this->db->insert('pedido',$datos)) {
			return true;
		} else return false;
	}
	function estadoMesa($mesa){
		$dato=$this->db->select('estado')->where('idMesa',$mesa)->from('mesa')->get()->result();
		return $dato;
	}
	function buscarPedido($mesa){
		$dato=$this->db->select('idPedido')->where('estado',1)->where('idMesa',$mesa)->from('pedido')->get()->result();
		return $dato;
	}
	function agregarPedPlato($datos){
		if ($this->db->insert('plato_pedido',$datos)) {
			return true;
		} else return false;
	}
	function cambiarEstadoM($idMesa,$estado){
		$this->db->where('idMesa',$idMesa);
		if ($this->db->update('mesa',$estado)) {
			return true;
		} else return false;
	}
	function listarPlatoPed($idPedido){
		$datos=$this->db->select('pl.nombre,pl.precio,pl.imagen')
		->from('plato_pedido pp')
		->join('plato pl','pl.idplato=pp.idplato')
		->where('pp.idPedido',$idPedido)
		->get()->result();
		return $datos;
	}
	function calcularPrecio($idPedido){
		$precioT=$this->db->select_sum('pl.precio')
		->from('plato_pedido pp')
		->join('plato pl','pp.idplato=pl.idplato')
		->where('pp.idPedido',$idPedido)->get()->result();
		return $precioT;
	}
	function listarTiposPago(){
		$datos=$this->db->select('idFormaPago,formaPago')->from('forma_pago')->get()->result();
		return $datos;
	}
	function realizarVenta($idPedido){

	}
	function loguear($username,$password){
		$this->db->where('alias',$username)->from('staff');
		if ($this->db->count_all_results() === 1) {
			$resultado=$this->db->select('alias,idUser')
							->where('alias',$username)->where('password',$password)
							->from('staff')->get()->result();
			return $resultado;
		} else return false;
	}

}