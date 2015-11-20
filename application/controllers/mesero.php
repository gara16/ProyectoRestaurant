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
/* fin de script */

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Description of mesero
 *
 * @author Eliu
 */
class mesero extends CI_Controller {

    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->helper("url");
        $this->load->model("restaurante");
    }

    public function index() {
        $data["mesas"] = $this->restaurante->listarMesa();
        $this->load->view("mesero.php", $data);
    }
}
