<?php
require('../../helpers/database.php');
require('../../helpers/validator.php');
require('../../libraries/fpdf182/fpdf.php');

/**
*   Clase para definir las plantillas de los reportes del sitio privado. Para más información http://www.fpdf.org/
*/
class Reportes extends FPDF
{
    // Propiedad para guardar el título del reporte.
    private $title = null;
    // Propiedad para guardar el nombre y apellido del empleado.
    private $nombre = null;
    private $apellido = null;    

    /*
    *   Método para iniciar el reporte con el encabezado del documento.    
    *   Parámetros: $title (título del reporte)
    *               $nombre (nombre del empledo que genero el reporte)
    *               $apellido (apellido del empledo que genero el reporte).
    *   Retorno: ninguno.
    */
    public function startReport($title, $nombre, $apellido)
    {
        // Se establece la zona horaria a utilizar durante la ejecución del reporte.
        ini_set('date.timezone', 'America/El_Salvador');        
        // Se verifica si un administrador ha iniciado sesión para generar el documento, de lo contrario se direcciona a main.php
        if (isset($_SESSION['id_empleado'])) {
            // Se asigna el título del documento a la propiedad de la clase.
            $this->title = $title;
            //Se le asigna el nombre y apellido a las variables
            $this->nombre = $nombre;
            $this->apellido = $apellido;
            // Se establece el título del documento (true = utf-8).
            $this->setTitle('ThruColors - Reporte', true);
            // Se establecen los margenes del documento (izquierdo, superior y derecho).
            $this->setMargins(15, 15, 15);
            // Se añade una nueva página al documento (orientación vertical y formato carta) y se llama al método header()
            $this->addPage('p', 'letter');
            // Se define un alias para el número total de páginas que se muestra en el pie del documento.
            $this->aliasNbPages();
        } else {
            header('location: ../../../views/dashboard/index.php');
        }
    }    

    /*
    *   Se sobrescribe el método de la librería para establecer la plantilla del encabezado de los reportes.
    *   Se llama automáticamente en el método addPage()
    */
    public function header()
    {
        // Se establece el logo.
        $this->image('../../imagenes/logo.png', 167, 5, 35);
        // Se ubica el título.
        $this->setFont('Arial', 'B', 15);
        $this->cell(185, 10, utf8_decode($this->title), 0, 1, 'C');
        // Se ubica el nombre del empleado, la fecha y hora del servidor.    
        $this->setFont('Arial', '', 10);
        $this->cell(185, 25, 'Nombre: '.utf8_decode($this->nombre).' '.utf8_decode($this->apellido).'                                                             
                                                     '.date('d M Y / H:i:s'), 0, 1, 'L');                
        //Para la fecha d/M/Y y para la hora H:i:s                
    }

    /*
    *   Se sobrescribe el método de la librería para establecer la plantilla del pie de los reportes.
    *   Se llama automáticamente en el método output()
    */
    public function footer()
    {
        // Se establece la posición para el número de página (a 15 milimetros del final).
        $this->setY(-15);
        // Se establece la fuente para el número de página.
        $this->setFont('Arial', 'I', 9);
        // Se imprime una celda con los derechos de ThruColors y con el número de página.
        $this->cell(0, 10, '2022 - Thru Colors   '.'                                                                                                
                                                                '.utf8_decode('Página ').$this->pageNo().'/{nb}', 0, 0, 'L');
    }
}
?>