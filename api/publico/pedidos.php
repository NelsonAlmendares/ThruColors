<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/pedidos.php');

    if(isset($_GET['action'])){
        session_start();

        $pedido = new Pedidos;
        $result = array('status' => 0, 'session' => 0, 'message' => null, 'exception' => null);

        if(isset($_SESSION['id_cliente'])){
            $result['session'] = 1;
            switch ($_GET['action']) {
                case 'createDetail':
                    $_POST = $pedido->validateForm($_POST);
                    if(!$pedido->startOrder()){

                    } elseif(!$pedido->setProducto($_POST['id_producto'])){

                    } else{

                    }
                break;
                
                default:
                    # code...
                    break;
            }
        } else{

        }

        header('content-type: application/json; charset=utf-8');
        print(json_encode($result));
        
    } else{
        print(json_encode('Recurso no disponible'));
    }
?>