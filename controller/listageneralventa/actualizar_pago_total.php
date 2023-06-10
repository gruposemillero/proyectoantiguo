<?php
    require '../../model/modelo_listarventa.php';
    $ML = new Modelo_listar();
    $grupoventa = htmlspecialchars($_POST['gv'],ENT_QUOTES,'UTF-8');
    $pagototalventa = htmlspecialchars($_POST['ptv'],ENT_QUOTES,'UTF-8');
    $preciounidadventa = htmlspecialchars($_POST['puv'],ENT_QUOTES,'UTF-8');
    $consulta = $ML->actualizar_pago_total($grupoventa,$pagototalventa,$preciounidadventa);
    echo $consulta;
    return $consulta;
?>  