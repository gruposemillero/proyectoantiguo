<?php
    require 'serverside.php';
    $table_data->getObtnerListadoVendedor('listado_grupo_ventas','Grupo_Venta',array('Grupo_Venta','Fecha','Id_Pago','Nombre','Documento','Licencia','Cantidad','Ubicacion','Precio_Unidad','Pago_Total','Restante'));
?>