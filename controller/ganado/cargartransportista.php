<?php
    require '../../model/modelo_ganado.php';
    $MG = new Modelo_Ganado();
    $consulta = $MG->listar_transportista();
    echo json_encode($consulta);
?>