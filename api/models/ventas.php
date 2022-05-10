<?php
/*
*	Clase para manejar la tabla productos de la base de datos.
*   Es clase hija de Validator.
*/
class ventas extends validator
{
    // Declaración de atributos (propiedades).
    private $id_venta = null;
    private $fecha_venta = null;
    private $nombre_cliente = null;
    private $apellido_cliente = null;
    private $producto = null;
    private $cantidad = null;
    private $estado_venta = null;
    /*private $ruta = '../images/productos/';*/

    /*
    *   Métodos para validar y asignar valores de los atributos.
    */
    public function setId_venta($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->id_venta = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setFecha_venta($value)
    {
        if ($this->validateDate($value)) {
            $this->fecha_venta = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setNombre_cliente($value)
    {
        if ($this->validateAlphanumeric($value, 1, 50)) {
            $this->nombre_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setApellido_cliente($value)
    {
        if ($this->validateAlphanumeric($value, 1, 50)) {
            $this->apellido_cliente = $value;
            return true;
        } else {
            return false;
        }
    }

    /*public function setImagen($file)
    {
        if ($this->validateImageFile($file, 500, 500)) {
            $this->imagen = $this->getFileName();
            return true;
        } else {
            return false;
        }
    }*/

    public function setProducto($value)
    {
        if ($this->validateAlphanumeric($value, 1, 50)) {
            $this->producto = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setCantidad($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->cantidad = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setEstado_venta($value)
    {
        if ($this->validateBoolean($value)) {
            $this->estado_venta = $value;
            return true;
        } else {
            return false;
        }
    }

    /*
    *   Métodos para obtener valores de los atributos.
    */
    public function getId_venta()
    {
        return $this->id_venta;
    }

    public function getFecha_venta()
    {
        return $this->fecha_venta;
    }

    public function getNombre_cliente()
    {
        return $this->nombre_cliente;
    }

    public function getApellido_cliente()
    {
        return $this->apellido_cliente;
    }

    public function getProducto()
    {
        return $this->producto;
    }

    public function getCantidad()
    {
        return $this->cantidad;
    }

    public function getEstado_venta()
    {
        return $this->estado_venta;
    }

    /*public function getRuta()
    {
        return $this->ruta;
    }*/

    /*
    *   Métodos para realizar las operaciones SCRUD (search, create, read, update, delete).
    */
    public function searchRows($value)
    {
        $sql = 'SELECT id_producto, imagen_producto, nombre_producto, descripcion_producto, precio_producto, nombre_categoria, estado_producto
                FROM productos INNER JOIN categorias USING(id_categoria)
                WHERE nombre_producto ILIKE ? OR descripcion_producto ILIKE ?
                ORDER BY nombre_producto';
        $params = array("%$value%", "%$value%");
        return Database::getRows($sql, $params);
    }

    public function createRow()
    {
        $sql = 'INSERT INTO productos(nombre_producto, descripcion_producto, precio_producto, imagen_producto, estado_producto, id_categoria, id_usuario)
                VALUES(?, ?, ?, ?, ?, ?, ?)';
        $params = array($this->nombre, $this->descripcion, $this->precio, $this->imagen, $this->estado, $this->categoria, $_SESSION['id_usuario']);
        return Database::executeRow($sql, $params);
    }

    public function readAll()
    {
        $sql = 'SELECT tb_v.id_venta, tb_v.fecha_venta, tb_c.nombre_cliente, tb_c.apellido_cliente, tb_p.nombre_producto, tb_dv.cantidad, tb_v.estado_venta
                FROM tb_venta tb_v, "tb_DetalleVenta" tb_dv, tb_cliente tb_c, tb_producto tb_p
                WHERE tb_v.id_venta=tb_dv.id_venta AND tb_dv.id_producto=tb_p.id_producto AND tb_v.id_cliente=tb_c.id_cliente;';
        $params = null;
        return Database::getRows($sql, $params);
    }

    public function readOne()
    {
        $sql = 'SELECT tb_v.id_venta, tb_v.fecha_venta, tb_c.nombre_cliente, tb_c.apellido_cliente, tb_p.nombre_producto, tb_dv.cantidad, tb_v.estado_venta
        FROM tb_venta tb_v, "tb_DetalleVenta" tb_dv, tb_cliente tb_c, tb_producto tb_p
        WHERE tb_v.id_venta=tb_dv.id_venta AND tb_dv.id_producto=tb_p.id_producto AND tb_v.id_cliente=tb_c.id_cliente AND tb_v.id_venta = ?';
        $params = array($this->id_venta);
        return Database::getRow($sql, $params);
    }

    public function updateRow($current_image)
    {
        // Se verifica si existe una nueva imagen para borrar la actual, de lo contrario se mantiene la actual.
        ($this->imagen) ? $this->deleteFile($this->getRuta(), $current_image) : $this->imagen = $current_image;

        $sql = 'UPDATE productos
                SET imagen_producto = ?, nombre_producto = ?, descripcion_producto = ?, precio_producto = ?, estado_producto = ?, id_categoria = ?
                WHERE id_producto = ?';
        $params = array($this->imagen, $this->nombre, $this->descripcion, $this->precio, $this->estado, $this->categoria, $this->id);
        return Database::executeRow($sql, $params);
    }

    public function deleteRow()
    {
        $sql = 'DELETE FROM productos
                WHERE id_producto = ?';
        $params = array($this->id);
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
