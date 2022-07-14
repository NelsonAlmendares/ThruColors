<?php

    class Productos extends Validator{
        private $id = null;
        private $nombreProducto = null;
        private $costoProducto = null;
        private $descripcionProducto = null;
        private $fotoProducto = null;
        private $cantidadProducto = null;
        private $estadoProducto = null;
        private $empleado = null;
        private $marcaProducto = null;
        private $generoProducto = null;
        private $categoriaProducto = null;
        private $presentacionProducto = null;
        private $nombre_marca = null;
        private $ruta = '../imagenes/productos/';

        /* Metodos para validar y asignar los valores que se tomaran para los atributos */
        public function setId($value){
            if ($this->validateNaturalNumber($value)) {
                $this-> id = $value;
                return true;
            }else{
                return false;
            }
        }

        public function setNombre($value){
            if($this->validateAlphanumeric($value, 1, 50)){
                $this->nombreProducto = $value;
                return true;
            }else{
                return false;
            }
        }

        public function setPrecio($value){
            if ($this->validateMoney($value)) {
                $this->costoProducto = $value;
                return true;
            }else{
                return false;
            }
        }

        public function setDescripcion($value){
            if ($this->validateAlphabetic($value, 1, 150)) {
                $this->descripcionProducto = $value;
                return true;
            }else{
                return false;
            }
        }

        public function setImage($file){
            if ($this->validateImageFile($file, 800, 800)) {
                $this->fotoProducto = $this->getFileName();
                return true;
            }else{
                return false;
            }
        }

        public function setCantidad($value){
            if ($this->validateNaturalNumber($value)) {
                $this->cantidadProducto = $value;
                return true;
            }else{
                return false;
            }
        }

        public function setEstado($value){
            if ($this->validateNaturalNumber($value)) {
                $this->estadoProducto = $value;
                return true;
            }else{
                return false;
            }
        }

        public function setEmpleado($value){
            if ($this->validateNaturalNumber($value)) {
                $this->empleado = $value;
                return true;
            }else{
                return false;
            }
        }
        
        public function setMarca($value){
            if ($this->validateNaturalNumber($value)) {
                $this->marcaProducto = $value;
                return true;
            }else{
                return false;
            }
        }

        public function setGenero($value){
            if ($this->validateNaturalNumber($value)) {
                $this->generoProducto = $value;
                return true;
            }else{
                return false;
            }
        }

        public function setCategoria($value){
            if ($this->validateNaturalNumber($value)) {
                $this->categoriaProducto = $value;
                return true;
            }else{
                return false;
            }
        }

        public function setPresentacion($value){
            if ($this->validateNaturalNumber($value)) {
                $this->presentacionProducto = $value;
                return true;
            }else{
                return false;
            }
        }

        public function setNombre_marca($value){
            if ($this->validateBoolean($value)){
                $this->nombre_marca = $value;
                return true;
            }else{
                return false;
            }
        }

        /* Medodos para obtener los valores de los atributos */
        public function getId(){
            return $this->id;
        }

        public function getNombre(){
            return $this->nombreProducto;
        }

        public function getCosto(){
            return $this->costoProducto;
        }
        
        public function getDescripcion(){
            return $this->descripcionProducto;
        }

        public function getFoto(){
            return $this-> fotoProducto;
        }

        public function getCantidad(){
            return $this-> cantidadProducto;
        }

        public function getEstado(){
            return $this-> estadoProducto;
        }

        public function getEmpleado(){
            return $this-> empleado;
        }

        public function getMarca(){
            return $this-> marcaProducto;
        }

        public function getGenero(){
            return $this-> generoProducto;
        }

        public function getCategiria(){
            return $this-> categoriaProducto;
        }

        public function getPresentacion(){
            return $this->presentacionProducto;
        }

        public function getRuta(){
            return $this->ruta;
        }

        public function getNombre_marca(){
        return $this->nombre_marca;
        }

        /* Metodos para realizar las operaciones SCRUD */

        /* Funcion para hacer la busqueda en la base por medio de parametros como son nombre y descripcion */
        public function searchRows($value){
            $sql = 'SELECT id_producto as ID, nombre_producto as nombre, foto_producto as foto, descripcion_producto as descripcion, costo_producto as costo, estado_producto as estado, nombre_marca as marca, categoria_producto as categoria, presentacion_producto as presentacion
            FROM tb_producto tp INNER JOIN tb_estado te ON tp."id_estadoProducto" = te.id_estado 
            INNER JOIN tb_marca tm ON tp."id_marcaProducto" = tm.id_marca
            INNER JOIN "tb_categoria" tc ON tp."id_categoriaProducto" = tc.id_categoria
            INNER JOIN tb_presentacion tb ON tp."id_presentacionProducto" = tb.id_presentacion
            WHERE nombre_producto ILIKE ?
            ORDER BY id_producto ';
            $params = array("%$value%");
            return Database::getRows($sql, $params);
        }

        /* Funcion para los inserts de la vista a la base */
        public function createRow(){
            $sql = 'INSERT INTO "tb_producto" (nombre_producto, costo_producto, descripcion_producto, foto_producto, cantidad_producto,"id_estadoProducto", id_empleado, "id_marcaProducto", "id_generoProducto","id_categoriaProducto","id_presentacionProducto")
            VALUES (?,?,?,?,?,?,?,?,?,?,?)';
            $params = array($this->nombreProducto, $this->costoProducto, $this->descripcionProducto, $this->fotoProducto, $this->cantidadProducto, $this->estadoProducto, $_SESSION['id_empleado'], $this->marcaProducto,  $this->generoProducto, $this->categoriaProducto, $this->presentacionProducto);
            return Database::executeRow($sql, $params);
        }

        public function readOne(){
            $sql = 'SELECT id_producto as ID, nombre_producto as nombre, foto_producto as foto, descripcion_producto as descripcion, costo_producto as costo, cantidad_producto as cantidad, estado_producto as estado, nombre_empleado as empleado, nombre_marca as marca, genero_producto as genero, categoria_producto as categoria, presentacion_producto as presentacion
                    FROM tb_producto tp 
                    INNER JOIN tb_estado te ON tp."id_estadoProducto" = te.id_estado 
                    INNER JOIN tb_marca tm ON tp."id_marcaProducto" = tm.id_marca
                    INNER JOIN "tb_categoria" tc ON tp."id_categoriaProducto" = tc.id_categoria
                    INNER JOIN tb_presentacion tb ON tp."id_presentacionProducto" = tb.id_presentacion
                    INNER JOIN tb_empleado tem ON tp.id_empleado = tem.id_empleado
                    INNER JOIN tb_genero tg ON tp."id_generoProducto" = tg.id_genero
                    WHERE id_producto = ?
                    ORDER BY id_producto';
            $params = array($this->id);
            return Database::getRow($sql, $params);
        }

        public function filter(){
            $sql = '';
        }

        /* Función para mandar a llamar a todos los registros que se tengan de la base  */
        public function readAll(){
            $sql = 'SELECT id_producto as ID, nombre_producto as nombre, foto_producto as foto, descripcion_producto as descripcion, costo_producto as costo, estado_producto as estado, nombre_marca as marca, categoria_producto as categoria, presentacion_producto as presentacion
                FROM tb_producto tp INNER JOIN tb_estado te ON tp."id_estadoProducto" = te.id_estado 
                INNER JOIN tb_marca tm ON tp."id_marcaProducto" = tm.id_marca
                INNER JOIN "tb_categoria" tc ON tp."id_categoriaProducto" = tc.id_categoria
                INNER JOIN tb_presentacion tb ON tp."id_presentacionProducto" = tb.id_presentacion
                ORDER BY nombre_producto';
            $params = null;
            return Database::getRows($sql, $params);
        }

        /* Función para actualizar un registro desde la vista de la aplicacion dejando la imagen actual que contiene */
        public function updateRow($current_image){
            ($this->fotoProducto) ? $this->deleteFile($this->getRuta(), $current_image) : $this->fotoProducto = $current_image;
            $sql = 'UPDATE public."tb_producto"
	            SET foto_producto=?, nombre_producto=?, costo_producto=?, descripcion_producto=?, cantidad_producto=?, "id_estadoProducto"=?, id_empleado=?, "id_marcaProducto"=?, "id_generoProducto"=?, "id_categoriaProducto"=?, "id_presentacionProducto"=?
	            WHERE id_producto = ?';
            $params = array($this->fotoProducto, $this->nombreProducto, $this->costoProducto, $this->descripcionProducto, $this->cantidadProducto, $this->estadoProducto, $this->empleado, $this->marcaProducto,  $this->generoProducto, $this->categoriaProducto, $this->presentacionProducto, $this->id);
            return Database::executeRow($sql, $params);
        }

        /* Funcion para eliminar un registro de la base */
        public function deleteRow(){
           $sql = 'DELETE FROM tb_producto
	                WHERE id_producto = ?';
            $params = array($this->id);
            return Database::executeRow($sql,  $params);
        }

        /* Funcion para mostrar la categorias de los productos en un tabla */
        public function readProductsCategory(){
            $sql = 'SELECT id_producto as ID, nombre_producto as nombre, foto_producto as foto, descripcion_producto as descripcion, costo_producto as costo, estado_producto as estado, nombre_marca as marca, categoria_producto as categoria, presentacion_producto as presentacion
                FROM tb_producto tp INNER JOIN tb_estado te ON tp."id_estadoProducto" = te.id_estado 
                INNER JOIN tb_marca tm ON tp."id_marcaProducto" = tm.id_marca
                INNER JOIN "tb_categoria" tc ON tp."id_categoriaProducto" = tc.id_categoria
                INNER JOIN tb_presentacion tb ON tp."id_presentacionProducto" = tb.id_presentacion
                WHERE nombre_marca = ? 
                ORDER BY id_producto';
            $params = array($this->nombre_marca);
            return Database::getRows($sql, $params);
        }

        public function filtrarProductosMarca(){
            $sql = 'SELECT id_producto as ID, nombre_producto as nombre, foto_producto as foto, descripcion_producto as descripcion, costo_producto as costo, estado_producto as estado, nombre_marca as marca, categoria_producto as categoria, presentacion_producto as presentacion
                FROM tb_producto tp INNER JOIN tb_estado te ON tp."id_estadoProducto" = te.id_estado 
                INNER JOIN tb_marca tm ON tp."id_marcaProducto" = tm.id_marca
                INNER JOIN "tb_categoria" tc ON tp."id_categoriaProducto" = tc.id_categoria
                INNER JOIN tb_presentacion tb ON tp."id_presentacionProducto" = tb.id_presentacion
                WHERE id_marca = ? 
                ORDER BY id_producto';
            $params = array($this->marcaProducto);
            return Database::getRows($sql, $params);
        }

        public function filtrarProductosCategoria(){
            $sql = 'SELECT id_producto as ID, nombre_producto as nombre, foto_producto as foto, descripcion_producto as descripcion, costo_producto as costo, estado_producto as estado, nombre_marca as marca, categoria_producto as categoria, presentacion_producto as presentacion
                FROM tb_producto tp INNER JOIN tb_estado te ON tp."id_estadoProducto" = te.id_estado 
                INNER JOIN tb_marca tm ON tp."id_marcaProducto" = tm.id_marca
                INNER JOIN "tb_categoria" tc ON tp."id_categoriaProducto" = tc.id_categoria
                INNER JOIN tb_presentacion tb ON tp."id_presentacionProducto" = tb.id_presentacion
                WHERE id_categoria = ? 
                ORDER BY id_producto';
            $params = array($this->categoriaProducto);
            return Database::getRows($sql, $params);
        }

        /* Funcion para ver el porcentaje de categorias en un gráfico */
        public function quantityProductsCategory(){
            $sql = 'SELECT categoria_producto, ROUND((COUNT(id_producto) * 100.0 / (SELECT COUNT(id_producto) FROM tb_producto)), 2) porcentaje
	            FROM tb_producto INNER JOIN tb_categoria ON "id_categoriaProducto" = id_categoria
	            GROUP BY categoria_producto ORDER BY porcentaje DESC';
            $params = null;
            return Database::getRows($sql, $params);
        }

        /*--------Métodos para generar reporte con marca------------*/
        public function productosMarca()
        {
            $sql = 'SELECT nombre_producto, costo_producto, estado_producto
                    FROM tb_producto tp INNER JOIN tb_estado te ON tp."id_estadoProducto" = te.id_estado
                    INNER JOIN tb_marca tm ON tp."id_marcaProducto" = tm.id_marca
                    WHERE tp."id_marcaProducto" = ?
                    ORDER BY nombre_producto';
            $params = array($this->marcaProducto);
            return Database::getRows($sql, $params);
        }
    }