<?php
    require '../../model/modelo_gasto.php';
    $MG = new Modelo_Gasto();
    $consulta = $MG->listar_codigo();
    echo json_encode($consulta);

?>
