<?php
require_once('../helpers/database.php');
require_once('../helpers/validator.php');
require_once('../models/categorias.php');
require_once('../models/productos.php');

// Comprobamoos si hay una acción a realizar
if(isset($_GET['action'])){

    // Se instancian las clases correspondientes
    $categorias = new Categorias;
    $producto = new Productos;

    //Se guarda en un arrglo el resultado que retorna la API
    $result = array('status' => 0, 'message' => 0, 'exception' => null);

    //Se compara la acción a realizarse
    switch ($_GET['action']) {
        case 'readAll':
            if ($result['dataset'] = $categorias->readAll()) {
                $result['status'] = 1;
            } elseif(Database::getException()){
                $result['exception'] = Database::getException();
            } else{
                $result['exception'] = 'No existen datos para mostrar';
            }
            break;
        case 'readProductosCategoria':
            if (!$producto->setId($_POST['id_categoria'])) {
                $result['exception'] = 'Categoría incorrecta';
            } elseif($result['dataset'] = $producto->readProductsCategory()){
                $result['status'] = 1;
            } elseif(Database::getException()){
                $result['exception'] = Database::getException();
            } else{
                $result['exception'] = 'Producto Inexistente';
            }
            break;
        case 'readOne':
            if(!$producto->setId($_POST['id_producto'])){
                $result['exception'] = 'Producto Incorrecto';
            } elseif($result['dataset'] = $producto->readOne()){
                $result['status'] = 1;
            } elseif(Database::getException()){
                $result['exception'] = Database::getException();
            } else{
                $result['exception'] = 'Producto Inexistente';
            }
            break;
        default:
            $result['exception'] = 'Acción no disponible';
        break;
    }
    //Indicamos el tipo de contenido a mostrar
    header('content-type: application/json; charset=utf-8');
    // Se imprime el resultado en formato Json y retorna el controlador
    print(json_encode($result));
} else{
    print(json_encode('Recurso no disponible'));
}

?>