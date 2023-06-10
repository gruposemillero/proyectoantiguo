<?php
    require_once 'modelo_conexion.php';

    class Modelo_Ganado extends conexionBD{
        public function listar_proveedor(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTAR_PROVEEDOR()";
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
        public function listar_transportista(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTAR_TRANSPORTISTA()";
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
        public function registrar_grupo(){
            $c = conexionBD::conexionPDO();
            $sql = "CALL REGISTRAR_GRUPO_COMPRA()";
            $query = $c->prepare($sql);
            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar($c);
        }


        public function listar_ganado_grupo($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTAR_GANADO_FILTRADO(?)";
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
        public function registrar_ganado($raza,$peso,$sexo,$color,$salud,$aretes,$marca,$descripcion,$idGrupo,$edad,$precio,$idProveedor,$idTransportista,$idPago,$edadtipo){
            $c = conexionBD::conexionPDO();
            $sql = "CALL REGISTRO_GANADO(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$raza);
            $query->bindParam(2,$peso);
            $query->bindParam(3,$color);
            $query->bindParam(4,$sexo);
            $query->bindParam(5,$salud);
            $query->bindParam(6,$marca);
            $query->bindParam(7,$aretes);
            $query->bindParam(8,$descripcion);
            $query->bindParam(9,$idGrupo);
            $query->bindParam(10,$edad);
            $query->bindParam(11,$precio);
            $query->bindParam(12,$idProveedor);
            $query->bindParam(13,$idTransportista);
            $query->bindParam(14,$idPago);
            $query->bindParam(15,$edadtipo);
            $resultado = $query->execute();
            
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar($c);
        }
        public function registrar_ganado_total($raza,$peso,$sexo,$color,$salud,$aretes,$marca,$descripcion,$idGrupo,$edad,$idProveedor,$idTransportista,$idPago,$edadtipo){
            $c = conexionBD::conexionPDO();
            $sql = "CALL REGISTRO_GANADO_TOTAL(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$raza);
            $query->bindParam(2,$peso);
            $query->bindParam(3,$color);
            $query->bindParam(4,$sexo);
            $query->bindParam(5,$salud);
            $query->bindParam(6,$marca);
            $query->bindParam(7,$aretes);
            $query->bindParam(8,$descripcion);
            $query->bindParam(9,$idGrupo);
            $query->bindParam(10,$edad);
            $query->bindParam(11,$idProveedor);
            $query->bindParam(12,$idTransportista);
            $query->bindParam(13,$idPago);
            $query->bindParam(14,$edadtipo);
            $resultado = $query->execute();
            
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function modificar_Ganado($idganado,$raza,$peso,$sexo,$color,$salud,$aretes,$marca,$descripcion,$edad,$precio){
            $c = conexionBD::conexionPDO();
            $sql = "CALL MODIFICAR_GANADO(?,?,?,?,?,?,?,?,?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$idganado);
            $query->bindParam(2,$raza);
            $query->bindParam(3,$peso);
            $query->bindParam(4,$color);
            $query->bindParam(5,$sexo);
            $query->bindParam(6,$salud);
            $query->bindParam(7,$marca);
            $query->bindParam(8,$aretes);
            $query->bindParam(9,$descripcion);
            $query->bindParam(10,$edad);
            $query->bindParam(11,$precio);
            $resultado = $query->execute();
            
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function actualizador_precio($precio,$idGrupo){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTA_PRECIO_PERSONALIZADO(?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$idGrupo);
            $query->bindParam(2,$precio);
            $resultado = $query->execute();
            return $resultado;

        }
        public function registrar_pago($pago_parcial,$Biatico_Inicio,$Biatico_Extras,$Biatico_Personal,$Biatico_Empresa,$pagototalbiatico,$ubicacion,$preciounidadganado){
            $c = conexionBD::conexionPDO();
            $sql = "CALL REGISTRAR_PAGO(?,?,?,?,?,?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$pago_parcial);
            $query->bindParam(2,$Biatico_Inicio);
            $query->bindParam(3,$Biatico_Extras);
            $query->bindParam(4,$Biatico_Personal);
            $query->bindParam(5,$Biatico_Empresa);
            $query->bindParam(6,$pagototalbiatico);
            $query->bindParam(7,$ubicacion);
            $query->bindParam(8,$preciounidadganado);
            $resultado = $query->execute();
            
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar($c);
        }
        public function registrar_pago_total($pago_total,$pago_parcial,$Biatico_Inicio,$Biatico_Extras,$Biatico_Personal,$Biatico_Empresa,$pagototalbiatico,$ubicacion,$preciounidadganado){
            $c = conexionBD::conexionPDO();
            $sql = "CALL REGISTRAR_PAGO_TOTAL(?,?,?,?,?,?,?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$pago_total);
            $query->bindParam(2,$pago_parcial);
            $query->bindParam(3,$Biatico_Inicio);
            $query->bindParam(4,$Biatico_Extras);
            $query->bindParam(5,$Biatico_Personal);
            $query->bindParam(6,$Biatico_Empresa);
            $query->bindParam(7,$pagototalbiatico);
            $query->bindParam(8,$ubicacion);
            $query->bindParam(9,$preciounidadganado);
            $resultado = $query->execute();
            
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar($c);
        }
        public function actualiza_pago_ganado($idGrupo,$idPago,$PagoTotalBiatico){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ACTUALIZAR_PAGO_GANADO_UNIDAD(?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$idGrupo);
            $query->bindParam(2,$idPago);
            $query->bindParam(3,$PagoTotalBiatico);
            $resultado = $query->execute();
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function actualiza_pago_ganado_total($idGrupo,$idPago,$PagoTotalBiatico){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ACTUALIZAR_PAGO_GANADO_TOTAL(?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$idGrupo);
            $query->bindParam(2,$idPago);
            $query->bindParam(3,$PagoTotalBiatico);
            $resultado = $query->execute();
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function actualiza_pago_ganado_vista($idGrupo,$idPago,$precio){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ACTUALIZAR_PAGO_GANADO_VISTA(?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$idGrupo);
            $query->bindParam(2,$idPago);
            $query->bindParam(3,$precio);
            $resultado = $query->execute();
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }


    }


?>