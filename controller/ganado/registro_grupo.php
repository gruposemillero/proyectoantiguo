<?php
    require '../../model/modelo_ganado.php';
    $MG = new Modelo_Ganado();
    $consulta = $MG->registrar_grupo();
    echo $consulta;
?>
