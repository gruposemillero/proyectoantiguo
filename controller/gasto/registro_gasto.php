<?php
    require '../../model/modelo_gasto.php';
    $MG = new Modelo_Gasto();
    $nombre = htmlspecialchars($_POST['n'],ENT_QUOTES,'UTF-8');
    $codigo = htmlspecialchars($_POST['co'],ENT_QUOTES,'UTF-8');
    $cantidad = htmlspecialchars($_POST['ca'],ENT_QUOTES,'UTF-8');
    $descripcion = htmlspecialchars($_POST['d'],ENT_QUOTES,'UTF-8');
    $consulta = $MG->registrar_gasto($nombre,$cantidad,$descripcion,$codigo);
    echo $consulta;
    return $consulta;
?>
