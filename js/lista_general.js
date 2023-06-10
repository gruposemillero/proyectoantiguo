var abrioganado = false;
var abriopago = true;

var modal_container_ganado_modificar = document.getElementById("modal_ganado_modificar");
function cerrarmodalmodificarganado() {
  modal_container_ganado_modificar.classList.remove("show");
}
var modal_container_ganado = document.getElementById("modal_ganado_grupo");
var abrioganado = false;
function cerrarmodalganado() {
  modal_container_ganado.classList.remove("show");
}
localStorage.setItem("grupoid", 1);
localStorage.setItem("proveedorlista", 1);
localStorage.setItem("transportistalista", 1);
var modal_container_pago = document.getElementById("modal_pago");
function abrirmodalderegistropago() {
  if (abrioganado == true) {
    modal_container_pago.classList.add("show");
  } else {
    return swal.fire(
      "Mensaje de Advertencia",
      "Necesitas Registrar primero un nuevo ganado",
      "warning"
    );
  }
}
function cerrarmodalregistropago() {
  modal_container_pago.classList.remove("show");
}
//---------------funcion de la tabla grupo serverside------------------------
var tbl_grupo_simple;
function lista_Ganado_serverside() {
  tbl_grupo_simple = $("#tabla_grupo").DataTable({
    
    ajax: {
      url: "controller/listageneral/listar_grupo.php",
      type: "POST",
    },
    columns: [
      { data: "Id_Grupo" },
      { data: "Fecha" },
      { data: "Nombre" },
      { data: "Documento" },
      { data: "Licencia" },
      { data: "Id_Pago" },
      { data: "Ubicacion" },
      { data: "Peso" },  
      {data: "Precio_Unidad" },
      { data: "Precio" },
      {  data: "Restante",
        render: function (data, type, row) {
          if (parseFloat(data) == 0) {
            return '<span class="success">'+ data + '</span>';
          }else {
            return '<span class="danger">'+ data + '</span>';
          }
        },
      },
      {
        defaultContent:
          "<button class='button-34 seleccionar' role='button'onclick='abrirmodalganadogrupo1()' ><span class='material-icons-sharp' > visibility </span></button>",
      },
    ],
    pageLength: 9,
    destroy: true,
    bLengthChange: false,
    async: false,
    processing: true,
    language: idioma_espanol,
    select: true,
    scrollX:true,
  });
}

//--------------cargar selecccion de proveedor----------------
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
          "<option value='" + data[i][0] + "'>" + data[i][3] + "</option>";
      }
      document.getElementById("select_vendedor").innerHTML = llenardata;
    } else {
      llenardata +=
        "<option value=''>No se encontrados datos en la bd</option>";
      document.getElementById("select_vendedor").innerHTML = llenardata;
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



function abrirmodalganadogrupo1() {
  $("#tabla_grupo").on("click", ".seleccionar", function () {
    var data = tbl_grupo_simple.row($(this).parents("tr")).data();


    localStorage.setItem("grupoid", data["Id_Grupo"]);
    localStorage.setItem("proveedorlista", data["Id_Proveedor"]);
    localStorage.setItem("transportistalista", data["Id_Transportista"]);
    localStorage.setItem("idpago", data["Id_Pago"]);
    localStorage.setItem("pulistagrale",data["Precio_Unidad"]);
    lista_ganado_simple();
  });
  modal_container_ganado.classList.add("show");
}

var tbl_ganado_simple1;
function lista_ganado_simple() {
  let idGrupo = localStorage.getItem("grupoid");

  tbl_ganado_simple1 = $("#tablita").DataTable({
    
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
      {
        defaultContent:
          "<button class='button-34 seleccionar' role='button'onclick='editarmodalganado()' ><span class='material-icons-sharp' > edit </span></button>",
      },
      
    ],
    searching: { regex: false },
    lengthMenu: [
      [10, 25, 50, 100, -1],
      [10, 25, 50, 100, "All"],
    ],
    pageLength: 9,
    bLengthChange: false,
    destroy: true,
    async: false,
    processing: true,
    language: idioma_espanol,
    select: true,
    scrollX:true,
  });
  tbl_ganado_simple1.on("draw.td", function () {
    let pageInfo = $("#tablita").DataTable().page.info();
    tbl_ganado_simple1
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + pageInfo.start;
      });
  });
}

// registro ganado
var modal_container_ganado1 = document.getElementById("modal_ganado_lista_general");

function cerrarmodalregistroganadolistageneral() {
  modal_container_ganado1.classList.remove("show");
}
function abrirmodalderegistroganadolistageneral() {
  document.getElementById("preciounidad").value = localStorage.getItem("pulistagrale");
  modal_container_ganado1.classList.add("show");
}
function datosdelselectlistageneral() {
  let llenardata = "";
  let llenardata2 = "";
  llenardata += "<option value='H'>Hembra</option>";
  llenardata += "<option value='M'>Macho</option>";
  document.getElementById("select_sexo_listageneral").innerHTML = llenardata;
  document.getElementById("select_sexo_editar_listageneral").innerHTML = llenardata;
  llenardata2 += "<option value='bien'>Bien</option>";
  llenardata2 += "<option value='mal'>Mal</option>";
  document.getElementById("select_salud_listageneral").innerHTML = llenardata2;
  document.getElementById("select_salud_editar_listageneral").innerHTML = llenardata2;
}
function registroGanadolistageneral() {

  let raza = document.getElementById("Raza").value;
  let Preciounidad = document.getElementById("preciounidad").value;
  let Peso = document.getElementById("Peso").value;
  let Color = document.getElementById("Color").value;
  let sexo = document.getElementById("select_sexo_listageneral").value;
  let salud = document.getElementById("select_salud_listageneral").value;
  let Marca = document.getElementById("Marca").value;
  let Aretes = document.getElementById("Aretes").value;
  let Descripcion = document.getElementById("Descripcion").value;
  let idGrupo = localStorage.getItem("grupoid");
  let precio = (Preciounidad * Peso).toFixed(2);

  let idProveedor = localStorage.getItem("proveedorlista");
  let idTransportista = localStorage.getItem("transportistalista");
  let Edad = document.getElementById("Edad").value;
  let idpago = localStorage.getItem("idpago");
  let pagototal = localStorage.getItem("pgbiatc");
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
  $.ajax({
    url: "controller/ganado/registro_ganado.php",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (resp) {
      abrioganado = true;
      localStorage.setItem("precioganado", resp);
      if (resp > 0) {

        Swal.fire(
          "Mensaje de confirmacion",
          "Agregado con exito",
          "success"
        ).then((value) => {
          lista_ganado_simple();
          modal_container_ganado1.classList.remove("show");
          limpiarinputsganado();
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


function limpiarinputpago() {
  document.getElementById("pagoparcial").value = "";
  document.getElementById("BiaticoInicio").value = "";
  document.getElementById("BiaticoExtras").value = "";
  document.getElementById("BiaticoPersonal").value = "";
  document.getElementById("BiaticoEmpresa").value = "";
}
function registrarpagolistageneral() {
  if (abrioganado == false) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Primero debe registrar todos los ganados adicionales",
      "warning"
    );
  } else {
    Swal.fire({
      title:
        "Esta seguro que desea guardar el registro completo de lista ganado?",
      showDenyButton: true,

      confirmButtonText: "guardar",
      denyButtonText: `no guardar`,
    }).then((result) => {
      if (result.isConfirmed) {
        let idPago = localStorage.getItem("idpago");
        let idGrupo = localStorage.getItem("grupoid");
        let precio = localStorage.getItem("precioganado");

        let formData = new FormData();
        formData.append("ip", idPago);
        formData.append("ig", idGrupo);
        formData.append("pr", precio);
        $.ajax({
          url: "controller/ganado/actualizar_pago_ganado_vista.php",
          type: "POST",
          data: formData,
          contentType: false,
          processData: false,
          success: function (resp) {
            
          },
        });
        abrioganado = false;
        Swal.fire("Guardado con exito!", "", "success");
      } 
    });
  }
}
function editarmodalganado(){
  $('#tablita').on('click', '.seleccionar', function () {
    var data1 = tbl_ganado_simple1.row($(this).parents('tr')).data(); //tamano escritorio
    
        document.getElementById("id_editar_ganado").value = data1["Id_Registro_Ganado"];
        document.getElementById("Raza_editar").value = data1["Raza"];
        document.getElementById("Peso_editar").value = data1["Peso"]
        document.getElementById("Color_editar").value = data1["Color"]
        document.getElementById("Aretes_editar").value = data1["Aretes"]
        document.getElementById("Marca_editar").value = data1["Marca"]
        document.getElementById("Edad_editar").value = data1["Edad"]
        document.getElementById("select_sexo_editar_listageneral").value = data1["Sexo"]
        document.getElementById("select_salud_editar_listageneral").value = data1["Salud"]
        document.getElementById("Descripcion_editar").value = data1["Descripcion"]
        modal_container_ganado_modificar.classList.add('show');

})
}

function modificarGanado() {

  let id_ganado_mo = document.getElementById("id_editar_ganado").value;
  let raza = document.getElementById("Raza_editar").value;
  let Preciounidad = document.getElementById("preciounidad_editar").value;
  let Peso = document.getElementById("Peso_editar").value;
  let Color = document.getElementById("Color_editar").value;
  let sexo = document.getElementById("select_sexo_editar_listageneral").value;
  let salud = document.getElementById("select_salud_editar_listageneral").value;
  let Marca = document.getElementById("Marca_editar").value;
  let Aretes = document.getElementById("Aretes_editar").value;
  let Descripcion = document.getElementById("Descripcion_editar").value;
  let precio = (Preciounidad * Peso).toFixed(1);

  let Edad = document.getElementById("Edad_editar").value;

  if (
    raza.length == 0 ||
    Peso.length == 0 ||
    Color.length == 0 ||
    sexo.length == 0 ||
    salud.length == 0 ||
    Edad.length == 0
  ) {
    return swal.fire(
      "Mensaje de Advertencia",
      "Tiene algunos campos vacios",
      "warning"
    );
  }
  let formData = new FormData();
  formData.append("i", id_ganado_mo);
  formData.append("r", raza);
  formData.append("p", Peso);
  formData.append("c", Color);
  formData.append("s", sexo);
  formData.append("sa", salud);
  formData.append("m", Marca);
  formData.append("a", Aretes);
  formData.append("d", Descripcion);
  formData.append("e", Edad);
  formData.append("pr", precio);
  $.ajax({
    url: "controller/ganado/modificar_ganado.php",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (resp) {
      abrioganado = true;
      localStorage.setItem("precioganado", resp);
      if (resp > 0) {

        Swal.fire(
          "Mensaje de confirmacion",
          "Agregado con exito",
          "success"
        ).then((value) => {
          lista_ganado_simple();
          modal_container_ganado_modificar.classList.remove("show");
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