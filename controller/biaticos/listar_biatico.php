<?php
    require '../../model/modelo_biatico.php';
    $MB = new Modelo_biatico();
    $consulta = $MB->listar_biatico();
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