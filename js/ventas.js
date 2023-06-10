localStorage.setItem("compra", 1);
var modal_container_grupo_ventas_grupo = document.getElementById("modal_grupo_ganado_Venta");

var modal_container_ganado = document.getElementById("modal_ganado_venta_ventass");
var abrioselect1 = false;
function abrirmodalderegistrogrupoventa() {
  if (localStorage.getItem("compra") > 1) { 
    return Swal.fire({
      title: "Ya se registro el grupo, continue con los ganados o actualice la pagina. ¿Desea actualizar la pagina?",
      showDenyButton: true,
      confirmButtonText: "Si",
      denyButtonText: `No`,
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        return Swal.fire({
          title: "Está seguroque desea actualizar la pagina?",
          showDenyButton: true,
          confirmButtonText: "Si",
          denyButtonText: `No`,
        }).then((result) => {
          /* Read more about isConfirmed, isDenied below */
          if (result.isConfirmed) {
            let timerInterval1;
            Swal.fire({
              title: "Recargando la pagina",
              html: "Recargare en <b></b> milisegundos.",
              timer: 1000,
              timerProgressBar: true,
              didOpen: () => {
                Swal.showLoading();
                const b = Swal.getHtmlContainer().querySelector("b");
                timerInterval1 = setInterval(() => {
                  b.textContent = Swal.getTimerLeft();
                }, 100);
              },
              willClose: () => {
                clearInterval(timerInterval1);
              },
            }).then((result1) => {
              /* Read more about handling dismissals below */
              if (result1.dismiss === Swal.DismissReason.timer) {
                location.reload();
              }
            });
          }
        });

        let timerInterval;
        Swal.fire({
          title: "Recargando la pagina",
          html: "Recargare en <b></b> milisegundos.",
          timer: 1000,
          timerProgressBar: true,
          didOpen: () => {
            Swal.showLoading();
            const b = Swal.getHtmlContainer().querySelector("b");
            timerInterval = setInterval(() => {
              b.textContent = Swal.getTimerLeft();
            }, 100);
          },
          willClose: () => {
            clearInterval(timerInterval);
          },
        }).then((result) => {
          if (result.dismiss === Swal.DismissReason.timer) {
            location.reload();
          }
        });
      }
    });
  } else {
  modal_container_grupo_ventas_grupo.classList.add("show");
  }
}
function cerrarmodalregistrogrupoventa() {
  modal_container_grupo_ventas_grupo.classList.remove("show");
}
function abrirmodalderegistroganado() {
  if (localStorage.getItem("compra") <= 1) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Primero debe registrar el grupo de venta",
      "warning"
    );
  } else {
    modal_container_ganado.classList.add("show");
  }
}
function cerrarmodalregistroganadoventa() {
  modal_container_ganado.classList.remove("show");
}
function cargarcomprador() {
  $.ajax({
    type: "POST",
    url: "controller/ventas/cargarcomprador.php",
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
          data[i][3] +
          "</option>";
      }
      document.getElementById("select_comprador").innerHTML = llenardata;
    } else {
      llenardata +=
        "<option value=''>No se encontrados datos en la bd</option>";
      document.getElementById("select_comprador").innerHTML = llenardata;
    }
  });
}

//--------------cargar selecccion de transportistas----------------

function cargartransportistaventa() {
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
      document.getElementById("select_transportista_lista_venta").innerHTML = llenardata;
    } else {
      llenardata +=
        "<option value=''>No se encontrados datos en la bd</option>";
      document.getElementById("select_transportista_lista_venta").innerHTML = llenardata;
    }
  });
}
var datatotalgrupo = 0
function cargargrupoganado() {
  $.ajax({
    type: "POST",
    url: "controller/ventas/cargargrupocompra.php",
  }).done(function (resp) {
    let data = JSON.parse(resp);
    let llenardata = "";
    let idgrupo;
    if (data.length > 0) {
      for (let i = 0; i < data.length; i++) {
        if (i == 0) {
          idgrupo = data[i][0];
          localStorage.setItem("compra2", idgrupo);
          cargarganado(idgrupo);
        }
        llenardata +=
          "<option value='" + data[i][0] + "'>" + data[i][0] + "</option>";
      }
    
      
      document.getElementById("select_grupo_ganado").innerHTML = llenardata;
      //document.getElementById("select_grupo_ganado").value = "";
      datatotalgrupo = data.length;
    } else {
      llenardata +=
        "<option value=''>No se encontrados datos en la bd</option>";
      document.getElementById("select_grupo_ganado").innerHTML = llenardata;
    }
  });
}
function cargarganado(grupoid) {
  
  $.ajax({
    type: "POST",
    url: "controller/ventas/cargargrupoganado.php",
    data: {
      grupoid: grupoid,
    },
  }).done(function (resp) {
    let data = JSON.parse(resp);
    let llenardata = "";
    let i;
    let idganado;
    if (data.length > 0) {
      if(data.length == 1){
        localStorage.setItem("idganadoescogido", data[0][0]);
        
      }
      for (i = 0; i < data.length; i++) {
        if (i == 0) {
          idganado = data[i][0];
          
        }

        llenardata +=
          "<option value='" +
          data[i][0] +
          "'>" +
          data[i][3] +
          " " +
          data[i][4] +
          "</option>";
      }
      document.getElementById("select_ganado_vacuno").innerHTML = llenardata;
      document.getElementById("select_ganado_vacuno").value = "";
    } else {
      llenardata +=
        "<option value=''>No se encontrados datos en la bd</option>";
      document.getElementById("select_ganado_vacuno").innerHTML = llenardata;
      document.getElementById("select_ganado_vacuno").value = "";
    }
  });
}
function cargarGanadoInput(grupoid) {
  $.ajax({
    type: "POST",
    url: "controller/ventas/cargarganadoinput.php",
    data: {
      grupoid: grupoid,
    },
  }).done(function (resp) {
    let data = JSON.parse(resp);
    if (data.length > 0) {
      for (let i = 0; i < data.length; i++) {
        document.getElementById("id_zonaventa").value = data[i][0];
        document.getElementById("Raza_zonaventa").value = data[i][3];
        document.getElementById("Peso_zonaventa").value = data[i][2];
        document.getElementById("Color_zonaventa").value = data[i][4];
        document.getElementById("Sexo_zonaventa").value = data[i][5];
        document.getElementById("Salud_zonaventa").value = data[i][6];
        document.getElementById("Aretes_zonaventa").value = data[i][8];
        document.getElementById("Marca_zonaventa").value = data[i][7];
        document.getElementById("Descripcion_zonaventa").value = data[i][9];
        document.getElementById("Edad_zonaventa").value = data[i][11];
      }
    }
  });
}

function registrargrupoVenta() {
  let comprador = document.getElementById("select_comprador").value;
  let transportista = document.getElementById("select_transportista_lista_venta").value;
  localStorage.setItem("comprador", comprador);
  localStorage.setItem("transportistacomprador", transportista);
  if (comprador.length == 0 || transportista.length == 0) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Tiene algunos campos vacios",
      "warning"
    );
  }
  $.ajax({
    url: "controller/ventas/registro_grupo_compra.php",
    type: "POST",
    contentType: false,
    processData: false,
  }).done(function (resp) {
    localStorage.setItem("compra", parseInt(resp) + 1);
    registrarpagoZonaVenta();
    
  });
  return false;
}

function registroGanadoVenta() {
  let idGrupoVenta = localStorage.getItem("compra");
  let idGanadoRegistro = localStorage.getItem("idganadoescogido");
  let idpagoventa = localStorage.getItem("pagoventaid");
  let comprador = localStorage.getItem("comprador");
  let transportista = localStorage.getItem("transportistacomprador");
  let formData = new FormData();

  formData.append("iv", idGrupoVenta);
  formData.append("igr", idGanadoRegistro);
  formData.append("ipv", idpagoventa);
  formData.append("com", comprador);
  formData.append("trans", transportista);

  $.ajax({
    url: "controller/ventas/registro_ganado_venta.php",
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
          recargarfunciones(); //cerranmos el modal
          lista_ganado_simple_vendidos_zona();
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

function recargarfunciones() {
  
  document.getElementById("Color_zonaventa").value = "";
  document.getElementById("Sexo_zonaventa").value = "";
  document.getElementById("Salud_zonaventa").value = "";
  document.getElementById("id_zonaventa").value = "";
  document.getElementById("Raza_zonaventa").value = "";
  document.getElementById("Peso_zonaventa").value = "";
  document.getElementById("Marca_zonaventa").value = "";
  document.getElementById("Aretes_zonaventa").value = "";
  document.getElementById("Descripcion_zonaventa").value = "";
  document.getElementById("Edad_zonaventa").value = "";
  
  cargargrupoganado();
  $("#select_grupo_ganado").change(function () {
    var grupoid = $("#select_grupo_ganado").val();
    cargarganado(grupoid);
  });
  $("#select_ganado_vacuno").change(function () {
    var ganadoid = $("#select_ganado_vacuno").val();
    cargarGanadoInput(ganadoid);
  });
}
var ltbl_ganado_simple_vendidos_zona;
function lista_ganado_simple_vendidos_zona() {
  let idGrupo = localStorage.getItem("compra");
  ltbl_ganado_simple_vendidos_zona = $("#tabla_ganado_vendidos_zona").DataTable({
    
    ajax: {
      url: "controller/ventas/ganadolistarventa.php",
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
      { data: "Color" },
      { data: "Aretes" },
      { data: "Marca" },
      { data: "Salud" },
      { data: "Descripcion" },
      { data: "Precio" },
      { data: "Id_Grupo" },
      { data: "Grupo_Venta" },
    ],
    pageLength: 9,
    destroy: true,
    async: false,
    processing: true,
    bLengthChange: false,
    language: idioma_espanol,
    select: true,
    scrollX:true,
  });
  ltbl_ganado_simple_vendidos_zona.on("draw.td", function () {
    let pageInfo = $("#tabla_ganado_vendidos_zona").DataTable().page.info();
    ltbl_ganado_simple_vendidos_zona
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + pageInfo.start;
      });
  });
}
function registrarpagoZonaVenta() {
  let pago_parcial = document.getElementById("pagoparcialZonaVenta").value;
  let Biatico_Final = document.getElementById("BiaticoInicioZonaVenta").value;
  let Biatico_Extras = document.getElementById("BiaticoExtrasZonaVenta").value;
  let Biatico_Personal = document.getElementById("BiaticoPersonalZonaVenta").value;
  let Biatico_Empresa = document.getElementById("BiaticoEmpresaZonaVenta").value;
  let ubicacion = document.getElementById("ubicacion_venta").value;
  if (pago_parcial.length == 0) {
    pago_parcial = 0;
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
  if (ubicacion.length == 0) {
    return  Swal.fire("Mensaje de advertencia", "Complete los datos", "warning");
  }
  let pagototalbiatico =
    parseFloat(Biatico_Final) +
    parseFloat(Biatico_Extras) +
    parseFloat(Biatico_Personal) +
    parseFloat(Biatico_Empresa);

  localStorage.setItem("pgbiatc", pago_parcial);

  let formData = new FormData();

  formData.append("pp", pago_parcial);
  formData.append("bi", Biatico_Final);
  formData.append("be", Biatico_Extras);
  formData.append("bp", Biatico_Personal);
  formData.append("bem", Biatico_Empresa);
  formData.append("pgt", pagototalbiatico);
  formData.append("ubi", ubicacion);
  $.ajax({
    url: "controller/ventas/registro_pago_venta.php",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (resp) {
      localStorage.setItem("pagoventaid", resp);
      Swal.fire(
        "Mensaje de confirmacion",
        "Agregado con exito",
        "success"
      ).then((value) => {
        cerrarmodalregistrogrupoventa();
      });
    },
  });
  return false;
}
function actualizarpagosganado() {
  if (localStorage.getItem("compra") <= 1) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Primero debe registrar el grupo de venta",
      "warning"
    );
  } else {
    Swal.fire({
      title: "Esta seguro que desea guardar el registro completo de lista ganado?, podra rectificarlo en vista general de ventas",
      showDenyButton: true,
      confirmButtonText: "guardar",
      denyButtonText: `no guardar`,
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {
        let idGrupo = localStorage.getItem("compra");
        let pagoparcial = localStorage.getItem("pgbiatc");
        let idpago = localStorage.getItem("pagoventaid");
        let formData = new FormData();

        formData.append("i", idGrupo);
        formData.append("ptb", pagoparcial);
        formData.append("idp", idpago);
        $.ajax({
          url: "controller/ventas/actualizar_pago_ganado_venta.php",
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
      } else if (result.isDenied) {
        Swal.fire("Registro no guardado", "", "info");
      }
    });
  }
}
