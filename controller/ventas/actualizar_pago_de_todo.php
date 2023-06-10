<?php
    require '../../model/modelo_ventas.php';
    $MG = new Modelo_Venta();
    $idpago23 = htmlspecialchars($_POST['sad'],ENT_QUOTES,'UTF-8');
    $consulta = $MG->actualizar_pago_todo_lista_Venta($idpago23);
    echo $consulta;
?>
