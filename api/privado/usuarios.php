<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/usuarios.php');

    if(isset($GET['actions'])){
        session_start();
        $usuario = new Usuarios;
        $result = array('status' => 0, 'session' => 0, 'message' => null, 'exception' => null, 'dataset' => null, 'username' => null);

        if(isset($_SESSION['id_usuario'])){
            switch ($GET['action']) {
                case 'getUser':
                    if(isset($_SESSION['alias_usuario'])){
                        $result['status'] = 1;
                        $result['username'] = $_SESSION['alias_usuario'];
                    }
                    else{
                        $result['exception'] = 'Alias de usuario indefinido';
                    }
                    break;
                case 'logOut':
                    if(session_destroy()){
                        $result['status'] = 1;
                        $result['messsage'] = 'Sesión eliminada correctamente';
                    }else{
                        $result['exception'] = 'Ocurrió un problema al cerrar la sesión';
                    }
                    break;
                case 'readProfile':
                    if($result['dataset'] = $usuario->readProfile()){
                        $result['status'] = 1;
                    }elseif (Database::getExeption()) {
                        $result['exception'] = Database::getExeption();
                    }else{
                        $result['exception'] = 'Usuario inexsitente';
                    }
                    break;
                case 'editProfile':
                    $_POST = $usuario->validateForm($_POST);
                    if(!$usuario->setNombres($_POST['nombres'])){
                        $result['exception'] = 'Nombres incorrectos';
                    }
                    break;
                default:
                    # code...
                    break;
            }
        }
    }
?>