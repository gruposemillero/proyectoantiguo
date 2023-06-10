<script src="js/ganado.js?rev=<?php echo time(); ?>"></script>
<div >
    <div class="nombtn">
        <h1>Zona de compra</h1>

    </div>
    <div class="nombtn ganado">
		<a class="abtn" onclick="abrirmodalderegistro()" href="#"><span>GRUPO</span><span>GRUPO</span></a>
		<a class="abtn cancelar" onclick="abrirmodalderegistroganado()" href="#"><span>GANADO</span><span>GANADO</span></a>
		<a class="abtn" onclick="actualizarpagosganado()" href="#"><span>ENVIAR</span><span>ENVIAR</span></a>
    </div>
    <div class="recent-orders">
        <h2>Registro de compra de ganados bovinos</h2>
        <table id="tabla_ganado" class="tablabd ganado" style="width:100%">
            <thead>
                <tr>
                    <th>Número</th>
                    <th>Raza</th>
                    <th>Sexo</th>
                    <th>Peso</th>
                    <th>Edad</th>
                    <th>Tipo</th>
                    <th>Color</th>
                    <th>Aretes</th>
                    <th>Marca</th>
                    <th>Salud</th>
                    <th>Descripcion</th>
                    <th>Idgrupo</th>
                    <th>Precio</th>
                    <th>Estado</th>
                </tr>
            </thead>
        </table>
        <div id="modal_grupo" class="modal-container">
            <div class="modal grandes ganado">
                <div class="">
                    <h3>Nombre del proveedor</h3>
                    <select class="select-css" id="select_proveedor" style="width:100%"></select>
                </div>
                <div class="">
                    <h3>Licencia del Transportista</h3>
                    <select class="select-css" id="select_transportista" style="width:100%"></select>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number"  placeholder="Introduzca el pago" id="pagoparcial">
                    <span>Pago adelantado o cancelado</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Transportista</span>
                    <input class="form-field"   type="number" placeholder="Introduzca el flete del transportista" id="BiaticoInicio" >
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number"  placeholder="Introduzca los Biaticos extras" id="BiaticoExtras" >
                    <span>Biaticos extras</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Biatico personal</span>
                    <input class="form-field" type="number"  placeholder="Introduzca los Biatico personal" id="BiaticoPersonal" >
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number"  placeholder="Introduzca los Biaticos de la empresa" id="BiaticoEmpresa" >
                    <span>Biaticos de la empresa</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Lugar de Compra</span>
                    <input class="form-field" type="text"  placeholder="Introduzca el lugar de compra" id="ubicacion" >
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca el precio por unidad" id="preciounidad">
                    <span>Precio por unidad</span>
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalregistro()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="registrargrupo()">Registrar grupo</button>
                </div>

            </div>
        </div>
        <div id="modal_grupo_total" class="modal-container">
            <div class="modal grandes ganado">
                <div class="">
                    <h3>Nombre del proveedor</h3>
                    <select class="select-css" id="select_proveedor_total" style="width:100%"></select>
                </div>
                <div class="">
                    <h3>Licencia del Transportista</h3>
                    <select class="select-css" id="select_transportista_total" style="width:100%"></select>
                </div>
                <br>
                <div class="form-group">
                    <span>Pago Total</span>
                    <input class="form-field" type="number"  placeholder="Introduzca el pago total de la compra" id="pagototal_total">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number"  placeholder="Introduzca el pago" id="pagoparcial_total">
                    <span>Pago adelanto o cancelado</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Transportista</span>
                    <input class="form-field"   type="number" placeholder="Introduzca el flete del transportista" id="BiaticoInicio_total" >
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number"  placeholder="Introduzca los Biaticos extras" id="BiaticoExtras_total" >
                    <span>Biaticos extras</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Biatico personal</span>
                    <input class="form-field" type="number"  placeholder="Introduzca los Biatico personal" id="BiaticoPersonal_total" >
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number"  placeholder="Introduzca los Biaticos de la empresa" id="BiaticoEmpresa_total" >
                    <span>Biaticos de la empresa</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Lugar de Compra</span>
                    <input class="form-field" type="text"  placeholder="Introduzca el lugar de compra" id="ubicacion_total" >
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca el precio por unidad adquirido" id="preciounidad_total" disabled value="0">
                    <span>Precio por unidad</span>
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalregistrototal()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="registrargrupo()">Registrar grupo</button>
                </div>

            </div>
        </div>
        <div id="modal_ganado" class="modal-container">
            <div class="modal grandes ganado">
                
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca la raza del ganado vacuno" id="Raza">
                    <span>Raza</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Peso</span>
                    <input class="form-field" type="number" placeholder="Introduzca el peso del ganado vacuno" id="Peso">
                </div>
                <br>

                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el color del ganado vacuno" id="Color">
                    <span>Color</span>
                </div>
                <br>

                <div class="form-group">
                    <span>Aretes</span>
                    <input class="form-field" type="text" placeholder="Introduzca los aretes del ganado vacuno" id="Aretes">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca la marca del ganado vacuno" id="Marca">
                    <span>Marca</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Edad</span>
                    <input class="form-field" type="number" placeholder="Introduzca la edad del ganado vacuno" id="Edad">
                </div>
                <br>
                <div class="">
                    <h3>Edad</h3>
                    <select class="select-css" id="select_edad" style="width:100%"></select>
                </div>
                <div class="">
                    <h3>Sexo</h3>
                    <select class="select-css" id="select_sexo" style="width:100%"></select>
                </div>

                <div class="">
                    <h3>Salud</h3>
                    <select class="select-css" id="select_salud" style="width:100%"></select>
                </div>
                <div class="form-group">
                    <span>Descripcion</span>
                    <input class="form-field" type="text" placeholder="Introduzca la descripcion del ganado vacuno" id="Descripcion">
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalregistroganado()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="registroGanado()">Guardar</button>

                </div>


            </div>
        </div>
        <div id="modal_ganado_total" class="modal-container">
            <div class="modal grandes ganado">
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca la raza del ganado vacuno" id="Raza_total">
                    <span>Raza</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Peso</span>
                    <input class="form-field" type="number" placeholder="Introduzca el peso del ganado vacuno" id="Peso_total">
                </div>
                <br>

                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el color del ganado vacuno" id="Color_total">
                    <span>Color</span>
                </div>
                <br>

                <div class="form-group">
                    <span>Aretes</span>
                    <input class="form-field" type="text" placeholder="Introduzca los aretes del ganado vacuno" id="Aretes_total">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca la marca del ganado vacuno" id="Marca_total">
                    <span>Marca</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Edad</span>
                    <input class="form-field" type="number" placeholder="Introduzca la edad del ganado vacuno" id="Edad_total">
                </div>
                <br>
                <div class="">
                    <h3>Edad</h3>
                    <select class="select-css" id="select_edad_total" style="width:100%"></select>
                </div>
                <div class="">
                    <h3>Sexo</h3>
                    <select class="select-css" id="select_sexo_total" style="width:100%"></select>
                </div>

                <div class="">
                    <h3>Salud</h3>
                    <select class="select-css" id="select_salud_total" style="width:100%"></select>
                </div>
                <div class="form-group">
                    <span>Descripcion</span>
                    <input class="form-field" type="text" placeholder="Introduzca la descripcion del ganado vacuno" id="Descripcion_total">
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalregistroganadototal()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="registroGanadoTotal()">Guardar</button>

                </div>


            </div>
        </div>

</div>

<script src="js/ganado.js"></script>
<script>
    lista_ganado_simple();
    cargarproveedor();
    cargartransportista();
    cargartransportistatotal();
    datosdelselect();
    datosdelselecttotal();      
    cargarproveedortotal();
</script>