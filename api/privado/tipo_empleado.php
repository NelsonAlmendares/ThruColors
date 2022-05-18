<?php
require_once('../helpers/database.php');
require_once('../helpers/validator.php');
require_once('../models/tipo_empleado.php');

// Se comprueba si existe una acción a realizar, de lo contrario se finaliza el script con un mensaje de error.
if (isset($_GET['action'])) {
    // Se crea una sesión o se reanuda la actual para poder utilizar variables de sesión en el script.
    session_start();
    // Se instancia la clase correspondiente.
    $tipo_empleado = new Tipo_empleado;
    // Se declara e inicializa un arreglo para guardar el resultado que retorna la API.
    $result = array('status' => 0, 'message' => null, 'exception' => null);
    // Se verifica si existe una sesión iniciada como administrador, de lo contrario se finaliza el script con un mensaje de error.
    if (isset($_SESSION['id_empleado'])) {
        // Se compara la acción a realizar cuando un administrador ha iniciado sesión.
        switch ($_GET['action']) {
            case 'readAll':
                if ($result['dataset'] =  $tipo_empleado->readAll()) {
                    $result['status'] = 1;
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'No hay datos registrados';
                }
                break;
            case 'search':
                $_POST =  $tipo_empleado->validateForm($_POST);
                if ($_POST['search'] == '') {
                    $result['exception'] = 'Ingrese un valor para buscar';
                } elseif ($result['dataset'] =  $tipo_empleado->searchRows($_POST['search'])) {
                    $result['status'] = 1;
                    $result['message'] = 'Valor encontrado';
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'No hay coincidencias';
                }
                break;
            case 'create':
                $_POST =  $tipo_empleado->validateForm($_POST);
                if (! $tipo_empleado->setNombre($_POST['nombre'])) {
                    $result['exception'] = 'Nombre incorrecto';
                } elseif (! $tipo_empleado->setDescripcion($_POST['descripcion'])) {
                    $result['exception'] = 'Descripción incorrecta';
                } elseif (!is_uploaded_file($_FILES['archivo']['tmp_name'])) {
                    $result['exception'] = 'Seleccione una imagen';
                } elseif (! $tipo_empleado->setImagen($_FILES['archivo'])) {
                    $result['exception'] =  $tipo_empleado->getFileError();
                } elseif ( $tipo_empleado->createRow()) {
                    $result['status'] = 1;
                    if ( $tipo_empleado->saveFile($_FILES['archivo'],  $tipo_empleado->getRuta(),  $tipo_empleado->getImagen())) {
                        $result['message'] = 'Categoría creada correctamente';
                    } else {
                        $result['message'] = 'Categoría creada pero no se guardó la imagen';
                    }
                } else {
                    $result['exception'] = Database::getException();
                }
                break;
            case 'readOne':
                if (! $tipo_empleado->setId($_POST['id'])) {
                    $result['exception'] = 'Categoría incorrecta';
                } elseif ($result['dataset'] =  $tipo_empleado->readOne()) {
                    $result['status'] = 1;
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'Categoría inexistente';
                }
                break;
            case 'update':
                $_POST =  $tipo_empleado->validateForm($_POST);
                if (! $tipo_empleado->setId($_POST['id'])) {
                    $result['exception'] = 'Categoría incorrecta';
                } elseif (!$data =  $tipo_empleado->readOne()) {
                    $result['exception'] = 'Categoría inexistente';
                } elseif (! $tipo_empleado->setNombre($_POST['nombre'])) {
                    $result['exception'] = 'Nombre incorrecto';
                } elseif (! $tipo_empleado->setDescripcion($_POST['descripcion'])) {
                    $result['exception'] = 'Descripción incorrecta';
                } elseif (!is_uploaded_file($_FILES['archivo']['tmp_name'])) {
                    if ( $tipo_empleado->updateRow($data['imagen_categoria'])) {
                        $result['status'] = 1;
                        $result['message'] = 'Categoría modificada correctamente';
                    } else {
                        $result['exception'] = Database::getException();
                    }
                } elseif (! $tipo_empleado->setImagen($_FILES['archivo'])) {
                    $result['exception'] =  $tipo_empleado->getFileError();
                } elseif ( $tipo_empleado->updateRow($data['imagen_categoria'])) {
                    $result['status'] = 1;
                    if ( $tipo_empleado->saveFile($_FILES['archivo'],  $tipo_empleado->getRuta(),  $tipo_empleado->getImagen())) {
                        $result['message'] = 'Categoría modificada correctamente';
                    } else {
                        $result['message'] = 'Categoría modificada pero no se guardó la imagen';
                    }
                } else {
                    $result['exception'] = Database::getException();
                }
                break;
            case 'delete':
                if (! $tipo_empleado->setId($_POST['id'])) {
                    $result['exception'] = 'Categoría incorrecta';
                } elseif (!$data =  $tipo_empleado->readOne()) {
                    $result['exception'] = 'Categoría inexistente';
                } elseif ( $tipo_empleado->deleteRow()) {
                    $result['status'] = 1;
                    if ( $tipo_empleado->deleteFile( $tipo_empleado->getRuta(), $data['imagen_categoria'])) {
                        $result['message'] = 'Categoría eliminada correctamente';
                    } else {
                        $result['message'] = 'Categoría eliminada pero no se borró la imagen';
                    }
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