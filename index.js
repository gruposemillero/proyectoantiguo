
// MenuToggle
function paginas2(){
    $(document).ready(() => {
        
        
        //$('#principalcontenido').load("view/principal.php");
        $('#proveedorcontenido').load("view/proveedor.php");
        $('#principal').click(function () {
            $('#transportistacontenido').hide();
            $('#pagocontenido').hide();
            $('#lista_ventacontenido').hide();
            $('#gananciacontenido').hide();
            $('#zona_ventacontenido').hide();
            $('#lista-generalcontenido').hide();
            $('#proveedorcontenido').hide();
            $('#compradorescontenido').hide();
            $('#ganadocontenido').hide();
            $('#principalcontenido').load("view/principal.php");
            document.getElementById("principalcontenido").style.display = "block";
            /*console.log($('#principal').css("display"));
            $('#principal').css("display","block")
            console.log($('#principal').css("display"));*/
        });
        $('#transportista').click(function () {
            $('#principalcontenido').hide(); 
            $('#lista_ventacontenido').hide();
            $('#pagocontenido').hide();
            $('#gananciacontenido').hide();
            $('#zona_ventacontenido').hide();  
            $('#compradorescontenido').hide();
            $('#lista-generalcontenido').hide();         
            $('#proveedorcontenido').hide();
            $('#ganadocontenido').hide();
            $('#transportistacontenido').load('view/transportista.php');
            document.getElementById("transportistacontenido").style.display = "block";
            
        });
        $('#proveedor').click(function () {
            $('#principalcontenido').hide(); 
            $('#zona_ventacontenido').hide();
            $('#lista_ventacontenido').hide();
            $('#pagocontenido').hide();
            $('#gananciacontenido').hide(); 
            $('#compradorescontenido').hide(); 
            $('#lista-generalcontenido').hide();         
            $('#transportistacontenido').hide();
            $('#ganadocontenido').hide();
            $('#proveedorcontenido').load('view/proveedor.php');
            document.getElementById("proveedorcontenido").style.display = "block";
            
        });
        $('#ganado').click(function () {
            $('#principalcontenido').hide();
            $('#lista_ventacontenido').hide();
            $('#pagocontenido').hide(); 
            $('#gananciacontenido').hide();
            $('#zona_ventacontenido').hide(); 
            $('#compradorescontenido').hide();  
            $('#lista-generalcontenido').hide();        
            $('#transportistacontenido').hide();
            $('#ganadocontenido').hide();
            $('#proveedorcontenido').hide();
            $('#ganadocontenido').load('view/ganado.php');
            document.getElementById("ganadocontenido").style.display = "block";
            
        });
        $('#lista-general').click(function () {
            $('#principalcontenido').hide();
            $('#lista_ventacontenido').hide();
            $('#pagocontenido').hide(); 
            $('#gananciacontenido').hide();
            $('#zona_ventacontenido').hide(); 
            $('#compradorescontenido').hide();  
            $('#transportistacontenido').hide();
            $('#ganadocontenido').hide();
            $('#proveedorcontenido').hide();
            $('#ganadocontenido').hide();
            $('#lista-generalcontenido').load('view/vistageneral.php');        
            document.getElementById("lista-generalcontenido").style.display = "block";
            
        });
        $('#compradores').click(function () {
            $('#principalcontenido').hide();
            $('#lista_ventacontenido').hide();
            $('#pagocontenido').hide(); 
            $('#gananciacontenido').hide();
            $('#zona_ventacontenido').hide(); 
            $('#lista-generalcontenido').hide();  
            $('#transportistacontenido').hide();
            $('#ganadocontenido').hide();
            $('#proveedorcontenido').hide();
            $('#ganadocontenido').hide();
            $('#compradorescontenido').load('view/compradores.php');        
            document.getElementById("compradorescontenido").style.display = "block";
            
        });
        $('#zona_venta').click(function () {
            $('#principalcontenido').hide(); 
            $('#lista_ventacontenido').hide();
            $('#lista-generalcontenido').hide();  
            $('#pagocontenido').hide();
            $('#gananciacontenido').hide();
            $('#transportistacontenido').hide();
            $('#ganadocontenido').hide();
            $('#compradorescontenido').hide();
            $('#proveedorcontenido').hide();
            $('#ganadocontenido').hide();
            $('#zona_ventacontenido').load('view/zona_venta.php');        
            document.getElementById("zona_ventacontenido").style.display = "block";
            
        });
        $('#pago').click(function () {
            $('#principalcontenido').hide();
            $('#lista_ventacontenido').hide();
            $('#gananciacontenido').hide(); 
            $('#lista-generalcontenido').hide();  
            $('#zona_ventacontenido').hide();
            $('#transportistacontenido').hide();
            $('#ganadocontenido').hide();
            $('#compradorescontenido').hide();
            $('#proveedorcontenido').hide();
            $('#ganadocontenido').hide();
            $('#pagocontenido').load('view/biatico.php');        
            document.getElementById("pagocontenido").style.display = "block";
            
        });
        $('#ganancia').click(function () {
            $('#principalcontenido').hide();
            $('#lista_ventacontenido').hide();
            $('#pagocontenido').hide(); 
            $('#lista-generalcontenido').hide();  
            $('#zona_ventacontenido').hide();
            $('#transportistacontenido').hide();
            $('#ganadocontenido').hide();
            $('#compradorescontenido').hide();
            $('#proveedorcontenido').hide();
            $('#ganadocontenido').hide();
            $('#gananciacontenido').load('view/ganancias.php');        
            document.getElementById("gananciacontenido").style.display = "block";
            
        });
        $('#lista_venta').click(function () {
            $('#principalcontenido').hide();
            $('#gananciacontenido').hide();
            $('#pagocontenido').hide(); 
            $('#lista-generalcontenido').hide();  
            $('#zona_ventacontenido').hide();
            $('#transportistacontenido').hide();
            $('#ganadocontenido').hide();
            $('#compradorescontenido').hide();
            $('#proveedorcontenido').hide();
            $('#ganadocontenido').hide();
            $('#lista_ventacontenido').load('view/vistageneralventa.php');        
            document.getElementById("lista_ventacontenido").style.display = "block";
            
        });
    });
    


}