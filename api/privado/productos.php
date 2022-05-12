<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/productos.php');

    if(isset($_GET['actions'])){
        session_start();

        $producto = new Productos;
        $result = array('status' => 0, 'message' => null, 'exception' => null);
        if (isset($_SESSION['id_usuario'])) {
            switch ($_GET['actions']) {
                case 'readAll':
                    if($result['dataset'] = $producto->readAll()){
                        $result['status'] = 1;
                    } elseif(Database::getExeption()){
                        $result['exception'] = Database::getExeption();
                    } else{
                        $result['exception'] = 'No hay registrados';
                    }
                    break;
                case 'search':
                    $_POST = $producto->validateForms($_POST);
                    if($_POST['search'] == ''){
                        $result['exception'] = 'Ingrese un valor para buscar';
                    } elseif($result['dataset'] = $producto->searchRows($_POST['search'])){
                        $result['status'] = 1;
                        $result['message'] = 'Valor encontrado';
                    } elseif(Database::getExeption()){
                        $result['dataset'] = Database::getExeption();
                    } else{
                        $result['exception'] = 'No hay coincidencias';
                    }
                    break;
                case 'create':
                    $_POST = $producto->validateForms($_POST);
                    if (!$producto->setNombre($_POST['nombreProducto'])) {
                        $result['exception'] = 'Nombre Incorrecto';
                    } elseif(!$producto->setDescripcion($_POST['descripcionProducto'])){
                        $result['exception'] = 'Descripcion Incorrecta';
                    }
                    break;
            }
        }
    }
?>