<?php
    require '../../model/modelo_ventas.php';
    $MV = new Modelo_Venta();
    
    
    $idGrupoVenta = htmlspecialchars($_POST['iv'],ENT_QUOTES,'UTF-8');
    $idGanadoRegistro = htmlspecialchars($_POST['igr'],ENT_QUOTES,'UTF-8');
    $idpagoventa = htmlspecialchars($_POST['ipv'],ENT_QUOTES,'UTF-8');
    $comprador = htmlspecialchars($_POST['com'],ENT_QUOTES,'UTF-8');
    $transportista = htmlspecialchars($_POST['trans'],ENT_QUOTES,'UTF-8');

    $consulta = $MV->registrar_Ganado($idGrupoVenta,$idGanadoRegistro,$idpagoventa,$comprador,$transportista);
    echo json_encode($consulta);
?>

