<?php
/*
*	Clase para manejar la tabla usuarios de la base de datos.
*   Es clase hija de Validator.
*/
class Empleados extends Validator
{
    // Declaración de atributos (propiedades).
    private $id_empleado = null;
    private $nombre_empleado = null;
    private $apellido_empleado = null;
    private $DUI_empleado = null;
    private $foto_empleado = null;
    Private $direccion_empleado = null;
    private $codigo_empleado = null;
    private $clave = null;
    private $tipo_empleado = null;
    private $ruta = '../imagenes/empleados/';

    /*
    *   Métodos para validar y asignar valores de los atributos.
    */
    public function setId_e($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->id_empleado = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setNombre_e($value)
    {
        if ($this->validateAlphabetic($value, 1, 50)) {
            $this->nombre_empleado = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setApellido_e($value)
    {
        if ($this->validateAlphabetic($value, 1, 50)) {
            $this->apellido_empleado = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setDUI_e($value)
    {
        if ($this->validateDUI($value)) {
            $this->DUI_empleado = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setFoto_e($file)
    {
        if ($this->validateImageFile($file,800,800)) {
            $this->foto_empleado = $this->getFileName();
            return true;
        } else {
            return false;
        }
    }

    public function setDireccion_e($value)
    {
        if ($this->validateAlphabetic($value, 1, 60)) {
            $this->direccion_empleado = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setCodigo_e($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->codigo_empleado = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setClave($value)
    {
        if ($this->validatePassword($value)) {
            $this->clave = password_hash($value, PASSWORD_DEFAULT);
            return true;
        } else {
            return false;
        }
    }

    public function setTipo_e($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->tipo_empleado = $value;
            return true;
        } else {
            return false;
        }
    }

    /*
    *   Métodos para obtener valores de los atributos.
    */
    public function getId_e()
    {
        return $this->id_empleado;
    }

    public function getNombre_e()
    {
        return $this->nombre_empleado;
    }

    public function getApellido_e()
    {
        return $this->apellido_empleado;
    }

    public function getDUI_e()
    {
        return $this->DUI_empleado;
    }

    public function getFoto_e()
    {
        return $this->foto_empleado;
    }

    public function getDireccion_e()
    {
        return $this->direccion_empleado;
    }

    public function getCodigo_e()
    {
        return $this->codigo_empleado;
    }

    public function getClave()
    {
        return $this->clave;
    }
    
    public function getTipo_e()
    {
        return $this->tipo_empleado;
    }

    public function getRuta()
    {
        return $this->ruta;
    }

    /*
    *   Métodos para gestionar la cuenta del usuario.
    */

    /*-------------Método para proporcionar el id del empleado.-------------*/
    public function checkUser($codigo_empleado)
    {
        $sql = 'SELECT id_empleado FROM tb_empleado WHERE codigo_empleado = ?';
        $params = array($codigo_empleado);
        if ($data = Database::getRow($sql, $params)) {
            $this->id_empleado = $data['id_empleado'];
            $this->codigo_empleado = $codigo_empleado;
            return true;
        } else {
            return false;
        }
    }

    /*-------------Método para proporcionar el nombre, apellido y foto del empleado.-------------*/
    public function readUserName($codigo_empleado)
    {
        $sql = 'SELECT nombre_empleado, apellido_empleado, foto_empleado
                FROM tb_empleado
                WHERE codigo_empleado = ?';
        $params = array($this->codigo_empleado);
        if ($data = Database::getRow($sql, $params)) {
            $this->nombre_empleado = $data['nombre_empleado'];
            $this->apellido_empleado = $data['apellido_empleado'];
            $this->foto_empleado = $data['foto_empleado'];
            $this->codigo_empleado = $codigo_empleado;
            return true;
        } else {
            return false;
        }
    }

    /*-------------Método para proporcionar el rol o tipo de empleado.-------------*/
    public function readUserRol($codigo_empleado)
    {
        $sql = 'SELECT te."tipoEmpleado" 
                FROM  tipo_empleado te, tb_empleado tb_e 
                WHERE te."id_tipoEmpleado"=tb_e.tipo_empleado AND tb_e.codigo_empleado= ?';
        $params = array($this->codigo_empleado);
        if ($data = Database::getRow($sql, $params)) {
            $this->tipo_empleado = $data['tipoEmpleado'];
            $this->codigo_empleado = $codigo_empleado;
            return true;
        } else {
            return false;
        }
    }

    public function checkPassword($password)
    {
        $sql = 'SELECT password_empleado FROM tb_empleado WHERE id_empleado = ?';
        $params = array($this->id_empleado);
        $data = Database::getRow($sql, $params);
        // Se verifica si la contraseña coincide con el hash almacenado en la base de datos.
        if (password_verify($password, $data['password_empleado'])) {
            return true;
        } else {
            return false;
        }
    }

    public function changePassword()
    {
        $sql = 'UPDATE tb_empleado SET clave_empleado = ? WHERE id_empleado = ?';
        $params = array($this->clave, $_SESSION['id_empleado']);
        return Database::executeRow($sql, $params);
    }

    public function readProfile()
    {
        $sql = 'SELECT id_empleado, nombres_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, tipo_empleado, foto_empleado
                FROM tb_empleado
                WHERE id_empleado = ?';
        $params = array($_SESSION['id_empleado']);
        return Database::getRow($sql, $params);
    }

    public function editProfile()
    {
        $sql = 'UPDATE tb_empleado
                SET nombre_empleado = ?, apellido_empleado = ?, "DUI" = ?, direccion_empleado = ?, codigo_empleado = ?, tipo_empleado = ?
                WHERE id_empleado = ?';
        $params = array($this->nombre_empleado, $this->apellido_empleado, $this->DUI_empleado, $this->direccion_empleado, $this->codigo_empleado, $this->tipo_empleado, $_SESSION['id_empleado']);
        return Database::executeRow($sql, $params);
    }

    /*
    *   Métodos para realizar las operaciones SCRUD (search, create, read, update, delete).
    */
    /*-------------Método para buscar el nombre y apellido de empleado.-------------*/
    public function searchRows($value)
    {
        $sql = 'SELECT id_empleado, nombre_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, tipo_empleado, foto_empleado
                FROM tb_empleado
                WHERE apellido_empleado ILIKE ? OR nombre_empleado ILIKE ? OR direccion_empleado ILIKE ?';
        $params = array("%$value%", "%$value%", "%$value%");
        return Database::getRows($sql, $params);
    }
    /*-------------Método para buscar el coddigo y tipo empleado de empleado.-------------*/
    public function searchNumbers($value)
    {
        $sql = 'SELECT id_empleado, nombre_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, tipo_empleado, foto_empleado
        FROM tb_empleado
        WHERE codigo_empleado = ? OR tipo_empleado = ?';
        $params = array("$value", "$value");
        return Database::getRows($sql, $params);
    }
    /*-------------Método para buscar el DUI de empleado.-------------*/
    public function searchDUIs($value)
    {
        $sql = 'SELECT id_empleado, nombre_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, tipo_empleado, foto_empleado
                FROM tb_empleado
                WHERE "DUI" ILIKE ?';
        $params = array("%$value%");
        return Database::getRows($sql, $params);
    }
    public function createRow()
    {
        $sql = 'INSERT INTO tb_empleado(nombre_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, password_empleado, tipo_empleado, foto_empleado)
            VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)';
        $params = array($this->nombre_empleado, $this->apellido_empleado, $this->DUI_empleado, $this->direccion_empleado, $this->codigo_empleado, $this->clave, $this->tipo_empleado, $this->foto_empleado);                
        //print_r($params);
        return Database::executeRow($sql, $params);
    }

    public function readAll()
    {
        $sql = 'SELECT id_empleado, nombre_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, password_empleado, tipo_empleado, foto_empleado
                FROM tb_empleado
                ORDER BY id_empleado;';
        $params = null;
        return Database::getRows($sql, $params);
    }

    public function readOne()
    {
        $sql = 'SELECT id_empleado, nombre_empleado, apellido_empleado, "DUI", direccion_empleado, codigo_empleado, password_empleado, tipo_empleado, foto_empleado
                FROM tb_empleado
                WHERE id_empleado = ?';
        $params = array($this->id_empleado);
        return Database::getRow($sql, $params);
    }

    public function updateRow($foto_imagen)
    {
        // Se verifica si existe una nueva imagen para borrar la actual, de lo contrario se mantiene la actual.
        ($this->foto_empleado) ? $this->deleteFile($this->getRuta(), $foto_imagen) : $this->foto_empleado = $foto_imagen;

        $sql = 'UPDATE tb_empleado 
               SET nombre_empleado = ?, apellido_empleado = ?, "DUI" = ?, direccion_empleado = ?, codigo_empleado = ?, tipo_empleado = ?, foto_empleado = ?
                WHERE id_empleado = ?';
        $params = array($this->nombre_empleado, $this->apellido_empleado, $this->DUI_empleado, $this->direccion_empleado, $this->codigo_empleado, $this->tipo_empleado, $this->foto_empleado, $this->id_empleado);
        return Database::executeRow($sql, $params);
    }

    public function deleteRow()
    {
        $sql = 'DELETE FROM tb_empleado
                WHERE id_empleado = ?';
        $params = array($this->id_empleado);
        return Database::executeRow($sql, $params);
    }
}
