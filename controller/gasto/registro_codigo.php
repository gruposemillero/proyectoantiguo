<?php
    require '../../model/modelo_gasto.php';
    $MG = new Modelo_Gasto();
    $nombre = htmlspecialchars($_POST['n'],ENT_QUOTES,'UTF-8');
    $consulta = $MG->registrar_codigo($nombre);
    echo $consulta;
    return $consulta;
?>
