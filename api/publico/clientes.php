<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/clientes.php');

    if(isset($_GET['action'])){
        session_start();

        $clientes = new Clientes;
        $result = array('status' => 0, 'session' => 0 ,'recaptcha' => 0, 'message' => null, 'exception' => null, 'username' => null);

        if(isset($_SESSION['id_cliente'])){
            $result['session'] = 1;
            switch ($_GET['action']) {
                case 'getUser':
                    if (isset($_SESSION['correo_cliente'])) {
                        $result['status'] = 1;
                        $result['username'] = $_SESSION['correo_cliente'];
                    } else{
                        $result['exceptoion'] = 'Correo de usuario indefinido';
                    }
                    break;
                case 'logOut':
                    if(session_destroy()){
                        $result['status'] = 1;
                        $result['message'] = 'Sesión eliminada correctamente';
                    } else{
                        $result['exception'] = 'Ocurrió un problema al cerrar sesión';
                    }
                    break;
                default:
                    $result['exception'] = 'Acción no valida dentro de la sesión';
                    break;
            }
        } else{
            switch ($_GET['action']) {
                case 'register':
                    $_POST = $clientes->validateForm($_POST);
                    $secretKey = '6LdBzLQUAAAAAL6oP4xpgMao-SmEkmRCpoLBLri-';
                    $ip = $_SERVER['REMOTE_ADDR'];

                    $data = array('secret' => $secretKey, 'response' => $_POST['g-recaptcha-response'], 'remoteip' => $ip);

                    $options = array(
                        'http' => array('header' => "Content-type: application/x-www-form-urlcodeded\r\n", 'method' => 'POST', 'content' => http_build_query($data)),
                        'ssl' => array('verify_peer' => false, 'verify_peer_name' => false)
                    );

                    $url = 'https://www.google.com/recaptcha/api/siteverify';
                    $context = stream_context_create($options);
                    $response = file_get_contents($url, false, $context);
                    $captcha = json_encode($response, true);

                    if(!$captcha['success']){
                        $result['recaptcha'] = 1;
                        $result['exception'] = 'No eres humano';
                    } elseif($$clientes->setNombre_c($_POST['nombres'])){
                        $result['exception'] = 'Nombres incorrectos';
                    } elseif(!$clientes->setApellido_c($_POST['apellidos'])){
                        $result['exception'] = 'Apellios Incorrectos';
                    } elseif(!$clientes->setCelular_c($_POST['celular'])){
                        $result['exception'] = 'Celular incorrecto';
                    } elseif(!$clientes->setDireccion_c($_POST['direccion'])){
                        $result['exception'] = 'Direccion Incorrecta';
                    } elseif(!$clientes->setEmail_c($_POST['correo'])){
                        $result['exception'] = 'Correo incorrecto';
                    } elseif(!$clientes->setEstado_c($_POST['estado'])){
                        $result['exception'] = 'Selecciona un estado valido';
                    } elseif(!$clientes){

                    }

                    break;
                
                default:
                    # code...
                    break;
            }
        }
    }
?>