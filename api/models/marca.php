<?php
/*clase para manejar la tabla producto de la base de datos*/

class marca extends validator
{
    //*Declaracion de atributos(propiedades).
    private $id_marca = null;
    private $nombre_marca = null;


    /*metodo para validar y asignar valores a los campos*/ 

    public function setId_marca($value)
    {
        if($this->validateNaturalNumber($value)){
            $this->id_marca = $value;
            return true;
        }else{
            return false;
        }   
    }

    public function setNombre_marca($value)
    {
        if ($this->validateBoolean($value)){
            $this->nombre_marca = $value;
            return true;
        }else{
            return false;
        }
    }

    /*Metodos para obtener los datos de los atributos*/ 

    public function getId_marca()
    {
        return $this->id_marca;
    }

    public function getNombre_marca()
    {
        return $this->nombre_marca;
    }

    /*Metodos para realizar las acciones SCRUD: search, create, read, update, delete.*/ 

    public function searchRows($value)
    {
        $sql = 'SELECT id_marca, nombre_marca FROM public.tb_marca 
        where nombre_marca ILIKE ?
        ORDER BY id_marca';
        $params = array("%$value%");
        return Database::getRows($sql, $params);
    }

    public function createRow()
    {
        $sql = 'INSERT INTO public.tb_marca(
            id_marca, nombre_marca)
            VALUES (?, ?)';
        $params = array($this->nombre);
        return Datatbase::executeRow($sql, $params);
    }

    public function readAll()
    {
        $sql = 'SELECT id_marca, nombre_marca
        FROM public.tb_marca
        ORDER BY id_marca';
        $params = null;
        return Database::getRows($sql, $params);
    }

    public function readOne()
    {
        $sql = 'SELECT id_marca, nombre_marca
        FROM public.tb_marca
        where id_marca = ?'  
       
        $params = array($this->id_marca);
        return Database::getRow($sql, $params):
    }

    public function updateRow()
    {
      $sql = 'UPDATE public.tb_marca
      SET id_marca=?, nombre_marca=?
      WHERE id_marca = ?';
      $params = array($this->nombre, $this->id);
      return Database::executeRow($sql, $params);
    }

    public function deleteRow()
    {
        $sql = 'DELETE FROM public.tb_marca
        WHERE id_marca = ?';
        $params = array($this->id);
        return Database::executeRow($sql, $params);
    }
}   
?>    