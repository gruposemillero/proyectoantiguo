var opcion = 2;
var dni = 1;
localStorage.setItem("grupoidgananciaventa", 1);
var modal_container_grupo = document.getElementById("modal_grupo_editar1");
function cerrarmodalregistro() {
  modal_container_grupo.classList.remove("show");
}
var modal_container_ganado_ganancias = document.getElementById("modal_ganado_grupo1_ganancias");
function abrirmodalganado_ganancias() {
  modal_container_ganado_ganancias.classList.add("show");
  compradorgeneralganancia();
}
function cerrarmodalganado_ganancias() {
  modal_container_ganado_ganancias.classList.remove("show");
}

var modar_container_pagos_totales = document.getElementById("modal_pago_final");
function cerrarmodalpagototal() {
  modar_container_pagos_totales.classList.remove("show");
}
// tabla simpleee filtadra
function sacarganancias(){
  // rellenarga();
  sumapreciocompratotal();
  sumaprecioventatotal();
  ganancias();
  document.getElementById('ptc').value = localStorage.getItem("sumapreciocompratotal");
  document.getElementById('pvt').value = localStorage.getItem("sumaprecioventatotal");
  let ptcd = localStorage.getItem("sumapreciocompratotal")
  let ptvd = localStorage.getItem("sumaprecioventatotal");
  gancnaistotal((ptvd - ptcd).toFixed(2));
  
}
function gancnaistotal(valor){
  document.getElementById('ga').value = valor;
  modar_container_pagos_totales.classList.add("show");
}

var tbl_ganancias;
function lista_ganancias() {
  let dni_buscar =document.getElementById("dni_buscar").value; 
  if (dni_buscar.length == 0) {
    dni_buscar = 1;
  }
  tbl_ganancias = $("#tabla_ganancias").DataTable({
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
      url: "controller/ganancia/listarganancia.php",
      type: "POST",
      data: {
        d: dni_buscar,
      },
    },
    columns: [
      { data: "Grupo_Venta" },
      { data: "Fecha" },
      { data: "Nombre" },
      { data: "Documento" },
      { data: "Licencia" },
      { data: "cantidad" },
      { data: "precio_compra" },
      { data: "gasto_inicial" },
      { data: "precio_compra_total"},
      { data: "precio_venta" },
      { data: "gasto_final" },
      { data: "precio_venta_total" },
      {
        data: "ganancia",
        render: function (data, type, row) {
          if (parseFloat(data) < 0) {
            return '<span class="danger">'+ data + '</span>';
          } else  if(parseFloat(data) > 0){
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
    language: idioma_espanol,
    select: true,
    scrollX:true,
    
  });

    
}

function sumapreciocompratotal (){
  var table = $('#tabla_ganancias').DataTable();
  var pruebita = table.column(8).data().sum();
  localStorage.setItem("sumapreciocompratotal",pruebita.toFixed(2));
}
function sumaprecioventatotal(){
  var table = $('#tabla_ganancias').DataTable();
  var pruebita = table.column(11).data().sum();
  localStorage.setItem("sumaprecioventatotal",pruebita.toFixed(2));
}
function ganancias(){
  var table = $('#tabla_ganancias').DataTable();
  var pruebita = table.column(12).data().sum();
  localStorage.setItem("gananciastotales",pruebita.toFixed(2));
}



//--------------cargar selecccion de proveedor----------------

//----------------editar vendedor-----------------------
function editarmodal() {
  
  $("#tabla_ganancias").on("click", ".seleccionar", function () {
    var data = tbl_ganancias.row($(this).parents("tr")).data(); //tamano escritorio
    localStorage.setItem("grupoidgananciaventa", data["Grupo_Venta"]);
    abrirmodalganadogrupo1.classList.add("show");
    lista_ganado_simple_ganancias();
  });
}
function lista_ganado_simple_ganancias() {
  var idGrupo = localStorage.getItem("grupoidgananciaventa");

  tbl_ganado_simple1 = $("#tabla_ganado_ganancias").DataTable({
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
      { data: "Precio_Unitario" },
      { data: "Peso_Actual" },
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
    bLengthChange: false,
    destroy: true,
    async: false,
    processing: true,
    language: idioma_espanol,
    select: true,
    scrollX:true,
  });
  tbl_ganado_simple1.on("draw.td", function () {
    let pageInfo = $("#tabla_ganado_ganancias").DataTable().page.info();
    tbl_ganado_simple1
      .column(0, { page: "current" })
      .nodes()
      .each(function (cell, i) {
        cell.innerHTML = i + 1 + pageInfo.start;
      });
  });
  
}


function abrirmodalganadogrupo1() {
  $("#tabla_ganancias").on("click", ".seleccionar", function () {
    var data = tbl_ganancias.row($(this).parents("tr")).data(); //tamano escritorio
    localStorage.setItem("grupoidgananciaventa", data["Grupo_Venta"]);
    lista_ganado_simple_ganancias();
  });
  modal_container_ganado_ganancias.classList.add("show");
}
//----------funcion para seleccionar grupo modal------------------------

