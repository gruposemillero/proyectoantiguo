

var modal_container_grupo = document.getElementById("modal_grupo_editar1");
function cerrarmodalregistro() {
  modal_container_grupo.classList.remove("show");
}
var modal_container_ganado_ventaslista = document.getElementById(
  "modal_ganado_grupo1_venta"
);
function cerrarmodalganado_ventaslista() {
  modal_container_ganado_ventaslista.classList.remove("show");
}

var modal_container_ganado_actualizado = document.getElementById(
  "modal_ganado_actualizarpagolistaventa"
);
function cerrarmodalganadoactualizadolistaventa() {
  modal_container_ganado_actualizado.classList.remove("show");
}
function abrirmodalganadoactualizadolistaventa() {
  modal_container_ganado_actualizado.classList.add("show");
}
var modal_container_ganado_actualizado_pu = document.getElementById(
  "modal_ganado_actualizarpagolistaventa_Precio_Unidad"
);
function cerrarmodalganadoactualizadolistaventaPrecioUnidad() {
  modal_container_ganado_actualizado_pu.classList.remove("show");
}
function abrirmodalganadoactualizadolistaventaPrecioUnidad() {
  modal_container_ganado_actualizado_pu.classList.add("show");
}
localStorage.setItem("grupoidventa", 1);

function abrirModalActualiaciondePagoslistaventa() {
  Swal.fire({
    title: "Escoja el tipo de registro que desea realizar",
    showDenyButton: true,

    confirmButtonText: "Registro por pago total",
    denyButtonText: `Registro con precio por unidad`,
  }).then((result) => {
    /* Read more about isConfirmed, isDenied below */
    if (result.isConfirmed) {
      Swal.fire({
        title: "Está seguro realizar este tipo de registro con pago total",
        showDenyButton: true,
        confirmButtonText: "Si",
        denyButtonText: `No`,
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          abrirmodalganadoactualizadolistaventa();
        }
      });
    } else if (result.isDenied) {
      Swal.fire({
        title:
          "Está seguro realizar este tipo de registro de precio por unidad",
        showDenyButton: true,
        confirmButtonText: "Si",
        denyButtonText: `No`,
      }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
          abrirmodalganadoactualizadolistaventaPrecioUnidad();
        }
      });
    }
  });
}
var datatotalgrupolistaventalistaventa = 0
// ------------------funcion de cargar grupos
function cargargrupoganadovendidoslistaventa() {
  $.ajax({
    type: "POST",
    url: "controller/ventas/cargargrupocompratotal.php",
  }).done(function (resp) {
    let data = JSON.parse(resp);
    let llenardata = "";
    let idgrupo;
    if (data.length > 0) {
      for (let i = 0; i < data.length; i++) {
        if (i == 0) {
          idgrupo = data[i][0];
          localStorage.setItem("compra2", idgrupo);
        }
        llenardata +=
          "<option value='" + data[i][0] + "'>" + data[i][0] + "</option>";
      }

      document.getElementById(
        "select_grupo_ganado_lista_venta_general"
      ).innerHTML = llenardata;
      //document.getElementById("select_grupo_ganado").value = "";
    } else {
      llenardata +=
        "<option value=''>No se encontrados datos en la bd</option>";
      document.getElementById(
        "select_grupo_ganado_lista_venta_general"
      ).innerHTML = llenardata;
    }
  });
}

function cargargrupoganadovendidoslistaventaPrecioUnidad() {
  $.ajax({
    type: "POST",
    url: "controller/ventas/cargargrupocompratotal.php",
  }).done(function (resp) {
    let data = JSON.parse(resp);
    let llenardata = "";
    let idgrupo;
    if (data.length > 0) {
      for (let i = 0; i < data.length; i++) {
        if (i == 0) {
          idgrupo = data[i][0];
          localStorage.setItem("compra2", idgrupo);
          cargarganadoListaVendidosPU(idgrupo);
        }
        llenardata +=
          "<option value='" + data[i][0] + "'>" + data[i][0] + "</option>";
      }

      document.getElementById(
        "select_grupo_ganado_lista_ventas_pu"
      ).innerHTML = llenardata;
      //document.getElementById("select_grupo_ganado").value = "";
      datatotalgrupolistaventa = data.length;
    } else {
      llenardata +=
        "<option value=''>No se encontrados datos en la bd</option>";
      document.getElementById(
        "select_grupo_ganado_lista_ventas_pu"
      ).innerHTML = llenardata;
    }
  });
}
function cargarGanadoInputPu(grupoid) {
  $.ajax({
    type: "POST",
    url: "controller/ventas/cargarganadoinputlistaventa.php",
    data: {
      grupoid: grupoid,
    },
  }).done(function (resp) {
    let data = JSON.parse(resp);
    if (data.length > 0) {
      for (let i = 0; i < data.length; i++) {
        document.getElementById("id_lista_ventas_pu").value = data[i][0];
        document.getElementById("Raza_lista_ventas_pu").value = data[i][3];
        document.getElementById("Peso_lista_ventas_pu").value = data[i][2];
        document.getElementById("Color_lista_ventas_pu").value = data[i][4];
        document.getElementById("Sexo_lista_ventas_pu").value = data[i][5];
        document.getElementById("Salud_lista_ventas_pu").value = data[i][6];
        document.getElementById("Aretes_lista_ventas_pu").value = data[i][8];
        document.getElementById("Marca_lista_ventas_pu").value = data[i][7];
        document.getElementById("Descripcion_lista_ventas_pu").value = data[i][9];
        document.getElementById("Edad_lista_ventas_pu").value = data[i][11];
      }
    }
  });
}
function cargarganadoListaVendidosPU(grupoidListaVenta) {
  $.ajax({
    type: "POST",
    url: "controller/ventas/cargargrupoganadolistaventa.php",
    data: {
      grupoid: grupoidListaVenta,
    },
  }).done(function (resp) {
    let data = JSON.parse(resp);
    let llenardata = "";
    let i;
    let idganado;
    if (data.length > 0) {
      if(data.length == 1){
        localStorage.setItem("idganadoescogidoPU", data[0][0]);
        
      }
      for (i = 0; i < data.length; i++) {
        if (i == 0) {
          idganado = data[i][0];
          
        }

        llenardata +=
          "<option value='" +
          data[i][0] +
          "'>" +
          data[i][1] +
          " " +
          data[i][3] +
          "</option>";
      }
      document.getElementById("select_ganado_vacuno_lista_ventas_pu").innerHTML = llenardata;
      document.getElementById("select_ganado_vacuno_lista_ventas_pu").value = "";
    } else {
      llenardata +=
        "<option value=''>No se encontrados datos en la bd</option>";
      document.getElementById("select_ganado_vacuno_lista_ventas_pu").innerHTML = llenardata;
      document.getElementById("select_ganado_vacuno_lista_ventas_pu").value = "";
    }
  });
}





var dni_buscar = 1;
//---------------funcion de la tabla grupo serverside------------------------
var tbl_ganado_simple;
function lista_Ganado_serverside() {
  dni_buscar = document.getElementById("dni_buscar_lista_venta").value;
  if (dni_buscar.length == 0) {
    dni_buscar = 1;
  }
  tbl_ganado_simple = $("#tabla_grupo1").DataTable({
    ordering: true,
    searching: true,
    bLengthChange: false,
    lengthMenu: [
      [10, 25, 50, 100, -1],
      [10, 25, 50, 100, "All"],
    ],
    pageLength: 10,
    destroy: true,
    async: false,
    processing: true,
    ajax: {
      url: "controller/listageneralventa/listargrupoventa.php",
      type: "POST",
      data: {
        d: dni_buscar,
      },
    },
    columns: [
      { data: "Grupo_Venta" },
      { data: "Fecha" },
      { data: "nombre" },
      { data: "Documento" },
      { data: "Licencia" },
      { data: "Id_Pago" },
      { data: "cantidad" },
      { data: "Peso_Total" },
      { data: "precio_compra_total" },
      { data: "Ubicacion" },
      { data: "Precio_Unidad" },
      { data: "Pago_Total" },
      {
        data: "Restante",
        render: function (data, type, row) {
          if (parseFloat(data) == 0) {
            return '<span class="success">' + data + "</span>";
          } else {
            return '<span class="danger">' + data + "</span>";
          }
        },
      },
      {
        defaultContent:
          " <button class='button-34 seleccionar' role='button'onclick='abrirmodalganadogrupo1()' ><span class='material-icons-sharp' > visibility </span</button>",
      },
    ],
    language: idioma_espanol,
    select: true,
    scrollX: true,
  });
  sumatotaldeuda();
}
function sumatotaldeuda() {
  var table = $("#tabla_grupo1").DataTable();
  var pruebita = table.column(12).data().sum();
  var convertido = parseFloat(pruebita).toFixed(2);
  localStorage.setItem("sumatotaldeuda", pruebita);
  document.getElementById("deudatotalpersonas").value = convertido;
}

//--------------cargar selecccion de proveedor----------------

//----------------editar vendedor-----------------------
function editarmodal() {
  modal_container_grupo.classList.add("show");

  $("#tabla_grupo1").on("click", ".editar", function () {
    var data = tbl_ganado_simple.row($(this).parents("tr")).data(); //tamano escritorio
    /*if(tbl_vendedor_simple.row(this).child.isShown()){
        var data = tbl_vendedor_simple.row(this).data(); // ayuda a llevar los datos cuando esta tamano celular
    }*/
    document.getElementById("id_editar").value = data[0]; //posicion que se encuentra en la base de datos
    document.getElementById("fecha_editar").value = data[2];
    document.getElementById("cantidad_editar").value = data[1];
    document.getElementById("precio_editar").value = data[3];
  });
}

function modificargrupo() {
  let id = document.getElementById("id_editar").value; //posicion que se encuentra en la base de datos
  let cantidad = document.getElementById("cantidad_editar").value;
  let precio = document.getElementById("precio_editar").value;
  if (id.length == 0 || cantidad.length == 0 || precio.length == 0) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Tiene algunos campos vacios",
      "warning"
    );
  }
  $.ajax({
    url: "controller/listageneralventa/modificar_grupo.php",
    type: "POST",
    data: {
      i: id,
      c: cantidad,
      p: precio,
    },
  }).done(function (resp) {
    if (resp > 0) {
      Swal.fire(
        "Mensaje de confirmacion",
        "Modificado con exito",
        "success"
      ).then((value) => {
        modal_container_grupo.classList.remove("show");
        tbl_ganado_simple.ajax.reload();
      });
    } else {
      Swal.fire("Mensaje de advertencia", "No se pudo modificar", "warning");
    }
  });
}

function abrirmodalganadogrupo1() {
  $("#tabla_grupo1").on("click", ".seleccionar", function () {
    var data = tbl_ganado_simple.row($(this).parents("tr")).data(); //tamano escritorio

    localStorage.setItem("grupoidventa", data["Grupo_Venta"]);
    lista_ganado_simple1();
  });
  modal_container_ganado_ventaslista.classList.add("show");
}
//----------funcion para seleccionar grupo modal------------------------

//---------------funcion de la tabla ganado simple------------------------

function lista_ganado_simple1() {
  var idGrupo = localStorage.getItem("grupoidventa");
  tbl_ganado_simple1 = $("#tablita1_ventaslista").DataTable({
    ajax: {
      url: "controller/ventas/ganadolistarventa.php",
      type: "POST",
      data: {
        id: idGrupo,
      },
    },
    columns: [
      { defaultContent: "" },
      { data: "nombre" },
      { data: "Raza" },
      { data: "Peso" },
      { data: "Precio" },
      { data: "Peso_Actual" },
      { data: "Precio_Unitario" },
      { data: "Precio_Venta" },
      { data: "Sexo" },
      { data: "Color" },
      { data: "Salud" },
      { data: "Aretes" },
      { data: "Marca" },
      { data: "Descripcion" },
      { data: "Id_Grupo" },
      { data: "Grupo_Venta" },
      { data: "Edad" },
      {
        data: "Gananicas",
        render: function (data, type, row) {
          if (parseFloat(data) > 0) {
            return '<span class="success">' + data + "</span>";
          } else {
            return '<span class="danger">' + data + "</span>";
          }
        },
      },
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
    let pageInfo = $("#tablita1_ventaslista").DataTable().page.info();
    tbl_ganado_simple1
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + pageInfo.start;
      });
  });
  localStorage.clear("grupoidventa");
}

function actualizarpagototalganado() {
  let grupoventa = document.getElementById(
    "select_grupo_ganado_lista_venta_general"
  ).value; //posicion que se encuentra en la base de datos
  let pagototalventa = document.getElementById("pagototalganado").value;
  let preciounidadventa = document.getElementById("preciounidadganado").value;
  if (
    grupoventa.length == 0 ||
    pagototalventa.length == 0 ||
    preciounidadventa.length == 0
  ) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Tiene algunos campos vacios",
      "warning"
    );
  }
  $.ajax({
    url: "controller/listageneralventa/actualizar_pago_total.php",
    type: "POST",
    data: {
      gv: grupoventa,
      ptv: pagototalventa,
      puv: preciounidadventa,
    },
  }).done(function (resp) {
    if (resp == 1) {
      return Swal.fire(
        "Mensaje de error",
        "Precio de adelanto no debe ser superior al precio total",
        "warning"
      );
    }
    if (resp > 1) {
      Swal.fire(
        "Mensaje de confirmacion",
        "Modificado con exito",
        "success"
      ).then((value) => {
        modal_container_ganado_actualizado.classList.remove("show");
        // tbl_ganado_simple.ajax.reload();
        cargargrupoganadovendidoslistaventa();
        limpiarfuncionesdelistaventa();
        lista_Ganado_serverside();
        location.reload();
      });
    }
  });
}
function limpiarfuncionesdelistaventa() {
  let grupoventa = document.getElementById(
    "select_grupo_ganado_lista_venta_general"
  ).value; //posicion que se encuentra en la base de datos
  document.getElementById("pagototalganado").value = "";
  document.getElementById("preciounidadganado").value = "";
}


function actualizarpagototalganadoPrecioUnidad() {
  let IdGanadoVendido = document.getElementById(
    "select_ganado_vacuno_lista_ventas_pu"
  ).value; //posicion que se encuentra en la base de datos
  localStorage.setItem('nodaesto',IdGanadoVendido);
  let PrecioUnidadGanadoUltimo = document.getElementById("Precio_Unidad_lista_ventas_pu").value;
  let PesoActualGanado = document.getElementById("Peso_Actual_lista_ventas_pu").value;
  if (
    IdGanadoVendido.length == 0 ||
    PrecioUnidadGanadoUltimo.length == 0 ||
    PesoActualGanado.length == 0
  ) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Tiene algunos campos vacios",
      "warning"
    );
  }
  $.ajax({
    url: "controller/listageneralventa/actualizar_pago_total_Precio_Unidad.php",
    type: "POST",
    data: {
      gv: IdGanadoVendido,
      ptv: PrecioUnidadGanadoUltimo,
      puv: PesoActualGanado,
    },
  }).done(function (resp) {
   
    if (resp == 1) {
      Swal.fire(
        "Mensaje de confirmacion",
        "Modificado con exito",
        "success"
      ).then((value) => {
        cargargrupoganadovendidoslistaventaPrecioUnidad();
        limpiarfuncionesdelistaventaPrecioUnidad();
        lista_Ganado_serverside();
        
      });
    }
  });
}

function limpiarfuncionesdelistaventaPrecioUnidad() {
//posicion que se encuentra en la base de datos
  document.getElementById("select_grupo_ganado_lista_ventas_pu").value = "";
  document.getElementById("select_ganado_vacuno_lista_ventas_pu").value = "";
  document.getElementById("Peso_Actual_lista_ventas_pu").value = "";
  document.getElementById("Precio_Unidad_lista_ventas_pu").value = "";
  document.getElementById("id_lista_ventas_pu").value = "";
  document.getElementById("Raza_lista_ventas_pu").value = "";
  document.getElementById("Peso_lista_ventas_pu").value = "";
  document.getElementById("Color_lista_ventas_pu").value = "";
  document.getElementById("Aretes_lista_ventas_pu").value = "";
  document.getElementById("Marca_lista_ventas_pu").value = "";
  document.getElementById("Edad_lista_ventas_pu").value = "";
  document.getElementById("Sexo_lista_ventas_pu").value = "";
  document.getElementById("Salud_lista_ventas_pu").value = "";
  document.getElementById("Descripcion_lista_ventas_pu").value = "";
}

function actualizarpagosganadoPrecioUnidadFinal() {
    Swal.fire({
      title:
        "Esta seguro que desea guardar el registro completo de lista ganado,Ya no se podra corregir",
      showDenyButton: true,

      confirmButtonText: "guardar",
      denyButtonText: `no guardar`,
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      let IdGanadoVendido23 = localStorage.getItem('nodaesto');
      let formData = new FormData();
  
    formData.append("sad", IdGanadoVendido23);
      if (result.isConfirmed) {

          $.ajax({
            url: "controller/ventas/actualizar_pago_de_todo.php",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (resp) {
              Swal.fire("Guardado con exito!", "", "success");
              lista_Ganado_serverside();
              cerrarmodalganadoactualizadolistaventaPrecioUnidad();
              location.reload();
            },
          });
          
        
      } else if (result.isDenied) {
        Swal.fire("Registro no guardado", "", "info");
      }
    });
  
}