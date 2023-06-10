<?php
    require '../../model/modelo_listarventa.php';
    $MGA = new Modelo_listar();
    $dni =  htmlspecialchars($_POST['d'],ENT_QUOTES,'UTF-8');
    $consulta = $MGA->listar_grupo_venta($dni);
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