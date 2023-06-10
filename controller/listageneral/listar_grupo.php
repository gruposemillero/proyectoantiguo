<?php
    require '../../model/modelo_listar.php';
    $ML = new Modelo_listar();
    $consulta = $ML->listar_grupo();
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