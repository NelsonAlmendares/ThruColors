<?php
/*clase para manejar la tabla producto de la base de datos*/ 

class Estado extends Validator 
{
    //*Declaracion de atributos(propiedades).
    private $id_estado = null;
    private $estado = null;

    /*metodo para validar y asignar valores a los campos*/ 

    public function setId_estado($value)
    {
        if ($this->validateNaturalNumber($value)){
            $this->id_estado = $value;
            return true;
        }else{
            return false;
        }
    }

    public function setEstado($value)
    {
        if ($this->validateAlphanumeric($value, 1, 30)){
            $this->estado = $value;
            return true;
        }else{
            return false;
        }
    }

    /*Metodos para obtener los datos de los atributos*/ 

    public function getId_estado()
    {
        return $this->id_estado;
    }

    public function getEstado()
    {
        return $this->estado;
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
        $sql = 'SELECT id_estado, estado_producto
        FROM tb_estado';
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