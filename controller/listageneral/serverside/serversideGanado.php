<?php
    require 'serverside.php';
    $table_data->getObtnerListadoVendedor('listado_grupo','Id_Grupo_Compra',array('Id_Grupo_Compra','Precio_Compra','Cantidad','Fecha_Compra','Estado','Documento','Licencia'));
?>