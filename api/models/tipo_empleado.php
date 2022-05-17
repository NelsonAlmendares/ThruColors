<?php
/*
*	Clase para manejar la tabla categorias de la base de datos.
*   Es clase hija de Validator.
*/
class Tipo_empleado extends Validator
{
    // Declaración de atributos (propiedades).
    private $id_tipoE = null;
    private $tipo_empleado = null;    

    /*
    *   Métodos para validar y asignar valores de los atributos.
    */
    public function setId_tipoE($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->id_tipoE = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setTipo_e($value)
    {
        if ($this->validateAlphanumeric($value, 1, 50)) {
            $this->tipo_empleado = $value;
            return true;
        } else {
            return false;
        }
    }   

    /*
    *   Métodos para obtener valores de los atributos.
    */
    public function getId_tipoE()
    {
        return $this->id_tipoE;
    }

    public function getTipo_E()
    {
        return $this->tipo_empleado;
    }    

    /*
    *   Métodos para realizar las operaciones SCRUD (search, create, read, update, delete).
    */
    public function searchRows($value)
    {
        $sql = 'SELECT id_categoria, nombre_categoria, imagen_categoria, descripcion_categoria
                FROM categorias
                WHERE nombre_categoria ILIKE ? OR descripcion_categoria ILIKE ?
                ORDER BY nombre_categoria';
        $params = array("%$value%", "%$value%");
        return Database::getRows($sql, $params);
    }

    public function createRow()
    {
        $sql = 'INSERT INTO categorias(nombre_categoria, imagen_categoria, descripcion_categoria)
                VALUES(?, ?, ?)';
        $params = array($this->nombre, $this->imagen, $this->descripcion);
        return Database::executeRow($sql, $params);
    }

    public function readAll()
    {
        $sql = 'SELECT t_e."id_tipoEmpleado", t_e."tipoEmpleado" 
                FROM tipo_empleado t_e
                ORDER BY t_e."tipoEmpleado"';
        $params = null;
        return Database::getRows($sql, $params);
    }

    public function readOne()
    {
        $sql = 'SELECT id_categoria, nombre_categoria, imagen_categoria, descripcion_categoria
                FROM categorias
                WHERE id_categoria = ?';
        $params = array($this->id);
        return Database::getRow($sql, $params);
    }

    public function updateRow($current_image)
    {
        // Se verifica si existe una nueva imagen para borrar la actual, de lo contrario se mantiene la actual.
        ($this->imagen) ? $this->deleteFile($this->getRuta(), $current_image) : $this->imagen = $current_image;

        $sql = 'UPDATE categorias
                SET imagen_categoria = ?, nombre_categoria = ?, descripcion_categoria = ?
                WHERE id_categoria = ?';
        $params = array($this->imagen, $this->nombre, $this->descripcion, $this->id);
        return Database::executeRow($sql, $params);
    }

    public function deleteRow()
    {
        $sql = 'DELETE FROM categorias
                WHERE id_categoria = ?';
        $params = array($this->id);
        return Database::executeRow($sql, $params);
    }
}
