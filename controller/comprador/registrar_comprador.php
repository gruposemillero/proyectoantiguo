<?php
    require '../../model/modelo_comprador.php';
    $MC = new Modelo_Comprador();
    $nombre = htmlspecialchars($_POST['n'],ENT_QUOTES,'UTF-8');
    $apellido = htmlspecialchars($_POST['a'],ENT_QUOTES,'UTF-8');
    $documento = htmlspecialchars($_POST['d'],ENT_QUOTES,'UTF-8');
    $ruc = htmlspecialchars($_POST['r'],ENT_QUOTES,'UTF-8');
    $consulta = $MC->registrar_comprador($nombre,$apellido,$documento,$ruc);
    echo $consulta;
    return $consulta;
?>
