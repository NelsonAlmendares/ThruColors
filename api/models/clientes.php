<?php
/*
*	Clase para manejar la tabla usuarios de la base de datos.
*   Es clase hija de Validator.
*/
class Clientes extends Validator
{
    // Declaración de atributos (propiedades).
    private $id_cliente = null;
    private $nombre_cliente = null;
    private $apellido_cliente = null;
    private $celular_cliente = null;
    private $foto_cliente = null;
    Private $direccion_cliente = null;
    private $email_cliente = null;
    private $clave = null;
    private $estado_cliente = null;
    private $ruta = '../imagenes/clientes/';

    /*
    *   Métodos para validar y asignar valores de los atributos.
    */
    public function setId_c($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->id_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setNombre_c($value)
    {
        if ($this->validateAlphabetic($value, 1, 50)) {
            $this->nombre_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setApellido_c($value)
    {
        if ($this->validateAlphabetic($value, 1, 50)) {
            $this->apellido_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setCelular_c($value)
    {
        if ($this->validatePhone($value)) {
            $this->celular_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setFoto_c($file)
    {
        if ($this->validateImageFile($file,800,800)) {
            $this->foto_cliente = $this->getFileName();
            return true;
        } else {
            return false;
        }
    }

    public function setDireccion_c($value)
    {
        if ($this->validateAlphanumeric($value, 1, 200)) {
            $this->direccion_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setEmail_c($value)
    {
        if ($this->validateEmail($value)) {
            $this->email_cliente = $value;
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

    public function setEstado_c($value)
    {
        if ($this->validateAlphabetic($value, 1, 30)) {
            $this->estado_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    /*
    *   Métodos para obtener valores de los atributos.
    */
    public function getId_c()
    {
        return $this->id_cliente;
    }

    public function getNombre_c()
    {
        return $this->nombre_cliente;
    }

    public function getApellido_c()
    {
        return $this->apellido_cliente;
    }

    public function getCelular_c()
    {
        return $this->celular_cliente;
    }

    public function getFoto_c()
    {
        return $this->foto_cliente;
    }

    public function getDireccion_c()
    {
        return $this->direccion_cliente;
    }

    public function getEmail_c()
    {
        return $this->email_cliente;
    }

    public function getClave()
    {
        return $this->clave;
    }
    
    public function getEstado_c()
    {
        return $this->estado_cliente;
    }

    public function getRuta()
    {
        return $this->ruta;
    }

    /*
    *   Métodos para gestionar la cuenta del usuario.
    */

    /*-------------Método para proporcionar el id del empleado.-------------*/
    public function checkUser($email_cliente)
    {
        $sql = 'SELECT id_cliente, estado_cliente FROM tb_cliente WHERE email_cliente = ?';
        $params = array($email_cliente);
        if ($data = Database::getRow($sql, $params)) {
            $this->id_cliente = $data['id_cliente'];
            $this->estado_cliente = $data['estado_cliente'];
            $this->email_cliente = $email_cliente;
            return true;
        } else {
            return false;
        }
    }

    /*-------------Método para proporcionar el nombre y foto del cliente.-------------*/
    public function readUserName($email_cliente)
    {
        $sql = 'SELECT nombre_cliente, apellido_cliente, foto_cliente
                FROM tb_cliente
                WHERE email_cliente = ?';
        $params = array($this->email_cliente);
        if ($data = Database::getRow($sql, $params)) {
            $this->nombre_cliente = $data['nombre_cliente'];
            $this->foto_cliente = $data['foto_cliente'];
            $this->apellido_cliente = $data['apellido_cliente'];
            $this->email_cliente = $email_cliente;
            return true;
        } else {
            return false;
        }
    }

    /*-------------Método para proporcionar el rol o estado de cliente.-------------*/
    public function readUserRol($email_cliente)
    {
        $sql = 'SELECT te."tipoEmpleado" 
                FROM  tipo_cliente te, tb_cliente tb_e 
                WHERE te."id_tipoEmpleado"=tb_e.tipo_cliente AND tb_e.email_cliente= ?';
        $params = array($this->email_cliente);
        if ($data = Database::getRow($sql, $params)) {
            $this->estado_cliente = $data['tipoEmpleado'];
            $this->email_cliente = $email_cliente;
            return true;
        } else {
            return false;
        }
    }

    public function checkPassword($password)
    {
        $sql = 'SELECT password FROM tb_cliente WHERE id_cliente = ?';
        $params = array($this->id_cliente);
        $data = Database::getRow($sql, $params);
        // Se verifica si la contraseña coincide con el hash almacenado en la base de datos.
        if (password_verify($password, $data['password'])) {
            return true;
        } else {
            return false;
        }
    }

    public function changePassword()
    {
        $sql = 'UPDATE tb_cliente SET clave_cliente = ? WHERE id_cliente = ?';
        $params = array($this->clave, $_SESSION['id_cliente']);
        return Database::executeRow($sql, $params);
    }

    public function readProfile()
    {
        $sql = 'SELECT id_cliente, nombre_cliente, apellido_cliente, "DUI", direccion_cliente, email_cliente, estado_cliente, foto_cliente
                FROM tb_cliente
                WHERE id_cliente = ?';
        $params = array($_SESSION['id_cliente']);
        return Database::getRow($sql, $params);
    }

    public function editProfile()
    {
        $sql = 'UPDATE tb_cliente
                SET nombre_cliente = ?, apellido_cliente = ?, "DUI" = ?, direccion_cliente = ?, email_cliente = ?, estado_cliente = ?
                WHERE id_cliente = ?';
        $params = array($this->nombre_cliente, $this->apellido_cliente, $this->DUI_cliente, $this->direccion_cliente, $this->email_cliente, $this->estado_cliente, $_SESSION['id_cliente']);
        return Database::executeRow($sql, $params);
    }

    /*
    *   Métodos para realizar las operaciones SCRUD (search, create, read, update, delete).
    */
    /*-------------Método para buscar el nombre y apellido de empleado.-------------*/
    public function searchRows($value)
    {
        $sql = 'SELECT id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, estado_cliente, foto_cliente
                FROM tb_cliente
                WHERE apellido_cliente ILIKE ? OR nombre_cliente ILIKE ? OR direccion_cliente ILIKE ? OR estado_cliente ILIKE ?';
        $params = array("%$value%", "%$value%", "%$value%", "%$value%");
        return Database::getRows($sql, $params);
    }
    /*-------------Método para buscar el celular de empleado.-------------*/
    public function searchNumbers($value)
    {
        $sql = 'SELECT id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, estado_cliente, foto_cliente
        FROM tb_cliente
        WHERE celular_cliente ILIKE ?';
        $params = array("%$value%");
        return Database::getRows($sql, $params);
    }
    /*-------------Método para buscar el email de empleado.-------------*/
    public function searchEmails($value)
    {
        $sql = 'SELECT id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, estado_cliente, foto_cliente
                FROM tb_cliente
                WHERE email_cliente ILIKE ?';
        $params = array("%$value%");
        return Database::getRows($sql, $params);
    }
    public function createRow()
    {
        $sql = 'INSERT INTO tb_cliente(nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, "password", estado_cliente, foto_cliente)
            VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)';
        $params = array($this->nombre_cliente, $this->apellido_cliente, $this->celular_cliente, $this->direccion_cliente, $this->email_cliente, $this->clave, $this->estado_cliente, $this->foto_cliente);                
        //print_r($params);
        return Database::executeRow($sql, $params);
    }

    public function readAll()
    {
        $sql = 'SELECT id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, "password", estado_cliente, foto_cliente
                FROM tb_cliente
                ORDER BY id_cliente;';
        $params = null;
        return Database::getRows($sql, $params);
    }

    public function readOne()
    {
        $sql = 'SELECT id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, "password", estado_cliente, foto_cliente
                FROM tb_cliente
                WHERE id_cliente = ?';
        $params = array($this->id_cliente);
        return Database::getRow($sql, $params);
    }

    public function updateRow($foto_imagen)
    {
        // Se verifica si existe una nueva imagen para borrar la actual, de lo contrario se mantiene la actual.
        ($this->foto_cliente) ? $this->deleteFile($this->getRuta(), $foto_imagen) : $this->foto_cliente = $foto_imagen;

        $sql = 'UPDATE tb_cliente 
               SET nombre_cliente = ?, apellido_cliente = ?, celular_cliente = ?, direccion_cliente = ?, email_cliente = ?, estado_cliente = ?, foto_cliente = ?
                WHERE id_cliente = ?';
        $params = array($this->nombre_cliente, $this->apellido_cliente, $this->celular_cliente, $this->direccion_cliente, $this->email_cliente, $this->estado_cliente, $this->foto_cliente, $this->id_cliente);
        return Database::executeRow($sql, $params);
    }

    public function deleteRow()
    {
        $sql = 'DELETE FROM tb_cliente
                WHERE id_cliente = ?';
        $params = array($this->id_cliente);
        return Database::executeRow($sql, $params);
    }
}