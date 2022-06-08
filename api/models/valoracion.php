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
        $sql = 'SELECT id_valoracion AS ID, comentario_producto AS comentario, fecha_comentario AS fecha FROM public."tb_valoracionProducto" ORDER BY fecha_comentario';
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
    

    }
?>