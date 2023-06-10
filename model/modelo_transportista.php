<?php
    require_once 'modelo_conexion.php';

    class Modelo_Transportista extends conexionBD{
        public function registrar_transportista($licencia,$placa,$documento,$ruc){
            $c = conexionBD::conexionPDO();
            $sql = "CALL REGISTRAR_TRANSPORTISTA(?,?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$placa);
            $query->bindParam(2,$licencia);
            $query->bindParam(3,$documento);
            $query->bindParam(4,$ruc);
            $resultado = $query->execute();
            if($row = $query->fetchColumn()){ 
                return $row;
            }
            conexionBD::cerrar($c);
        }
        public function modificar_transportista($id,$licencia,$placa,$docunento,$ruc){
            $c = conexionBD::conexionPDO();
            $sql = "CALL MODIFICAR_TRANSPORTISTA(?,?,?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$id);
            $query->bindParam(2,$placa);
            $query->bindParam(3,$licencia);
            $query->bindParam(4,$docunento);
            $query->bindParam(5,$ruc);
            $resultado = $query->execute();
            if($resultado){
                return  1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function eliminar_transportista($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ELIMINAR_TRANSPORTISTA(?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$id);
            $resultado = $query->execute();
            if($resultado){
                return  1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }

    }


?>