<?php
require('../../helpers/reportes_public.php');
require('../../models/ventas.php');
require_once('../../helpers/database.php');
require_once('../../helpers/validator.php');

// Se instancia la clase para crear el reporte.
$pdf = new Reportes;
//Se verifica si hay una sesion activa, para poder utilizar las variables de session
session_start();
// Se inicia el reporte con el encabezado del documento.
$pdf->startReport('Venta realizada', $_SESSION['nombre_cliente'], $_SESSION['apellido_cliente'], $_SESSION['correo_cliente']);

// Se instancia el módelo Marca para obtener los datos.
$venta = new Ventas;

// Se declara una variable para guardar el id de la venta
$id_venta = null;
// Se obtiene del url el id de la venta
parse_url($id_venta = $_GET['id']);

// Se comprueba si existe una acción a realizar, de lo contrario se finaliza el script con un mensaje de error.
if($dataVentas = $venta->readRecibo($id_venta)){
    // Se establece la fuente para los encabezados.
    $pdf->setFont('Times', 'B', 11);  
    // Se establece un color de relleno para los encabezados de las tablas.
    $pdf->setFillColor(147,164,208);        
    // Se imprimen las celdas con los encabezados.
    $pdf->cell(30, 10, utf8_decode('Código'), 0, 0, 'C', 1);
    $pdf->cell(67, 10, utf8_decode('Descripción'), 0, 0, 'C', 1);
    $pdf->cell(30, 10, utf8_decode('Cantidad'), 0, 0, 'C', 1);             
    $pdf->cell(30, 10, utf8_decode('P. Unitario'), 0, 0, 'C', 1);             
    $pdf->cell(30, 10, utf8_decode('P. ToTal'), 0, 0, 'C', 1);             
    // Se recorren los registros ($dataVentas) fila por fila ($rowVentas).
    foreach ($dataVentas as $rowVentas) {
        $pdf->cell(0, 10,' ', 0, 1,);
        // Se establece la fuente para los datos.        
        $pdf->setFont('Arial', '', 9);
        // Se establece un color de relleno de la celda del nombre de pedido.
        $pdf->setFillColor(211,218,237);
        // Se imprime una celda con el nombre de la pedido.
        $pdf->cell(30, 10, utf8_decode($rowVentas['codigo']), 0, 0, 'C');
        $pdf->cell(67, 10, utf8_decode($rowVentas['nombre'].' '.$rowVentas['marca'].' ('.$rowVentas['presentacion'].')'), 0, 0, 'C');
        $pdf->cell(30, 10, utf8_decode($rowVentas['cantidad']), 0, 0, 'C');
        $pdf->cell(30, 10, '$'.$rowVentas['costo'], 0, 0, 'C');
        $sub_total = $rowVentas['costo'] * $rowVentas['cantidad'];
        $pdf->cell(30, 10, '$'.utf8_decode($sub_total), 0, 0, 'C');
    }   
                         
} else {
    $pdf->cell(0, 10, utf8_decode('No hay marcas para mostrar'), 1, 1);
}            

// Se envía el documento al navegador y se llama al método footer()
$pdf->output('I', 'Factura.pdf');