<?php
    require_once 'modelo_conexion.php';

    class Modelo_listar extends conexionBD{
        public function listar_grupo_venta($dni){
            $c = conexionBD::conexionPDO();
            $sql = "CALL LISTADO_GRUPO_VENTAS_FILTRADO(?)";
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
        public function modificar_grupo($id,$cantidad,$precio){
            $c = conexionBD::conexionPDO();
            $sql = "CALL MODIFICAR_LISTA_GENERAL_VENTA(?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$id);
            $query->bindParam(2,$cantidad);
            $query->bindParam(3,$precio);
            $resultado = $query->execute();
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function actualizar_pago_total($grupoventa,$pagototalventa,$preciounidadventa){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ACTUALIZAR_PAGO_TOTAL_VENTA(?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$grupoventa);
            $query->bindParam(2,$pagototalventa);
            $query->bindParam(3,$preciounidadventa);
            $resultado = $query->execute();
            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar($c);
        }
        public function actualizar_pago_total_Precio_Unidad($grupoventa,$pagototalventa,$preciounidadventa){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ACTUALIZAR_PAGO_GANADO_PRECIO_UNITARIO_GANADO(?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$grupoventa);
            $query->bindParam(2,$pagototalventa);
            $query->bindParam(3,$preciounidadventa);
            $resultado = $query->execute();
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function eliminar_grupo($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ELIMINAR_LISTA_GENERAL_VENTA(?)";
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
        

    }


?>