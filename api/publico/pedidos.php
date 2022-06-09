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
                        $result['exception'] = 'Ocurrio un problema al obtner pedido';
                    } elseif(!$pedido->setProducto($_POST['id_producto'])){
                        $result['exception'] = 'Producto incorrecto';
                    } elseif(!$pedido->setCantidad($_POST['cantidad'])){
                        $result['exception'] = 'Cantidad incorrecta';
                    } elseif(!$pedido->createDetail()){
                        $result['status'] = 1;
                        $result['message'] = 'Producto agregado correctamente';
                    } else{
                        $result['exception'] = 'Ocurrió un problema al agregar el producto';
                    }
                break;
                case 'readOrderDetail':
                    if(!$pedido->startOrder()){
                        $result['exception'] = 'Debe agregar un producto al carrito';
                    } elseif(!$result['dataset'] = $pedido->readOrderDetail()){
                        
                    }
                break;
                
                default:
                    
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