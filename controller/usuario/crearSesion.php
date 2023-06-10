<?php
$idusuario = htmlspecialchars($_POST['idusuario'],ENT_QUOTES,'UTF-8'); 
$usuario = htmlspecialchars($_POST['usuario'],ENT_QUOTES,'UTF-8');//evitamos codigo javascript
$nombre = htmlspecialchars($_POST['nombre'],ENT_QUOTES,'UTF-8');//evitamos codigo javascript
$apellido = htmlspecialchars($_POST['apellido'],ENT_QUOTES,'UTF-8');//evitamos codigo javascript
$documento = htmlspecialchars($_POST['documento'],ENT_QUOTES,'UTF-8');//evitamos codigo javascript
session_start();
$_SESSION['S_IDUSUARIO'] = $idusuario; //NOMBRE
$_SESSION['S_USUARIO'] = $usuario; // USUARIO
$_SESSION['S_NOMBRE'] = $nombre; //ID
$_SESSION['S_APELLIDO'] = $apellido; //DNI
$_SESSION['S_DOCUMENTO'] = $documento; //APELLIDO

?>