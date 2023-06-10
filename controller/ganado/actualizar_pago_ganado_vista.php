<?php
    require '../../model/modelo_ganado.php';
    $MG = new Modelo_Ganado();
    
    $idGrupo = htmlspecialchars($_POST['ig'],ENT_QUOTES,'UTF-8');
    $idPago = htmlspecialchars($_POST['ip'],ENT_QUOTES,'UTF-8');
    $precio = htmlspecialchars($_POST['pr'],ENT_QUOTES,'UTF-8');
    
    $consulta = $MG->actualiza_pago_ganado_vista($idGrupo,$idPago,$precio);
    echo $consulta;
?>
