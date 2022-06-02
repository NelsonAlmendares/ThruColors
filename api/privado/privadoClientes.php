<?php
require_once('../helpers/database.php');
require_once('../helpers/validator.php');
require_once('../models/clientes.php');

// Se comprueba si existe una acción a realizar, de lo contrario se finaliza el script con un mensaje de error.
if (isset($_GET['action'])) {
    // Se crea una sesión o se reanuda la actual para poder utilizar variables de sesión en el script.
    session_start();
    // Se instancia la clase correspondiente.
    $cliente = new Clientes;
    // Se declara e inicializa un arreglo para guardar el resultado que retorna la API.

    $result = array('status' => 0, 'session' => 0, 'message' => null, 'exception' => null, 'dataset' => null, 'codigo' => null);
    // Se verifica si existe una sesión iniciada como administrador, de lo contrario se finaliza el script con un mensaje de error.
    if (isset($_SESSION['id_empleado'])) {
        $result['session'] = 1;
        // Se compara la acción a realizar cuando un administrador ha iniciado sesión.
        switch ($_GET['action']) {


            /* 
*caso para obtener el usuario 
*/
            case 'getUser':
                if (isset($_SESSION['codigo_cliente'])) {
                    $result['status'] = 1;
                    $result['codigo'] = $_SESSION['codigo_cliente'];
                    $result['nombre'] = $_SESSION['nombre_cliente'];
                    $result['foto'] = $_SESSION['foto_cliente'];
                    $result['rol'] = $_SESSION['tipo_cliente'];
                } else {
                    $result['exception'] = 'Codigo de empleado indefinido';
                }
                break;


                /* 
*caso para cerrar sesion
*/
            case 'logOut':
                if (session_destroy()) {
                    $result['status'] = 1;
                    $result['message'] = 'Sesión eliminada correctamente';
                } else {
                    $result['exception'] = 'Ocurrió un problema al cerrar la sesión';
                }
                break;


/* 
*caso para leer los datos del perfil 
*/

            case 'readProfile':
                if ($result['dataset'] = $cliente->readProfile()) {
                    $result['status'] = 1;
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'Empleado inexistente';
                }
                break;


/* 
*caso para editar el perfil del cliente 
*/

            case 'editProfile':
                $_POST = $cliente->validateForm($_POST);
                if (!$cliente->setNombre_e($_POST['nombre_cliente'])) {
                    $result['exception'] = 'Nombre incorrecto';
                } elseif (!$cliente->setApellido_e($_POST['apellido_cliente'])) {
                    $result['exception'] = 'Apellido incorrecto';
                } elseif (!$cliente->setDUI_e($_POST['DUI_cliente'])) {
                    $result['exception'] = 'DUI incorrecto';
                } elseif (!$cliente->setDireccion_e($_POST['direccion_cliente'])) {
                    $result['exception'] = 'Direccion incorrecto';
                } elseif (!$cliente->setCodigo_e($_POST['codigo_cliente'])) {
                    $result['exception'] = 'Codigo incorrecto';
                } elseif (!$cliente->setTipo_e($_POST['tipo_cliente'])) {
                    $result['exception'] = 'Tipo empleado incorrecto';
                } elseif ($cliente->editProfile()) {
                    $result['status'] = 1;
                    $result['message'] = 'Perfil modificado correctamente';
                } else {    
                    $result['exception'] = Database::getException();
                }
                break;

/* 
*caso para cambiar contraseña del cliente 
*/

            case 'changePassword':
                $_POST = $cliente->validateForm($_POST);
                if (!$cliente->setId($_SESSION['id_cliente'])) {
                    $result['exception'] = 'Empleado incorrecto';
                } elseif (!$cliente->checkPassword($_POST['actual'])) {
                    $result['exception'] = 'Clave actual incorrecta';
                } elseif ($_POST['nueva'] != $_POST['confirmar']) {
                    $result['exception'] = 'Claves nuevas diferentes';
                } elseif (!$cliente->setClave($_POST['nueva'])) {
                    $result['exception'] = $cliente->getPasswordError();
                } elseif ($cliente->changePassword()) {
                    $result['status'] = 1;
                    $result['message'] = 'Contraseña cambiada correctamente';
                } else {
                    $result['exception'] = Database::getException();
                }
                break;



/* 
*caso para leer todos los datos del tb cliente 
*/


            case 'readAll':
                if ($result['dataset'] = $cliente->readAll()) {
                    $result['status'] = 1;
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'No hay datos registrados';
                }
                break;


/* 
*caso para buscar un cliente 
*/



            case 'search':
                $_POST = $cliente->validateForm($_POST);
                if ($_POST['buscar'] == '') {
                    $result['exception'] = 'Ingrese un valor para buscar';
                } elseif ($cliente->validatePhone($_POST['buscar'])) {
                    if ($result['dataset'] = $cliente->searchNumbers($_POST['buscar'])) {
                        $result['status'] = 1;
                        $result['message'] = 'Valor encontrado';
                    } else{
                        $result['exception'] = 'No hay coincidencias';
                    }
                } elseif ($cliente->validateAlphabetic($_POST['buscar'],0,500)) {
                    if ($result['dataset'] = $cliente->searchRows($_POST['buscar'])) {
                        $result['status'] = 1;
                        $result['message'] = 'Valor encontrado';
                    } else{
                        $result['exception'] = 'No hay coincidencias';
                    }
                } elseif ($cliente->validateEmail($_POST['buscar'])) {
                    if ($result['dataset'] = $cliente->searchEmails($_POST['buscar'])) {
                        $result['status'] = 1;
                        $result['message'] = 'Valor encontrado';
                    } else{
                        $result['exception'] = 'No hay coincidencias';
                    }
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'No hay coincidencias';
                }
                break;

/* 
*caso para crar un cliente 
*/


            case 'create':
                $_POST = $cliente->validateForm($_POST);                
                if (!$cliente->setNombre_c($_POST['nombre_cliente'])) {
                    $result['exception'] = 'Nombre incorrectos';
                } elseif (!$cliente->setApellido_c($_POST['apellido_cliente'])) {
                    $result['exception'] = 'Apellido incorrectos';
                } elseif (!$cliente->setCelular_c($_POST['celular_cliente'])) {
                    $result['exception'] = 'Celular incorrecto';
                } elseif (!is_uploaded_file($_FILES['foto_cliente']['tmp_name'])) {
                    $result['exception'] = 'Seleccione una imagen';
                } elseif (!$cliente->setFoto_c($_FILES['foto_cliente'])) {
                    $result['exception'] = $cliente->getFileError();
                } elseif (!$cliente->setDireccion_c($_POST['direccion_cliente'])) {
                    $result['exception'] = 'Direccion incorrecto';
                } elseif (!$cliente->setEmail_c($_POST['email_cliente'])) {
                    $result['exception'] = 'Email incorrecto';
                } elseif (!isset($_POST['estado_cliente'])) {
                    $result['exception'] = 'Seleccione un estado para el cliente';
                } elseif (!$cliente->setEstado_c($_POST['estado_cliente'])) {
                    $result['exception'] = 'Estado del cliente incorrecto';
                } elseif ($_POST['clave'] != $_POST['confirmar']) {
                    $result['exception'] = 'Claves diferentes';
                } elseif (!$cliente->setClave($_POST['clave'])) {
                    $result['exception'] = $cliente->getPasswordError();                    
                } elseif ($cliente->createRow()) {
                    $result['status'] = 1;
                    if ($cliente->saveFile($_FILES['foto_cliente'], $cliente->getRuta(), $cliente->getFoto_c())) {
                    $result['message'] = 'El cliente registrado correctamente';
                    } else {
                        $result['message'] = 'El cliente se registro pero no se guardó la imagen';
                    }
                } elseif (Database::getException()) {                   
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'El cliente no se registro correctamente';
                }
                break;


/* 
*caso para cleer un dato del cliente 
*/

            case 'readOne':
                if (!$cliente->setId_c($_POST['id_cliente'])) {
                    $result['exception'] = 'Cliente incorrecto';
                } elseif ($result['dataset'] = $cliente->readOne()) {
                    $result['status'] = 1;
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'Cliente inexistente';
                }
                break;


/* 
*caso para actualizar un cliente 
*/


            case 'update':
                $_POST = $cliente->validateForm($_POST);
                if (!$cliente->setId_c($_POST['id_cliente'])) {
                    $result['exception'] = 'Cliente incorrecto';
                } elseif (!$data = $cliente->readOne()) {
                    $result['exception'] = 'Cliente inexistente';
                } elseif (!$cliente->setNombre_c($_POST['nombre_cliente'])) {
                    $result['exception'] = 'Nombre incorrecto';
                } elseif (!$cliente->setApellido_c($_POST['apellido_cliente'])) {
                    $result['exception'] = 'Apellido incorrecto';
                } elseif (!$cliente->setCelular_c($_POST['celular_cliente'])) {
                    $result['exception'] = 'Celular incorrecto';
                } elseif (!$cliente->setDireccion_c($_POST['direccion_cliente'])) {
                    $result['exception'] = 'Direccion incorrecto';
                } elseif (!$cliente->setEmail_c($_POST['email_cliente'])) {
                    $result['exception'] = 'Email incorrecto';
                } elseif (!$cliente->setEstado_c($_POST['estado_cliente'])) {
                    $result['exception'] = 'Estado de cliente incorrecto';
                } elseif (!is_uploaded_file($_FILES['foto_cliente']['tmp_name'])) {
                    if ($cliente->updateRow($data['foto_cliente'])) {
                        $result['status'] = 1;
                        $result['message'] = 'Cliente modificado correctamente';
                    } else {
                        $result['exception'] = Database::getException();
                    }
                } elseif (!$cliente->setFoto_c($_FILES['foto_cliente'])) {
                    $result['exception'] = $cliente->getFileError();
                } elseif ($cliente->updateRow($data['foto_cliente'])) {
                    $result['status'] = 1;
                    if ($cliente->saveFile($_FILES['foto_cliente'], $cliente->getRuta(), $cliente->getFoto_c())) {
                        $result['message'] = 'Cliente modificado correctamente';
                    } else {
                        $result['message'] = 'Cliente modificado pero no se guardó la imagen';
                    }
                } else {
                    $result['exception'] = Database::getException();
                }
                break;

/* 
*caso para eliminar un cliente 
*/


            case 'delete':
                if (!$cliente->setId_c($_POST['id_cliente'])) {
                    $result['exception'] = 'Cliente incorrecto';
                } elseif (!$data = $cliente->readOne()) {
                    $result['exception'] = 'Cliente inexistente';
                } elseif ($cliente->deleteRow()) {
                    $result['status'] = 1;
                    if ($cliente->deleteFile($cliente->getRuta(), $data['foto_cliente'])) {
                        $result['message'] = 'Cliente eliminado correctamente';
                    } else {
                        $result['message'] = 'Cliente eliminado pero no se borró la imagen';
                    }                   
                } else {
                    $result['exception'] = Database::getException();
                }
                break;
            default:
                $result['exception'] = 'Acción no disponible dentro de la sesión';
        }
    } else {
        // Se compara la acción a realizar cuando el administrador no ha iniciado sesión.
        switch ($_GET['action']) {
            case 'readUsers':
                if ($cliente->readAll()) {
                    $result['status'] = 1;
                    $result['message'] = 'Existe al menos un usuario registrado';
                } else {
                    $result['exception'] = 'No existen usuarios registrados';
                }
                break;
            case 'register':
                $_POST = $cliente->validateForm($_POST);
                if (!$cliente->setNombre_e($_POST['nombre_cliente'])) {
                    $result['exception'] = 'Nombre incorrectos';
                } elseif (!$cliente->setApellido_e($_POST['apellido_cliente'])) {
                    $result['exception'] = 'Apellido incorrectos';
                } elseif (!$cliente->setDUI_e($_POST['DUI_cliente'])) {
                    $result['exception'] = 'DUI incorrecto';
                } elseif (!is_uploaded_file($_FILES['foto_cliente']['tmp_name'])) {
                    $result['exception'] = 'Seleccione una imagen';
                } elseif (!$cliente->setFoto_e($_FILES['foto_cliente'])) {
                    $result['exception'] = $cliente->getFileError();
                } elseif (!$cliente->setDireccion_e($_POST['direccion_cliente'])) {
                    $result['exception'] = 'Direccion incorrecto';
                } elseif (!$cliente->setCodigo_e($_POST['codigo_cliente'])) {
                    $result['exception'] = 'Codigo incorrecto';
                } elseif (!$cliente->setTipo_e(1)) {
                    $result['exception'] = 'Tipo empleado incorrecto';
                } elseif ($_POST['clave'] != $_POST['confirmar']) {
                    $result['exception'] = 'Claves diferentes';
                } elseif (!$cliente->setClave($_POST['clave'])) {
                    $result['exception'] = $cliente->getPasswordError();                    
                } elseif ($cliente->createRow()) {
                    $result['status'] = 1;
                    if ($cliente->saveFile($_FILES['foto_cliente'], $cliente->getRuta(), $cliente->getFoto_e())) {
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


/* 
*caso para inisiar sesion del cliente 
*/


            case 'logIn':
                $_POST = $cliente->validateForm($_POST);
                if (!$cliente->checkUser($_POST['codigo_cliente'])) {
                    $result['exception'] = 'Codigo incorrecto';
                } elseif (!$cliente->readUserName($_POST['codigo_cliente'])) {
                    $result['exception'] = 'Nombre no encontrado';
                } elseif (!$cliente->readUserRol($_POST['codigo_cliente'])) {
                    $result['exception'] = 'Rol no encontrado';
                } elseif ($cliente->checkPassword($_POST['clave'])) {
                    $result['status'] = 1;
                    $result['message'] = 'Autenticación correcta';
                    $_SESSION['id_cliente'] = $cliente->getId_e();
                    $_SESSION['codigo_cliente'] = $cliente->getCodigo_e();
                    $_SESSION['nombre_cliente'] = $cliente->getNombre_e();
                    $_SESSION['foto_cliente'] = $cliente->getFoto_e();
                    $_SESSION['tipo_cliente'] = $cliente->getTipo_e();
                } else {
                    $result['exception'] = 'Clave incorrecta';
                }
                break;
            default:
                $result['exception'] = 'Acción no disponible fuera de la sesión';
        }
    }
    // Se indica el tipo de contenido a mostrar y su respectivo conjunto de caracteres.
    header('content-type: application/json; charset=utf-8');
    // Se imprime el resultado en formato JSON y se retorna al controlador.
    print(json_encode($result));
} else {
    print(json_encode('Recurso no disponible'));
}
