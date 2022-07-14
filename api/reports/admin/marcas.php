<?php
require('../../helpers/reportes_priv.php');
require('../../models/productos.php');
require('../../models/marca.php');

// Se instancia la clase para crear el reporte.
$pdf = new Reportes;
//Se verifica si hay una sesion activa, para poder utilizar las variables de session
session_start();
// Se inicia el reporte con el encabezado del documento.
$pdf->startReport('Productos por marca', $_SESSION['nombre_empleado'], $_SESSION['apellido_empleado']);

//Se le asigna el nombre del empleado
//$pdf->nombreEmpleado($_SESSION['nombre_empleado']);

// Se instancia el módelo Marca para obtener los datos.
$marca = new Marca;
// Se verifica si existen registros (marcas) para mostrar, de lo contrario se imprime un mensaje.
if ($dataMarcas = $marca->readAll()) {                
    // Se recorren los registros ($dataMarcas) fila por fila ($rowMarca).
    foreach ($dataMarcas as $rowMarca) {
        // Se establece la fuente para los encabezados.
        $pdf->setFont('Times', 'B', 11);
        // Se establece un color de relleno de la celda del nombre de marca.
        $pdf->setFillColor(147,164,208);
        // Se imprime una celda con el nombre de la marca.
        $pdf->cell(0, 10, utf8_decode('Marca: '.$rowMarca['nombre_marca']), 1, 1, 'C', 1);        
        // Se establece un color de relleno para los encabezados de las tablas.
        $pdf->setFillColor(211,218,237);        
        // Se imprimen las celdas con los encabezados.
        $pdf->cell(126, 10, utf8_decode('Nombre'), 1, 0, 'C', 1);
        $pdf->cell(30, 10, utf8_decode('Precio (US$)'), 1, 0, 'C', 1);
        $pdf->cell(30, 10, utf8_decode('Estado'), 1, 1, 'C', 1);
        // Se instancia el módelo Productos para procesar los datos.
        $producto = new Productos;
        // Se establece la categoría para obtener sus productos, de lo contrario se imprime un mensaje de error.
        if ($producto->setMarca($rowMarca['id_marca'])) {
            // Se establece la fuente para los datos de los productos.
            $pdf->setFont('Arial', '', 11);
            // Se verifica si existen registros (productos) para mostrar, de lo contrario se imprime un mensaje.
            if ($dataProductos = $producto->productosMarca()) {
                // Se recorren los registros ($dataProductos) fila por fila ($rowProducto).
                foreach ($dataProductos as $rowProducto) {
                    ($rowProducto['estado_producto']) ? $estado = 'Activo' : $estado = 'Inactivo';
                    // Se imprimen las celdas con los datos de los productos.
                    $pdf->cell(126, 10, utf8_decode($rowProducto['nombre_producto']), 1, 0);
                    $pdf->cell(30, 10, '$'.$rowProducto['costo_producto'], 1, 0);
                    $pdf->cell(30, 10, $estado, 1, 1);
                }
            } else {
                $pdf->cell(0, 10, utf8_decode('No hay productos para esta marca'), 1, 1);
            }
        } else {
            $pdf->cell(0, 10, utf8_decode('Marca incorrecta o inexistente'), 1, 1);
        }
    }
} else {
    $pdf->cell(0, 10, utf8_decode('No hay marcas para mostrar'), 1, 1);
}

// Se envía el documento al navegador y se llama al método footer()
$pdf->output('I', 'productos.pdf');