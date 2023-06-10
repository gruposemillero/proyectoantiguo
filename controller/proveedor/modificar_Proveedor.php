<?php
    require '../../model/modelo_proveedor.php';
    $MV = new Modelo_Proveedor();
    $id = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $nombre = htmlspecialchars($_POST['n'],ENT_QUOTES,'UTF-8');
    $apellido = htmlspecialchars($_POST['a'],ENT_QUOTES,'UTF-8');
    $documento = htmlspecialchars($_POST['d'],ENT_QUOTES,'UTF-8');
    $ruc = htmlspecialchars($_POST['r'],ENT_QUOTES,'UTF-8');
    $consulta = $MV->modidicar_proveedor($id,$nombre,$apellido,$documento,$ruc);
    echo $consulta;
    return $consulta;
?> 