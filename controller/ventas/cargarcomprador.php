<?php
    require '../../model/modelo_ventas.php';
    $MV = new Modelo_Venta();
    $consulta = $MV->listar_comprador();
    echo json_encode($consulta);
?>