<?php
    require_once 'modelo_conexion.php';

    class Modelo_Venta extends conexionBD{
        
        public function listar_comprador(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTAR_COMPRADOR()";
            $arreglo = array();
            $query = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll(); //
            foreach($resultado as $resp){
                $arreglo[] = $resp;
            }
            return $arreglo;
            conexionBD::cerrar($c);
        }
        public function listar_grupo_compra(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SELECT_GRUPO_COMPRA()";
            $arreglo = array();
            $query = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll(); //
            foreach($resultado as $resp){
                $arreglo[] = $resp;
            }
            return $arreglo;
            conexionBD::cerrar($c);
        }
        public function listar_grupo_compra_total(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SELECT_GRUPO_COMPRA_TOTAL()";
            $arreglo = array();
            $query = $c->prepare($sql);
            $query->execute();
            $resultado = $query->fetchAll(); //
            foreach($resultado as $resp){
                $arreglo[] = $resp;
            }
            return $arreglo;
            conexionBD::cerrar($c);
        }
        // public function listar_grupo_compra_biatico(){
        //     $c = conexionBD::conexionPDO();
        //     $sql = "CALL SELECT_GRUPO_COMPRA_BIATICO()";
        //     $arreglo = array();
        //     $query = $c->prepare($sql);
        //     $query->execute();
        //     $resultado = $query->fetchAll(); //
        //     foreach($resultado as $resp){
        //         $arreglo[] = $resp;
        //     }
        //     return $arreglo;
        //     conexionBD::cerrar($c);
        // }
        // public function listar_grupo_compra_venta(){
        //     $c = conexionBD::conexionPDO();
        //     $sql = "CALL SELECT_GRUPO_VENTA()";
        //     $arreglo = array();
        //     $query = $c->prepare($sql);
        //     $query->execute();
        //     $resultado = $query->fetchAll(); //
        //     foreach($resultado as $resp){
        //         $arreglo[] = $resp;
        //     }
        //     return $arreglo;
        //     conexionBD::cerrar($c);
        // }
        public function listar_grupo_ganado($idgrupo){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SELECT_GANADO(?)";
            $arreglo = array();
            $query = $c->prepare($sql);
            $query->bindParam(1,$idgrupo);
            $query->execute();
            $resultado = $query->fetchAll(); //
            foreach($resultado as $resp){
                $arreglo[] = $resp;
            }
            return $arreglo;
            conexionBD::cerrar($c);
        }
        public function listar_grupo_ganado_lista_venta($idgrupo){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SELECT_GANADO_VENTA(?)";
            $arreglo = array();
            $query = $c->prepare($sql);
            $query->bindParam(1,$idgrupo);
            $query->execute();
            $resultado = $query->fetchAll(); //
            foreach($resultado as $resp){
                $arreglo[] = $resp;
            }
            return $arreglo;
            conexionBD::cerrar($c);
        }
        public function listar_ganado_vendidos($idGrupoVenta){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTAR_VENTA_GANADO(?)";
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
        public function listar_ganado_input($idgrupo){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SELECT_GANADO_INPUT(?)";
            $arreglo = array();
            $query = $c->prepare($sql);
            $query->bindParam(1,$idgrupo);
            $query->execute();
            $resultado = $query->fetchAll(); //
            foreach($resultado as $resp){
                $arreglo[] = $resp;
            }
            return $arreglo;
            conexionBD::cerrar($c);
        }
        public function listar_ganado_input_lista_venta($idgrupo){
            $c = conexionBD::conexionPDO();
            $sql = "CALL SELECT_GANADO_INPUT_LISTA_VENTA(?)";
            $arreglo = array();
            $query = $c->prepare($sql);
            $query->bindParam(1,$idgrupo);
            $query->execute();
            $resultado = $query->fetchAll(); //
            foreach($resultado as $resp){
                $arreglo[] = $resp;
            }
            return $arreglo;
            conexionBD::cerrar($c);
        }
        public function registrar_grupo(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL REGISTRAR_GRUPO_VENTA()";
            $query = $c->prepare($sql);
            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar($c);
        }
        public function registrar_Ganado($idGrupoVenta,$idGanadoRegistro,$idpagoventa,$comprador,$transportista){
            $c = conexionBD::conexionPDO();
            $sql = "CALL REGISTRAR_GANADO_VENTA(?,?,?,?,?)";
            $query = $c->prepare($sql);      
            $query->bindParam(1,$idGanadoRegistro);
            $query->bindParam(2,$idGrupoVenta);
            $query->bindParam(3,$comprador);
            $query->bindParam(4,$transportista);
            $query->bindParam(5,$idpagoventa); 
            $resultado = $query->execute();
            
            if($resultado){
                return  1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function registrar_pago($pago_parcial,$Biatico_Inicio,$Biatico_Extras,$Biatico_Personal,$Biatico_Empresa,$pagototalbiatico,$ubicacion){
            $c = conexionBD::conexionPDO();
            $sql = "CALL REGISTRAR_PAGO_VENTA(?,?,?,?,?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$pago_parcial);
            $query->bindParam(2,$Biatico_Inicio);
            $query->bindParam(3,$Biatico_Extras);
            $query->bindParam(4,$Biatico_Personal);
            $query->bindParam(5,$Biatico_Empresa);
            $query->bindParam(6,$pagototalbiatico);
            $query->bindParam(7,$ubicacion);
            $resultado = $query->execute();
            
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar($c);
        }

        public function actualizar_pago_venta($idgrupo,$pago_parcial,$idpago){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ACTUALIZAR_PAGO_VENTA(?,?,?)";
            $query = $c->prepare($sql);      
            $query->bindParam(1,$idgrupo);
            $query->bindParam(2,$pago_parcial);
            $query->bindParam(3,$idpago);
            $resultado = $query->execute();
            
            if($resultado){
                return  1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function actualizar_pago_todo_lista_Venta($idpago23){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ACTUALIZAR_PAGO_VENTA_PRECIO_UNIDAD_DEVERDAD(?)";
            $query = $c->prepare($sql);      
            $query->bindParam(1,$idpago23);
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