<?php
    require '../../model/modelo_transportista.php';
    $MT = new Modelo_Transportista();
    $consulta = $MT->listar_transportista();
    if($consulta){
        echo json_encode($consulta);
    }else{
        echo '{
            "sEcho":1,
            "iTotalRecords":"0",
            "iTotalDisplayRecords":"0",
            "aaData":[]
        }';
    }


?>