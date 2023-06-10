<?php
    require '../../model/modelo_ventas.php';
    $MV = new Modelo_Venta();
    $idgrupo = htmlspecialchars($_POST['grupoid'],ENT_QUOTES,'UTF-8');
    $consulta = $MV->listar_ganado_input_lista_venta($idgrupo);
    echo json_encode($consulta);
?>