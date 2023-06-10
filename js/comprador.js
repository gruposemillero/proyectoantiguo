//---------------funcion de la tabla proveedores serverside------------------------
var modal_container_comprador = document.getElementById("modal_comprador_compra");


function abrirmodalderegistrocomprador(){
    modal_container_comprador.classList.add('show');  
  }
  function cerrarmodalregistrocomprador(){
    modal_container_comprador.classList.remove('show');
  }

// modal editar
var modal_container_editar_proveedor = document.getElementById("modal_container_editar_comprador");
function cerrarmodaleditar(){
    modal_container_editar_proveedor.classList.remove('show');
  }

// modal eliminar

var modal_container_eliminar_proveedor = document.getElementById(
  "modal_container_eliminar_comprador"
);

function cerrarmodaleliminar(){
    modal_container_eliminar_proveedor.classList.remove('show');
  }

//-------------funcion registrar---------------------
function registar_comprador_compra() {
    let nombre = $("#nombre_comprador").val();
    let apellido = $("#apellido_comprador").val();
    let documento = $("#documento_comprador").val();
    let ruc = $("#ruc_comprador").val();
    if (nombre.length == 0 || apellido.length == 0) {
        return swal.fire(
          "Mensaje de Advertencia",
          "Nombre o apellido esta vacio en el comprador",
          "warning"
        );
      }
      if (documento.length == 0 ) {
        documento = '00000000';
      }
      if (ruc.length == 0) {
        ruc = '00000000000';
      }
    let formData = new FormData();
    formData.append('n', nombre);
    formData.append('a', apellido);
    formData.append('d', documento);
    formData.append('r', ruc);

    $.ajax({
        url: 'controller/comprador/registrar_comprador.php',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (resp) {
            if (resp > 0) {
                if (resp == 1) {
                    Swal.fire("Mensaje de confirmacion", "Nuevo comprador registrado", "success").
                        then(() => {
                            modal_container_comprador.classList.remove('show');
                            tbl_comprador.ajax.reload();
                        });
                } else {
                    Swal.fire("Mensaje de advertencia", "Ya existe el comprador en la base de datos", "warning").then(() => {
                        $("#modal_registro").modal('hide');
                    });
                }

            } else {
                Swal.fire("Mensaje de Error", "No se pudo registrar al comprador", "error");
            }
        }
    });
    return false;
}

//---------------funcion de la tabla compradores serverside------------------------
var tbl_comprador;
function lista_compradores_serverside() {
    tbl_comprador = $("#tabla_comprador").DataTable({
        "pageLength": 10,
        "destroy": true,
        "bProcessing": true,
        "bDeferRender": true,
        "bServerSide": true,
        bLengthChange: false,
        scrollX: true,
        "sAjaxSource": "controller/comprador/serverside/serversideComprador.php",
        "columns": [
            { "defaultContent": "" },
            { "data": 1 },
            { "data": 2 },
            { "data": 3 },
            { "data": 4 },
            {
                defaultContent:
                  "<button class='button-34 cancelar eliminar'  role='button'onclick='abrirmodaleliminar()'><span class='material-icons-sharp' > close </span></button>  <button class='button-34 editar'  role='button'onclick='abrirmodaleditar()' ><span class='material-icons-sharp' > edit </span></button>",
              },
        ],
        "language": idioma_espanol,
        select: true
    });
    tbl_comprador.on('draw.td', function () {
        let pageInfo = $("#tabla_comprador").DataTable().page.info();
        tbl_comprador.column(0, { page: 'current' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1 + pageInfo.start;
        });
    });

}
//----------------editar comprador-----------------------
function abrirmodaleditar(){
    
    modal_container_editar_proveedor.classList.add('show');
    $('#tabla_comprador').on('click', '.editar', function () {
        var data = tbl_comprador.row($(this).parents('tr')).data(); //tamano escritorio
        

        document.getElementById('id_editar_comprador').value = data[0]; 
        document.getElementById('nombre_editar_comprador').value = data[1];
        document.getElementById('apellido_editar_comprador').value = data[2];
        document.getElementById('documento_editar_comprador').value = data[3];
        document.getElementById('ruc_editar_comprador').value = data[4];
    })
}


function modificarComprador() {
    let id = $("#id_editar_comprador").val();
    let nombre = $("#nombre_editar_comprador").val();
    let apellido = $("#apellido_editar_comprador").val();
    let documento = $("#documento_editar_comprador").val();
    let ruc = $("#ruc_editar_comprador").val();
    if (nombre.length == 0 || apellido.length == 0 || documento.length == 0 || id.length == 0) {
        return swal.fire("Mensaje de Advertencia", "Tiene algunos campos vacios", "warning");
    }
    $.ajax({
        url: 'controller/comprador/modificar_comprador.php',
        type: 'POST',
        data: {
            i: id,
            n: nombre,
            a: apellido,
            d: documento,
            r: ruc
        }
    }).done(function (resp) {
        if (resp > 0) {

            Swal.fire("Mensaje de confirmacion", "Modificado con exito", "success").
                then((value) => {
                    modal_container_editar_proveedor.classList.remove('show');
                    tbl_comprador.ajax.reload();

                });
        } else {
            Swal.fire("Mensaje de advertencia", "No se pudo modificar al comprador", "warning");
        }
    })
}
function abrirmodaleliminar(){
    modal_container_eliminar_proveedor.classList.add('show');
    $('#tabla_comprador').on('click', '.eliminar', function () {
        var data = tbl_comprador.row($(this).parents('tr')).data(); 
        document.getElementById('id_eliminar_comprador').value = data[0]; 
        document.getElementById('nombre_eliminar_comprador').value = data[1];
        document.getElementById('apellido_eliminar_comprador').value = data[2];
        document.getElementById('documento_eliminar_comprador').value = data[3];
        document.getElementById('ruc_eliminar_comprador').value = data[4];
    
    })
}

function eliminarcomprador() {
    let id = $("#id_eliminar_comprador").val();
    $.ajax({
        url: 'controller/comprador/eliminar_comprador.php',
        type: 'POST',
        data: {
            i: id
        }
    }).done(function (resp) {
        if (resp > 0) {
            Swal.fire("Mensaje de confirmacion", "Eliminado con exito", "success").
                then((value) => {
                    modal_container_eliminar_proveedor.classList.remove('show');
                    tbl_comprador.ajax.reload();

                });
        } else {
            Swal.fire("Mensaje de advertencia", "No se pudo eliminar por que tiene ganado comprado a su nombre", "warning");
        }
    })
}
