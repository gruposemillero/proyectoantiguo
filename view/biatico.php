<script src="js/pago.js?rev=<?php echo time(); ?>"></script>

<div>

    <div class="nombtn">
        <h1>Pagos</h1>
        
    </div>

    <div class="recent-orders">
        <h2>Registro de Pagos</h2>
        <table id="tabla_biatico" class="tablabd ganado" style="width:100%; ">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Fecha</th>
                    <th>Tipo de Pago</th>
                    <th>Pago Total</th>
                    <th>Pago Realizado</th>
                    <th>Deuda</th>
                    <th>Biatico Inicio</th>
                    <th>Biatico Final</th>
                    <th>Biatico Extras</th>
                    <th>Biatico Personal</th>
                    <th>Biatico Empresa</th>
                    <th>Precio Unidad </th>
                    <th>Estado</th>
                    <th>Operacion</th>
                </tr>
            </thead>
        </table>
        <div id="modal_container_editar_pago" class="modal-container">
            <div class="modal">
                <div class="form-group">
                    <input class="form-field"  type="text" placeholder="" id="id_editar_pago" disabled>
                    <span>ID</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Pago Total</span>
                    <input class="form-field"  type="text" placeholder="Introduzca el pago total" id="pago_total_pago" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field deuda"  type="text" placeholder="Introduzca el pago total" id="deuda_pago" disabled>
                    <span>Deuda Pendiente</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Pago adelantado o cancelado</span>
                    <input class="form-field"  type="text" placeholder="Introduzca el pago parcial adicional" id="pago_parcial_pago">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field"  type="text" placeholder="Introduzca el flete adicional del transportista" id="BiaticoInicioeditar_pago">
                    <span>Transportista - Compra</span>
                </div>
                
                <br>
                <div class="form-group">
                    <span>Transportista - Venta</span>
                    <input class="form-field"  type="text" placeholder="Introduzca el flete adicional del transportista" id="BiaticoFinalEditar_pago">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca los Biaticos extras adicional" id="Biatico_Extras_editar_pago">
                    <span>Biaticos extras</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Biatico personal</span>
                    <input class="form-field" type="number" placeholder="Introduzca los Biatico personal adicional" id="Biatico_Personal_editar_pago">
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca los Biaticos de la empresa adicional" id="Biatico_Empresa_editar_pago">
                    <span>Biaticos de la empresa</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Precio por unidad</span>
                    <input class="form-field" type="number" placeholder="Introduzca el precio por unidad" id="PrecioUnidad_editar_pago" disabled>
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodaleditar()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="modificarBiatico()">Guardar</button>

                </div>

            </div>
        </div>
        <div id="modal_pago_grupo" class="modal-container">
            
            <div class="modal tableta">
                <br>
                <br>
                <table id="tablita1" class="tablabd general" style="width:100%; ">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Codigo Pago</th>
                            <th>Fecha Pagada</th>
                            <th>Pago Realizado</th>
                        </tr>
                    </thead>
                </table>
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalopago()" role="button">Salir</button>
                    <button class="button-34 success" onclick="elminarRegistroBiatico()" role="button">Eliminar Registro</button>
                </div>
                
                <br><br>
            </div>
        </div>
        <div id="modal_container_eliminar_pagos" class="modal-container">
            <div class="modal">
                <div class="form-group">
                    <input class="form-field"  type="text" placeholder="" id="id_eliminar_pago" disabled>
                    <span>ID</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Pago Total</span>
                    <input class="form-field"  type="text" placeholder="Introduzca el pago total" id="pago_total_eliminar_pago" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="text" placeholder="Introduzca el pago total" id="deuda_eliminar_pago" disabled>
                    <span>Deuda Pendiente</span>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field"  type="text" placeholder="Introduzca el flete adicional del transportista" id="BiaticoInicio_eliminar_pago" disabled>
                    <span>Transportista - compra</span>
                </div>
                
                <br>
                <div class="form-group">
                    <span>Transportista - venta</span>
                    <input class="form-field"  type="text" placeholder="Introduzca el flete adicional del transportista" id="BiaticoFinal_eliminar_pago" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca los Biaticos extras adicional" id="Biatico_Extras_eliminar_pago" disabled>
                    <span>Biaticos extras</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Biatico personal</span>
                    <input class="form-field" type="number" placeholder="Introduzca los Biatico personal adicional" id="Biatico_Personal_eliminar_pago" disabled>
                </div>
                <br>
                <div class="form-group">
                    <input class="form-field" type="number" placeholder="Introduzca los Biaticos de la empresa adicional" id="Biatico_Empresa_eliminar_pago" disabled>
                    <span>Biaticos de la empresa</span>
                </div>
                <br>
                <div class="form-group">
                    <span>Precio por unidad</span>
                    <input class="form-field" type="number" placeholder="Introduzca el precio por unidad" id="PrecioUnidad_eliminar_pago" disabled>
                </div>
                <br>
                <!-- HTML !-->
                <div class="btninput">
                    <button class="button-34 cancelar" onclick="cerrarmodalopagoeliminar()" role="button">Cancelar</button>
                    <button class="button-34" role="button" onclick="elminarBiatico()">Eliminar</button>

                </div>

            </div>
        </div>

    </div>
    <!-- modal -->






</div>
<script src="js/pago.js"></script>
<script>
    lista_pagos_grupo();
    lista_biaticos_serverside();
</script>
</div>