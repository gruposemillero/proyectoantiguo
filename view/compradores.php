<script src="js/comprador.js?rev=<?php echo time(); ?>"></script>

<div>

    <div class="nombtn">
        <h1>Compradores</h1>
    </div>
    <br>
    <div class="nombtn">
		<a class="abtn" onclick="abrirmodalderegistrocomprador()" href="#"><span>AGREGAR</span><span>AGREGAR</span></a>
    </div>
    <div class="recent-orders">
        <h2>Registro de compradores</h2>
        <table id="tabla_comprador" class="tablabd proveedor" style="width:100%">
            <thead>
                <tr>
                    <th>Número</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>DNI</th>
                    <th>RUC</th>
                    <th>Eliminar - Modificar</th>
                </tr>
            </thead>
        </table>


        <div id="modal_comprador_compra" class="modal-container">
            <div class="modal">
                <div class="form-group">
                    <span>Nombre</span>
                    <input class="form-field" type="text" placeholder="Introduzca el nombre del comprador" id="nombre_comprador" >
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el apellido del comprador" id="apellido_comprador">
                    <span>Apellido</span>
                </div>
                <br>
                <div class="form-group">
                    <span>DNI</span>
                    <input class="form-field" type="number" placeholder="Introduzca el DNI del comprador" id="documento_comprador">
                </div>

                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca el ruc del comprador" id="ruc_comprador">
                    <span>RUC</span>
                </div>

                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalregistrocomprador()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="registar_comprador_compra()">Guardar</button>

                </div>

            </div>
        </div>
        <div id="modal_container_editar_comprador" class="modal-container">
            <div class="modal">
                <div class="form-group">
                    <input class="form-field" style="text-transform:uppercase;" type="text"  id="id_editar_comprador" disabled>
                    <span>ID</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Nombre</span>
                    <input class="form-field" type="text" placeholder="Introduzca el nombre del comprador" id="nombre_editar_comprador">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el apellido del comprador" id="apellido_editar_comprador">
                    <span>Apellido</span>
                </div>
                <br>
                <div class="form-group">
                    <span>DNI</span>
                    <input class="form-field" type="number" placeholder="Introduzca el documento del comprador" id="documento_editar_comprador">
                </div>

                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca el ruc del comprador" id="ruc_editar_comprador">
                    <span>RUC</span>
                </div>

                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodaleditar()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="modificarComprador()">Modificar</button>

                </div>

            </div>
        </div>
        <div id="modal_container_eliminar_comprador" class="modal-container">
            <div class="modal">
            <div class="form-group">
                    <input class="form-field" style="text-transform:uppercase;" type="text"  id="id_eliminar_comprador" disabled>
                    <span>ID</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Nombre</span>
                    <input class="form-field" type="text" placeholder="Introduzca el nombre del comprador" id="nombre_eliminar_comprador"disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el apellido del comprador" id="apellido_eliminar_comprador"disabled>
                    <span>Apellido</span>
                </div>
                <br>
                <div class="form-group">
                    <span>DNI</span>
                    <input class="form-field" type="number" placeholder="Introduzca el documento del comprador" id="documento_eliminar_comprador"disabled>
                </div>

                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca el ruc del comprador" id="ruc_eliminar_comprador" disabled>
                    <span>RUC</span>
                </div>

                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodaleliminar()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="eliminarcomprador()">Eliminar</button>

                </div>

            </div>
        </div>
            

</div>
<script src="js/comprador.js"></script>
<script>
    lista_compradores_serverside();
</script>