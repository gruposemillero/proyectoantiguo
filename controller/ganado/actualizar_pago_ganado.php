<?php
    require '../../model/modelo_ganado.php';
    $MG = new Modelo_Ganado();
    
    $idGrupo = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $idPago = htmlspecialchars($_POST['idp'],ENT_QUOTES,'UTF-8');
    $PagoTotalBiatico = htmlspecialchars($_POST['ptb'],ENT_QUOTES,'UTF-8');
    
    $consulta = $MG->actualiza_pago_ganado($idGrupo,$idPago,$PagoTotalBiatico);
    echo $consulta;
?>
