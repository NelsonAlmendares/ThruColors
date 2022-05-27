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
                $_POST = $productos->validateForm($_POST);
                
                if (!$productos->setNombre($_POST['nombre_producto'])) {
                    $result['exception'] = 'Nombre incorrecto';
                } elseif (!$productos->setPrecio($_POST['costo'])) {
                    $result['exception'] = 'Precio invalido';
                } elseif (!$productos->setDescripcion($_POST['descripcion_producto'])) {
                    $result['exception'] = 'Descripcion del producto incorrecta';
                } elseif (!is_uploaded_file($_FILES['foto_producto']['tmp_name'])) {
                    $result['exception'] = 'Seleccione una imagen';
                } elseif (!$productos->setImage($_FILES['foto_producto'])) {
                    $result['exception'] = $productos->getFileError();
                } elseif (!$productos->setCantidad($_POST['cantidad_producto'])) {
                    $result['exception'] = 'Cantidad incorrecta';
                } elseif (!isset($_POST['estado_producto'])) {
                    $result['exception'] = 'Seleccione un estado de producto';
                } elseif (!$productos->setEstado($_POST['estado_producto'])) {
                    $result['exception'] = 'Estado del producto incorrecto';
                } elseif (!isset($_POST['empleado_producto'])) {
                    $result['exception'] = 'Seleccione un empleado';
                } elseif (!$productos->setEmpleado($_POST['empleado_producto'])) {
                    $result['exception'] = 'Empleado incorrecto';
                } elseif (!isset($_POST['marca_producto'])) {
                    $result['exception'] = 'Seleccione una marca';
                } elseif (!$productos->setMarca($_POST['marca_producto'])) {
                    $result['exception'] = 'Marca incorrecta';
                } elseif (!isset($_POST['genero_producto'])) {
                    $result['exception'] = 'Seleccione un genero para el producto';
                } elseif (!$productos->setGenero($_POST['genero_producto'])) {
                    $result['exception'] = 'Genero incorrecto';
                } elseif (!isset($_POST['categoria_producto'])) {
                    $result['exception'] = 'Seleccione una categoria para el producto'; 
                } elseif (!$productos->setCategoria($_POST['categoria_producto'])) {
                    $result['exception'] = 'Categoria incorrecta';
                } elseif (!isset($_POST['presentacion_producto'])) {
                    $result['exception'] = 'Seleccione una presentación para el producto'; 
                } elseif (!$productos->setPresentacion($_POST['presentacion_producto'])) {
                    $result['exception'] = 'Presentacion incorrecta';                                     
                } elseif ($productos->createRow()) {
                    $result['status'] = 1;
                    if ($productos->saveFile($_FILES['foto_producto'], $productos->getRuta(), $productos->getFoto())) {
                    $result['message'] = 'El empleado registrado correctamente';
                    } else {
                        $result['message'] = 'El empleado se registro pero no se guardó la imagen';
                    }
                } elseif (Database::getException()) {                   
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'El empleado no se registro correctamente';
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
                $_POST = $productos->validateForm($_POST);
                if (!$productos->setId($_POST['id_producto'])) {
                    $result['exception'] = 'Producto incorrecto';
                } elseif (!$data = $productos->readOne()) {
                    $result['exception'] = 'Empleado inexistente';
                } elseif (!$productos->setNombre($_POST['nombre_producto'])) {
                    $result['exception'] = 'Nombre incorrectos';
                } elseif (!$productos->setPrecio($_POST['costo'])) {
                    $result['exception'] = 'Precio invalido';
                } elseif (!$productos->setDescripcion($_POST['descripcion_producto'])) {
                    $result['exception'] = 'Descripcion del producto incorrecta';
                } elseif (!$productos->setCantidad($_POST['cantidad_producto'])) {
                    $result['exception'] = 'Cantidad incorrecta';
                } elseif (!isset($_POST['estado_producto'])) {
                    $result['exception'] = 'Seleccione un estado de producto';
                } elseif (!$productos->setEstado($_POST['estado_producto'])) {
                    $result['exception'] = 'Estado del producto incorrecto';
                } elseif (!isset($_POST['empleado_producto'])) {
                    $result['exception'] = 'Seleccione un empleado';
                } elseif (!$productos->setEmpleado($_POST['empleado_producto'])) {
                    $result['exception'] = 'Empleado incorrecto';
                } elseif (!isset($_POST['marca_producto'])) {
                    $result['exception'] = 'Seleccione una marca';
                } elseif (!$productos->setMarca($_POST['marca_producto'])) {
                    $result['exception'] = 'Marca incorrecta';
                } elseif (!isset($_POST['genero_producto'])) {
                    $result['exception'] = 'Seleccione un genero para el producto';
                } elseif (!$productos->setGenero($_POST['genero_producto'])) {
                    $result['exception'] = 'Genero incorrecto';
                } elseif (!isset($_POST['categoria_producto'])) {
                    $result['exception'] = 'Seleccione una categoria para el producto'; 
                } elseif (!$productos->setCategoria($_POST['categoria_producto'])) {
                    $result['exception'] = 'Categoria incorrecta';
                } elseif (!isset($_POST['presentacion_producto'])) {
                    $result['exception'] = 'Seleccione una presentación para el producto'; 
                } elseif (!$productos->setPresentacion($_POST['presentacion_producto'])) {
                    $result['exception'] = 'Presentacion incorrecta';
                } elseif (!is_uploaded_file($_FILES['foto_producto']['tmp_name'])) {
                    if ($productos->updateRow($data['foto'])) {
                        $result['status'] = 1;
                        $result['message'] = 'Empleado modificado correctamente';
                    } else {
                        $result['exception'] = Database::getException();
                    }
                } elseif (!$productos->setImage($_FILES['foto_producto'])) {
                    $result['exception'] = $productos->getFileError();
                } elseif ($productos->updateRow($data['foto'])) {
                    $result['status'] = 1;
                    if ($productos->saveFile($_FILES['foto_producto'], $productos->getRuta(), $productos->getFoto())) {
                        $result['message'] = 'Producto modificado correctamente';
                    } else {
                        $result['message'] = 'Producto modificado pero no se guardó la imagen';
                    }
                } else {
                    $result['exception'] = Database::getException();
                }
                break;
            case 'delete':
                if (! $productos->setId($_POST['id_producto'])) {
                    $result['exception'] = 'Producto incorrecto';
                } elseif (!$data =  $productos->readOne()) {
                    $result['exception'] = 'Producto inexistente';
                } elseif ($productos->deleteRow()) {
                    $result['status'] = 1;
                    if ($productos->deleteFile($productos->getRuta(), $data['foto'])) {
                        $result['message'] = 'Producto eliminado correctamente';
                    } else {
                        $result['message'] = 'Producto eliminado pero no se borró la imagen';
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
