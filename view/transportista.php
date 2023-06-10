<script src="js/transportista.js?rev=<?php echo time(); ?>"></script>

<div>

  <div class="nombtn">
      <h1>Transportistas</h1>
  </div>
  <br>
    <div class="nombtn">
		<a class="abtn" onclick="abrirmodalderegistro()" href="#"><span>AGREGAR</span><span>AGREGAR</span></a>
    </div>

  <div class="recent-orders">
      <h2>Registro de transportistas</h2>
      <table id="tabla_ganado_simple" class="tablabd transportista" style="width:100%">
          <thead>
              <tr>
                  <th>Número</th>
                  <th>Placa</th>
                  <th>Licencia</th>
                  <th>DNI</th>
                  <th>RUC</th>
                  <th>Eliminar - Modificar</th>
              </tr>
          </thead>
      </table>
      <div id="modal_container" class="modal-container">
          <div class="modal">
              <div class="form-group">
                  <span>Licencia</span>
                  <input class="form-field"  type="text" placeholder="Introduzca la licencia del conductor" id="licencia">
              </div>
              <br>
              <div class="form-group">
                  <input class="form-field"  type="text" placeholder="Introduzca la placa del camión" id="placa">
                  <span>Placa</span>
              </div>
              <br>
              <div class="form-group">
                  <span>DNI</span>
                  <input class="form-field" type="number" placeholder="Introduzca el DNI del conductor" id="documento">
              </div>
              <br>
              <div class="form-group">
                  <input class="form-field" type="number" placeholder="Introduzca el RUC del conductor" id="ruc">
                  <span>RUC</span>
              </div>
              <br>
              <!-- HTML !-->
              <div class="btninput">
                  <button class="button-34 cancelar" onclick="cerrarmodalregistro()" role="button">Cancelar</button>
                  <button class="button-34" role="button" onclick="registar_transportista()">Guardar</button>

              </div>

          </div>
      </div>
      
      <div id="modal_container_editar" class="modal-container">
          <div class="modal">
              <div class="form-group">
                  <input class="form-field"  type="text" placeholder="Introduzca la placa del camion" id="id_editar" disabled>
                  <span>ID</span>
              </div>
              <br>
              <div class="form-group">
                  <span>Placa</span>
                  <input class="form-field"  type="text" placeholder="Introduzca la licencia del conductor" id="licencia_editar">
              </div>
              <br>
              <div class="form-group">
                  <input class="form-field"  type="text" placeholder="Introduzca la placa del camion" id="placa_editar">
                  <span>Licencia</span>
              </div>
              <br>
              <div class="form-group">
                  <span>DNI</span>
                  <input class="form-field" type="number" placeholder="Introduzca el DNI del conductor" id="documento_editar">
              </div>
              <br>
              <div class="form-group">
                  <input class="form-field" type="number" placeholder="Introduzca el RUC del conductor" id="ruc_editar">
                  <span>RUC</span>
              </div>
              <br>
              <!-- HTML !-->
              <div class="btninput">
                  <button class="button-34 cancelar" onclick="cerrarmodaleditar()" role="button">Cancelar</button>
                  <button class="button-34" role="button" onclick="editarTransportista()">Modificar</button>

              </div>

          </div>
      </div>
      <div id="modal_container_eliminar" class="modal-container">
          <div class="modal">
              <div class="form-group">
                  <input class="form-field" type="text" placeholder="Introduzca la placa del camion" id="id_eliminar" disabled>
                  <span>ID</span>
              </div>
              <br>
              <div class="form-group">
                  <span>Placa</span>
                  <input class="form-field"  type="text" placeholder="Introduzca la licencia del conductor" id="licencia_eliminar" disabled>
              </div>
              <br>
              <div class="form-group">
                  <input class="form-field"  type="text" placeholder="Introduzca la placa del camion" id="placa_eliminar" disabled>
                  <span>Licencia</span>
              </div>
              <br>
              <div class="form-group">
                  <span>DNI</span>
                  <input class="form-field" type="number" placeholder="introduzca el documento del conductor" id="documento_eliminar" disabled>
              </div>
              <br>
              <div class="form-group">
                  <input class="form-field" type="number" placeholder="introduzca el RUC del conductor" id="ruc_eliminar" disabled>
                  <span>RUC</span>
              </div>
              <br>
              <!-- HTML !-->
              <div class="btninput">
                  <button class="button-34 cancelar" onclick="cerrarmodaleliminar()" role="button">Cancelar</button>
                  <button class="button-34" role="button" onclick="eliminartransportista()">Eliminar</button>

              </div>

          </div>
      </div>
  </div>
</div>
<script src="js/transportista.js"></script>
<script>
    lista_Transportista_serverside();
</script>
</div>