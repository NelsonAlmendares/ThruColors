<?php
require_once('../helpers/database.php');
require_once('../helpers/validator.php');
require_once('../models/productos.php');

// Se comprueba si existe una acción a realizar, de lo contrario se finaliza el script con un mensaje de error.
if (isset($_GET['action'])) {
    // Se crea una sesión o se reanuda la actual para poder utilizar variables de sesión en el script.
    session_start();
    // Se instancia la clase correspondiente.
    $productos = new Productos;
    // Se declara e inicializa un arreglo para guardar el resultado que retorna la API.
    $result = array('status' => 0, 'message' => null, 'exception' => null);
    // Se verifica si existe una sesión iniciada como administrador, de lo contrario se finaliza el script con un mensaje de error.
    if (isset($_SESSION['id_empleado'])) {
        // Se compara la acción a realizar cuando un administrador ha iniciado sesión.
        switch ($_GET['action']) {
            case 'readAll':
                if ($result['dataset'] =  $productos->readAll()) {
                    $result['status'] = 1;
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'No hay datos registrados';
                }
                break;
            case 'search':
                $_POST =  $productos->validateForm($_POST);
                if ($_POST['buscar'] == '') {
                    $result['exception'] = 'Ingrese un valor para buscar';
                } elseif ($result['dataset'] =  $productos->searchRows($_POST['buscar'])) {
                    $result['status'] = 1;
                    $result['message'] = 'Valor encontrado';
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'No hay coincidencias';
                }
                break;
            case 'create':
                $_POST =  $productos->validateForm($_POST);
                if (! $productos->setTipo_e($_POST['tipo_empleado'])) {
                    $result['exception'] = 'Tipo empleado no aceptado';                
                } elseif ( $productos->createRow()) {
                    $result['status'] = 1;
                    $result['message'] = 'Tipo empleado creado correctamente';                    
                } else {
                    $result['exception'] = Database::getException();
                }
                break;
            case 'readOne':
                if (!$productos->setId($_POST['id_producto'])) {
                    $result['exception'] = 'Producto incorrecto';
                } elseif ($result['dataset'] =  $productos->readOne()) {
                    $result['status'] = 1;
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'Producto inexistente';
                }
                break;
            case 'update':
                $_POST =  $productos->validateForm($_POST);
                if (! $productos->setId($_POST['id_producto'])) {
                    $result['exception'] = 'Tipo empleado incorrecto';
                } elseif (!$data =  $productos->readOne()) {
                    $result['exception'] = 'Tipo empleado inexistente';
                } elseif (! $productos->setTipo_e($_POST['tipo_empleado'])) {
                    $result['exception'] = 'Tipo empleado no aceptado';                
                } elseif ( $productos->updateRow()) {
                        $result['status'] = 1;
                        $result['message'] = 'Tipo empleado modificado correctamente';
                } else {
                    $result['exception'] = Database::getException();
                }
                break;
            case 'delete':
                if (! $productos->setId_tipoE($_POST['id_tipoE'])) {
                    $result['exception'] = 'Tipo empleado incorrecto';
                } elseif (!$data =  $productos->readOne()) {
                    $result['exception'] = 'Tipo empleado inexistente';
                } elseif ( $productos->deleteRow()) {
                    $result['status'] = 1;
                    $result['message'] = 'Tipo empleado eliminado correctamente';                    
                } else {
                    $result['exception'] = Database::getException();
                }
                break;
            default:
                $result['exception'] = 'Acción no disponible dentro de la sesión';
        }
        // Se indica el tipo de contenido a mostrar y su respectivo conjunto de caracteres.
        header('content-type: application/json; charset=utf-8');
        // Se imprime el resultado en formato JSON y se retorna al controlador.
        print(json_encode($result));
    } else {
        print(json_encode('Acceso denegado'));
    }
} else {
    print(json_encode('Recurso no disponible'));
}
