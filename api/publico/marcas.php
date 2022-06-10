<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/marca.php');

    // Se comprueba si existe una acción a realizar, de lo contrario se finaliza el script con un mensaje de error.
if (isset($_GET['action'])) {
    // Se instancian las clases correspondientes.
    $marca = new Marca;
    $result = array ('status' => 0, 'message' => null, 'message' => null);
    // Se compara la acción a realizar según la petición del controlador.
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
            $result['exception'] = 'Acción no disponible';
    }
    // Se indica el tipo de contenido a mostrar y su respectivo conjunto de caracteres.
    header('content-type: application/json; charset=utf-8');
    // Se imprime el resultado en formato JSON y se retorna al controlador.
    print(json_encode($result));
} else {
    print(json_encode('Recurso no disponible'));
}
?>