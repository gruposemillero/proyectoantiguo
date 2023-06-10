<?php
    require '../../model/modelo_listarventa.php';
    $ML = new Modelo_listar();
    $id = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $consulta = $ML->eliminar_grupo($id);
    echo $consulta;
    return $consulta;
?> 