<?php
    require '../../model/modelo_usuario.php';
    $MU = new Modelo_Usuario(); //creamos un objeto
    $usu = htmlspecialchars($_POST['u'],ENT_QUOTES,'UTF-8'); 
    $pass = htmlspecialchars($_POST['p'],ENT_QUOTES,'UTF-8');//evitamos codigo javascript
    $consulta = $MU->VerificarUsuario($usu,$pass);
    if(count($consulta)>0){
        echo json_encode($consulta); //de utf8 a string json
    }else{
        echo 0;
    }
?>