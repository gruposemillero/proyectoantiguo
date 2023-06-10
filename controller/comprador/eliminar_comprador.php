<?php
    require '../../model/modelo_comprador.php';
    $MC = new Modelo_Comprador();
    $id = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $consulta = $MC->eliminar_comprador($id);
    echo $consulta;
    return $consulta;
?> 