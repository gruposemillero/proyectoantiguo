<?php
    require '../../model/modelo_ganado.php';
    $MG = new Modelo_Ganado();
    $id = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
    $precio = htmlspecialchars($_POST['pr'],ENT_QUOTES,'UTF-8');
    $consulta = $MG->actualizador_precio($precio,$idGrupo);
    echo $consulta;
?>
