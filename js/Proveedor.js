var modal_container_proveedor = document.getElementById("modal_proveedor");


function abrirmodalderegistro(){
    modal_container_proveedor.classList.add('show');  
  }
  function cerrarmodalregistro(){
    modal_container_proveedor.classList.remove('show');
  }

var modal_container_editar_proveedor = document.getElementById("modal_container_editar_proveedor");
function cerrarmodaleditar(){
    modal_container_editar_proveedor.classList.remove('show');
  }


var modal_container_eliminar_proveedor = document.getElementById(
  "modal_container_eliminar_proveedor"
);

function cerrarmodaleliminar(){
    modal_container_eliminar_proveedor.classList.remove('show');
  }



var tbl_proveedor_simple;
function lista_proveedores_serverside() {
  tbl_proveedor_simple = $("#tabla_proveedor").DataTable({
    pageLength: 10,
    destroy: true,
    bProcessing: true,
    bDeferRender: true,
    bServerSide: true,
    scrollX: true,
    bLengthChange: false,
    sAjaxSource: "controller/proveedor/serverside/serverside_Proveedor.php",
    columns: [
      { defaultContent: "" },
      { data: 1 },
      { data: 2 },
      { data: 3 },
      { data: 4 },
      {
        defaultContent:
          "<button class='button-34 cancelar eliminar' style='margin:6px;' role='button'onclick='abrirmodaleliminar()'><span class='material-icons-sharp'> close </span></button>  <button class='button-34 editar'style='margin:6px;'  role='button'onclick='abrirmodaleditar()' ><span class='material-icons-sharp'> edit </span></button>",
      },
    ],
    language: idioma_espanol,
    select: true,
  });
  tbl_proveedor_simple.on("draw.td", function () {
    let pageInfo = $("#tabla_proveedor").DataTable().page.info();
    tbl_proveedor_simple
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + pageInfo.start;
      });
  });
}
//----------------editar proveedor-----------------------
function abrirmodaleditar() {
    modal_container_editar_proveedor.classList.add("show");
    $("#tabla_proveedor").on("click", ".editar", function () {
        var data = tbl_proveedor_simple.row($(this).parents("tr")).data(); 
        
        document.getElementById("id_editar_proveedor").value = data[0]; 
        document.getElementById("nombre_editar_proveedor").value = data[1];
        document.getElementById("apellido_editar_proveedor").value = data[2];
        document.getElementById("documento_editar_proveedor").value = data[3];
        document.getElementById("ruc_editar_proveedor").value = data[4];
      });
  }


function modificarproveedor() {
  let id = $("#id_editar_proveedor").val();
  let nombre = $("#nombre_editar_proveedor").val();
  let apellido = $("#apellido_editar_proveedor").val();
  let documento = $("#documento_editar_proveedor").val();
  let ruc = $("#ruc_editar_proveedor").val();
  if (
    nombre.length == 0 ||
    apellido.length == 0 ||
    documento.length == 0 ||
    id.length == 0
  ) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Tiene algunos campos vacios",
      "warning"
    );
  }
  $.ajax({
    url: "controller/proveedor/modificar_proveedor.php",
    type: "POST",
    data: {
      i: id,
      n: nombre,
      a: apellido,
      d: documento,
      r: ruc
    },
  }).done(function (resp) {
    if (resp > 0) {

      Swal.fire(
        "Mensaje de confirmacion",
        "Modificado con exito",
        "success"
      ).then((value) => {
        modal_container_editar_proveedor.classList.remove("show");
        tbl_proveedor_simple.ajax.reload();
      });
    } else {
      Swal.fire(
        "Mensaje de advertencia",
        "Ya existe el proveedor en la base de datos",
        "warning"
      );
    }
  });
}
function abrirmodaleliminar() {
    modal_container_eliminar_proveedor.classList.add("show");
    $("#tabla_proveedor").on("click", ".eliminar", function () {
        var data = tbl_proveedor_simple.row($(this).parents("tr")).data();
        document.getElementById("id_eliminar_proveedor").value = data[0]; 
        document.getElementById("nombre_eliminar_proveedor").value = data[1];
        document.getElementById("apellido_eliminar_proveedor").value = data[2];
        document.getElementById("documento_eliminar_proveedor").value = data[3];
        document.getElementById("ruc_eliminar_proveedor").value = data[4];
      });
  }

function eliminarproveedor() {
  let id = $("#id_eliminar_proveedor").val();
  $.ajax({
    url: "controller/proveedor/eliminar_proveedor.php",
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
        modal_container_eliminar_proveedor.classList.remove("show");
        tbl_proveedor_simple.ajax.reload();
      });
    } else {
      Swal.fire("Mensaje de advertencia", "No se pudo eliminar por que tiene ganado a su nombre", "warning");
    }
  });
}
function registar_proveedor() {
  let nombre = $("#nombre_proveedor").val();
  let apellido = $("#apellido_proveedor").val();
  let documento = $("#documento_proveedor").val();
  let ruc = $("#ruc_proveedor").val();
  if (nombre.length == 0 || apellido.length == 0) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Nombre o apellido esta vacio en el proveedor",
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
  formData.append("n", nombre);
  formData.append("a", apellido);
  formData.append("d", documento);
  formData.append("r", ruc);
  $.ajax({
    url: "controller/proveedor/registro_proveedor.php",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (resp) {
      if (resp > 0) {
        if (resp == 1) {
          limpiar_modal_proveedor();
          Swal.fire(
            "Mensaje de confirmacion",
            "Nuevo proveedor registrado",
            "success"
          ).then(() => {
            modal_container_proveedor.classList.remove('show');
            tbl_proveedor_simple.ajax.reload();
          });
        } else {
          limpiar_modal_proveedor();
          Swal.fire(
            "Mensaje de advertencia",
            "Ya existe el proveedor en la base de datos",
            "warning"
          ).then(() => {
            $("#modal_registro_usuario").modal("hide");
          });
        }
      } else {
        Swal.fire(
          "Mensaje de Erroe",
          "No se pudo registrar al proveedor",
          "error"
        );
      }
    },
  });
  return false;
}

function limpiar_modal_proveedor() {
  document.getElementById("nombre_proveedor").value = "";
  document.getElementById("apellido_proveedor").value = "";
  document.getElementById("documento_proveedor").value = "";
  
  document.getElementById("ruc_proveedor").value = "";
}

// 

// function generarPDF() {
//   let proveedor = document.getElementById("select_proveedor").value;
//   let transportista = document.getElementById("select_transportista").value;
//   let cantidad = document.getElementById("cantidad").value;
//   let ruc = document.getElementById("ruc").value;
//   let distrito = document.getElementById("distrito").value;
//   let provincia = document.getElementById("provincia").value;
//   let ciudad = document.getElementById("ciudad").value;
//   let color = document.getElementById("color").value;
//   let nombre = document.getElementById("transp").value;
//   window.open(
//     "../view/libreporte/reportes/generar_ticket.php?id=" +
//       parseInt(proveedor) +
//       "&transportista=" +
//       parseInt(transportista) +
//       "&cantidad=" +
//       parseInt(cantidad) +
//       "&ruc=" +
//       ruc +
//       "&distrito=" +
//       distrito +
//       "&provincia=" +
//       provincia +
//       "&ciudad=" +
//       ciudad +
//       "&color=" +
//       color +
//       "&nombre=" +
//       nombre +
//       "#zoom=100%",
//     "Ticket",
//     "scrollbars=NO"
//   );
// }
