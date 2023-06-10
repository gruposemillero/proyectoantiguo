<?php
    require '../../model/modelo_biatico.php';
    $MB = new Modelo_biatico();
    $Id_Grupo_Compra = htmlspecialchars($_POST['ci'],ENT_QUOTES,'UTF-8');
    $Id_Grupo_Venta = htmlspecialchars($_POST['vi'],ENT_QUOTES,'UTF-8');
    $Biatico_Inicio = htmlspecialchars($_POST['bi'],ENT_QUOTES,'UTF-8');
    $Biatico_Final = htmlspecialchars($_POST['bf'],ENT_QUOTES,'UTF-8');
    $Biatico_Extras = htmlspecialchars($_POST['be'],ENT_QUOTES,'UTF-8');
    $Biatico_Personal = htmlspecialchars($_POST['bp'],ENT_QUOTES,'UTF-8');
    $Biatico_Empresa = htmlspecialchars($_POST['bem'],ENT_QUOTES,'UTF-8');
    $consulta = $MB-> registrar_biatico($Id_Grupo_Compra,$Id_Grupo_Venta,$Biatico_Inicio,$Biatico_Final,$Biatico_Extras,$Biatico_Personal,$Biatico_Empresa);
    echo $consulta;
    return $consulta;
?>
