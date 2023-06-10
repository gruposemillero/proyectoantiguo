<?php
    require '../../model/modelo_ventas.php';
    $MG = new Modelo_Venta();
    $pago_parcial = htmlspecialchars($_POST['pp'],ENT_QUOTES,'UTF-8');
    $Biatico_Inicio = htmlspecialchars($_POST['bi'],ENT_QUOTES,'UTF-8');
    $Biatico_Extras = htmlspecialchars($_POST['be'],ENT_QUOTES,'UTF-8');
    $Biatico_Personal = htmlspecialchars($_POST['bp'],ENT_QUOTES,'UTF-8');
    $Biatico_Empresa = htmlspecialchars($_POST['bem'],ENT_QUOTES,'UTF-8');
    $pagototalbiatico = htmlspecialchars($_POST['pgt'],ENT_QUOTES,'UTF-8');
    $ubicacion = htmlspecialchars($_POST['ubi'],ENT_QUOTES,'UTF-8');

    $consulta = $MG->registrar_pago($pago_parcial,$Biatico_Inicio,$Biatico_Extras,$Biatico_Personal,$Biatico_Empresa,$pagototalbiatico,$ubicacion);
    echo $consulta;
?>
