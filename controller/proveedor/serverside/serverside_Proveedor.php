<?php
    require '../../serverside/serverside.php';
    $table_data->getObtnerListadoVendedor('listado_proveedor','Id_Proveedor',array('Id_Proveedor','Nombre','Apellido','Documento','Ruc'));
?>