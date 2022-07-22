<?php
require('../../helpers/reportes_priv.php');
require('../../models/productos.php');
require('../../models/categorias.php');

//Se instancia la clase para crear el reporte.
$pdf = new Reportes;
//Se verifica si hay una sesion activa, para poder utilizar las variables de session.
session_start();
// Se inicia el reporte con el encabezado del documento.
$pdf->startReport('Productos por categorias', $_SESSION['nombre_empleado'], $_SESSION['apellido_empleado'], $_SESSION['codigo_empleado']);
//Se le asigna el nombre del empleado
//$pdf->nombreEmpleado($_SESSION['nombre_empleado']);

// Se instancia el módelo Tipo empleado para obtener los datos.
$categoria = new Categorias;
// Se verifica si existen registros (marcas) para mostrar, de lo contrario se imprime un mensaje.
if ($dataCategorias = $categoria -> CategoriaP()){
    // Se establece la fuente para los encabezados.
    $pdf -> setFont('Times', 'B', 11);
    // Se establece un color de relleno para los encabezados de las tablas.
    $pdf ->setFillColor(147,164,208);
    // Se imprimen las celdas con los encabezados.
    $pdf -> cell(93, 10, utf8_decode('Nombre'),1,0,'C', 1);
    $pdf -> cell(93, 10, utf8_decode('Costo'),1,1,'C', 1);
    //Se evalua si existen productos en las categorias para mostrar, de lo contrario no se muestra
    foreach($dataCategorias as $rowCategoriaP){
        //Se evalua si existen empleados en el tipo empleado para mostrar, de lo contrario no se muestra
        if ($rowCategoriaP['cantidad'] > 0){
        // Se establece la fuente para los encabezados.
        $pdf -> setFont('Times', 'B', 11);
        // Se establece un color de relleno para los encabezados de las tablas.
        $pdf ->setFillColor(147,164,208);
        // Se imprimen las celdas con los encabezados.
        $pdf -> cell(0,10,utf8_decode('Categoria: '.$rowCategoriaP['categoria_producto']),1, 1, 'C',1);
                   
        // Se instancia el módelo Producto para procesar los datos.
        $productos = new Productos;
        // Se establece la categoria para obtener el producto, de lo contrario se imprime un mensaje de error.
        if ($productos -> setCategoria($rowCategoriaP['id_categoria'])) {
        // Se establece la fuente para los datos de los productos.
        $pdf -> setFont('Arial','',11);
        // Se verifica si existen registros (productos) para mostrar, de lo contrario se imprime un mensaje.
        if($dataCategorias = $productos -> productoCate()){
        // Se recorren los registros ($dataCategorias) fila por fila ($rowCategoriaP).
        foreach ($dataCategorias as $rowCategoriaP) {
        // Se imprimen las celdas con los datos de los empleados.
        $pdf -> cell(93, 10, utf8_decode($rowCategoriaP['nombre_producto']),1,0);
        $pdf -> cell(93, 10, utf8_decode($rowCategoriaP['costo_producto']),1,1);

       }
        }
    }else{
        $pdf -> cell(0, 10, utf8_decode('Categoria incorrecto o inexistente'), 1, 1);
    }
    }
}
}else{
    $pdf->cell(0, 10, utf8_decode('No hay Categorias para mostrar'), 1, 1);
}
// Se envía el documento al navegador y se llama al método footer()
$pdf->output('I', 'Categoria_Producto.pdf');