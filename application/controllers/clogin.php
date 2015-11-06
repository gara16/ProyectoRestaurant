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

class Clogin extends CI_Controller{
	function __construct(){
		parent:: __construct();
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->helper('security');
		$this->load->library('form_validation');
		$this->load->model('restaurante');
	}

	public function index(){
		$this->load->view('login');
	}

	function validar(){
		$this->form_validation->set_rules('nombre','Usuario','trim|required|min_length[6]|max_length[12]|alpha_numeric|xss_clean');
		$this->form_validation->set_rules('password','Password','trim|required|min_length[6]|max_length[18]|xss_clean');
	}

	function logueo($user,$password){
		$rpta=$this->restaurante->loguear($user,md5($password));
		if($rpta!=null){
			settype($rpta['0'],"array");
			if ($rpta['0']['idUser'] === '1') redirect('cadmi');
			else if ($rpta['0']['idUser'] === '2') redirect('carta');
			else redirect('ccheff');
		}else $this->load->view('login');
	}
}
?>