<?php
    require '../../model/modelo_ventas.php';
    $MV = new Modelo_Venta();
    $consulta = $MV->listar_grupo_compra_biatico();
    echo json_encode($consulta);
?>