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
            $sql = 'INSERT INTO ventas(estado_venta, id_cliente) VALUES (?, ?)';
            $params = array($this->estado, $_SESSION['id_cliente']);

            if($this->id_pedido = Database::getLastRow($sql,$params)){
                return true;
            } else{
                return false;
            }
        }
    }

    public function createDetail(){
        $sql = 'INSERT INTO public."tb_detalleVenta"(
                cantidad, id_producto, id_venta, id_valoracion)
                VALUES (?, (SELECT costo_producto FROM tb_ventas WHERE id_venta = ?), ?, ?)';
        $params = array($this->producto, $this->producto, $this->cantidad, $this->id_pedido);
        return Database::executeRow($sql, $params);
    }

    public function readOrderDetail(){
        $sql = 'SELECT id_venta, nombre_producto, costo_producto, cantidad
        FROM public."tb_detalleVenta" td INNER JOIN tb_producto tp ON td.id_producto = tp.id_producto
        WHERE id_venta = ?';
        $params = array($this->id_pedido);
        return Database::getRows($sql, $params);
    }

    public function finishOrder(){
        date_default_timezone_get('America/El_Salvador');
        $date = date('Y-m-d');
        $this->estado = 1;
        $sql = 'UPDATE public.tb_ventas
            SET fecha_venta=?, estado_venta=?
            WHERE id_venta = ?';
        $params = array($this->estado, $date, $_SESSION['id_venta']);
        return Database::executeRow($sql, $params);
    }

    public function updateDetail(){
        $sql = 'UPDATE public."tb_detalleVenta"
        SET cantidad=?
        WHERE "id_detalleVenta" = ? AND id_venta = ?';
        
    }

    }
?>