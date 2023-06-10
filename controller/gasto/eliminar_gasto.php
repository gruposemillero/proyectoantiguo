<?php
    require '../../model/modelo_gasto.php';
    $MG = new Modelo_Gasto();
    $id = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $consulta = $MG->eliminar_gasto($id);
    echo $consulta;
    return $consulta;
?>
