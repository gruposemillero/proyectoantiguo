<?php
    require '../../model/modelo_ganado.php';

    $idGrupo = htmlspecialchars($_POST['id'],ENT_QUOTES,'UTF-8');
    $MG = new Modelo_Ganado();
    $consulta = $MG->listar_ganado_grupo($idGrupo);
    if($consulta){
        echo json_encode($consulta);
    }else{
        echo '{
            "sEcho":1,
            "iTotalRecords":"0",
            "iTotalDisplayRecords":"0",
            "aaData":[]
        }';
    }
    
?>
