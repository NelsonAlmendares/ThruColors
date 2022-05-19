<?php

    class Categorias extends Validator{
        private $id_categoria = null;
        private $categoria_producto = null;
        private $foto_categoria = null;
        private $descripcion_categoria = null;
        private $ruta = '../imagenes/categorias/';

        public function setId_c($value){
            if($this->validateNaturalNumber($value)){
                $this->id_categoria = $value;
                return true;
            } else{
                return false;
            }
        }

        public function setCategoria_p($value){
            if ($this->validateAlphanumeric($value, 1, 50)) {
                $this->categoria_producto = $value;
                return true;
            } else{
                return false;
            }
        }

        public function setFoto_c($file){
            if ($this->validateImageFile($file, 800,800)) {
                $this->foto_categoria = $this->getFileName();
                return true;
            } else{
                return false;
            }
        }

        public function setDescripcion_c($value){
            if ($this->validateAlphanumeric($value, 1 ,200)){
                $this->descripcion_categoria = $value;
                return true;
            } else{
                return false;
            }
        }

        public function getId_c(){
            return $this->id_categoria;
        }

        public function getCategoria_p(){
            return $this->categoria_producto;
        }

        public function getFoto_c(){
            return $this->foto_categoria;
        }

        public function getDescripcion_c(){
            return $this->descripcion_categoria;
        }

        public function getRuta(){
            return $this->ruta;
        }

        /* Metodos para las operaciones SCRUD de la vista de Categorias */

        //Funcion para listar las categorias que han sido creadas en la base de datos
        public function searchRows($value){
            $sql = 'SELECT id_categoria, categoria_producto, foto_categoria, descripcion_categoria
                FROM tb_categoria
                WHERE categoria_producto ILIKE ? OR descripcion_categoria ILIKE ?
                ORDER BY categoria_producto';
            $params = array("%$value%", "%$value%");
            return Database::getRows($sql, $params);
        }

        //Funcion para crear una nueva categoria que es almacena en la base de datos
        public function createRow(){
            $sql = 'INSERT INTO tb_categoria(categoria_producto, foto_categoria, descripcion_categoria)
	                VALUES (?, ?, ?)';
            $params = array($this->categoria_producto, $this->foto_categoria, $this->descripcion_categoria);
            return Database::executeRow($sql, $params);
        }

        //Funcion para listar un unico elemento de la base de datos por su ID
        public function readOne(){
            $sql = 'SELECT id_categoria, categoria_producto, foto_categoria, descripcion_categoria
                FROM public."tb_categoria"
                WHERE id_categoria = ?
                ORDER BY categoria_producto';
            $params = array($this->id_categoria);
            return Database::getRow($sql, $params);
        }

        // Funcion para leer toda la tabla pero con un solo paramerto
        public function readAll(){
            $sql = 'SELECT id_categoria, categoria_producto, foto_categoria, descripcion_categoria
                    FROM tb_categoria
                    ORDER BY id_categoria';
            $params = null;
            return Database::getRows($sql, $params);
        }

        //Funcion para actualizar una categoria de la base
        public function updateRow($current_image){
            ($this->foto_categoria) ? $this->deleteFile($this->getRuta(), $current_image) : $this->foto_categoria = $current_image;
            $sql = 'UPDATE public.tb_categoria
	            SET categoria_producto=?, foto_categoria=?, descripcion_categoria=?
	            WHERE id_categoria = ?';
            $params = array($this->categoria_producto, $this->foto_categoria, $this->descripcion_categoria, $this->id_categoria);
            return Database::executeRow($sql, $params);
        }

        //Funcion para eliminar una categoria
        public function deleteRow(){
            $sql = 'DELETE FROM tb_categoria
                    WHERE id_categoria = ?';
            $params = array($this->id_categoria);
            return Database::executeRow($sql, $params);
        }

    }

?>