<?php
    class valoracion extends Validator{
        private $Id_valoracion = null;
        private $comentario = null;
        private $fecha = null;

    public function setId_valoracion($value){
        if($this->validateNaturalNumber($value)){
            $this->id_valoracion = $value;
            return true; 
        } else{
            return false;
        }
    }

    public function setComentario($value){
        if($this->validateString(1 ,50, $value)){
            $this->comentario = $value;
            return true;
        }else{
            return false;
        }
    }

    public function setFecha($value){
        if($this->validateDate($value)){
            $this->fecha = $value;
            return true;
        } else{
            return false;
        }
    }

    public function getId_valoracion(){
        return $this->Id_valoracion;
    }

    public function getComentario(){
        return $this->comentario;
    }

    public function getFecha(){
        return $this->fecha;
    }

    public function readAll(){
        $sql = 'SELECT nombre_cliente AS nombre, apellido_cliente AS apellido ,nombre_producto AS producto, comentario_producto AS comentario, fecha_comentario AS fecha
            FROM tb_ventas tv
            INNER JOIN tb_producto tp ON tp.id_producto = tv.id_producto
            INNER JOIN tb_cliente tc ON tv.id_cliente = tc.id_cliente
            INNER JOIN "tb_valoracionProducto" tvp ON tv.id_valoracion = tvp.id_valoracion
            ORDER BY fecha_comentario';
        $params = null;
        return Database::getRows($sql, $params);
    }
    
    public function createRow($value){
        $sql = 'INSERT INTO public."tb_valoracionProducto"(
	    comentario_producto, fecha_comentario, estado_comentario)
	    VALUES (?, current_date, "activo")';
        $params = array($this->comentario);
        return Database::executeRow($sql, $params);
    }

    public function valoracionBueno(){
        $sql = 'select count(comentario_producto) from public."tb_valoracionProducto" WHERE comentario_producto LIKE = ? OR comentario_producto LIKE = ? ';
        $params = array("%Bueno%", "%buen%");
        return Database::getRows($sql, $params);
    }

    public function registerValoracion(){
        $sql = 'INSERT INTO public."tb_valoracionProducto"(
	        comentario_producto, fecha_comentario)
	        VALUES (?, CURRENT_DATE)';
        $params = array($this->comentario);
        return Database::executeRow($sql, $params);
    }

    }
?>