<?php
    session_start();
    if (!isset($_SESSION['S_IDUSUARIO'])) {
    header('location: login.php'); // con esto condicionamos par que no se
    }
    ?>

<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de compra y venta de ganados bovinos</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="jquery-3.4.1.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet" />
    <!-- style datatables-->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">

    <link rel="stylesheet" type="text/css" href="utilities/DataTables/datatables.min.css" />
    <link rel="stylesheet" href="utilities/select2.min.js">
</head>

<body>
    <div class="container">
        <div class="navigation" id="navi">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon">
                            <ion-icon name="logo-apple"></ion-icon>
                        </span>
                        <span class="title">Bienvenidos Sr. Nicolas L.</span>
                    </a>
                </li>
                <!--<li>
                    <a id="principal" href="#">
                        <span class="icon">
                            <ion-icon name="home-outline"></ion-icon>
                        </span>
                        <span class="title">Dashboard</span>
                    </a>
                </li>-->
                <li>
                    <a id="proveedor" href="#">
                        <span class="icon">
                            <ion-icon name="people"></ion-icon>
                        </span>
                        <span class="title">Proveedor</span>
                    </a>
                </li>
                <li>
                    <a id="transportista" href="#">
                        <span class="icon">
                            <ion-icon name="car"></ion-icon>
                        </span>
                        <span class="title">Transportista</span>
                    </a>
                </li>
                <li>
                    <a id="ganado" href="#">
                        <span class="icon">
                            <ion-icon name="clipboard"></ion-icon>
                        </span>
                        <span class="title">Ganados - compra</span>
                    </a>
                </li>
                <li>
                    <a id="lista-general" href="#">
                        <span class="icon">
                            <ion-icon name="eye"></ion-icon>
                        </span>
                        <span class="title">Registro de compra</span>
                    </a>
                </li>
                <li>
                    <a id="compradores" href="#">
                        <span class="icon">
                            <ion-icon name="people"></ion-icon>
                        </span>
                        <span class="title">Compradores</span>
                    </a>
                </li>
                <li>
                    <a id="zona_venta" href="#">
                        <span class="icon">
                            <ion-icon name="cart"></ion-icon>
                        </span>
                        <span class="title">Ganados - Venta</span>
                    </a>
                </li>
                <li>
                    <a id="lista_venta" href="#">
                        <span class="icon">
                            <ion-icon name="eye"></ion-icon>
                        </span>
                        <span class="title">Registro de Ventas</span>
                    </a>
                </li>
                <li>
                    <a id="pago" href="#">
                        <span class="icon">
                            <ion-icon name="pricetags"></ion-icon>
                        </span>
                        <span class="title">Pagos</span>
                    </a>
                </li>
                <li>
                    <a id="ganancia" href="#">
                        <span class="icon">
                            <ion-icon name="logo-usd"></ion-icon>
                        </span>
                        <span class="title">Ganancias</span>
                    </a>
                </li>
                <li>
                    <a href="controller/usuario/cerrarSesion.php">
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title">Cerrar cesión</span>
                    </a>
                </li>
            </ul>

        </div>
        <div class="main" id="mai">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>
                <!-- search 
					<div class="search">
						<label>
							<input type="text" placeholder="Search here">
							<ion-icon name="search-outline"></ion-icon>
						</label>
					</div>-->
                <!-- userImg 
                <div class="user">
                    <img src="user.jpg">
                </div>-->
            </div>
            <div id="principalcontenido">
                <!-- cards -->


            </div>
            <div id="transportistacontenido"></div>
            <div id="proveedorcontenido"></div>
            <div id="ganadocontenido"></div>
            <div id="lista-generalcontenido"></div>
            <div id="compradorescontenido"></div>
            <div id="zona_ventacontenido"></div>
            <div id="pagocontenido"></div>
            <div id="gananciacontenido"></div>
            <div id="lista_ventacontenido"></div>

        </div>
    </div>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="index.js"></script>
    
    <script>
    let toggle = document.querySelector('.toggle');
    let navigation = document.querySelector('.navigation');
    let main = document.querySelector('.main');

    let ancho = window.screen.width;
    let alto = window.screen.heigth;
    console.log(ancho + " " + alto);
    console.log(typeof(ancho))
    if (ancho < 481) {

        document.getElementById("navi").className = "navigation ";
        document.getElementById("mai").className = "main ";
    } else {
        document.getElementById("navi").className = "navigation active";
        document.getElementById("mai").className = "main active";
    }
    toggle.onclick = function() {
        navigation.classList.toggle('active');
        main.classList.toggle('active');
    }
    // add hovered class in selected list item
    let list = document.querySelectorAll('.navigation li');

    function activeLink() {
        list.forEach((item) =>
            item.classList.remove('hovered'));
        this.classList.add('hovered');

        this.onclick = function() {
            if (ancho < 481) {
                document.getElementById("navi").className = "navigation ";
                document.getElementById("mai").className = "main ";
            } else {
                document.getElementById("navi").className = "navigation active";
                document.getElementById("mai").className = "main active";
            }

        }

    }
    list.forEach((item) =>
        item.addEventListener('mouseover', activeLink)

    );
    </script>

    <script>
    paginas2();
    </script>
    <script type="text/javascript" src="utilities/DataTables/datatables.min.js"></script>
    <script src="utilities/sum.js"></script>
    <script src="utilities/sweetalert2.js"></script>
    <script src="utilities/select2.min.js"></script>
    <script>
    let idioma_espanol = {
        select: {
            rows: "%d fila seleccionada"
        },
        "sProcessing": "Procesando...",
        "sLengthMenu": "Mostrar _MENU_ registros",
        "sZeroRecords": "No se encontraron resultados",
        "sEmptyTable": "Ning&uacute;n dato disponible en esta tabla",
        "sInfo": "Registros del (_START_ al _END_) total de _TOTAL_ registros",
        "sInfoEmpty": "Registros del (0 al 0) total de 0 registros",
        "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix": "",
        "sSearch": "Buscar:",
        "sUrl": "",
        "sInfoThousands": ",",
        "sLoadingRecords": "<b>No se encontraron datos</b>",
        "oPaginate": {
            "sFirst": "Primero",
            "sLast": "Último",
            "sNext": "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        }
    }
    $(document).ready(function() {
        $('#example').DataTable({
            autoWidth: false,
            columnDefs: [{
                targets: ['_all'],
                className: 'mdc-data-table__cell',
            }, ],
        });
    });
    </script>
</body>

</html>