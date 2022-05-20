<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/categorias.php');

    // Se comprueba que haya una sesión iniciada, de lo contrario de envía un mensaje de error
    if(isset($_GET['action'])){

        //Se crea o se reinicia la sesión para utilizar las variables del script
        session_start();

        // Se instancia la clase para acceder a su contenido
        $categoria = new Categorias;
        //Iniciamos el arreglo para guardar el resultado en la API
        $result = array('status' => 0, 'session' => 0, 'message' => null, 'exception' => null, 'dataset' => null, 'codigo' => null);
        //Se verifica si hay una sesión iniciada
        if(isset($_SESSION['id_empleado'])){
            $result['session'] = 1;
            switch ($_GET['action']){
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
                    if($_POST['buscar'] == ''){
                        $result['exception'] = 'Ingrese un valor para buscar';
                    } elseif($result['dataset'] = $categoria->searchRows($_POST['buscar'])){
                        $result['status'] = 1;
                        $result['message'] = 'Valor encontrdo';
                    } elseif (Database::getException()){
                        $result['exception'] = Database::getException();
                    } else {
                        $result['exception'] = 'No hay coincidencias';
                    }
                break;
/* 
*este es el caso para crar una categoria 
*/
                case 'create':
                    $_POST = $categoria->validateForm($_POST);
                    if(!$categoria->setCategoria_p($_POST['categoria_producto'])){
                        $result['exception'] = 'Nombre de categoria incorrecta';
                    } elseif(!$categoria->setDescripcion_c($_POST['descripcion_categoria'])){
                        $result['exeption'] = 'Descripcion incorrecta';
                    } elseif(!is_uploaded_file($_FILES['foto_categoria']['tmp_name'])){
                        $result['exception'] = $categoria->getFileError();
                    } elseif(!$categoria->setFoto_c($_FILES['foto_categoria'])){
                        $result['exception'] = $categoria->getFileError();
                    } elseif($categoria->createRow()){
                        $result['status'] = 1;
                        if($categoria->saveFile($_FILES['foto_categoria'], $categoria->getRuta(), $categoria->getFoto_c())){
                            $result['message'] = 'Categoria creada correctamente';
                        } else{
                            $result['message'] = 'Categoría creada pero no se guardó la imagen';
                        }
                    } else{
                        $result['exception'] = Database::getException();
                    }
                break;


/* 
* case para la funcion leer uno 
*/
                case 'readOne':
                    if(!$categoria->setId_c($_POST['id_categoria'])){
                        $result['exception'] = 'Categoria incorrecta';
                    } elseif($result['dataset'] = $categoria->readOne()){
                        $result['status'] = 1;
                    } elseif(Database::getException()){
                        $result['exception'] = Database::getException();
                    } else{
                        $result['exception'] = 'Categpría inexistente';
                    }
                break;


/* 
*caso para la funcion actualizar 
*/

 
                case 'update':
                    $_POST = $categoria->validateForm($_POST);
                    if(!$categoria->setId_c($_POST['id_categoria'])){
                        $result['exception'] = 'Categoria incorrecta ';
                    } elseif(!$data = $categoria->readOne()){
                        $result['exception'] = 'Categoría inexistente';
                    } elseif(!$categoria->setCategoria_p($_POST['categoria_producto'])){
                        $result['exception'] = 'Nombre de categoria incorrecta';
                    } elseif(!$categoria->setDescripcion_c($_POST['descripcion_categoria'])){
                        $result['exception'] = 'Descripcion incorrecta';
                    } elseif(!is_uploaded_file($_FILES['foto_categoria']['tmp_name'])){
                        if($categoria->updateRow($data['foto_categoria'])){
                            $result['status'] = 1;
                            $result['messasge'] = 'Categoría modificada correctamente';
                        } else{
                            $result['exception'] = Database::getException();
                        }
                    } elseif(!$categoria->setFoto_c($_FILES['foto_categoria'])){
                        $result['exception'] = $categoria->getFileError();
                    } elseif($categoria->updateRow($data['foto_categoria'])){
                        $result['status'] = 1;
                        if($categoria->saveFile($_FILES['foto_categoria'], $categoria->getRuta(), $categoria->getFoto_c())){
                            $result['message'] = 'Categoría modificada correctamente    ';
                        } else{
                            $result['message']  = 'Categoria modificada pero no se guardó la imagen';
                        }
                    } else{
                        $result['exception'] = Database::getException();
                    }
                    break;



/* 
*caso para eliminar una categoria 
*/

                    case 'delete':
                        if(!$categoria->setId_c($_POST['id_categoria'])){
                            $result['exception'] = 'Categoria incorrecta';
                        } elseif(!$data = $categoria->readOne()){
                            $result['excpetion'] = 'Categoria inexistente';
                        } elseif($categoria->deleteRow()){
                            $result['status'] = 1;
                            if($categoria->deleteFile($categoria->getRuta(), $data['foto_categoria'])){
                                $result['message'] = 'Categoria eliminada correctamente';
                            } else{
                                $result['message'] = 'Categoria eliminada pero no se borro la imagen';
                            }
                        } else{
                            $result['exception'] = Database::getException();
                        }
                    break;
                default:
/* 
*aca se imprimen los errores 
*/

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