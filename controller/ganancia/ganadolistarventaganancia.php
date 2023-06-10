<?php
    require '../../model/modelo_ganancia.php';
    $MGA = new Modelo_Ganancia();
    $idGrupoVenta = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
    $consulta = $MGA->listar_ganado_vendidos_ganancia($idGrupoVenta);
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