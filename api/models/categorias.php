<?php

    class Categorias extends Validator{
        private $id = null;
        private $nombre = null;
        private $imagen = null;
        private $descripcion = null;
        private $ruta = '../images/categorias';

        public function setId($value){
            if($this->validateNaturalNumber($value)){
                $this->id = $value;
                return true;
            } else{
                return false;
            }
        }

        public function setNombre($value){
            if ($this->validateAlphanumeric($value, 1, 150)) {
                $this->nombre = $value;
                return true;
            } else{
                return false;
            }
        }

        public function setImage($file){
            if ($this->validateImageFile($file, 800,800)) {
                $this->imagen = $this->getFileName();
                return true;
            } else{
                return false;
            }
        }

        public function setDescripcion($value){
            if ($this->validateString($value, 1 ,300)){
                $this->descripcion = $value;
                return true;
            } else{
                return false;
            }
        }

        public function getId(){
            return $this->id;
        }

        public function getNombre(){
            return $this->nombre;
        }

        public function getImage(){
            return $this->imagen;
        }

        public function getDescripcion(){
            return $this->descripcion;
        }

        public function getRuta(){
            return $this->ruta;
        }

        /* Metodos para las operaciones SCRUD de la vista de Categorias */

        //Funcion para listar las categorias que han sido creadas en la base de datos
        public function searchRows($value){
            $sql = 'SELECT id_categoria, categoria_producto, foto_categoria, descripcion_categoria
                FROM public."tb_categoria"
                WHERE categoria_producto LIKE = ? OR descripcion_categoria LIKE = ?
                ORDER BY categoria_producto';
            $params = array("%$value%", "%$value%");
            return Database::getRows($sql, $params);
        }

        //Funcion para crear una nueva categoria que es almacena en la base de datos
        public function createRow(){
            $sql = 'INSERT INTO public.tb_categoria(categoria_producto, foto_categoria, descripcion_categoria)
	                VALUES (?, ?, ?, ?)';
            $params = array($this->nombre, $this->imagen, $this->descripcion);
            return Database::executeRow($sql, $params);
        }

        //Funcion para listar un unico elemento de la base de datos por su ID
        public function readOne(){
            $sql = 'SELECT id_categoria, categoria_producto, foto_categoria, descripcion_categoria
                FROM public."tb_categoria"
                WHERE id_categoria = ?
                ORDER BY categoria_producto';
            $params = array($this->id);
            return Database::getRow($sql, $params);
        }

        // Funcion para leer toda la tabla pero con un solo paramerto
        public function readAll(){
            $sql = 'SELECT id_categoria, categoria_producto, foto_categoria, descripcion_categoria
	            FROM public.tb_categoria
	            ORDER BY categoria_producto';
            $params = null;
            return Database::getRow($sql, $params);
        }

        //Funcion para actualizar una categoria de la base
        public function updateRow($current_image){
            ($this->imagen) ? $this->deleteFile($this->getRuta(), $current_image) : $this->imagen = $current_image;
            $sql = 'UPDATE public.tb_categoria
	            SET categoria_producto=?, foto_categoria=?, descripcion_categoria=?
	            WHERE id_categoria = ?';
            $params = array($this->imagen, $this->nombre, $this->descripcion, $this->id);
            return Database::executeRow($sql, $params);
        }

        //Funcion para eliminar una categoria
        public function deleteRow($values){
            $sql = 'DELETE FROM public.tb_categorias 
                WHERE id_categoria = ?';
            $params = array($this->id);
            return Database::executeRow($sql, $params);
        }

    }

?>