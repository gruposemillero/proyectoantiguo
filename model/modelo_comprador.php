<?php
    require_once 'modelo_conexion.php';

    class Modelo_Comprador extends conexionBD{

        public function registrar_comprador($nombre,$apellido,$documento,$ruc){
            $c = conexionBD::conexionPDO();
            $sql = "CALL REGISTRAR_COMPRADOR(?,?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$nombre);
            $query->bindParam(2,$apellido);
            $query->bindParam(3,$documento);
            $query->bindParam(4,$ruc);
            $resultado = $query->execute();

            if($row = $query->fetchColumn()){
                return $row;
            }
            conexionBD::cerrar($c);
        }
        public function modificar_comprador($id,$nombre,$apellido,$documento,$ruc){
            $c = conexionBD::conexionPDO();
            $sql = "CALL MODIFICAR_COMPRADOR(?,?,?,?,?)";
            $query = $c->prepare($sql);
            $query->bindParam(1,$id);
            $query->bindParam(2,$nombre);
            $query->bindParam(3,$apellido);
            $query->bindParam(4,$documento);
            $query->bindParam(5,$ruc);
            $resultado = $query->execute();
            if($resultado){
                return 1;
            }else{
                return 0;
            }
            conexionBD::cerrar($c);
        }
        public function eliminar_comprador($id){
            $c = conexionBD::conexionPDO();
            $sql = "CALL ELIMINAR_COMPRADOR(?)";
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