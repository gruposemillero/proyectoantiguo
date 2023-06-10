<?php
    require_once 'modelo_conexion.php';

    class Modelo_Ganancia extends conexionBD{
        
        public function listar_ganancias($dni){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTAR_GRUPO_GANANCIAS_PRUEBA(?)";
            $arreglo = array();
            $query = $c->prepare($sql);
            $query->bindParam(1,$dni);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC); //
            foreach($resultado as $resp){
                $arreglo["data"][] = $resp;
            }
            return $arreglo;
            conexionBD::cerrar($c);
        }
        public function listar_ganado_vendidos_ganancia($idGrupoVenta){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTAR_VENTA_GANADO_VENDIDOS(?)";
            $arreglo = array();
            $query = $c->prepare($sql);
            $query->bindParam(1,$idGrupoVenta);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC); //
            foreach($resultado as $resp){
                $arreglo["data"][] = $resp;
            }
            return $arreglo;
            conexionBD::cerrar($c);
        }

    }


?>