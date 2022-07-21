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
