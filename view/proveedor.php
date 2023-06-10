<script src="js/Proveedor.js?rev=<?php echo time(); ?>"></script>


<div>

    <div class="nombtn">
        <h1>Proveedores</h1>
        
    </div>
    <br>
    <div class="nombtn">
		<a class="abtn" onclick="abrirmodalderegistro()" href="#"><span>AGREGAR</span><span>AGREGAR</span></a>
    </div>
    <div class="recent-orders">
        <h2>Registro de proveedores</h2>
        <table id="tabla_proveedor" class="tablabd proveedor" style="width:100%">
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


        <div id="modal_proveedor" class="modal-container">
            <div class="modal">
                <div class="form-group">
                    <span>Nombre</span>
                    <input class="form-field" type="text" placeholder="Introduzca el nombre del proveedor" id="nombre_proveedor" >
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el apellido del proveedor" id="apellido_proveedor">
                    <span>Apellido</span>
                </div>
                <br>
                <div class="form-group">
                    <span>DNI</span>
                    <input class="form-field" type="number" placeholder="Introduzca el DNI del proveedor" id="documento_proveedor">
                </div>

                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca el RUC del proveedor" id="ruc_proveedor">
                    <span>RUC</span>
                </div>

                <br>

                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalregistro()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="registar_proveedor()">Guardar</button>

                </div>

            </div>
        </div>
        <div id="modal_container_editar_proveedor" class="modal-container">
            <div class="modal">
                <div class="form-group">
                    <input class="form-field"  type="text"  id="id_editar_proveedor" disabled>
                    <span>ID</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Nombre</span>
                    <input class="form-field" type="text" placeholder="Introduzca el nombre del proveedor" id="nombre_editar_proveedor">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el apellido del proveedor" id="apellido_editar_proveedor">
                    <span>Apellido</span>
                </div>
                <br>
                <div class="form-group">
                    <span>DNI</span>
                    <input class="form-field" type="number" placeholder="Introduzca el DNI del proveedor" id="documento_editar_proveedor">
                </div>

                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca el RUC del proveedor" id="ruc_editar_proveedor">
                    <span>RUC</span>
                </div>

                <br>
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodaleditar()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="modificarproveedor()">Modificar</button>

                </div>

            </div>
        </div>
        <div id="modal_container_eliminar_proveedor" class="modal-container">
            <div class="modal">
            <div class="form-group">
                    <input class="form-field" style="text-transform:uppercase;" type="text"  id="id_eliminar_proveedor" disabled>
                    <span>ID</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Nombre</span>
                    <input class="form-field" type="text" placeholder="Introduzca el nombre del proveedor" id="nombre_eliminar_proveedor"disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el apellido del proveedor" id="apellido_eliminar_proveedor"disabled>
                    <span>Apellido</span>
                </div>
                <br>
                <div class="form-group">
                    <span>DNI</span>
                    <input class="form-field" type="number" placeholder="Introduzca el DNI del proveedor" id="documento_eliminar_proveedor"disabled>
                </div>

                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca el RUC del proveedor" id="ruc_eliminar_proveedor" disabled>
                    <span>RUC</span>
                </div>

                <br>
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodaleliminar()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="eliminarproveedor()">Eliminar</button>

                </div>

            </div>
        </div>
            

</div>
<script src="js/Proveedor.js"></script>
<script>
    lista_proveedores_serverside();
</script>