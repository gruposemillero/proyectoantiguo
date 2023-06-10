var modal_container = document.getElementById('modal_container');
function abrirmodalderegistro(){
  modal_container.classList.add('show');  
}
function cerrarmodalregistro(){
  modal_container.classList.remove('show');
}

var modal_container_editar = document.getElementById('modal_container_editar');
function cerrarmodaleditar(){
  modal_container_editar.classList.remove('show');
}


  // modal eliminar
  var modal_container_eliminar = document.getElementById('modal_container_eliminar');
  function cerrarmodaleliminar(){
    modal_container_eliminar.classList.remove('show');
  }


var tbl_ganado_simple;
function lista_Transportista_serverside() {
  tbl_ganado_simple = $("#tabla_ganado_simple").DataTable({
    pageLength: 10,
    destroy: true,
    bProcessing: true,
    bDeferRender: true,
    bServerSide: true,
    bLengthChange: false,
    scrollX: true,
    sAjaxSource:
      "controller/transportista/serverside/serversideTransportista.php",
    columns: [
      {
        defaultContent: "",
      },
      {
        data: 1,
      },
      {
        data: 2,
      },
      {
        data: 3,
      },
      {
        data: 4,
      },
      {
        defaultContent:
          "<button class='button-34 cancelar eliminar' style='margin:6px;' role='button'onclick='abrirmodaleliminar()'><span class='material-icons-sharp'> close </span></button>  <button class='button-34 editar' style='margin:6px;' role='button'onclick='abrirmodaleditar()' ><span class='material-icons-sharp'> edit </span></button>",
      },
    ],
    language: idioma_espanol,
    select: true,
  });
  tbl_ganado_simple.on("draw.td", function () {
    let pageInfo = $("#tabla_ganado_simple").DataTable().page.info();
    tbl_ganado_simple
      .column(0, {
        page: "current",
      })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + pageInfo.start;
      });
  });
}


function abrirmodaleditar() {
  modal_container_editar.classList.add("show");
  $("#tabla_ganado_simple").on("click", ".editar", function () {
    var data = tbl_ganado_simple.row($(this).parents("tr")).data(); //tamano escritorio
    if (tbl_ganado_simple.row(this).child.isShown()) {
      var data = tbl_ganado_simple.row(this).data(); // ayuda a llevar los datos cuando esta tamano celular
    }
    document.getElementById("id_editar").value = data[0]; //posicion que se encuentra en la base de datos
    document.getElementById("placa_editar").value = data[2];
    document.getElementById("licencia_editar").value = data[1];
    document.getElementById("documento_editar").value = data[3];
    document.getElementById("ruc_editar").value = data[4];
  });
}

function editarTransportista() {
  let id = $("#id_editar").val();
  let licencia = $("#licencia_editar").val();
  let placa = $("#placa_editar").val();
  let documento = document.getElementById("documento_editar").value;
  let ruc = document.getElementById("ruc_editar").value;
  if (licencia.length == 0 || placa.length == 0 || id.length == 0) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Tiene algunos campos vacios",
      "warning"
    );
  }
  $.ajax({
    url: "controller/transportista/modificar_transportista.php",
    type: "POST",
    data: {
      i: id,
      l: licencia,
      p: placa,
      d: documento,
      r: ruc,
    },
  }).done(function (resp) {
    if (resp > 0) {

      Swal.fire(
        "Mensaje de confirmacion",
        "Modificado con exito",
        "success"
      ).then((value) => {
        modal_container_editar.classList.remove("show");

        tbl_ganado_simple.ajax.reload();
      });
    } else {
      Swal.fire(
        "Mensaje de advertencia",
        "Ya existe el transportista en la base de datos",
        "warning"
      );
    }
  });
}
function abrirmodaleliminar() {
    modal_container_eliminar.classList.add("show");
  $("#tabla_ganado_simple").on("click", ".eliminar", function () {
    var data = tbl_ganado_simple.row($(this).parents("tr")).data(); //tamano escritorio
    /*if(tbl_ganado_simple.row(this).child.isShown()){
            var data = tbl_vendedor_simple.row(this).data(); // ayuda a llevar los datos cuando esta tamano celular
        }*/

    document.getElementById("id_eliminar").value = data[0]; //posicion que se encuentra en la base de datos
    document.getElementById("placa_eliminar").value = data[2];
    document.getElementById("licencia_eliminar").value = data[1];
    document.getElementById("documento_eliminar").value = data[3];
    document.getElementById("ruc_eliminar").value = data[4];
  });
}

function eliminartransportista() {
  let id = $("#id_eliminar").val();
  $.ajax({
    url: "controller/transportista/eliminar_transportista.php",
    type: "POST",
    data: {
      i: id
    },
  }).done(function (resp) {
    if (resp > 0) {
      Swal.fire(
        "Mensaje de confirmacion",
        "Eliminado con exito",
        "success"
      ).then((value) => {
        modal_container_eliminar.classList.remove("show");
        tbl_ganado_simple.ajax.reload();
      });
    } else {
      Swal.fire("Mensaje de advertencia", "No se pudo eliminar", "warning");
    }
  });
}


function registar_transportista() {
  let licencia = document.getElementById("placa").value;
  let placa = document.getElementById("licencia").value;
  let documento = document.getElementById("documento").value;
  let ruc = document.getElementById("ruc").value;
  if (licencia.length == 0 || placa.length == 0) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Tiene algunos campos vacios",
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
  formData.append("p", licencia);
  formData.append("l", placa);
  formData.append("d", documento);
  formData.append("r", ruc);
  $.ajax({
    url: "controller/transportista/registro_transportista.php",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (resp) {
      if (resp > 0) {
        if (resp == 1) {
          limpiar_modal_transportista();
          Swal.fire(
            "Mensaje de confirmacion",
            "Nuevo transportista registrado",
            "success"
          ).then(() => {
            tbl_ganado_simple.ajax.reload();
            modal_container.classList.remove("show");
          });
        } else {
          limpiar_modal_vendedor();
          Swal.fire(
            "Mensaje de advertencia",
            "Ya existe el transportista en la base de datos",
            "warning"
          ).then(() => {
            $("#modal_registro_usuario").modal("hide");
          });
        }
      } else {
        Swal.fire(
          "Mensaje de advertencia",
          "No se pudo registrar al transportista",
          "error"
        );
      }
    },
  });
  return false;
}

function limpiar_modal_transportista() {
  document.getElementById("licencia").value = "";
  document.getElementById("placa").value = "";
  document.getElementById("documento").value = "";
  document.getElementById("ruc").value = "";
}
