<?php
/*clase para manejar la tabla producto de la base de datos*/ 

class Presentacion extends Validator 
{
    //*Declaracion de atributos(propiedades).
    private $id_presentacion = null;
    private $presentacion = null;

    /*metodo para validar y asignar valores a los campos*/ 

    public function setId_presentacion($value)
    {
        if ($this->validateNaturalNumber($value)){
            $this->id_presentacion = $value;
            return true;
        }else{
            return false;
        }
    }

    public function setPresentacion($value)
    {
        if ($this->validateAlphanumeric($value, 1, 50)){
            $this->presentacion = $value;
            return true;
        }else{
            return false;
        }
    }

    /*Metodos para obtener los datos de los atributos*/ 

    public function getId_presentacion()
    {
        return $this->id_presentacion;
    }

    public function getPresentacion()
    {
        return $this->presentacion;
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
        $sql = 'SELECT id_presentacion, presentacion_producto
        FROM tb_presentacion';
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