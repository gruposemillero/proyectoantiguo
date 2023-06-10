<script src="js/lista_general.js?rev=<?php echo time(); ?>"></script>

<div>

    <div class="nombtn">
        <h1>Registro general de compra de ganados bovinos</h1>
    </div>
    <div class="recent-orders">
        <h2>Listado de compra de ganados bovinos</h2>
        <table id="tabla_grupo" class="tablabd general" style="width:100%">
            <thead>
                <tr>
                    <th>Id grupo</th>
                    <th>Fecha</th>
                    <th>Nombre del proveedor</th>
                    <th>DNI</th>
                    <th>Licencia Transportista</th>
                    <th>Codigo pago</th>
                    <th>Ubicacion de compra</th>
                    <th>Peso total</th>
                    <th>Precio unidad</th>
                    <th>Precio total</th>
                    <th>Deuda</th>
                    <th>Accion</th>
                </tr>
            </thead>
        </table>

        <div id="modal_ganado_grupo" class="modal-container">
            <br>
            <br>
            <div class="modal tableta">
                <br>
                <br>
                <br>
              
                <table id="tablita" class="tablabd general" style="width: 100%;">
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
                            <th>Operacion</th>
                        </tr>
                    </thead>
                </table>
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalganado()" role="button">Cancelar</button>
                </div>
                <br>
            </div>
        </div>
        <div id="modal_ganado_lista_general" class="modal-container">
            <div class="modal grandes ganado">
                <div class="form-group">
                    <span>Precio por unidad</span>
                    <input class="form-field" type="number" placeholder="Introduzca el precio por unidad adquirido"
                        id="preciounidad" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca la raza del ganado vacuno" id="Raza">
                    <span>Raza</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Peso</span>
                    <input class="form-field" type="number" placeholder="Introduzca el peso del ganado vacuno"
                        id="Peso">
                </div>
                <br>

                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el color del ganado vacuno"
                        id="Color">
                    <span>Color</span>
                </div>
                <br>

                <div class="form-group">
                    <span>Aretes</span>
                    <input class="form-field" type="text" placeholder="Introduzca los aretes del ganado vacuno"
                        id="Aretes">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca la marca del ganado vacuno"
                    id="Marca">
                    <span>Marca</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Edad</span>
                    <input class="form-field" type="number" placeholder="Introduzca la edad del ganado vacuno"
                        id="Edad">
                </div>
                <br>
                <div class="">
                    <h3>Sexo</h3>
                    <select class="select-css" id="select_sexo_listageneral" style="width:100%"></select>
                    </div>

                <div class="">
                    <h3>Salud</h3>
                    <select class="select-css" id="select_salud_listageneral" style="width:100%"></select>
                </div>
                <div class="form-group">
                    <span>Descripcion</span>
                    <input class="form-field" type="text" placeholder="Introduzca la descripcion del ganado vacuno"
                        id="Descripcion">
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalregistroganadolistageneral()"
                        role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="registroGanadolistageneral()">Guardar</button>

                </div>


            </div>
        </div>
        <div id="modal_pago" class="modal-container">
            <div class="modal grandes ganado">
                <div class="form-group">
                    <span>Precio Total</span>
                    <input class="form-field" type="number" placeholder="Introduzca el precio por unidad adquirido"
                        id="preciototal" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" value="0" placeholder="Introduzca la raza del ganado vacuno"
                        id="pagoparcial">
                    <span>Pago Parcial</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Biaticos de Compra</span>
                    <input class="form-field" style="text-transform:uppercase;" value="0" type="number"
                        placeholder="introduzca los Biaticos de Compra" id="BiaticoInicio">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" value="0" placeholder="Introduzca los Biaticos extras"
                        id="BiaticoExtras">
                    <span>Biaticos extras</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Biatico personal</span>
                    <input class="form-field" type="number" value="0" placeholder="Introduzca los Biatico personal"
                        id="BiaticoPersonal">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" value="0" placeholder="Introduzca los Biaticos de laempresa"
                        id="BiaticoEmpresa">
                    <span>Biaticos de la empresa</span>
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalregistropago()"
                        role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="registrarpago()">Registrar grupo</button>
                </div>

            </div>
        </div>
        <div id="modal_ganado_modificar" class="modal-container">
            <div class="modal grandes ganado">
                <div class="form-group">
                    <span>Precio por unidad</span>
                    <input class="form-field" type="number" placeholder="Introduzca el precio por unidad adquirido"
                        id="preciounidad_editar" disabled>
                </div>
                <br>
                <div class="form-group">
                    <span>Id</span>
                    <input class="form-field" type="number" placeholder="Introduzca el precio por unidad adquirido"
                        id="id_editar_ganado" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca la raza del ganado vacuno"
                        id="Raza_editar">
                    <span>Raza</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Peso</span>
                    <input class="form-field" type="number" placeholder="Introduzca el peso del ganado vacuno"
                        id="Peso_editar" disabled>
                </div>
                <br>

                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el color del ganado vacuno"
                        id="Color_editar">
                    <span>Color</span>
                </div>
                <br>

                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca los aretes del ganado vacuno"
                        id="Aretes_editar">
                    <span>Aretes</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Marca</span>
                    <input class="form-field" type="text" placeholder="Introduzca la marca del ganado vacuno"
                        id="Marca_editar">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca la edad del ganado vacuno"
                        id="Edad_editar">
                    <span>Edad</span>
                </div>
                <br>
                <div class="">
                    <h3>Sexo</h3>
                    <select class="select-css" id="select_sexo_editar_listageneral" style="width:100%"></select>
                </div>

                <div class="">
                    <h3>Salud</h3>
                    <select class="select-css" id="select_salud_editar_listageneral" style="width:100%"></select>
                </div>
                <div class="form-group">
                    <span>Descripcion</span>
                    <input class="form-field" type="text" placeholder="Introduzca la descripcion del ganado vacuno"
                        id="Descripcion_editar">
                </div>
                <br>

                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalmodificarganado()"
                        role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="modificarGanado()">Guardar</button>

                </div>


            </div>
        </div>


    </div>
    <script src="js/lista_general.js"></script>

    <script>
    lista_Ganado_serverside();
    lista_ganado_simple()
    datosdelselectlistageneral();
    </script>
</div>