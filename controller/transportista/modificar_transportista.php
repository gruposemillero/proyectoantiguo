
<?php
    require '../../model/modelo_transportista.php';
    $MT = new Modelo_Transportista();
    $id = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $licencia = htmlspecialchars($_POST['p'],ENT_QUOTES,'UTF-8');
    $placa = htmlspecialchars($_POST['l'],ENT_QUOTES,'UTF-8');
    $docunento = htmlspecialchars($_POST['d'],ENT_QUOTES,'UTF-8');
    $ruc = htmlspecialchars($_POST['r'],ENT_QUOTES,'UTF-8');
    $consulta = $MT->modificar_transportista($id,$licencia,$placa,$docunento,$ruc);
    echo $consulta;
    return $consulta;
?>
