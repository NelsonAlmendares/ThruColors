<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/categorias.php');

    if(isset($_GET['action'])){
        session_start();

        $categorias = new Categorias;
        $result = array ('status' => 0, 'message' => null, 'exception' => null);

        if(isset($_SESSION['id_cliente'])){
            switch ($_GET['action']) {
                case 'readAll':
                    if($result['dataset'] = $categorias->readAll()){
                        $result['status'] = 1;
                    } elseif(Database::getException()){
                        $result['exception'] = Database::getException();
                    } else{
                        $result['exception'] = 'No hay datos registrados';
                    }
                    break;
                
                default:
                    $result['exception'] = 'Acción no disponible dentro de la sesión';
                    break;
            }
            
            header('content-type: application/json; charset=utf-8');
            print(json_encode($result));
        } else{
            print(json_encode('Acceso denegado'));
        }
    }else{
        print(json_encode('Recurso no dispoible'));
    }
?>