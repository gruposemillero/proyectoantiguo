<?php
//capa de abstraccion, difenretes conexiones con mismo metodo objetos de datos de php PHP DATA OBJECTS
class conexionBD{
    public function conexionPDO(){
        $dsn = 'mysql:dbname=empresa;host=127.0.0.1';
        $usuario = 'root';
        $contrasena = '';
        try{
            $pdo = new PDO($dsn,$usuario,$contrasena);
            $pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
            $pdo->exec("set names utf8"); // funciona para las tildes   
            return $pdo;
        }catch(Exception $e){
            echo "conexion fallida";
        }
    }
    function cerrar($pdo){
        $this->$pdo=null;
    }

}

?>