<?php
    require '../../model/modelo_biatico.php';
    $MB = new Modelo_biatico();
    $id= htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
    $consulta = $MB->listar_fecha_pago($id);
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