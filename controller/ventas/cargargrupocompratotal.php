<?php
    require '../../model/modelo_ventas.php';
    $MV = new Modelo_Venta();
    $consulta = $MV->listar_grupo_compra_total();
    echo json_encode($consulta);
?>