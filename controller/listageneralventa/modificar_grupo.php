<?php
    require '../../model/modelo_listarventa.php';
    $ML = new Modelo_listar();
    $id = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $cantidad = htmlspecialchars($_POST['c'],ENT_QUOTES,'UTF-8');
    $precio = htmlspecialchars($_POST['p'],ENT_QUOTES,'UTF-8');
    $consulta = $ML->modificar_grupo($id,$cantidad,$precio);
    echo $consulta;
    return $consulta;
?>  