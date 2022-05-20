<?php



/*
*	Clase para conducir los datos de la tb clientes.
*   Es clase hija de Validator.
*/
class clientes extends Validator
{



 /*
*declaracion de los donde se guardan los datos, como nombre, apellido, correo, etc 
*/

    private $id_clietne = null;
    private $nombre_cliente = null;
    private $apellido_cliente = null;
    private $celular_cliente = null;
    private $direccion_cliente = null;
    private $email_cliente = null;
    private $clave = null;
    private $estado_cliente = null;
    private $foto_cliente = null;
    private $ruta = '../imagenes/clientes/';



/*
* metodos get y set
*/
    public function setId_c($value)
    {
        if ($this->validateNaturalNumer($value)){
            $this=> id_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setNombre_c($value)
    {
        if ($this->validateAlphabetic($value, 1, 50)) {
            $this=> nombre_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setApellido_c($value)
    {
        if ($this->validateAlphabetic($value, 1, 50)) {
            $this=> apellido_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setCelular_c($value)
    {
        if ($this->validatePhone($value)) {
            $this=> celular_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setDireccion_c($value)
    {
        if ($this->validateAlphabetic($value, 1, 60)) {
            $this=> direccion_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setEmail_c($value)
    {
        if ($this->validateEmail($value)){
            $this=> email_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setPassword_c($value)
    {
        if ($this->validateNaturalNumer($value)){
            $this=> clave = password_hash($value, PASSWORD_DEFAULT);
            return true;
        } else {
            return false;
        }
    }

    public function setEstado_c($value)
    {
        if ($this->validateBoolean($value)){
            $this-> estado_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setFoto_c($value)
    {
        if ($this->validateImageFile($value, 800,800)){
            $this-> foto_cliente = $this->getFileName();
            return true;
        } else {
            return false;
        }
    }

    
    /*
    *metodo get para obtener los registros de la bd
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

    public function getCelulara_c()
    {
        return $this->celular_cliente;
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
    public function getFoto_c()
    {
        return $this->foto_cliente;
    }
    public function getRuta()
    {
        return $this->ruta;
    }



    /*
    *Met para gestionar la acount del cliente
    */
public function checkUser($email_cliente)
{
    $sql = 'SELECT id_cliente, estado_cliente FROM tb_cliente WHERE email_cliente = ?';
    $params = array($email_cliente);
    if ($dta = Database::getRow($sql, $params)) {
        $this->id_cliente = $data['id_cliente'];
        $this->estado_cliente = $data['estado_cliente'];
        $this->email_cliente = $email_cliente;
        return true;
    } else {
        return false;
    }
    
}



/*
*metodo para confirmar la contra
*/
public function checkPassword($password)
{
    $sql = 'SELECT password_cliente FROM tb_cliente WHERE id_cliente = ?';
        $params = array($this->id);
        $data = Database::getRow($sql, $params);
        if (password_verify($password, $data['password_cliente'])) {
            return true;
        } else {
            return false;
        }
}



/*
*Metodo para cambiar contrase;a
*/
public function changePassword()
    {
        $sql = 'UPDATE tb_cliente SET clave_cliente = ? WHERE id_cliente = ?';
        $params = array($this->clave, $this->id);
        return Database::executeRow($sql, $params);
    }



/*
*Metodo para editar perfil del cliente
*/
    public function editProfile()
    {
        $sql = 'UPDATE tb_cliente
                SET nombre_cliente/*nombre del primer campo*/ = ?, apellido_cliente /**nombre del segundo campo*/= ?, celular_cliente = ?, direccion_cliente = ?, email_cliente = ?, estado_cliente = ?
                WHERE id_cliente = ?';
        $params = array($this->nombre_cliente, $this->apellido_cliente, $this->celular_cliente, $this->direccion_cliente, $this->email_cliente, $this->estado_cliente, $_SESSION['id_cliente']);
        return Database::executeRow($sql, $params);
    }



/*
*Metodos para buscar-agregar-modificar-eliminar-leer
*/

/*
*metodo para Agregar o crear 
*/
public function createRow()
{
    $sql = 'INSERT INTO cliente(nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, clave_cliente, estado_cliente, foto_cliente)
            VALUES(?, ?, ?, ?, ?, ?, ?, ?)';
    $params = array($this->nombre_cliente, $this->apellido_cliente, $this->celular_cliente, $this->direccion_cliente, $this->email_cliente, $this->clave_cliente, $this->estado_cliente, $this->foto_cliente);
    return Database::executeRow($sql, $params);
}



/*
*Metodo para buscar un cliente
*/
public function searchRows($value)
    {
        $sql = 'SELECT id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, estado_cliente, foto_cliente
                FROM tb_cliente
                WHERE apellido_cliente ILIKE ? OR nombre_cliente ILIKE ? OR correo_cliente ILIKE ?
                ORDER BY apellido_cliente';
        $params = array("%$value%", "%$value%", "%$value%");
        return Database::getRows($sql, $params);
    }


/*
*Metodo para leer los datos de la bd 
*/
public function readAll()
    {
        $sql = 'SELECT id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, estado_cliente, foto_cliente
                FROM tb_cliente
                ORDER BY apellido_cliente';
        $params = null;
        return Database::getRows($sql, $params);
    }



/*
*metodo para leer una fila
*/
public function readOne()
    {
        $sql = 'SELECT id_cliente, nombre_cliente, apellido_cliente, celular_cliente, direccion_cliente, email_cliente, estado_cliente, foto_cliente
                FROM tb_cliente
                WHERE id_cliente = ?';
        $params = array($this->id);
        return Database::getRow($sql, $params);
    }



/*
*metodo para actualizar un campo
*/
public function updateRow()
    {
        $sql = 'UPDATE tb_cliente
                SET nombre_cliente = ?, apellido_cliente = ?, celular_cliente = ?,  direccion_cliente = ?, email_cliente = ?, estado_cliente = ?
                WHERE id_cliente = ?';
        $params = array($this->nombres, $this->apellidos, $this->dui, $this->estado, $this->telefono, $this->nacimiento, $this->direccion, $this->id);
        return Database::executeRow($sql, $params);
    }



/*
*Metodo para eliminar un cliente
*/    
public function deleteRow()
    {
        $sql = 'DELETE FROM cliente
                WHERE id_cliente = ?';
        $params = array($this->id);
        return Database::executeRow($sql, $params);
    }
}