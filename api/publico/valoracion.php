<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/valoracion.php');

    if(isset($_GET['action'])){
        //Instanciamos el objeto con el que accedemos a la clase
        $valoracion = new valoracion;
        $result = array('status' => 0, 'message' => null, 'message' => null);

        switch ($_GET['action']) {
            case 'readAll':
                if($result['dataset'] = $valoracion->readAll()){
                    $result['status'] = 1;
                } elseif(Database::getException()){
                    $result['exception'] = Database::getException();
                } else{
                    $result['exception'] = 'Valoracion no valida';
                }
                break;
            case 'readValoracion':
                if($result['dataset'] = $valoracion->valoracionBueno()){
                    $result['status'] = 1;
                } elseif(Database::getException()){
                    $result['excption'] = Database::getException();
                } else{
                    $result['exception'] = 'Acción no valida';
                }
            break;
            case 'registerValoracion':
                if($valoracion['dataset'] = $valoracion->registerValoracion){
                    $result['status'] = 1;
                } elseif(Database::getException()){
                    $result['exception'] = Database::getException();
                } else{
                    $result['exception'] = 'Acción no valida';
                }
            break;

            default:
                $result['exception'] = 'Acción no disponible';
                break;
        }
        header('content-type: application/json; charset=utf-8');
        print(json_encode($result));
    }else{
        print(json_encode('Recurso no disponible'));
    }
?>