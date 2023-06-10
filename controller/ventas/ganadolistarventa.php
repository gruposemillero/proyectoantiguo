<?php
    require '../../model/modelo_ventas.php';
    $MV = new Modelo_Venta();
    $idGrupoVenta = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
    $consulta = $MV->listar_ganado_vendidos($idGrupoVenta);
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