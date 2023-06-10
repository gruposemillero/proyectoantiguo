<?php
    require '../../model/modelo_ganado.php';
    $MG = new Modelo_Ganado();
    $consulta = $MG->listar_proveedor();
    echo json_encode($consulta);
?>