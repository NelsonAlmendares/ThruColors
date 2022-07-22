<?php 
require('../../helpers/reportes_priv.php');
require('../../models/empleados.php');
require('../../models/tipo_empleado.php');

//Se instancia la clase para crear el reporte.
$pdf = new Reportes;
//Se verifica si hay una sesion activa, para poder utilizar las variables de session.
session_start();
// Se inicia el reporte con el encabezado del documento.
$pdf->startReport('Tipo empleado', $_SESSION['nombre_empleado'], $_SESSION['apellido_empleado'], $_SESSION['codigo_empleado']);
//Se le asigna el nombre del empleado
//$pdf->nombreEmpleado($_SESSION['nombre_empleado']);

// Se instancia el módelo Tipo empleado para obtener los datos.
$tipo_empleado = new Tipo_empleado;
// Se verifica si existen registros (marcas) para mostrar, de lo contrario se imprime un mensaje.
if ($dataTipo_empleado = $tipo_empleado -> readTipoEm()){
    // Se establece la fuente para los encabezados.
    $pdf -> setFont('Times', 'B', 11);
    // Se establece un color de relleno para los encabezados de las tablas.
    $pdf ->setFillColor(147,164,208);
    // Se imprimen las celdas con los encabezados.
    $pdf -> cell(93, 10, utf8_decode('Nombre'),1,0,'C', 1);
    $pdf -> cell(93, 10, utf8_decode('Apellido'),1, 1,'C', 1);
     // Se recorren los registros ($datatipo_empleado) fila por fila ($rowTipoEm).
    foreach($dataTipo_empleado as $rowTipoEm){
        //Se evalua si existen empleados en el tipo empleado para mostrar, de lo contrario no se muestra
        if($rowTipoEm['cantidad']> 0 ){
            // Se establece la fuente para los encabezados. 
            $pdf -> setFont('Times', 'B', 11);
            // Se establece un color de relleno de la celda del nombre de empleado.
            $pdf -> setFillColor(211,218,237);
            // Se imprime una celda con el nombre del empleado.
            $pdf -> cell(0,10,utf8_decode('Tipo Empleado: '.$rowTipoEm['tipoEmpleado']),1, 1, 'C',1);

            // Se instancia el módelo Empleado para procesar los datos.
            $empleado = new Empleados;
            // Se establece el tipo empleado para obtener el empleado, de lo contrario se imprime un mensaje de error.
            if($empleado -> setTipo_e($rowTipoEm['id_tipoEmpleado'])) {
                // Se establece la fuente para los datos de los productos.
                $pdf -> setFont('Arial','',11);
                // Se verifica si existen registros (empleados) para mostrar, de lo contrario se imprime un mensaje.
                if($dataTipo_empleado = $empleado -> empleadosTipos()){
                // Se recorren los registros ($datatipo_empleado) fila por fila ($rowTipoEm).
                foreach($dataTipo_empleado as $rowTipoEm){
                    // Se imprimen las celdas con los datos de los empleados.
                    $pdf -> cell(93, 10, utf8_decode($rowTipoEm['nombre_empleado']),1,0);
                    $pdf -> cell(93, 10, utf8_decode($rowTipoEm['apellido_empleado']),1,1);
                }
                }else{

                }
            }else{
                $pdf -> cell(0, 10, utf8_decode('Tipo empleado incorrecto o inexistente'), 1, 1);
            }
        }
    }
}else{
    $pdf->cell(0, 10, utf8_decode('No hay Tipos empleados para mostrar'), 1, 1);
}
// Se envía el documento al navegador y se llama al método footer()
$pdf->output('I', 'Tipo_Empleado.pdf');