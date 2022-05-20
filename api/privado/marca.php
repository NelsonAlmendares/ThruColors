<?php 
require_once('../helpers/database.php');
require_once('../helpers/validator.php');
require_once('../models/marca.php');

// Se comprueba si existe una acción a realizar, de lo contrario se finaliza el script con un mensaje de error.
if (isset($_GET['action'])){

   // Se crea una sesión o se reanuda la actual para poder utilizar variables de sesión en el script.
   session_start();
   // Se instancia la clase correspondiente.
   $marca = new Marca;
    // Se declara e inicializa un arreglo para guardar el resultado que retorna la API.
    $result = array('status' => 0, 'message' => null, 'exception' => null);
    // Se verifica si existe una sesión iniciada como administrador, de lo contrario se finaliza el script con un mensaje de error.
    if (isset($_SESSION['id_empleado'])){
        // Se compara la acción a realizar cuando un administrador ha iniciado sesión.
        switch ($_GET['action']){
            case 'readAll':
                if ($result['dataset'] = $marca->readAll()){
                    $result['status'] = 1;
                }elseif (Database::getException()){
                    $result['exception'] = Database::getException();
                }else{
                    $result['exception'] = 'No hay maracas registradas';
                }
                break;
            case 'search':
                $_POST = $marca->validateForm($_POST);
                if ($_POST['buscar'] == ''){
                $result['exception'] = 'Ingrese un valor para buscar';
                }elseif($result['dataset'] = $marca -> searchRows($_POST['buscar'])){
                $result['status'] = 1;
                $result['message'] = 'Valor encontrado';
                }elseif (Database::getException()){
                $result['exception'] = Database::getException();
                }else{
                $result['exception'] = 'No hay coincidencias';
                }
                break;
            case 'create':
                $_POST =  $marca->validateForm($_POST);
                if (!$marca->setNombre_marca($_POST['nombre_marca'])) {
                    $result['exception'] = 'marca no aceptada';                
                } elseif ( $marca->createRow()) {
                    $result['status'] = 1;
                    $result['message'] = 'Marca creada correctamente';                    
                } else {
                    $result['exception'] = Database::getException();
                }
                break;
            case 'readOne':
                if(!$marca -> setid_marca($_POST['id_marca'])) {
                    $result['exception'] = 'Marca incorrecta';
                }elseif ($result['dataset'] = $marca -> readOne()) {
                    $result['status'] = 1;
                }elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                }else{
                    $result['exception'] = 'Marca inexistente';
                }
                break;
                case 'update':
                    $_POST =  $marca->validateForm($_POST);
                    if (! $marca->setid_marca($_POST['id_marca'])) {
                        $result['exception'] = 'Marca incorrecto';
                    } elseif (!$data =  $marca->readOne()) {
                        $result['exception'] = 'Marca inexistente';
                    } elseif (! $marca->setNombre_marca($_POST['nombre_marca'])) {
                        $result['exception'] = 'Marca no aceptado';                
                    } elseif ( $marca->updateRow()) {
                            $result['status'] = 1;
                            $result['message'] = 'Marca modificado correctamente';
                    } else {
                        $result['exception'] = Database::getException();
                    }
                    break;
            case 'delete':
                if(!$marca -> setid_marca($_POST['id_marca'])) {
                    $result['exception'] = 'Marca incorrecta';
                }elseif (!$data = $marca -> readOne()) {
                    $result['exception'] = 'Marca Inexistente';
                }elseif($marca -> deleteRow()){
                    $result['status'] = 1;
                    $result['message'] = 'Marca eliminada correctamente';
                }else{
                    $result['exception'] = Database::getException();
                }
                break;
            default:
                $result['exception'] = 'Accion no disponible dentros de la session';
        }
         // Se indica el tipo de contenido a mostrar y su respectivo conjunto de caracteres.
         header('content_type: application/json; charset=utf-8');
         // Se imprime el resultado en formato JSON y se retorna al controlador.
         print(json_encode($result));
    }else{
        print(json_encode('Acceso denegado'));
    }
}else{
    print(json_encode('Recurso no disponible'));
}