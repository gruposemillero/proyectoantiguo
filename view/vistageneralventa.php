<script src="js/lista_venta.js?rev=<?php echo time(); ?>"></script>

<div>

    <div class="nombtn">
        <h1>Registro general de ventas de ganados bovinos</h1>

    </div>
    <div class="nombtn">
        <a class="abtn" onclick="abrirModalActualiaciondePagoslistaventa()" href="#"><span>ACTUALIZAR</span><span>ACTUALIZAR</span></a>
        <div class="form-group ganancias">
            <input class="form-field ganancia" type="number" placeholder="Introduzca el DNI del comprador" id="dni_buscar_lista_venta">
            <span>DNI</span>
        </div>
        <a class="abtn" onclick="lista_Ganado_serverside()" href="#"><span>Buscador</span><span>Buscador</span></a>

    </div>
    <div class="recent-orders">
        <table id="tabla_grupo1" class="tablabd general" style="width:100%">
            <thead>
                <tr>
                    <th>Id grupo</th>
                    <th>Fecha</th>
                    <th>Nombre Comprador</th>
                    <th>DNI</th>
                    <th>Licencia Transportista</th>
                    <th>Codigo Pago</th>
                    <th>Cantidad</th>
                    <th>Peso Total</th>
                    <th>Precio Compra</th>
                    <th>Ubicacion de venta</th>
                    <th>Precio Unidad</th>
                    <th>Precio total</th>
                    <th>Deuda</th>
                    <th>Accion</th>
                </tr>
            </thead>
        </table>
        <div class="nombtn ganado">
            <a class="abtn" onclick="sumatotaldeuda()" href="#"><span>DEUDA</span><span>DEUDA</span></a>
            <div class="form-group ganancias">
                <input class="form-field ganancia deuda" type="number" placeholder="deuda total" id="deudatotalpersonas" disabled>
                <span>Deuda Total</span>
            </div>
        </div>


        <div id="modal_grupo_editar1" class="modal-container">
            <div class="modal">
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="" id="id_editar" disabled>
                    <span>ID</span>
                </div>
                <br>
                <div class="form-group">
                    <span>fecha</span>
                    <input class="form-field" type="date" placeholder="Introduzca la cantidad de ganado" id="fecha_editar" disabled>
                </div>
                <br>
                <div class="form-group">

                    <input class="form-field" type="number" placeholder="Introduzca la cantidad de ganado" id="cantidad_editar">
                    <span>Cantidad</span>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="" id="precio_editar">
                    <span>Precio</span>
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalregistro()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="modificargrupo()">Registrar grupo</button>
                </div>

            </div>
        </div>
        <div id="modal_ganado_grupo1_venta" class="modal-container">

            <div class="modal tableta">
                <br>
                <br>
                <table id="tablita1_ventaslista" class="tablabd general" style="width:100%; ">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombres</th>
                            <th>Raza</th>
                            <th>Peso</th>
                            <th>Precio Compra</th>
                            <th>Precio Unitario</th>
                            <th>Peso Actual</th>
                            <th>Precio Venta</th>
                            <th>Sexo</th>
                            <th>Color</th>
                            <th>Salud</th>
                            <th>Aretes</th>
                            <th>Marca</th>
                            <th>Descripcion</th>
                            <th>Grupo Ganado</th>
                            <th>Grupo Venta</th>
                            <th>Edad</th>
                            <th>Ganacia o Perdida</th>
                        </tr>
                    </thead>
                </table>
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalganado_ventaslista()" role="button">Salir</button>
                </div>
                <br><br>
            </div>
        </div>
        <div id="modal_ganado_actualizarpagolistaventa" class="modal-container">
            <div class="modal">
                <div class="">
                    <h3>Seleccione al grupo</h3>
                    <select class="select-css" id="select_grupo_ganado_lista_venta_general" style="width:100%"></select>
                </div>
                <div class="form-group">
                    <span>Peso Total </span>
                    <input class="form-field" type="number" placeholder="Introduzca el pago total del grupo" id="pagototalganado">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca el id del ganado" id="preciounidadganado">
                    <span>Precio unidad</span>
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalganadoactualizadolistaventa()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="actualizarpagototalganado()">Guardar</button>

                </div>


            </div>
        </div>
        <div id="modal_ganado_actualizarpagolistaventa_Precio_Unidad" class="modal-container">
            <div class="modal grandes ganado venta">
                <div class="">
                    <h3>Seleccione el grupo de compra</h3>
                    <select class="select-css" id="select_grupo_ganado_lista_ventas_pu" style="width:100%"></select>
                </div>
                <div class="">
                    <h3>Seleccione el ganado de compra</h3>
                    <select class="select-css" id="select_ganado_vacuno_lista_ventas_pu" style="width:100%"></select>
                </div>
                <div class="form-group">
                    <span>Id</span>
                    <input class="form-field" type="number" placeholder="Introduzca el id del ganado" id="id_lista_ventas_pu" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca la raza del ganado vacuno" id="Raza_lista_ventas_pu" disabled>
                    <span>Raza</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Peso</span>
                    <input class="form-field" type="number" placeholder="Introduzca el peso del ganado vacuno" id="Peso_lista_ventas_pu" disabled>
                </div>
                <br>

                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el color del ganado vacuno" id="Color_lista_ventas_pu" disabled>
                    <span>Color</span>
                </div>
                <br>

                <div class="form-group">
                    <span>Aretes</span>
                    <input class="form-field" type="text" placeholder="Introduzca los aretes del ganado vacuno" id="Aretes_lista_ventas_pu" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca la marca del ganado vacuno" id="Marca_lista_ventas_pu" disabled>
                    <span>Marca</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Edad</span>
                    <input class="form-field" type="number" placeholder="Introduzca la edad del ganado vacuno" id="Edad_lista_ventas_pu" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el sexo del ganado vacuno" id="Sexo_lista_ventas_pu" disabled>
                    <span>Sexo</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Salud</span>
                    <input class="form-field" type="text" placeholder="Introduzca la salud del ganado vacuno" id="Salud_lista_ventas_pu" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca la descripcion del ganado vacuno" id="Descripcion_lista_ventas_pu" disabled>
                    <span>Descripcion</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Precio Unidad</span>
                    <input class="form-field" type="text" placeholder="Introduzca la descripcion del ganado vacuno" id="Precio_Unidad_lista_ventas_pu" >
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca la descripcion del ganado vacuno" id="Peso_Actual_lista_ventas_pu" >
                    <span>Peso Actual</span>
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalganadoactualizadolistaventaPrecioUnidad()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="actualizarpagototalganadoPrecioUnidad()">Guardar</button>
                    <button class="button-34" role="button" onclick="actualizarpagosganadoPrecioUnidadFinal()">Enviar</button>

                </div>


            </div>
        </div>


    </div>
    <script src="js/lista_venta.js"></script>

    <script>
        lista_Ganado_serverside();
        cargargrupoganadovendidoslistaventa();
        cargargrupoganadovendidoslistaventaPrecioUnidad();
        $("#select_grupo_ganado_lista_ventas_pu").change(function() {
            var grupoidListaVenta = $("#select_grupo_ganado_lista_ventas_pu").val();
            console.log(grupoidListaVenta);
            cargarganadoListaVendidosPU(grupoidListaVenta);
        })
        $("#select_ganado_vacuno_lista_ventas_pu").change(function() {
            var ganadoid = $("#select_ganado_vacuno_lista_ventas_pu").val();
            cargarGanadoInputPu(ganadoid);

        })
    </script>
</div>