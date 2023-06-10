
<?php
    require '../../model/modelo_transportista.php';
    $MT = new Modelo_Transportista();
    $id = htmlspecialchars($_POST['i'],ENT_QUOTES,'UTF-8');
    $consulta = $MT->eliminar_transportista($id);
    echo $consulta;
    return $consulta;
?>
