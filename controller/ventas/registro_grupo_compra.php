<?php
    require '../../model/modelo_ventas.php';
    $MV = new Modelo_Venta();
    $consulta = $MV->registrar_grupo();
    echo $consulta;
?>
