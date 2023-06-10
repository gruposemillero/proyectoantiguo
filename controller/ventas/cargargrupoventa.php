<?php
    require '../../model/modelo_ventas.php';
    $MV = new Modelo_Venta();
    $consulta = $MV->listar_grupo_compra_venta();
    echo json_encode($consulta);
?>