<?php
require_once('../helpers/database.php');
require_once('../helpers/validator.php');
require_once('../models/empleados.php');

// Se comprueba si existe una acción a realizar, de lo contrario se finaliza el script con un mensaje de error.
if (isset($_GET['action'])) {
    // Se crea una sesión o se reanuda la actual para poder utilizar variables de sesión en el script.
    session_start();
    // Se instancia la clase correspondiente.
    $empleado = new Empleados;
    // Se declara e inicializa un arreglo para guardar el resultado que retorna la API.

    $result = array('status' => 0, 'session' => 0, 'message' => null, 'exception' => null, 'dataset' => null, 'codigo' => null);
    // Se verifica si existe una sesión iniciada como administrador, de lo contrario se finaliza el script con un mensaje de error.
    if (isset($_SESSION['id_empleado'])) {
        $result['session'] = 1;
        // Se compara la acción a realizar cuando un administrador ha iniciado sesión.
        switch ($_GET['action']) {
            case 'getUser':
                if (isset($_SESSION['codigo_empleado'])) {
                    $result['status'] = 1;
                    $result['codigo'] = $_SESSION['codigo_empleado'];
                    $result['nombre'] = $_SESSION['nombre_empleado'];
                    $result['foto'] = $_SESSION['foto_empleado'];
                    $result['rol'] = $_SESSION['tipo_empleado'];
                } else {
                    $result['exception'] = 'Codigo de empleado indefinido';
                }
                break;
            case 'logOut':
                if (session_destroy()) {
                    $result['status'] = 1;
                    $result['message'] = 'Sesión eliminada correctamente';
                } else {
                    $result['exception'] = 'Ocurrió un problema al cerrar la sesión';
                }
                break;
            case 'readProfile':
                if ($result['dataset'] = $empleado->readProfile()) {
                    $result['status'] = 1;
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'Empleado inexistente';
                }
                break;
            case 'editProfile':
                $_POST = $empleado->validateForm($_POST);
                if (!$empleado->setNombre_e($_POST['nombre_empleado'])) {
                    $result['exception'] = 'Nombre incorrecto';
                } elseif (!$empleado->setApellido_e($_POST['apellido_empleado'])) {
                    $result['exception'] = 'Apellido incorrecto';
                } elseif (!$empleado->setDUI_e($_POST['DUI_empleado'])) {
                    $result['exception'] = 'DUI incorrecto';
                } elseif (!$empleado->setDireccion_e($_POST['direccion_empleado'])) {
                    $result['exception'] = 'Direccion incorrecto';
                } elseif (!$empleado->setCodigo_e($_POST['codigo_empleado'])) {
                    $result['exception'] = 'Codigo incorrecto';
                } elseif (!$empleado->setTipo_e($_POST['tipo_empleado'])) {
                    $result['exception'] = 'Tipo empleado incorrecto';
                } elseif ($empleado->editProfile()) {
                    $result['status'] = 1;
                    $result['message'] = 'Perfil modificado correctamente';
                } else {    
                    $result['exception'] = Database::getException();
                }
                break;
            case 'changePassword':
                $_POST = $empleado->validateForm($_POST);
                if (!$empleado->setId($_SESSION['id_empleado'])) {
                    $result['exception'] = 'Empleado incorrecto';
                } elseif (!$empleado->checkPassword($_POST['actual'])) {
                    $result['exception'] = 'Clave actual incorrecta';
                } elseif ($_POST['nueva'] != $_POST['confirmar']) {
                    $result['exception'] = 'Claves nuevas diferentes';
                } elseif (!$empleado->setClave($_POST['nueva'])) {
                    $result['exception'] = $empleado->getPasswordError();
                } elseif ($empleado->changePassword()) {
                    $result['status'] = 1;
                    $result['message'] = 'Contraseña cambiada correctamente';
                } else {
                    $result['exception'] = Database::getException();
                }
                break;
            case 'readAll':
                if ($result['dataset'] = $empleado->readAll()) {
                    $result['status'] = 1;
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'No hay datos registrados';
                }
                break;
            case 'search':
                $_POST = $empleado->validateForm($_POST);
                if ($_POST['search'] == '') {
                    $result['exception'] = 'Ingrese un valor para buscar';
                } elseif ($result['dataset'] = $empleado->searchRows($_POST['search'])) {
                    $result['status'] = 1;
                    $result['message'] = 'Valor encontrado';
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'No hay coincidencias';
                }
                break;
            case 'create':
                $_POST = $empleado->validateForm($_POST);
                
                if (!$empleado->setNombre_e($_POST['nombre_empleado'])) {
                    $result['exception'] = 'Nombre incorrectos';
                } elseif (!$empleado->setApellido_e($_POST['apellido_empleado'])) {
                    $result['exception'] = 'Apellido incorrectos';
                } elseif (!$empleado->setDUI_e($_POST['DUI_empleado'])) {
                    $result['exception'] = 'DUI incorrecto';
                } elseif (!is_uploaded_file($_FILES['foto_empleado']['tmp_name'])) {
                    $result['exception'] = 'Seleccione una imagen';
                } elseif (!$empleado->setFoto_e($_FILES['foto_empleado'])) {
                    $result['exception'] = $empleado->getFileError();
                } elseif (!$empleado->setDireccion_e($_POST['direccion_empleado'])) {
                    $result['exception'] = 'Direccion incorrecto';
                } elseif (!$empleado->setCodigo_e($_POST['codigo_empleado'])) {
                    $result['exception'] = 'Codigo incorrecto';
                } elseif (!isset($_POST['tipo_empleado'])) {
                    $result['exception'] = 'Seleccione un tipo de empleado';
                } elseif (!$empleado->setTipo_e($_POST['tipo_empleado'])) {
                    $result['exception'] = 'Tipo empleado incorrecto';
                } elseif ($_POST['clave'] != $_POST['confirmar']) {
                    $result['exception'] = 'Claves diferentes';
                } elseif (!$empleado->setClave($_POST['clave'])) {
                    $result['exception'] = $empleado->getPasswordError();                    
                } elseif ($empleado->createRow()) {
                    $result['status'] = 1;
                    if ($empleado->saveFile($_FILES['foto_empleado'], $empleado->getRuta(), $empleado->getFoto_e())) {
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
                if (!$empleado->setId_e($_POST['id_empleado'])) {
                    $result['exception'] = 'Usuario incorrecto';
                } elseif ($result['dataset'] = $empleado->readOne()) {
                    $result['status'] = 1;
                } elseif (Database::getException()) {
                    $result['exception'] = Database::getException();
                } else {
                    $result['exception'] = 'Usuario inexistente';
                }
                break;
            case 'update':
                $_POST = $empleado->validateForm($_POST);
                if (!$empleado->setId_e($_POST['id_empleado'])) {
                    $result['exception'] = 'Usuario incorrecto';
                } elseif (!$empleado->readOne()) {
                    $result['exception'] = 'Usuario inexistente';
                } elseif (!$empleado->setNombre_e($_POST['nombre_empleado'])) {
                    $result['exception'] = 'Nombres incorrectos';
                } elseif (!$empleado->setApellido_e($_POST['apellido_empleado'])) {
                    $result['exception'] = 'Apellidos incorrectos';
                } elseif (!$empleado->setDUI_e($_POST['DUI_empleado'])) {
                    $result['exception'] = 'DUI incorrecto';
                } elseif (!$empleado->setDireccion_e($_POST['direccion_empleado'])) {
                    $result['exception'] = 'Direccion incorrecto';
                } elseif (!$empleado->setCodigo_e($_POST['codigo_empleado'])) {
                    $result['exception'] = 'Codigo incorrecto';
                } elseif (!$empleado->setTipo_e($_POST['tipo_empleado'])) {
                    $result['exception'] = 'Tipo empleado incorrecto';
                } elseif ($empleado->updateRow()) {
                    $result['status'] = 1;
                    $result['message'] = 'Usuario modificado correctamente';
                } else {
                    $result['exception'] = Database::getException();
                }
                break;
            case 'delete':
                if ($_POST['id_empleado'] == $_SESSION['id_empleado']) {
                    $result['exception'] = 'No se puede eliminar a sí mismo';
                } elseif (!$empleado->setId_e($_POST['id'])) {
                    $result['exception'] = 'Usuario incorrecto';
                } elseif (!$empleado->readOne()) {
                    $result['exception'] = 'Usuario inexistente';
                } elseif ($empleado->deleteRow()) {
                    $result['status'] = 1;
                    $result['message'] = 'Usuario eliminado correctamente';
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
                if ($empleado->readAll()) {
                    $result['status'] = 1;
                    $result['message'] = 'Existe al menos un usuario registrado';
                } else {
                    $result['exception'] = 'No existen usuarios registrados';
                }
                break;
            case 'register':
                $_POST = $empleado->validateForm($_POST);
                if (!$empleado->setNombre_e($_POST['nombre_empleado'])) {
                    $result['exception'] = 'Nombre incorrectos';
                } elseif (!$empleado->setApellido_e($_POST['apellido_empleado'])) {
                    $result['exception'] = 'Apellido incorrectos';
                } elseif (!$empleado->setDUI_e($_POST['DUI_empleado'])) {
                    $result['exception'] = 'DUI incorrecto';
                } elseif (!is_uploaded_file($_FILES['foto_empleado']['tmp_name'])) {
                    $result['exception'] = 'Seleccione una imagen';
                } elseif (!$empleado->setFoto_e($_FILES['foto_empleado'])) {
                    $result['exception'] = $empleado->getFileError();
                } elseif (!$empleado->setDireccion_e($_POST['direccion_empleado'])) {
                    $result['exception'] = 'Direccion incorrecto';
                } elseif (!$empleado->setCodigo_e($_POST['codigo_empleado'])) {
                    $result['exception'] = 'Codigo incorrecto';
                } elseif (!$empleado->setTipo_e(1)) {
                    $result['exception'] = 'Tipo empleado incorrecto';
                } elseif ($_POST['clave'] != $_POST['confirmar']) {
                    $result['exception'] = 'Claves diferentes';
                } elseif (!$empleado->setClave($_POST['clave'])) {
                    $result['exception'] = $empleado->getPasswordError();                    
                } elseif ($empleado->createRow()) {
                    $result['status'] = 1;
                    if ($empleado->saveFile($_FILES['foto_empleado'], $empleado->getRuta(), $empleado->getFoto_e())) {
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
            case 'logIn':
                $_POST = $empleado->validateForm($_POST);
                if (!$empleado->checkUser($_POST['codigo_empleado'])) {
                    $result['exception'] = 'Codigo incorrecto';
                } elseif (!$empleado->readUserName($_POST['codigo_empleado'])) {
                    $result['exception'] = 'Nombre no encontrado';
                } elseif (!$empleado->readUserRol($_POST['codigo_empleado'])) {
                    $result['exception'] = 'Rol no encontrado';
                } elseif ($empleado->checkPassword($_POST['clave'])) {
                    $result['status'] = 1;
                    $result['message'] = 'Autenticación correcta';
                    $_SESSION['id_empleado'] = $empleado->getId_e();
                    $_SESSION['codigo_empleado'] = $empleado->getCodigo_e();
                    $_SESSION['nombre_empleado'] = $empleado->getNombre_e();
                    $_SESSION['foto_empleado'] = $empleado->getFoto_e();
                    $_SESSION['tipo_empleado'] = $empleado->getTipo_e();
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
