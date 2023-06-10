<?php
    require_once 'modelo_conexion.php';

    class Modelo_biatico extends conexionBD{

        public function modificar_biatico($id,$pago_total,$pago_parcial,$Biatico_Inicio,$Biatico_Final,$Biatico_Extras,$Biatico_Personal,$Biatico_Empresa,$Precio_Unidad){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ACTUALIZACION_PAGO_GENERAL(?,?,?,?,?,?,?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$id);
            $query->bindParam(2,$pago_total);
            $query->bindParam(3,$pago_parcial);
            $query->bindParam(4,$Biatico_Inicio);
            $query->bindParam(5,$Biatico_Final);
            $query->bindParam(6,$Biatico_Extras);
            $query->bindParam(7,$Biatico_Personal);
            $query->bindParam(8,$Biatico_Empresa);
            $query->bindParam(9,$Precio_Unidad);
            $resultado = $query->execute();
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function eliminar_biatico($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ELIMINAR_BIATICO(?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$id);
            $resultado = $query->execute();
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function eliminar_registro_biatico($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ELIMINAR_REGISTRO_BIATICO(?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$id);
            $resultado = $query->execute();
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function listar_biatico(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTAR_BIATICO()";
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
        public function listar_fecha_pago($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTAR_FECHA_PAGO(?)";
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