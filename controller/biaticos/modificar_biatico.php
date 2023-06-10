<?php
    require '../../model/modelo_biatico.php';
    $MB = new Modelo_biatico();
    $id = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $pago_total = htmlspecialchars($_POST['pt'],ENT_QUOTES,'UTF-8');
    $pago_parcial = htmlspecialchars($_POST['pp'],ENT_QUOTES,'UTF-8');
    $Biatico_Inicio = htmlspecialchars($_POST['bi'],ENT_QUOTES,'UTF-8');
    $Biatico_Final = htmlspecialchars($_POST['bf'],ENT_QUOTES,'UTF-8');
    $Biatico_Extras = htmlspecialchars($_POST['be'],ENT_QUOTES,'UTF-8');
    $Biatico_Personal = htmlspecialchars($_POST['bp'],ENT_QUOTES,'UTF-8');
    $Biatico_Empresa = htmlspecialchars($_POST['bem'],ENT_QUOTES,'UTF-8');
    $Precio_Unidad = htmlspecialchars($_POST['pre'],ENT_QUOTES,'UTF-8');
    $consulta = $MB-> modificar_biatico($id,$pago_total,$pago_parcial,$Biatico_Inicio,$Biatico_Final,$Biatico_Extras,$Biatico_Personal,$Biatico_Empresa,$Precio_Unidad);
    echo $consulta;
    return $consulta;
?>
