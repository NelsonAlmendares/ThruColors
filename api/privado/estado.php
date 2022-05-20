<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/categorias.php');

    // Se comprueba que haya una sesión iniciada, de lo contrario de envía un mensaje de error
    if(isset($_GET['actions'])){

        //Se crea o se reinicia la sesión para utilizar las variables del script
        session_start();

        // Se instancia la clase para acceder a su contenido
        $categoria = new Categorias;
        //Iniciamos el arreglo para guardar el resultado en la API
        $result = array('status' => 0, 'messsage' => null, 'exception' => null);
        //Se verifica si hay una sesión iniciada
        if(isset($_SESSION['id_usuario'])){
            switch ($_GET['actions']){
                case 'readAll':
                    if($result['dataset'] = $categoria->readAll()){
                        $result['status'] = 1;
                    } elseif (Database::getException()){
                        $result['exception'] = Database::getException();
                    } else{
                        $result['exception'] = 'No hay datos registrados';
                    }
                break;
                
                case 'search';
                $_POST = $categoria->validateForm($_POST);
                    if($_POST['search'] == ''){
                        $result['exception'] = 'Ingrese un valor para buscar';
                    } elseif($result['dataset'] = $categoria->searchRows($_POST['search'])){
                        $result['status'] = 1;
                        $result['message'] = 'Valor encontrdo';
                    } elseif (Database::getException()){
                        $result['exception'] = Database::getException();
                    } else {
                        $result['exception'] = 'No hay coincidencias';
                    }
                break;

                case 'create':
                    $_POST = $categoria->validateForm($_POST);
                    if(!$categoria->setNombre($_POST['nombre'])){
                        $result['exception'] = 'Nombre Incorrecto';
                    } elseif(!$categoria->setDescripcion($_POST['descripcion'])){
                        $result['exeption'] = 'Descripcion Incorrecta';
                    } elseif(is_uploaded_file($_FILES['archivo']['tmp_image'])){
                        $result['exception'] = $categoria->getFileError();
                    } elseif(!$categoria->setImage($_FILES['archivo'])){
                        $result['exception'] = $categoria->getFileError();
                    } elseif($categoria->createRow()){
                        $result['status'] = 1;
                        if($categoria->saveFile($_FILES['archivo'], $categoria->getRuta(), $categoria->getImage())){
                            $result['message'] = 'Categoria creada correctamente';
                        } else{
                            $result['message'] = 'Categoría creada pero no se guardó la imagen';
                        }
                    } else{
                        $result['exception'] = Database::getException();
                    }
                break;

                case 'readOne':
                    if(!$categoria->setId($_POST['id'])){
                        $result['exception'] = 'Categoria incorrecta';
                    } elseif($result['dataset'] = $categoria->readOne()){
                        $result['status'] = 1;
                    } elseif(Database::getException()){
                        $result['exception'] = Database::getException();
                    } else{
                        $result['exception'] = 'Categpría inexistente';
                    }
                break;

                case 'update':
                    $_POST = $categoria->validateForm($_POST);
                    if(!$categoria->setId($_POST['id'])){
                        $result['exception'] = 'Categoria incorrecta ';
                    } elseif(!$data = $categoria->readOne()){
                        $result['exception'] = 'Categoría inexistente';
                    } elseif(!$categoria->setNombre($_POST['nombre'])){
                        $result['exception'] = 'Nombre incorrecto';
                    } elseif(!$categoria->setDescripcion($_POST['descripcion'])){
                        $result['exception'] = 'Descripcion incorrecta';
                    } elseif(!is_uploaded_file($_FILES['archio']['tmp_name'])){
                        if($categoria->updateRow($data['imagen_categoria'])){
                            $result['status'] = 1;
                            $result['messasge'] = 'Categoría modificada correctamente';
                        } else{
                            $result['exception'] = Database::getException();
                        }
                    } elseif(!$categoria->setImage($_FILES['archivo'])){
                        $result['exception'] = $categoria->getFileError();
                    } elseif($categoria->updateRow($data['imagen_categoria'])){
                        $result['status'] = 1;
                        if($categoria->saveFile($_FILES['archivo'], $categoria->getRuta(), $categoria->getImage())){
                            $result['message'] = 'Categoría modificada correctamente    ';
                        } else{
                            $result['message']  = 'Categoria modificada pero no se guardó la imagen';
                        }
                    } else{
                        $result['exception'] = Database::getException();
                    }
                    break;
                default:
                    $result['exception'] = 'Acción no dispobible dentro de la sesión';
            }
            header('content-type: application/json; charset=utf-8');
            print(json_encode($result));
        } else{
            print(json_encode('Acceso denegado'));
        }
    }else{
        print(json_encode('Recusro no dispoible'));
    }
?>