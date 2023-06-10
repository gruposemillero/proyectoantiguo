<?php
    require '../../model/modelo_transportista.php';
    $MT = new Modelo_Transportista();
    $licencia = htmlspecialchars($_POST['l'],ENT_QUOTES,'UTF-8');
    $placa = htmlspecialchars($_POST['p'],ENT_QUOTES,'UTF-8');
    $documento = htmlspecialchars($_POST['d'],ENT_QUOTES,'UTF-8');
    $ruc = htmlspecialchars($_POST['r'],ENT_QUOTES,'UTF-8');
    $consulta = $MT->registrar_transportista($licencia,$placa,$documento,$ruc);
    echo $consulta;
    return $consulta;
?>
