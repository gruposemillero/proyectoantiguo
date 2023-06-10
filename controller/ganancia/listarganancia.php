<?php
    require '../../model/modelo_ganancia.php';
    $MGA = new Modelo_Ganancia();
    $dni =  htmlspecialchars($_POST['d'],ENT_QUOTES,'UTF-8');
    $consulta = $MGA->listar_ganancias($dni);
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