<?php
    require '../../model/modelo_ventas.php';
    $MG = new Modelo_Venta();
    $idgrupo = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $pago_parcial = htmlspecialchars($_POST['ptb'],ENT_QUOTES,'UTF-8');
    $idpago = htmlspecialchars($_POST['idp'],ENT_QUOTES,'UTF-8');
    $consulta = $MG->actualizar_pago_venta($idgrupo,$pago_parcial,$idpago);
    echo $consulta;
?>
