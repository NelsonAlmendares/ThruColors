<?php
/*clase para manejar la tabla producto de la base de datos*/ 

class tipo_empleado extends validator 
{
    //*Declaracion de atributos(propiedades).
    private $id_tipoEmpleado = null;
    private $tipoEmpleado = null;

    /*metodo para validar y asignar valores a los campos*/ 

    public function setId_tipoEmpleado($value)
    {
        if ($this->validateBaturalNumber($value)){
            $this->id_tipoEmpleado = $value;
            return true
        }else{
            return false;
        }
    }

    public function setTipoEmpleado($value)
    {
        if ($this->validateBoolean($value)){
            this->tipoEmpleado = $value;
            return true;
        }else{
            return false;
        }
    }

    /*Metodos para obtener los datos de los atributos*/ 

    public function getId_tipoEmpleado()
    {
        return $this->id_tipoEmpleado;
    }

    public function getTipoEmpleado()
    {
        return $this->tipoEmpleado;
    }

    /*Metodos para realizar las acciones SCRUD: search, create, read, update, delete.*/
     
    public function searchRows($value)
    {
        $sql = 'SELECT "id_tipoEmpleado", "tipoEmpleado"
        FROM public.tipo_empleado where "tipoEmpleado" = ?';
        $params = array("%$value%");
        return Database::getRows($sql, $params);
    }

    public function createRow()
    {
        $sql = 'INSERT INTO public.tipo_empleado(
            "id_tipoEmpleado", "tipoEmpleado")
            VALUES (?, ?)';
        $params = array($this->nombre);
        return Database::executeRow($sql, $params);
    }

    public function readAll()
    {
        $sql = 'SELECT "id_tipoEmpleado", "tipoEmpleado"
        FROM public.tipo_empleado';
        $params = null;
        return Database::getRows($sql, $params);
    }

    public function readOne()
    {
        $sql = 'SELECT "id_tipoEmpleado", "tipoEmpleado"
        FROM public.tipo_empleado';
        $params = array($this->id_tipoEmpleado);
        return Database::executeRow($sql, $params);
    }

    public function updateRow()
    {
        $sql = 'UPDATE public.tipo_empleado
        SET "id_tipoEmpleado"=?, "tipoEmpleado"=?
        WHERE id_tipoEmpleado = ?';
        $params = array($this->nombre, $this->id);
        return Database::executeRow($sql, $params);
    }

    public function deleteRow()
    {
        $sql = 'DELETE FROM public.tipo_empleado
        WHERE tipoEmpleado = ?';
        $params = array($this->id);
        return Database::executeRow($sql, $params);
    }
}