<?php
    require_once('../helpers/database.php');
    require_once('../helpers/validator.php');
    require_once('../models/productos.php');

    if(isset($_GET['actions'])){
        session_start();

        $producto = new Productos;
        $result = array('status' => 0, 'message' => null, 'exception' => null);
        if (isset($_SESSION['id_usuario'])) {
            switch ($_GET['actions']) {
                case 'readAll':
                    if($result['dataset'] = $producto->readAll()){
                        $result['status'] = 1;
                    } elseif(Database::getException()){
                        $result['exception'] = Database::getException();
                    } else{
                        $result['exception'] = 'No hay registrados';
                    }
                    break;
                case 'search':
                    $_POST = $producto->validateForms($_POST);
                    if($_POST['search'] == ''){
                        $result['exception'] = 'Ingrese un valor para buscar';
                    } elseif($result['dataset'] = $producto->searchRows($_POST['search'])){
                        $result['status'] = 1;
                        $result['message'] = 'Valor encontrado';
                    } elseif(Database::getException()){
                        $result['dataset'] = Database::getException();
                    } else{
                        $result['exception'] = 'No hay coincidencias';
                    }
                break;

                case 'create':
                    $_POST = $producto->validateForms($_POST);
                    if (!$producto->setNombre($_POST['nombreProducto'])) {
                        $result['exception'] = 'Nombre Incorrecto';
                    } elseif(!$producto->setPrecio($_POST['costoProducto'])){
                        $result['exception'] = 'Precio incorrecto';
                    } elseif(!$producto->setDescripcion($_POST['descripcionProducto'])){
                        $result['exception'] = 'Descripcion Incorrecta';
                    } elseif(!$producto->setImage($_FILES['archivo'])){
                        $result['exception'] = $producto->getFoto();
                    } elseif (!$producto->setCantidad($_POST['categoria'])) {
                        $result['exception'] = 'Categoria incorrecta';
                    } elseif(!$producto->setEstado($_POST['estado'])){
                        $result['exception'] = 'Seleccione un estado';
                    } elseif(!$producto->setEmpleado($_POST['empleado'])){
                        $result['exception'] = 'Empleado incorrecto';
                    } elseif(!$producto->setMarca($_POST['marca'])) {
                        $result['exception'] = 'Seleccione una marca';
                    } elseif(!$producto->setGenero($_POST['genero'])){
                        $result['exception'] = 'Seleciona el genero';
                    } elseif(!$producto->setCategoria($_POST['categoria'])){
                        $result['exception'] = 'Selecciona una categoria';
                    } elseif(!$producto->setPresentacion($_POST['presentacion'])){
                        $result['exception'] = 'Presentacion incorrecta';
                    } elseif($producto->createRow()){
                        if($producto->saveFile($_FILES['archivo'], $producto->getRuta(), $producto->getFoto())){
                            $result['message'] = 'Producto guardado satisfactoriamente';
                        }else{
                            $result['message'] = 'Producto creado pero no se guardo la imagen';
                        }
                    }
                    else{
                        $result['exception'] = Database::getException();
                    }
                break;

                case 'readOne':
                    if(!$producto->setId($_POST['id'])){
                        $result['exception'] = 'Producto incorrecto';
                    } elseif($result['dataset'] = $producto->readOne()){
                        $result['status'] = 1;
                    } elseif(Database::getException()){
                        $result['exception'] = Database::getException();
                    }else{
                        $result['exception'] = 'Producto Inexistente';
                    }
                break;

                case 'update':
                    $_POST = $producto->validateForms($_POST);
                    if(!$producto->setId($_POST['id'])){
                        $result['exception'] = 'Producto Incorrecto';
                    } elseif(!$data = $producto->readOne()){
                        $result['exception'] = 'Producto inexistente';
                    } elseif(!$producto->setNombre($_POST['nombreProducto'])){
                        $result['exception'] = 'Nombre incorrecto';
                    } elseif(!$producto->setPrecio($_POST['costoProducto'])){
                        $result['exception'] = 'Precio no valido';
                    } elseif(!$producto->setDescripcion($_POST['descripcionProducto'])){
                        $result['exception'] = 'Descripcion incorrecta';   
                    } elseif(!$producto->setCantidad($_POST['cantidadProducto'])){
                        $result['exception'] = 'Cantidad incorrecta';
                    } elseif(!$producto->setEstado($_POST['estadoProducto'])){
                        $result['exception'] = 'Selecione un estado'; 
                    } elseif(!$producto->setEmpleado($_POST['empleado'])){
                        $result['exception'] = 'Empleado no valido';
                    } elseif(!$producto->setMarca($_POST['marcaProducto'])){
                        $result['exception'] = 'Seleccione una marca';
                    } elseif(!$producto->setCategoria($_POST['categoriaProducto'])){
                        $result['exception'] = 'Seleeccione una categoria';
                    } elseif(!$producto->setPresentacion($_POST['presentacionProducto'])){
                        $result['exception'] = 'Seleccione una presentacio';
                    } elseif(!is_uploaded_file($_FILES['archivo']['tmp_name'])){
                        if($producto->updateRow($data['foto'])){
                            $result['status'] = 1;
                            $result['message'] = 'Producto modificado correctamente';
                        } else{
                            $result['exception'] = Database::getException();
                        }
                    } elseif(!$producto->setImage($_FILES['archivo'])){
                        $result['exception'] =  $producto->getFileError();
                    } elseif($producto->updateRow($data['foto_producto'])){
                        $result['status'] = 1;
                        if ($producto->saveFile($_FILES['archivo'], $producto->getRuta(), $producto->getFoto())) {
                            $result['message'] = 'Producto modificado correctamente';
                        } else{
                            $result['message'] = 'Producto modificado pero no se guardó la imagen';
                        }
                    } else{
                        $result['exception'] = Database::getException();
                    }
                break;
            }
        }
    }
?>