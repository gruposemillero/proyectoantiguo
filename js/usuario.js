function iniciar() {
    let usu = document.getElementById('txt_usuario').value;
    let pass = document.getElementById('txt_pass').value;
    if (usu.length == 0 || pass.length == 0) {
        return Swal.fire('Mensaje de Advertencia', 'Ingrese los campos requeridos', 'warning');
    }
    $.ajax({
        url: 'controller/usuario/iniciarSesion.php',
        type: 'POST',
        data: {
            u: usu,
            p: pass
        }
    }).done(function (resp) {
        let data = JSON.parse(resp);
        if (data.length > 0) {
            $.ajax({
                url: 'controller/usuario/crearSesion.php',
                type: 'POST',
                data: {
                    idusuario: data[0][0], //esto se saca de la tbla posicion columna y fila
                    nombre: data[0][1],
                    apellido: data[0][2],
                    documento: data[0][3],
                    usuario: data[0][5],
                }
            }).done(function (r) {
                let timerInterval
                Swal.fire({
                    title: 'Ingresando al sistema',
                    html: 'redireccionando en <b></b> milliseconds.',
                    timer: 2000,
                    timerProgressBar: true,
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading()
                        const b = Swal.getHtmlContainer().querySelector('b')
                        timerInterval = setInterval(() => {
                            b.textContent = Swal.getTimerLeft()
                        }, 100)
                    },
                    willClose: () => {
                        clearInterval(timerInterval)
                    }
                }).then((result) => {
                    /* Read more about handling dismissals below */
                    if (result.dismiss === Swal.DismissReason.timer) {
                        location.reload();
                    }
                })
            })
        } else {
            Swal.fire('Mensaje de Error', 'Usuario o clave incorrecta', 'error');
        }
    })
}

