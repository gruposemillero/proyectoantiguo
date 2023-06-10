<?php
    require '../../model/modelo_proveedor.php';
    $MV = new Modelo_Proveedor();
    $id = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $consulta = $MV->eliminar_proveedor($id);
    echo $consulta;
    return $consulta;
?> 