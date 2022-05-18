<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/empleados');

    if(isset($GET['actions'])){
        session_start();
        $empleado = new empleados;
        $result = array('status' => 0, 'session' => 0, 'message' => null, 'exception' => null, 'dataset' => null, 'codigo' => null);

        if(isset($_SESSION['id_empleado'])){
            switch ($GET['action']) {
                case 'getUser':
                    if(isset($_SESSION['codigo_empleado'])){
                        $result['status'] = 1;
                        $result['codigo'] = $_SESSION['codigo_empleado'];
                    }
                    else{
                        $result['exception'] = 'Coddigo de cliente indefinido';
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
                    if($result['dataset'] = $empleado->readProfile()){
                        $result['status'] = 1;
                    }elseif (Database::getException()) {
                        $result['exception'] = Database::getException();
                    }else{
                        $result['exception'] = 'Empleado inexsitente';
                    }
                    break;
                case 'editProfile':
                    $_POST = $empleado->validateForm($_POST);
                    if(!$empleado->setNombre_e($_POST['nombres'])){
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