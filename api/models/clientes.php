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
    private $password = null;
    private $estado_cliente = null;
    private $foto_cliente = null;
    private $ruta = '../imagenes/clientes/';

}

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
            $this=> password = password_hash($value, PASSWORD_DEFAULT);
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

    public function getPassword_c()
    {
        return $this->password;
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