<?php
require_once('../helpers/database.php');
require_once('../helpers/validator.php');
require_once('../models/ventas.php');

// Se comprueba si existe una acción a realizar, de lo contrario se finaliza el script con un mensaje de error.
if (isset($_GET['action'])) {
    // Se crea una sesión o se reanuda la actual para poder utilizar variables de sesión en el script.
    session_start();
    // Se instancia la clase correspondiente.
    $venta = new Ventas;
    // Se declara e inicializa un arreglo para guardar el resultado que retorna la API.
    $result = array('status' => 0, 'message' => null, 'exception' => null);
    // Se verifica si existe una sesión iniciada como administrador, de lo contrario se finaliza el script con un mensaje de error.
    if (isset($_SESSION['id_empleado'])) {
        // Se compara la acción a realizar cuando un administrador ha iniciado sesión.
        switch ($_GET['action']) {
            case 'readAll':
                if ($result['dataset'] = $venta->readAll()) {
                    $result['status'] = 1;
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'No hay datos registrados';
                }
                break;
            case 'search':
                $_POST = $venta->validateForm($_POST);
                if ($_POST['buscar'] == '') {
                    $result['exception'] = 'Ingrese un valor para buscar';
                } elseif ($result['dataset'] = $venta->searchRows($_POST['buscar'])) {
                    $result['status'] = 1;
                    $result['message'] = 'Valor encontrado';
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'No hay coincidencias';
                }
                break;            
            case 'readOne':
                if (!$venta->setId($_POST['id_venta'])) {
                    $result['exception'] = 'Venta incorrecta';
                } elseif ($result['dataset'] = $venta->readOne()) {
                    $result['status'] = 1;
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'Producto inexistente';
                }
                break;
            case 'update':
                $_POST = $venta->validateForm($_POST);
                if (!$venta->setId($_POST['id_venta'])) {
                    $result['exception'] = 'Venta incorrecta';
                } elseif (!$data = $venta->readOne()) {
                    $result['exception'] = 'Venta inexistente';
                } elseif (!isset($_POST['estado_venta'])) {
                    $result['exception'] = 'Seleccione un estado de venta';                
                } elseif (!$venta->setEstado($_POST['estado_venta'])) {
                    $result['exception'] = 'Estado incorrecto';                
                } elseif ($venta->updateRow()) {
                    $result['status'] = 1;
                    $result['message'] = 'Producto modificado correctamente';
                } else {
                    $result['exception'] = Database::getException();
                }
                break;
            case 'delete':
                if (!$venta->setId($_POST['id_venta'])) {
                    $result['exception'] = 'Venta incorrecto';
                } elseif (!$data = $venta->readOne()) {
                    $result['exception'] = 'Venta inexistente';
                } elseif ($venta->deleteRow()) {
                    $result['status'] = 1;
                    $result['message'] = 'Venta eliminada correctamente';
                } else {
                    $result['exception'] = Database::getException();
                }
                break;
            case 'cantidadProductosCategoria':
                if ($result['dataset'] = $venta->cantidadProductosCategoria()) {
                    $result['status'] = 1;
                } else {
                    $result['exception'] = 'No hay datos disponibles';
                }
                break;
            case 'porcentajeProductosCategoria':
                if ($result['dataset'] = $venta->porcentajeProductosCategoria()) {
                    $result['status'] = 1;
                } else {
                    $result['exception'] = 'No hay datos disponibles';
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
