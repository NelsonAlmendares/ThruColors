<?php

    class Pedidos extends Validator{
        private $id_pedido = null;
        private $id_detalle = null;
        private $cliente = null;
        private $producto = null;
        private $cantidad = null;
        private $precio = null;
        private $estado = null;
        private $marca = null;
        private $presentacion = null;

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

    public function setMarca($value){
        if ($this->validateNaturalNumber($value)) {
            $this->marca = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setPresentacion($value){
        if ($this->validateNaturalNumber($value)) {
            $this->presentacion = $value;
            return true;
        } else {
            return false;
        }
    }

    public function getIdPedido(){
        return $this->id_pedido;
    }

    public function getIdDetalle(){
        return $this->id_detalle;
    }

    public function getCliente(){
        return $this->cliente;
    }

    public function getProducto(){
        return $this->producto;
    }

    public function getCantidad(){
        return $this->cantidad;
    }

    public function getPrecio(){
        return $this->precio;
    }
    
    public function getEstado(){
        return $this->estado;
    }

    public function getMarca(){
        return $this->marca;
    }

    public function getPresentacion(){
        return $this->presentacion;
    }

    public function startOrder(){
        $this->estado = 0;

        $sql = 'SELECT id_venta FROM tb_venta WHERE estado_venta = ? AND id_cliente = ?';
        $params = array($this->estado, $_SESSION['id_cliente']);
        if($data = Database::getRow($sql, $params)){
            $this->id_pedido = $data['id_venta'];
            return true;
        } else{
            $sql = 'INSERT INTO tb_venta(fecha_venta, estado_venta, id_cliente) 
            VALUES (CURRENT_DATE,?, ?)';
            $params = array($this->estado, $_SESSION['id_cliente']);

            if($this->id_pedido = Database::getLastRow($sql,$params)){
                return true;
            } else{
                return false;
            }
        }
    }

    public function createDetail(){
        $sql = 'INSERT INTO "tb_DetalleVenta"(
                cantidad,precio_producto, id_producto, id_venta)
                VALUES (?, (SELECT costo_producto FROM tb_producto WHERE id_producto = ?), ?,?)';
        $params = array($this->cantidad, $this->producto, $this->producto, $this->id_pedido);
        return Database::executeRow($sql, $params);
    }

    public function readOrderDetail(){
        $sql = 'SELECT id_venta, nombre_producto AS nombre, costo_producto AS costo, cantidad, tm.nombre_marca AS marca, tb.presentacion_producto AS presentacion, td."id_DetalleVenta" AS id_detalle
                FROM "tb_DetalleVenta" td INNER JOIN tb_producto tp ON td.id_producto = tp.id_producto
                INNER JOIN tb_marca tm ON tp."id_marcaProducto" = tm.id_marca
                INNER JOIN tb_presentacion tb ON tp."id_presentacionProducto" = tb.id_presentacion
                WHERE id_venta = ?';
        $params = array($this->id_pedido);
        return Database::getRows($sql, $params);
    }

    public function finishOrder(){
        $date = date('Y-m-d');
        $this->estado = 1;
        $sql = 'UPDATE tb_venta
            SET fecha_venta=CURRENT_DATE, estado_venta=?
            WHERE id_venta = ?';
        $params = array($this->estado, $_SESSION['id_pedido']);
        return Database::executeRow($sql, $params);
    }

    public function updateDetail()
    {
        $sql = 'UPDATE "tb_DetalleVenta"
                SET cantidad = ?
                WHERE "id_DetalleVenta" = ? AND id_venta = ?';
        $params = array($this->cantidad, $this->id_detalle, $this->id_pedido);
        return Database::executeRow($sql, $params);
    }

    // Método para eliminar un producto que se encuentra en el carrito de compras.
    public function deleteDetail()
    {
        $sql = 'DELETE FROM "tb_DetalleVenta"
                WHERE "id_DetalleVenta" = ? AND id_venta = ?';
        $params = array($this->id_detalle, $_SESSION['id_pedido']);
        return Database::executeRow($sql, $params);
    }

    }
?>