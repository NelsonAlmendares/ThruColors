<?php
require_once('../helpers/database.php');
require_once('../helpers/validator.php');
require_once('../models/marca.php');
require_once('../models/productos.php');

// Se comprueba si existe una acción a realizar, de lo contrario se finaliza el script con un mensaje de error.
if (isset($_GET['action'])) {
    // Se instancian las clases correspondientes.
    $marca = new Marca;
    $producto = new Productos;
    // Se declara e inicializa un arreglo para guardar el resultado que retorna la API.
    $result = array('status' => 0, 'message' => null, 'exception' => null);
    // Se compara la acción a realizar según la petición del controlador.
    switch ($_GET['action']) {
        case 'readAll':
            if ($result['dataset'] = $producto->readAll()) {
                $result['status'] = 1;                
            } elseif (Database::getException()) {
                $result['exception'] = Database::getException();
            } else {
                $result['exception'] = 'No existen categorías para mostrar';
            }
            break;
        case 'readProductosMarca':   
            if (!$producto->setNombre_marca($_POST['nombre_marca'])) {
                $result['exception'] = 'Marca incorrecta';
            } elseif ($result['dataset'] = $producto->readProductsCategory()) {
                $result['status'] = 1;
            } elseif (Database::getException()) {
                $result['exception'] = Database::getException();
            } else {
                $result['exception'] = 'No existen productos para mostrar';
            }
            break;
        case 'filtrarProductos': 
            if (isset($_POST['marca'])) {
                if (!$producto->setMarca($_POST['marca'])) {
                    $result['exception'] = 'Marca incorrecta';
                } elseif ($result['dataset'] = $producto->filtrarProductosMarca()) {
                    $result['status'] = 1;
                }
            }elseif (isset($_POST['categorias'])) {
                if (!$producto->setCategoria($_POST['categorias'])) {
                    $result['exception'] = 'Categoria incorrecta';
                } elseif ($result['dataset'] = $producto->filtrarProductosCategoria()) {
                    $result['status'] = 1;
                }
            } elseif (Database::getException()) {
                $result['exception'] = Database::getException();
            } else {
                $result['exception'] = 'No existen productos para mostrar';
            }
            break;
        case 'readOne':
            if (!$producto->setId($_POST['id_producto'])) {
                $result['exception'] = 'Producto incorrecto';
            } elseif ($result['dataset'] = $producto->readOne()) {
                $result['status'] = 1;
            } elseif (Database::getException()) {
                $result['exception'] = Database::getException();
            } else {
                $result['exception'] = 'Producto inexistente';
            }
            break;
        case 'search':
                $_POST =  $producto->validateForm($_POST);
                if ($_POST['buscar'] == '') {
                    $result['exception'] = 'Ingrese un valor para buscar';
                } elseif ($result['dataset'] =  $producto->searchRows($_POST['buscar'])) {
                    $result['status'] = 1;
                    $result['message'] = 'Valor encontrado';
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'No hay coincidencias';
                }
                break;
        default:
            $result['exception'] = 'Acción no disponible';
    }
    // Se indica el tipo de contenido a mostrar y su respectivo conjunto de caracteres.
    header('content-type: application/json; charset=utf-8');
    // Se imprime el resultado en formato JSON y se retorna al controlador.
    print(json_encode($result));
} else {
    print(json_encode('Recurso no disponible'));
}