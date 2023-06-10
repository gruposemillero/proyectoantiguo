<?php
    require '../../model/modelo_biatico.php';
    $MB = new Modelo_biatico();
    $id = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $consulta = $MB-> eliminar_biatico($id);
    echo $consulta;
    return $consulta;
?>
