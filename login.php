<?php
session_start();
if(isset($_SESSION['S_IDUSUARIO'])){
    echo $_SESSION['S_IDUSUARIO'];
    if($_SESSION['S_IDUSUARIO'] == '1'){
        header('location: index.php');
    }
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login Sistema</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="buscar.css">

</head>

<body>
    <div id="contenedor" class="wrapper">

        <div id="contenedorcentrado">
            <div id="login" class="login">

                <p class="title">Iniciar Sesión</p>
                <input type="text" placeholder="Ingresar usuario" id="txt_usuario">
                <i class="fa fa-user"></i>
                <input type="password" placeholder="Ingresar contraseña" id="txt_pass">
                <i class="fa fa-key"></i>
                <button onclick="iniciar()"><i class="spinner"></i>
                    <span class="state">Ingresar</span></button>
            </div>
        </div>
    </div>
    <!-- /.login-box -->


    <!--Utilities-->
    <script src="utilities/sweetalert2.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <!--Script propip-->
    <script src="js/usuario.js?rev=<?php echo time();?>"></script> <!-- volver a recargar el js -->

</body>

</html>