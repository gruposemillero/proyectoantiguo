//--------------cargar selecccion de vendedores----------------
localStorage.setItem("dato", 0);
var abrio = false;
var abriopago = true;
var ganadototal = 0;
var abrioenviar = false;

var abrioregistrocompraunidad = false;
var abrioregistrototal = false;
var modal_container_grupo = document.getElementById("modal_grupo");
var modal_container_grupo_total = document.getElementById("modal_grupo_total");

var modal_container_ganado = document.getElementById("modal_ganado");
var modal_container_ganado_total =
  document.getElementById("modal_ganado_total");

var modal_container_pago = document.getElementById("modal_pago");
function abrirmodalderegistro() {
  if (abrio == false) {
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
            abrioregistrototal = true;
            modal_container_grupo_total.classList.add("show");
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
            abrioregistrocompraunidad = true;
            modal_container_grupo.classList.add("show");
          }
        });
      }
    });
  } else {
    return swal.fire(
      "Mensaje de Advertencia",
      "Ya registro el grupo prosiga con el registro de ganado",
      "warning"
    );
  }
}
function cerrarmodalregistro() {
  modal_container_grupo.classList.remove("show");
}
function cerrarmodalregistrototal() {
  modal_container_grupo_total.classList.remove("show");
}
function abrirmodalderegistroganado() {
  if (localStorage.getItem("dato") <= 1) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Primero debe registrar el grupo",
      "warning"
    );
  } else {

    if (abrioregistrototal == true) {
      modal_container_ganado_total.classList.add("show");
    } else if (abrioregistrocompraunidad == true) {
      modal_container_ganado.classList.add("show");
    } 
  }
}
function cerrarmodalregistroganado() {
  modal_container_ganado.classList.remove("show");
}
function cerrarmodalregistroganadototal() {
  modal_container_ganado_total.classList.remove("show");
}
function abrirmodalderegistropago() {
  if (localStorage.getItem("dato") <= 1) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Primero debe registrar el grupo",
      "warning"
    );
  } else {
    if (abriopago == true) {
      modal_container_pago.classList.add("show");
    } 
  }
}
function cerrarmodalregistropago() {
  modal_container_pago.classList.remove("show");
}
function cargarproveedor() {
  $.ajax({
    type: "POST",
    url: "controller/ganado/cargarproveedor.php",
  }).done(function (resp) {
    let data = JSON.parse(resp);
    let llenardata = "";
    if (data.length > 0) {
      for (let i = 0; i < data.length; i++) {
        llenardata +=
          "<option value='" +
          data[i][0] +
          "'>" +
          data[i][1] +
          " " +
          data[i][2] +
          "</option>";
      }
      document.getElementById("select_proveedor").innerHTML = llenardata;
    } else {
      llenardata +=
        "<option value=''>No se encontrados datos en la bd</option>";
      document.getElementById("select_proveedor").innerHTML = llenardata;
    }
  });
}
//--------------cargar selecccion de transportistas----------------

function cargartransportista() {
  $.ajax({
    type: "POST",
    url: "controller/ganado/cargartransportista.php",
  }).done(function (resp) {
    let data = JSON.parse(resp);
    let llenardata = "";
    if (data.length > 0) {
      for (let i = 0; i < data.length; i++) {
        llenardata +=
          "<option value='" + data[i][0] + "'>" + data[i][2] + "</option>";
      }
      document.getElementById("select_transportista").innerHTML = llenardata;
    } else {
      llenardata +=
        "<option value=''>No se encontrados datos en la bd</option>";
      document.getElementById("select_transportista").innerHTML = llenardata;
    }
  });
}
function cargarproveedortotal() {
  $.ajax({
    type: "POST",
    url: "controller/ganado/cargarproveedor.php",
  }).done(function (resp) {
    let data = JSON.parse(resp);
    let llenardata = "";
    if (data.length > 0) {
      for (let i = 0; i < data.length; i++) {
        llenardata +=
          "<option value='" +
          data[i][0] +
          "'>" +
          data[i][1] +
          " " +
          data[i][2] +
          "</option>";
      }
      document.getElementById("select_proveedor_total").innerHTML = llenardata;
    } else {
      llenardata +=
        "<option value=''>No se encontrados datos en la bd</option>";
      document.getElementById("select_proveedor_total").innerHTML = llenardata;
    }
  });
}
//--------------cargar selecccion de transportistas----------------

function cargartransportistatotal() {
  $.ajax({
    type: "POST",
    url: "controller/ganado/cargartransportista.php",
  }).done(function (resp) {
    let data = JSON.parse(resp);
    let llenardata = "";
    if (data.length > 0) {
      for (let i = 0; i < data.length; i++) {
        llenardata +=
          "<option value='" + data[i][0] + "'>" + data[i][2] + "</option>";
      }
      document.getElementById("select_transportista_total").innerHTML =
        llenardata;
    } else {
      llenardata +=
        "<option value=''>No se encontrados datos en la bd</option>";
      document.getElementById("select_transportista_total").innerHTML =
        llenardata;
    }
  });
}
//--------------registro para el grupo----------------
function registrargrupo() {
  let proveedor = document.getElementById("select_proveedor").value;
  let transportista = document.getElementById("select_transportista").value;
  localStorage.setItem("proveedor", proveedor);
  localStorage.setItem("transportista", transportista);

  if (proveedor.length == 0 || transportista.length == 0) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Tiene algunos campos vacios",
      "warning"
    );
  }
  $.ajax({
    url: "controller/ganado/registro_grupo.php",
    type: "POST",

    contentType: false,
    processData: false,
  }).done(function (resp) {
    localStorage.setItem("dato", parseInt(resp) + 1);
    if (abrioregistrocompraunidad == true) {
      registrarpago();
      
    } else if (abrioregistrototal == true) {
      registrarpagototal();
    }
    
  });

  return false;
}

var tbl_ganado_simple;

function lista_ganado_simple() {
  let idGrupo = localStorage.getItem("dato");
  tbl_ganado_simple = $("#tabla_ganado").DataTable({
    ajax: {
      url: "controller/ganado/ganadolistar.php",
      type: "POST",
      data: {
        id: idGrupo,
      },
    },
    columns: [
      { defaultContent: "" },
      { data: "Raza" },
      { data: "Sexo" },
      { data: "Peso" },
      { data: "Edad" },
      { data: "Tipo" },
      { data: "Color" },
      { data: "Aretes" },
      { data: "Marca" },
      { data: "Salud" },
      { data: "Descripcion" },
      { data: "Id_Grupo" },
      { data: "Precio" },
      {
        data: "Estado",
        render: function (data, type, row) {
          if (data == "DISPONIBLE") {
            return '<span class="success">DISPONIBLE</span>';
          } else {
            return '<span class="danger">VENDIDO</span>';
          }
        },
      },
    ],
    pageLength: 9,
    destroy: true,
    bLengthChange: false,
    async: false,
    processing: true,
    language: idioma_espanol,
    select: true,
    scrollX: true,
  });
  tbl_ganado_simple.on("draw.td", function () {
    let pageInfo = $("#tabla_ganado").DataTable().page.info();
    tbl_ganado_simple
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + pageInfo.start;
      });
  });
}

function registroGanado() {
  let raza = document.getElementById("Raza").value;
  let Preciounidad = parseFloat( localStorage.getItem("preciounidadganado"));
  let Peso = document.getElementById("Peso").value;
  let Color = document.getElementById("Color").value;
  let edadtipo = document.getElementById("select_edad").value;
  let sexo = document.getElementById("select_sexo").value;
  let salud = document.getElementById("select_salud").value;
  let Marca = document.getElementById("Marca").value;
  let Aretes = document.getElementById("Aretes").value;
  let Descripcion = document.getElementById("Descripcion").value;
  let idGrupo = localStorage.getItem("dato");
  let precio = (Preciounidad * Peso).toFixed(2);
  let idProveedor = localStorage.getItem("proveedor");
  let idTransportista = localStorage.getItem("transportista");

  let Edad = document.getElementById("Edad").value;
  let pagototal = localStorage.getItem("pgbiatc");
  let idpago = localStorage.getItem("pagoid");
  if (
    raza.length == 0 ||
    Peso.length == 0 ||
    Color.length == 0 ||
    sexo.length == 0 ||
    salud.length == 0 ||
    idGrupo.length == 0 ||
    Edad.length == 0 
  ) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Tiene algunos campos vacios",
      "warning"
    );
  }
  let formData = new FormData();
  formData.append("r", raza);
  formData.append("p", Peso);
  formData.append("c", Color);
  formData.append("s", sexo);
  formData.append("sa", salud);
  formData.append("m", Marca);
  formData.append("a", Aretes);
  formData.append("d", Descripcion);
  formData.append("i", idGrupo);
  formData.append("e", Edad);
  formData.append("pr", precio);
  formData.append("ip", idProveedor);
  formData.append("it", idTransportista);
  formData.append("idp", idpago);
  formData.append("ptb", pagototal);
  formData.append("edt", edadtipo);
  $.ajax({
    url: "controller/ganado/registro_ganado.php",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (resp) {
      if (resp > 0) {
        //validarInput("nombre","apellido","documento");

        Swal.fire(
          "Mensaje de confirmacion",
          "Agregado con exito",
          "success"
        ).then((value) => {
          modal_container_ganado.classList.remove("show");
          limpiarinputsganado();
          lista_ganado_simple();
        });
      } else {
        Swal.fire(
          "Mensaje de advertencia",
          "No se pudo agregar al ganado",
          "warning"
        );
      }
    },
  });
}
function registroGanadoTotal() {
  let raza = document.getElementById("Raza_total").value;
  let Peso = document.getElementById("Peso_total").value;
  let Color = document.getElementById("Color_total").value;
  let edadtipo = document.getElementById("select_edad_total").value;
  let sexo = document.getElementById("select_sexo_total").value;
  let salud = document.getElementById("select_salud_total").value;
  let Marca = document.getElementById("Marca_total").value;
  let Aretes = document.getElementById("Aretes_total").value;
  let Descripcion = document.getElementById("Descripcion_total").value;
  let idGrupo = localStorage.getItem("dato");
  let idProveedor = localStorage.getItem("proveedor");
  let idTransportista = localStorage.getItem("transportista");

  let Edad = document.getElementById("Edad_total").value;
  let pagototal = localStorage.getItem("pgbiatc");
  let idpago = localStorage.getItem("pagoid");
  if (
    raza.length == 0 ||
    Peso.length == 0 ||
    Color.length == 0 ||
    sexo.length == 0 ||
    salud.length == 0 ||
    idGrupo.length == 0 ||
    Edad.length == 0
  ) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Tiene algunos campos vacios",
      "warning"
    );
  }
  let formData = new FormData();
  formData.append("r", raza);
  formData.append("p", Peso);
  formData.append("c", Color);
  formData.append("s", sexo);
  formData.append("sa", salud);
  formData.append("m", Marca);
  formData.append("a", Aretes);
  formData.append("d", Descripcion);
  formData.append("i", idGrupo);
  formData.append("e", Edad);
  formData.append("ip", idProveedor);
  formData.append("it", idTransportista);
  formData.append("idp", idpago);
  formData.append("ptb", pagototal);
  formData.append("edt", edadtipo);
  $.ajax({
    url: "controller/ganado/registro_ganado_total.php",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (resp) {
      if (resp > 0) {
        //validarInput("nombre","apellido","documento");

        Swal.fire(
          "Mensaje de confirmacion",
          "Agregado con exito",
          "success"
        ).then((value) => {
          modal_container_ganado_total.classList.remove("show");
          limpiarinputsganado1();
          lista_ganado_simple();
        });
      } else {
        Swal.fire(
          "Mensaje de advertencia",
          "No se pudo agregar al ganado",
          "warning"
        );
      }
    },
  });
}
function limpiarinputsganado() {
  document.getElementById("Raza").value = "";
  document.getElementById("Peso").value = "";
  document.getElementById("Color").value = "";
  document.getElementById("Marca").value = "";
  document.getElementById("Aretes").value = "";
  document.getElementById("Descripcion").value = "";
  document.getElementById("Edad").value = "";
}
function limpiarinputsganado1() {
  document.getElementById("Raza_total").value = "";
  document.getElementById("Peso_total").value = "";
  document.getElementById("Color_total").value = "";
  document.getElementById("Marca_total").value = "";
  document.getElementById("Aretes_total").value = "";
  document.getElementById("Descripcion_total").value = "";
  document.getElementById("Edad_total").value = "";
}

function datosdelselect() {
  var llenardata3 = "";
  var llenardata4 = "";
  var llenardata5 = "";
  llenardata3 += "<option value='H'>Hembra</option>";
  llenardata3 += "<option value='M'>Macho</option>";
  document.getElementById("select_sexo").innerHTML = llenardata3;
  llenardata4 += "<option value='bien'>Bien</option>";
  llenardata4 += "<option value='mal'>Mal</option>";
  document.getElementById("select_salud").innerHTML = llenardata4;
  llenardata5 += "<option value='Años'>Años</option>";
  llenardata5 += "<option value='Meses'>Meses</option>";
  document.getElementById("select_edad").innerHTML = llenardata5;
}
function datosdelselecttotal() {
  let llenardata = "";
  let llenardata2 = "";
  var llenardata3 = "";
  llenardata += "<option value='H'>Hembra</option>";
  llenardata += "<option value='M'>Macho</option>";
  document.getElementById("select_sexo_total").innerHTML = llenardata;
  llenardata2 += "<option value='bien'>Bien</option>";
  llenardata2 += "<option value='mal'>Mal</option>";
  document.getElementById("select_salud_total").innerHTML = llenardata2;
  llenardata3 += "<option value='Años'>Años</option>";
  llenardata3 += "<option value='Meses'>Meses</option>";
  document.getElementById("select_edad_total").innerHTML = llenardata3;
}

function registrarpago() {
  let pago_parcial = document.getElementById("pagoparcial").value;
  let Biatico_Inicio = document.getElementById("BiaticoInicio").value;
  let Biatico_Extras = document.getElementById("BiaticoExtras").value;
  let Biatico_Personal = document.getElementById("BiaticoPersonal").value;
  let Biatico_Empresa = document.getElementById("BiaticoEmpresa").value;
  let ubicacion = document.getElementById("ubicacion").value;
  let preciounidadganado = document.getElementById("preciounidad").value;
  if (pago_parcial.length == 0) {
    pago_parcial = 0;
  } 
  if (preciounidadganado.length == 0) {
    preciounidadganado = 0;
  } 
  if (Biatico_Inicio.length == 0) {
    Biatico_Inicio = 0;
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
  if (ubicacion.length == 0) {
    return  Swal.fire("Mensaje de advertencia", "Complete los datos", "warning");
  }
  let pagototalbiatico =
    parseFloat(Biatico_Inicio) +
    parseFloat(Biatico_Extras) +
    parseFloat(Biatico_Personal) +
    parseFloat(Biatico_Empresa);

  localStorage.setItem("preciounidadganado", preciounidadganado);
  localStorage.setItem("pgbiatc", pagototalbiatico);
  let formData = new FormData();

  formData.append("pp", pago_parcial);
  formData.append("bi", Biatico_Inicio);
  formData.append("be", Biatico_Extras);
  formData.append("bp", Biatico_Personal);
  formData.append("bem", Biatico_Empresa);
  formData.append("pgt", pagototalbiatico);
  formData.append("ubi", ubicacion);
  formData.append("pru", preciounidadganado);
  $.ajax({
    url: "controller/ganado/registro_pago.php",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (resp) {
      localStorage.setItem("pagoid", resp);
      Swal.fire("Mensaje de confirmacion", "Agregado con exito", "success").then(
        (value) => {
          modal_container_grupo.classList.remove("show");
          modal_container_grupo_total.classList.remove("show");
          abrio = true;
        }
      );
    },
  });
  return false;
}
function limpiarinputpago() {
  document.getElementById("pagoparcial").value = "";
  document.getElementById("BiaticoInicio").value = "";
  document.getElementById("BiaticoExtras").value = "";
  document.getElementById("BiaticoPersonal").value = "";
  document.getElementById("BiaticoEmpresa").value = "";
}

function actualizarpagosganado() {
  if (localStorage.getItem("dato") <= 1) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Primero debe registrar el grupo",
      "warning"
    );
  } else {
    Swal.fire({
      title:
        "Esta seguro que desea guardar el registro completo de lista ganado, podra rectificarlo en lista general?",
      showDenyButton: true,

      confirmButtonText: "guardar",
      denyButtonText: `no guardar`,
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {

        if (abrioregistrocompraunidad == true) {
          let idGrupo = localStorage.getItem("dato");
          let pagototal = localStorage.getItem("pgbiatc");
          let idpago = localStorage.getItem("pagoid");
          let formData = new FormData();

          formData.append("i", idGrupo);
          formData.append("ptb", pagototal);
          formData.append("idp", idpago);
          $.ajax({
            url: "controller/ganado/actualizar_pago_ganado.php",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (resp) {
              abrioenviar = true;
              location.reload();
            },
          });
          Swal.fire("Guardado con exito!", "", "success");
        } else if (abrioregistrototal == true) {
          let idGrupo = localStorage.getItem("dato");
          let pagototal = localStorage.getItem("pgbiatc");
          let idpago = localStorage.getItem("pagoid");
          let formData = new FormData();

          formData.append("i", idGrupo);
          formData.append("ptb", pagototal);
          formData.append("idp", idpago);
          $.ajax({
            url: "controller/ganado/actualizar_pago_ganado_total.php",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (resp) {
              abrioenviar = true;
              location.reload();
            },
          });
        }
      } else if (result.isDenied) {
        Swal.fire("Registro no guardado", "", "info");
      }
    });
  }
}

function registrarpagototal() {
  let pago_total = document.getElementById("pagototal_total").value;
  let pago_parcial = document.getElementById("pagoparcial_total").value;
  let Biatico_Inicio = document.getElementById("BiaticoInicio_total").value;
  let Biatico_Extras = document.getElementById("BiaticoExtras_total").value;
  let Biatico_Personal = document.getElementById("BiaticoPersonal_total").value;
  let Biatico_Empresa = document.getElementById("BiaticoEmpresa_total").value;
  let ubicacion = document.getElementById("ubicacion_total").value;

  let preciounidadganado = 0;

  if (pago_total - pago_parcial > 0) {
    if (pago_total.length == 0) {
      pago_total = 0;
    }
    if (pago_parcial.length == 0) {
      pago_parcial = 0;
    }
    if (Biatico_Inicio.length == 0) {
      Biatico_Inicio = 0;
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
    if (ubicacion.length == 0) {
      return  Swal.fire("Mensaje de advertencia", "Complete los datos", "warning");
    }
  
    let pagototalbiatico =
      parseFloat(Biatico_Inicio) +
      parseFloat(Biatico_Extras) +
      parseFloat(Biatico_Personal) +
      parseFloat(Biatico_Empresa);
  
    localStorage.setItem("pgbiatc", pagototalbiatico);
  
    let formData = new FormData();
  
    formData.append("pt", pago_total);
    formData.append("pp", pago_parcial);
    formData.append("bi", Biatico_Inicio);
    formData.append("be", Biatico_Extras);
    formData.append("bp", Biatico_Personal);
    formData.append("bem", Biatico_Empresa);
    formData.append("pgt", pagototalbiatico);
    formData.append("ubi", ubicacion);
    formData.append("pru", preciounidadganado);
    $.ajax({
      url: "controller/ganado/registro_pago_total.php",
      type: "POST",
      data: formData,
      contentType: false,
      processData: false,
      success: function (resp) {
        localStorage.setItem("pagoid", resp);
        Swal.fire("Mensaje de confirmacion", "Agregado con exito", "success").then(
          (value) => {
            modal_container_grupo.classList.remove("show");
            modal_container_grupo_total.classList.remove("show");
            abrio = true;
          }
        );
      },
    });
    return false;
  } else {
    return swal.fire(
      "Mensaje de Advertencia",
      "El pago Parcial no puede ser mayor que el pago total",
      "warning"
    );
  }
}
function limpiarinputpago() {
  document.getElementById("pagototal_total").value = "";
  document.getElementById("pagoparcial_total").value = "";
  document.getElementById("BiaticoInicio_total").value = "";
  document.getElementById("BiaticoExtras_total").value = "";
  document.getElementById("BiaticoPersonal_total").value = "";
  document.getElementById("BiaticoEmpresa_total").value = "";
}
