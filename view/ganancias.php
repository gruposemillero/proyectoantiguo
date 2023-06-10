<script src="js/ganancias.js?rev=<?php echo time(); ?>"></script>

<div>
    <div class="nombtn">

        <h1>Zona de ganancias</h1>
    </div>
    <div class="nombtn">
        <div class="form-group ganancias">

            <input class="form-field ganancia" type="number" placeholder="introduzca el dni del comprador"
                id="dni_buscar">
            <span>DNI</span>
        </div>
        <a class="abtn" onclick="lista_ganancias()" href="#"><span>Buscador</span><span>Buscador</span></a>
        <a class="abtn cancelar" onclick="sacarganancias()" href="#"><span>ganancias</span><span>ganancias</span></a>


    </div>
    <div class="recent-orders">
        <h2>Registro de ganancias </h2>
        <table id="tabla_ganancias" class="tablabd general" style="width:100%">
            <thead>
                <tr>
                    <th>Grupo venta</th>
                    <th>Fecha</th>
                    <th>Nombre del comprador</th>
                    <th>DNI</th>
                    <th>Licencia Transportista</th>
                    <th>Cantidad</th>
                    <th>Precio Compra</th>
                    <th>Gasto Inicial</th>
                    <th>Precio Compra Total</th>
                    <th>Precio Venta</th>
                    <th>Gasto Final</th>
                    <th>Precio Venta Total</th>
                    <th>Ganacias</th>
                    <th>Accion</th>
                </tr>
            </thead>
        </table>
        <div id="modal_ganado_grupo1_ganancias" class="modal-container">

            <div class="modal tableta">
                <br>
                <br>
                <table id="tabla_ganado_ganancias" class="tablabd general" style="width:100%; ">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombres</th>
                            <th>Raza</th>
                            <th>Peso</th>
                            <th>Precio Compra</th>
                            <th>Peso Actual</th>
                            <th>Precio Unitario</th>
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
                    <button class="button-34 cancelar" onclick="cerrarmodalganado_ganancias()" role="button">Salir</button>
                </div>
                <br><br>
            </div>
        </div>
        <div id="modal_pago_final" class="modal-container">
            <div class="modal">
                <div class="form-group">
                    <span>Precio de Compra total</span>
                    <input class="form-field" type="number" placeholder="Introduzca el precio compra total" id="ptc"
                        disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca el precio venta total" id="pvt"
                        disabled>
                    <span>Precio de Venta total</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Ganancia o Perdida</span>
                    <input class="form-field" type="number" placeholder="Introduzca las ganancias" id="ga" disabled>
                </div>

                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalpagototal()" role="button">okay</button>

                </div>

            </div>
        </div>

    </div>
    <script src="js/ganancias.js"></script>

    <script>
    lista_ganancias();
    lista_ganado_simple_ganancias();
    </script>
</div>