<?php
    require_once 'modelo_conexion.php';

    class Modelo_listar extends conexionBD{
        
        public function listar_grupo(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTAR_GRUPO_COMPRA()";
            $arreglo = array();
            $query = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll(PDO::FETCH_ASSOC); //
            foreach($resultado as $resp){
                $arreglo["data"][] = $resp;
            }
            return $arreglo;
            conexionBD::cerrar($c);
        }
        public function consultar_grupo_filtrado($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTA_PAGO_FILTRADO_COMPRA(?)";
            $arreglo = array();
            $query = $c->prepare($sql);
            $query->bindParam(1,$id);
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