<script src="js/ventas.js?rev=<?php echo time(); ?>"></script>
<div>
    <div class="nombtn">
        <h1>Zona venta</h1>

    </div>
    <div class="nombtn ganado">
        <a class="abtn" onclick="abrirmodalderegistrogrupoventa()" href="#"><span>GRUPO</span><span>GRUPO</span></a>
        <a class="abtn cancelar" onclick="abrirmodalderegistroganado()" href="#"><span>GANADO</span><span>GANADO</span></a>
        <a class="abtn" onclick="actualizarpagosganado()" href="#"><span>ENVIAR</span><span>ENVIAR</span></a>
    </div>
    <div class="recent-orders">
        <h2>Registro de ventas de ganados bovinos</h2>
        <table id="tabla_ganado_vendidos_zona" class="tablabd ganado" style="width:100%">
            <thead>
                <tr>
                    <th>Número</th>
                    <th>Raza</th>
                    <th>Sexo</th>
                    <th>Peso</th>
                    <th>Edad</th>
                    <th>Color</th>
                    <th>Aretes</th>
                    <th>Marca</th>
                    <th>Salud</th>
                    <th>Descripcion</th>
                    <th>Precio Compra</th>
                    <th>Grupo Ganado</th>
                    <th>Grupo Venta</th>
                </tr>
            </thead>
        </table>
        <div id="modal_grupo_ganado_Venta" class="modal-container">
            <div class="modal grandes">
                <div class="">
                    <h3>Nombre del comprador</h3>
                    <select class="select-css" id="select_comprador" style="width:100%"></select>
                </div>
                <div class="">
                    <h3>Licencia del Transportista</h3>
                    <select class="select-css" id="select_transportista_lista_venta" style="width:100%"></select>
                </div>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca el pago" id="pagoparcialZonaVenta">
                    <span>Pago adelantando o cancelado</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Transportista</span>
                    <input class="form-field" type="number" placeholder="Introduzca el flete del transportista" id="BiaticoInicioZonaVenta">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca los Biaticos extras" id="BiaticoExtrasZonaVenta">
                    <span>Biaticos extras</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Biatico personal</span>
                    <input class="form-field" type="number" placeholder="Introduzca los Biatico personal" id="BiaticoPersonalZonaVenta">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca los Biaticos de laempresa" id="BiaticoEmpresaZonaVenta">
                    <span>Biaticos de la empresa</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Lugar de Venta</span>
                    <input class="form-field" type="text" placeholder="Introduzca el lugar de la venta" id="ubicacion_venta">
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalregistrogrupoventa()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="registrargrupoVenta()">Registrar grupo</button>
                </div>

            </div>
        </div>
        <div id="modal_ganado_venta_ventass" class="modal-container">
            <div class="modal grandes ganado venta">
                <div class="">
                    <h3>Seleccione el grupo de compra</h3>
                    <select class="select-css" id="select_grupo_ganado" style="width:100%"></select>
                </div>
                <div class="">
                    <h3>Seleccione el ganado de compra</h3>
                    <select class="select-css" id="select_ganado_vacuno" style="width:100%"></select>
                </div>
                <div class="form-group">
                    <span>Id</span>
                    <input class="form-field" type="number" placeholder="Introduzca el id del ganado" id="id_zonaventa" disabled>
                </div>
                <br>
                <div class="form-group">
                    <span>Raza</span>
                    <input class="form-field" type="text" placeholder="Introduzca la raza del ganado vacuno" id="Raza_zonaventa" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca el peso del ganado vacuno" id="Peso_zonaventa" disabled>
                    <span>Peso</span>
                </div>
                <br>

                <div class="form-group">
                    <span>Color</span>
                    <input class="form-field" type="text" placeholder="Introduzca el color del ganado vacuno" id="Color_zonaventa" disabled>
                </div>
                <br>

                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca los aretes del ganado vacuno" id="Aretes_zonaventa" disabled>
                    <span>Aretes</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Marca</span>
                    <input class="form-field" type="text" placeholder="Introduzca la marca del ganado vacuno" id="Marca_zonaventa" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca la edad del ganado vacuno" id="Edad_zonaventa" disabled>
                    <span>Edad</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Sexo</span>
                    <input class="form-field" type="text" placeholder="Introduzca el sexo del ganado vacuno" id="Sexo_zonaventa" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca la salud del ganado vacuno" id="Salud_zonaventa" disabled>
                    <span>Salud</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Descripcion</span>
                    <input class="form-field" type="text" placeholder="Introduzca la descripcion del ganado vacuno" id="Descripcion_zonaventa" disabled>
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalregistroganadoventa()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="registroGanadoVenta()">Guardar</button>

                </div>


            </div>
        </div>

    </div>
    <script src="js/ventas.js"></script>
    <script>
        lista_ganado_simple_vendidos_zona();
        cargarcomprador();
        cargartransportistaventa();
        cargargrupoganado();
        var ejecuto = false;
        $("#select_grupo_ganado").change(function() {
            var grupoid = $("#select_grupo_ganado").val();
            console.log(grupoid);
            cargarganado(grupoid);
            ejecuto = true;
        })

        $("#select_ganado_vacuno").change(function() {
            var ganadoid = $("#select_ganado_vacuno").val();
            localStorage.setItem("idganadoescogido", ganadoid);
            cargarGanadoInput(ganadoid);

        })
    </script>