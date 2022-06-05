<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/marca.php');

    if(isset($_GET['action'])){
        session_start();

        $marca = new Marca;
        $result = array ('status' => 0, 'message' => null, 'message' => null);

        if(isset($_SESSION['id_cliente'])){
            switch ($_GET['action']) {
                case 'readAll':
                    if($result['dataset'] = $marca->readAll()){
                        $result['status'] = 1;
                    } elseif(Database::getException()){
                        $result['exception'] = Database::getException();
                    } else{
                        $result['excption'] = 'Marcas no registradas';
                    }
                    break;
                
                default:
                    $result['exception'] = Database::getException();
                    break;
            }

            header('content-type: application/json; charset=utf-8');
            print(json_encode($result));

        } else{
            print(json_encode('Acceso denegado'));
        }
    } else{
        print(json_encode('Recurso no disponible'));
    }
?>