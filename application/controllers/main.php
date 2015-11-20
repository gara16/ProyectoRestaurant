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
/*fin de script*/

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Description of main
 *
 * @author Eliu
 */
class main extends CI_Controller {
    //put your code here
    public function __construct() {
        parent::__construct();
        
        $this->load->helper(array("form", "url"));
        $this->load->library('form_validation');
        $this->load->model("restaurante");
    }
    
    public function index() {
        $this->load->view("main.php");
    }
    
    public function login() {
        
        if (!isset($_POST['uname'], $_POST['upass'])){
            $this->load->view("login.php");
        } else {
            $this->form_validation->set_rules('uname', 'NombreUsuario' ,'required|trim');
            $this->form_validation->set_rules('upass', 'Contrasena','required|trim');
            
            if ($this->form_validation->run()==FALSE){
                $this->load->view("login.php");
            } else {
                $this->load->view("main.php");
            }
        }
    }
}
