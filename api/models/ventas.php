<?php
/*
*	Clase para manejar la tabla productos de la base de datos.
*   Es clase hija de Validator.
*/
class ventas extends validator
{
    // Declaración de atributos (propiedades).
    private $id_venta = null;    
    private $estado = null;

    /*
    *   Métodos para validar y asignar valores de los atributos.
    */
    public function setId($value){
        if ($this->validateNaturalNumber($value)) {
            $this->id_venta = $value;
            return true;
        } else {
            return false;
        }
    }    

    public function setEstado($value)
    {
        if ($this->validateBoolean($value)) {
            $this->estado = $value;
            return true;
        } else {
            return false;
        }
    }

    /*
    *   Métodos para obtener valores de los atributos.
    */
    public function getId()
    {
        return $this->id_venta;
    }

    public function getEstado()
    {
        return $this->estado;
    }

    /*
    *   Métodos para realizar las operaciones SCRUD (search, create, read, update, delete).
    */
    public function searchRows($value)
    {
        $sql = 'SELECT "id_DetalleVenta" as id_venta, cantidad as cantidad, nombre_producto as producto, fecha_venta as fecha, estado_venta as estado, id_cliente as cliente, comentario_producto as comentario
        FROM PUBLIC."tb_DetalleVenta" tbd 
        INNER JOIN tb_venta tv ON tbd.id_venta = tv.id_venta
        INNER JOIN "tb_valoracionProducto" tp ON tbd."id_Valoracion" = tp.id_valoracion
        INNER JOIN "tb_producto" tbp ON tbd.id_producto = tbp.id_producto
        WHERE nombre_producto ILIKE ?
        ORDER BY "id_DetalleVenta"';
            $params = array("%$value%");
        return Database::getRows($sql, $params);
    }    

    public function readAll()
    {
        $sql = 'SELECT id_venta AS id_venta, estado_venta AS estado, fecha_venta AS fecha, nombre_cliente AS cliente
                FROM tb_venta tv 
                INNER JOIN tb_cliente tc ON tv.id_cliente = tc.id_cliente
                ORDER BY id_venta';
        $params = null;
        return Database::getRows($sql, $params);
    }

    public function readOne()
    {
        $sql = 'SELECT id_venta AS id_venta, estado_venta AS estado
                FROM tb_venta
                WHERE id_venta = ?
                ORDER BY id_venta';
        $params = array($this->id_venta);
        return Database::getRow($sql, $params);
    }

    public function updateRow()
    {   
        $sql = 'UPDATE tb_venta
                SET estado_venta=?
                WHERE id_venta = ?';
        $params = array($this->estado, $this->id_venta);
        return Database::executeRow($sql, $params);
    }

    public function deleteRow()
    {
        $sql = 'DELETE FROM tb_venta
                WHERE id_venta = ?';
        $params = array($this->id_venta);
        return Database::executeRow($sql, $params);
    }

    public function readProductosCategoria()
    {
        $sql = 'SELECT id_producto, imagen_producto, nombre_producto, descripcion_producto, precio_producto
                FROM productos INNER JOIN categorias USING(id_categoria)
                WHERE id_categoria = ? AND estado_producto = true
                ORDER BY nombre_producto';
        $params = array($this->id);
        return Database::getRows($sql, $params);
    }

    /*
    *   Métodos para generar gráficas.
    */
    public function cantidadProductosCategoria()
    {
        $sql = 'SELECT nombre_categoria, COUNT(id_producto) cantidad
                FROM productos INNER JOIN categorias USING(id_categoria)
                GROUP BY nombre_categoria ORDER BY cantidad DESC';
        $params = null;
        return Database::getRows($sql, $params);
    }

    public function porcentajeProductosCategoria()
    {
        $sql = 'SELECT nombre_categoria, ROUND((COUNT(id_producto) * 100.0 / (SELECT COUNT(id_producto) FROM productos)), 2) porcentaje
                FROM productos INNER JOIN categorias USING(id_categoria)
                GROUP BY nombre_categoria ORDER BY porcentaje DESC';
        $params = null;
        return Database::getRows($sql, $params);
    }

    /*
    *   Métodos para generar reportes.
    */
    public function productosCategoria()
    {
        $sql = 'SELECT nombre_producto, precio_producto, estado_producto
                FROM productos INNER JOIN categorias USING(id_categoria)
                WHERE id_categoria = ?
                ORDER BY nombre_producto';
        $params = array($this->categoria);
        return Database::getRows($sql, $params);
    }
}
