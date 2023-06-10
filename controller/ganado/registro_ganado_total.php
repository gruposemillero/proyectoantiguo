<?php
    require '../../model/modelo_ganado.php';
    $MG = new Modelo_Ganado();
    $raza = htmlspecialchars($_POST['r'],ENT_QUOTES,'UTF-8');
    $peso = htmlspecialchars($_POST['p'],ENT_QUOTES,'UTF-8');
    $color = htmlspecialchars($_POST['c'],ENT_QUOTES,'UTF-8');
    $sexo = htmlspecialchars($_POST['s'],ENT_QUOTES,'UTF-8');
    $salud = htmlspecialchars($_POST['sa'],ENT_QUOTES,'UTF-8');
    $marca = htmlspecialchars($_POST['m'],ENT_QUOTES,'UTF-8');
    $aretes = htmlspecialchars($_POST['a'],ENT_QUOTES,'UTF-8');
    $descripcion = htmlspecialchars($_POST['d'],ENT_QUOTES,'UTF-8');
    $idGrupo = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $edad = htmlspecialchars($_POST['e'],ENT_QUOTES,'UTF-8');
    $idProveedor = htmlspecialchars($_POST['ip'],ENT_QUOTES,'UTF-8');
    $idTransportista = htmlspecialchars($_POST['it'],ENT_QUOTES,'UTF-8');
    $idPago = htmlspecialchars($_POST['idp'],ENT_QUOTES,'UTF-8');
    $PagoTotalBiatico = htmlspecialchars($_POST['ptb'],ENT_QUOTES,'UTF-8');
    $edadtipo = htmlspecialchars($_POST['edt'],ENT_QUOTES,'UTF-8');
    $consulta = $MG->registrar_ganado_total($raza,$peso,$sexo,$color,$salud,$aretes,$marca,$descripcion,$idGrupo,$edad,$idProveedor,$idTransportista,$idPago,$edadtipo);
    echo $consulta;
?>
