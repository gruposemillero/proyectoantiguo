localStorage.setItem("Pagoidgrupototalfecha",0);
var valorgeneral = 1
var modal_container_editar = document.getElementById("modal_container_editar_pago");
function cerrarmodaleditar() {
  
  modal_container_editar.classList.remove("show");
  limpiarinputpagos();
}
var modal_pago_grupo = document.getElementById("modal_pago_grupo");
function cerrarmodalopago() {
  
  modal_pago_grupo.classList.remove("show");
}
var modal_pago_eliminar = document.getElementById("modal_container_eliminar_pagos");
function cerrarmodalopagoeliminar() {
  
  modal_pago_eliminar.classList.remove("show");
}
//---------------funcion de la tabla biaticoes serverside------------------------

var tbl_biatico;
function lista_biaticos_serverside() {
  tbl_biatico = $("#tabla_biatico").DataTable({
    bLengthChange: false,

    ajax: {
      url: "controller/biaticos/listar_biatico.php",
      type: "POST",
    },
    columns: [
      { data: "Id_Pago" },
      { data: "Fecha" },
      { data: "Tipo" },
      { data: "Pago_Total" },
      { data: "Pago_Parcial" },
      {  data: "Restante",
        render: function (data, type, row) {
          if (parseFloat(data) == 0) {
            return '<span class="success">'+ data + '</span>';
          }else {
            return '<span class="danger">'+ data + '</span>';
          }
        },
      },
      { data: "Biatico_Inicio" },
      { data: "Biatico_Final" },
      { data: "Biatico_Extras" },
      { data: "Biatico_Personal" },
      { data: "Biatico_Empresa" },

      { data: "Precio_Unidad" },
      {
        data: "Estado",
        render: function (data, type, row) {
          if (data == "PAGADO") {
            return '<span class="success">PAGADO</span>';
          } else {
            return '<span class="danger">DEUDA</span>';
          }
        },
      },

      {
        defaultContent:
          "<button class='button-34  eliminar'  style='margin: 4px' role='button'onclick='abrirmodaleliminarpago()' ><span class='material-icons-sharp'> close </span></button>   <button class='button-34 cancelar seleccionar' role='button'onclick='abrirmodaleditar()' ><span class='material-icons-sharp'> edit </span></button>    <button class='button-34 observar' style='margin: 4px' role='button'onclick='abrirmodalobservar()' ><span class='material-icons-sharp'> attach_money </span></button>",
      },
    ],
    searching: { regex: false },
    lengthMenu: [
      [10, 25, 50, 100, -1],
      [10, 25, 50, 100, "All"],
    ],
    pageLength: 9,
    destroy: true,
    async: false,
    processing: true,
    language: idioma_espanol,
    select: true,
    scrollX: true,
  });
}
//----------------elminar biatico-----------------------
function abrirmodaleliminarpago() {
  $("#tabla_biatico").on("click", ".eliminar", function () {
    var data = tbl_biatico.row($(this).parents("tr")).data(); //tamano escritorio

    document.getElementById("id_eliminar_pago").value = data["Id_Pago"]; //posicion que se encuentra en la base de datos
    document.getElementById("pago_total_eliminar_pago").value = data["Pago_Total"];
    document.getElementById("deuda_eliminar_pago").value = data["Restante"];
    document.getElementById("PrecioUnidad_eliminar_pago").value =
      data["Precio_Unidad"];
    if (data["Biatico_Inicio"] == 0 || data["Biatico_Inicio"] === null) {
      document.getElementById("BiaticoInicio_eliminar_pago").disabled = true;
    }
    if (data["Biatico_Final"] == 0 || data["Biatico_Final"] === null) {
      document.getElementById("BiaticoFinal_eliminar_pago").disabled = true;
    }
    document.getElementById("Biatico_Extras_eliminar_pago").value = data["Biatico_Extras"];
    document.getElementById("Biatico_Personal_eliminar_pago").value = data["Biatico_Personal"];
    document.getElementById("Biatico_Empresa_eliminar_pago").value = data["Biatico_Empresa"];
    modal_pago_eliminar.classList.add("show");
  });
}
function elminarBiatico() {
  let id = $("#id_eliminar_pago").val();
  

  $.ajax({
    url: "controller/biaticos/eliminar_biatico.php",
    type: "POST",
    data: {
      i: id
    },
  }).done(function (resp) {
    if (resp > 0) {
      //validarInput("nombre","apellido","documento");

      Swal.fire(
        "Mensaje de confirmacion",
        "Modificado con exito",
        "success"
      ).then((value) => {
        modal_pago_eliminar.classList.remove("show");
        tbl_biatico.ajax.reload();

        limpiarinputpagos();
      });
    } else {
      Swal.fire(
        "Mensaje de advertencia",
        "Ya existe el vendedor en la base de datos",
        "warning"
      );
    }
  });
}
//----------------editar biatico-----------------------
function abrirmodaleditar() {
  $("#tabla_biatico").on("click", ".seleccionar", function () {
    var data = tbl_biatico.row($(this).parents("tr")).data(); //tamano escritorio

    document.getElementById("id_editar_pago").value = data["Id_Pago"]; //posicion que se encuentra en la base de datos
    document.getElementById("pago_total_pago").value = data["Pago_Total"];
    document.getElementById("deuda_pago").value = data["Restante"];
    document.getElementById("PrecioUnidad_editar_pago").value =
      data["Precio_Unidad"];
    if (data["Biatico_Inicio"] == 0 || data["Biatico_Inicio"] === null) {
      document.getElementById("BiaticoInicioeditar_pago").disabled = true;
    }
    if (data["Biatico_Final"] == 0 || data["Biatico_Final"] === null) {
      document.getElementById("BiaticoFinalEditar_pago").disabled = true;
    }
    modal_container_editar.classList.add("show");
  });
}
function abrirmodalobservar() {
  $("#tabla_biatico").on("click", ".observar", function () {
    var data = tbl_biatico.row($(this).parents("tr")).data(); //tamano escritorio

    localStorage.setItem("Pagoidgrupototalfecha",data["Id_Pago"]) ; //posicion que se encuentra en la base de datos
    valorgeneral = data["Id_Pago"]
    lista_pagos_grupo();
   
    modal_pago_grupo.classList.add("show");
  });
}

function modificarBiatico() {
  let id = $("#id_editar_pago").val();
  let pago_total = $("#pago_total_pago").val();

  let deuda = $("#deuda_pago").val();
  let pago_parcial = $("#pago_parcial_pago").val();
  let Biatico_Inicio = $("#BiaticoInicioeditar_pago").val();
  let Biatico_Final = $("#BiaticoFinalEditar_pago").val();
  let Biatico_Extras = $("#Biatico_Extras_editar_pago").val();
  let Biatico_Personal = $("#Biatico_Personal_editar_pago").val();
  let Biatico_Empresa = $("#Biatico_Empresa_editar_pago").val();

  let Precio_Unidad = $("#PrecioUnidad_editar_pago").val();
  if (deuda - pago_parcial < 0) {
    return swal.fire(
      "Mensaje de Advertencia",
      "El pago realizado debe ser menos la deuda",
      "warning"
    );
  }
  if (pago_total.length == 0) {
    pago_total = 0;
  }
  if (pago_parcial.length == 0) {
    pago_parcial = 0;
  }
  if (Biatico_Inicio.length == 0) {
    Biatico_Inicio = 0;
  }
  if (Biatico_Final.length == 0) {
    Biatico_Final = 0;
  }
  if (Biatico_Extras.length == 0) {
    Biatico_Extras = 0;
  }
  if (Biatico_Personal.length == 0) {
    Biatico_Personal = 0;
  }
  if (Biatico_Empresa.length == 0) {
    Biatico_Empresa = 0;
  }

  $.ajax({
    url: "controller/biaticos/modificar_biatico.php",
    type: "POST",
    data: {
      i: id,
      pt: pago_total,
      pp: pago_parcial,
      bi: Biatico_Inicio,
      bf: Biatico_Final,
      be: Biatico_Extras,
      bp: Biatico_Personal,
      bem: Biatico_Empresa,
      pre: Precio_Unidad,
    },
  }).done(function (resp) {
    limpiarinputpagos();
    if (resp > 0) {
      //validarInput("nombre","apellido","documento");

      Swal.fire(
        "Mensaje de confirmacion",
        "Modificado con exito",
        "success"
      ).then((value) => {
        modal_container_editar.classList.remove("show");
        tbl_biatico.ajax.reload();

        limpiarinputpagos();
      });
    } else {
      Swal.fire(
        "Mensaje de advertencia",
        "Ya existe el vendedor en la base de datos",
        "warning"
      );
    }
  });
}
function limpiarinputpagos() {
  document.getElementById("BiaticoInicioeditar_pago").disabled = false;
  document.getElementById("BiaticoFinalEditar_pago").disabled = false;
  document.getElementById("pago_total_pago").value = "";
  document.getElementById("deuda_pago").value = "";
  document.getElementById("pago_parcial_pago").value = "";
  document.getElementById("BiaticoFinalEditar_pago").value = "";
  document.getElementById("Biatico_Extras_editar_pago").value = "";
  document.getElementById("Biatico_Personal_editar_pago").value = "";

  document.getElementById("Biatico_Empresa_editar_pago").value = "";
  document.getElementById("BiaticoInicioeditar_pago").value = "";
}
var tbl_ganado_simple1;
function lista_pagos_grupo() {
  let dfs = localStorage.getItem("Pagoidgrupototalfecha");

  tbl_ganado_simple1 = $("#tablita1").DataTable({
    ajax: {
      url: "controller/biaticos/ganadolistarfechapago.php",
      type: "POST",
      data: {
        id: dfs,
      },
    },
    columns: [
      { defaultContent: "" },
      { data: "Id_Pago" },
      { data: "Fecha_Modificacion" },
      { data: "Pago"}
    ],
    pageLength: 6,
    destroy: true,
    async: false,
    processing: true,
    bLengthChange: false,
    language: idioma_espanol,
    select: true,
    scrollX: true,
  });
  tbl_ganado_simple1.on("draw.td", function () {
    let pageInfo = $("#tablita1").DataTable().page.info();
    tbl_ganado_simple1
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + pageInfo.start;
      });
  });
}
function elminarRegistroBiatico() {
  let id = localStorage.getItem("Pagoidgrupototalfecha");
  

  $.ajax({
    url: "controller/biaticos/eliminar_Registro_biatico.php",
    type: "POST",
    data: {
      i: id
    },
  }).done(function (resp) {
    if (resp > 0) {
      //validarInput("nombre","apellido","documento");

      Swal.fire(
        "Mensaje de confirmacion",
        "Modificado con exito",
        "success"
      ).then((value) => {
        modal_pago_grupo.classList.remove("show");
        tbl_biatico.ajax.reload();

        limpiarinputpagos();
      });
    } else {
      Swal.fire(
        "Mensaje de advertencia",
        "Ya existe el vendedor en la base de datos",
        "warning"
      );
    }
  });
}