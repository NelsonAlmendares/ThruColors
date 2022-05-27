<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/valoracion.php');

    // Se comprueba que haya una sesión iniciada, de lo contrario de envía un mensaje de error
    if(isset($_GET['action'])){

        //Se crea o se reinicia la sesión para utilizar las variables del script
        session_start();

        // Se instancia la clase para acceder a su contenido
        $valoracion = new Valoracion;
        //Iniciamos el arreglo para guardar el resultado en la API
        $result = array('status' => 0, 'messsage' => null, 'exception' => null);
        //Se verifica si hay una sesión iniciada
        if (isset($_SESSION['id_empleado'])) {
            // Se compara la acción a realizar cuando un administrador ha iniciado sesión.
            switch ($_GET['action']) {
                case 'readAll':
                    if ($result['dataset'] =  $valoracion->readAll()) {
                        $result['status'] = 1;
                    } elseif (Database::getException()) {
                        $result['exception'] = Database::getException();
                    } else {
                        $result['exception'] = 'No hay datos registrados';
                    }
                    break;
                default:
                    $result['exception'] = 'Acción no dispobible dentro de la sesión';
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