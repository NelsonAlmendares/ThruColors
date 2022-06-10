<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/clientes.php');

    if(isset($_GET['action'])){
        session_start();

        $clientes = new Clientes;
        $result = array('status' => 0, 'session' => 0 ,'recaptcha' => 0, 'message' => null, 'exception' => null, 'nombre_cliente' => null);

        if(isset($_SESSION['id_cliente'])){
            $result['session'] = 1;
            switch ($_GET['action']) {
                case 'getUser':
                    if (isset($_SESSION['correo_cliente'])) {
                        $result['status'] = 1;
                        $result['nombre_cliente'] = $_SESSION['nombre_cliente'];
                        $result['apellido_cliente'] = $_SESSION['apellido_cliente'];
                        $result['correo_cliente'] = $_SESSION['correo_cliente'];
                        $result['foto_cliente'] = $_SESSION['foto_cliente'];
                    } else{
                        $result['exception'] = 'Correo de usuario indefinido';
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

                    if($$clientes->setNombre_c($_POST['nombres'])){
                        $result['exception'] = 'Nombres incorrectos';
                    } elseif(!$clientes->setApellido_c($_POST['apellidos'])){
                        $result['exception'] = 'Apellios Incorrectos';
                    } elseif(!$clientes->setCelular_c($_POST['celular'])){
                        $result['exception'] = 'Celular incorrecto';
                    } elseif(!$clientes->setDireccion_c($_POST['direccion'])){
                        $result['exception'] = 'Direccion Incorrecta';
                    } elseif(!$clientes->setEmail_c($_POST['correo'])){
                        $result['exception'] = 'Correo incorrecto';
                    } elseif(!$clientes->setCelular_c($_POST['celular'])){
                        $result['exception'] = 'Celular incorrecto';
                    } elseif($_POST['clave'] != $_POST['confirmar_clave']){
                        $result['exception'] = 'Claves diferentes';
                    } elseif(!$clientes->setClave($_POST['clave'])){
                        $result['exception'] = $clientes->getPasswordError();
                    } elseif($clientes->createRow()){
                        $result['status'] = 1;
                        $result['message'] = 'Cliente registrado correctamente';
                    } else{
                        $result['exception'] = Database::getException();
                    }
                    break;
                    case 'logIn':
                        $_POST = $clientes->validateForm($_POST);
                        if (!$clientes->checkUser($_POST['correo_cliente'])) {
                            $result['exception'] = 'Correo incorrecto';
                        } elseif (!$clientes->getEstado_c()) {
                            $result['exception'] = 'La cuenta ha sido desactivada';
                        } elseif (!$clientes->readUserName($_POST['correo_cliente'])) {
                            $result['exception'] = 'Nombre no encontrado';
                        } elseif ($clientes->checkPassword($_POST['clave'])) {
                            $result['status'] = 1;
                            $result['message'] = 'Autenticación correcta';
                            $_SESSION['id_cliente'] = $clientes->getId_c();
                            $_SESSION['correo_cliente'] = $clientes->getEmail_c();
                            $_SESSION['nombre_cliente'] = $clientes->getNombre_c();
                            $_SESSION['apellido_cliente'] = $clientes->getApellido_c();
                            $_SESSION['foto_cliente'] = $clientes->getFoto_c();
                        } else {
                            $result['exception'] = 'Clave incorrecta';
                        }
                        break;
                    default:
                        $result['exception'] = 'Acción no disponible fuera de la sesión';
                }
        }
        // Se indica el tipo de contenido a mostrar y su respectivo conjunto de caracteres.
    header('content-type: application/json; charset=utf-8');
    // Se imprime el resultado en formato JSON y se retorna al controlador.
    print(json_encode($result));
} else {
    print(json_encode('Recurso no disponible'));
}
    
?>