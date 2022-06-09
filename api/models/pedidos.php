<?php

    class Pedidos extends Validator{
        private $id_pedido = null;
        private $id_detalle = null;
        private $cliente = null;
        private $producto = null;
        private $cantidad = null;
        private $precio = null;
        private $estado = null;

    public function setIdPedido($value){
        if ($this->validateNaturalNumber($value)) {
            $this->id_pedido = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setIdDetalle($value){
        if ($this->validateNaturalNumber($value)) {
            $this->id_detalle = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setCliente($value){
        if ($this->validateNaturalNumber($value)) {
            $this->cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setProducto($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->producto = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setCantidad($value){
        if ($this->validateNaturalNumber($value)) {
            $this->cantidad = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setPrecio($value){
        if ($this->validateMoney($value)) {
            $this->precio = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setEstado($value){
        if ($this->validateNaturalNumber($value)) {
            $this->estado = $value;
            return true;
        } else {
            return false;
        }
    }

    public function getIdPedido(){
        return $this->id_pedido;
    }

    public function startOrder(){
        $this->estado = 0;
        $sql = 'SELECT id_venta FROM PUBLIC."tb_ventas" WHERE estado_venta = ? AND id_cliente = ?';
        $params = array($this->estado, $_SESSION['id_cliente']);
        if($data = Database::getRow($sql, $params)){
            $this->id_pedido = $data['id_pedido'];
        } else{
            $sql = '';
        }
    }

    }
?>