<?php
    class dataBase{
        /* variablas para la conexion con la base de datos */
        private static $connection = null;
        private static $statement = null;
        private static $error = null;

        public static function connect(){
            $server = 'localhost';
            $database = 'DB_ThruColors';
            $username = 'postgres';
            $password = '1234';

            self::$connection = new PDO('pgslq:host=' . $server . ';dbname=' . $database . ';port=5432' , $username, $password);
        }

        /* Funcion para las operaciones insert, update y delete */

        public static function executeRow($query, $values){
            try {
                self::connect();
                self::$statement = self::$connection->prepare($query);
                $state = self::$statement->execute($values);
                self::$connection = null;
                return $state;
            } catch (PDOException $error) {
                
            }
        }

        /*Funcion para mandar a llamar los registros con sentencia de sql tipo SELECT retornando un valor booleano*/
        public static function getRow($query, $values){
            try {
                self::connect();
                self::$statement = self::$connection->prepare($query);
                self::$statement->execute($values);
                self::$connection = null;
                return self::$statement->fetchAll(PDO::FETCH_ASSOC);
            } catch (PDOException $error) {
                self::setException($error->getCode(), $error->getMessage());
            }
        }

        public static function getRows($query, $values){
            try{
                self::connect();
                self::$statement = self::$connection->prepare($query);
                $state = self::$statement->execute($values);
                self::$connection = null;
                return $state;
            }catch(PDOException $error){
                self::setException($error->getCode(), $error->getMessage());
                return false;
            }
        }
        
        private static function setException($code, $message){
        // Se asigna el mensaje del error original por si se necesita.
        self::$error = utf8_encode($message);
        // Se compara el código del error para establecer un error personalizado.
        switch ($code) {
            case '7':
                self::$error = 'Existe un problema al conectar con el servidor';
                break;
            case '42703':
                self::$error = 'Nombre de campo desconocido';
                break;
            case '23505':
                self::$error = 'Dato duplicado, no se puede guardar';
                break;
            case '42P01':
                self::$error = 'Nombre de tabla desconocido';
                break;
            case '23503':
                self::$error = 'Registro ocupado, no se puede eliminar';
                break;
            default:
                self::$error = 'Ocurrió un problema en la base de datos';
            }
        }

        /* Metodo para obtener errores de una excecion */
        public static function getExeption(){
            return self::$error;
        }
    }
?>