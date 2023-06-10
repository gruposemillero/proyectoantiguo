<?php
    require '../../model/modelo_ventas.php';
    $MV = new Modelo_Venta();
    $consulta = $MV->listar_grupo_compra();
    echo json_encode($consulta);
?>