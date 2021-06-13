<?php
  header("Cache-Control: no-cache, must-revalidate"); // HTTP/1.1
  header("Expires: Sat, 1 Jul 2000 05:00:00 GMT"); // Fecha en el pasado
?>

<!doctype html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <!-- Estilos -->
    <link rel="stylesheet" href="../../resources/css/estilos.css">

    <!-- Fuentes -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css2?family=Manrope&family=Quicksand&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600&display=swap" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@700&display=swap" rel="stylesheet"> 

    <title>Primer Uso | Citiger</title>
  </head>
  <body>
      <!-- Contenedor Principal -->
    <div class="flex-column" id="container2">

        <div class="row mt-3 mb-2">
            <div class="col-12">
                <h1 class="tituloDato text-center">Primer Uso</h1>
            </div>
        </div>

        <div class="row my-4">
            <div class="col-12">
                <h1 class="campoDato text-center px-4">Hemos detectado que no existe ningún usuario 
                    registrado, por favor escriba sus credenciales para crear una cuenta.</h1>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-xl-3 col-md-6 col-sm-12 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                <div class="form-group">
                    <div class="form-group">
                        <label for="" class="tituloCajaTextoFormulario">Nombres:</label>
                        <input type="text" name="#" id="#" class="form-control cajaTextoFormulario widthRegister">
                    </div>
                
                    <div class="form-group">
                        <label for="" class="tituloCajaTextoFormulario">Apellidos:</label>
                        <input type="text" name="#" id="#" class="form-control cajaTextoFormulario widthRegister">
                    </div>
                
                    <div class="form-group">
                        <label for="" class="tituloCajaTextoFormulario">Usuario:</label>
                        <input type="text" name="#" id="#" class="form-control cajaTextoFormulario widthRegister">
                    </div>
                
                    <div class="form-group">
                        <label for="" class="tituloCajaTextoFormulario">Fecha de Nacimiento:</label>
                        <input type="date" name="#" id="#" class="form-control cajaTextoFormulario widthRegister">
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 col-sm-12 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                <div class="form-group">
                    <div class="form-group">
                        <label for="" class="tituloCajaTextoFormulario">Correo:</label>
                        <input type="email" name="#" id="#" class="form-control cajaTextoFormulario widthRegister">
                    </div>
                
                    <div class="form-group">
                        <label for="" class="tituloCajaTextoFormulario">Confirmar Correo:</label>
                        <input type="text" name="#" id="#" class="form-control cajaTextoFormulario widthRegister">
                    </div>
                
                    <div class="form-group">
                        <label for="" class="tituloCajaTextoFormulario">Contraseña:</label>
                        <input type="password" name="#" id="#" class="form-control cajaTextoFormulario widthRegister">
                    </div>

                    <div class="form-group">
                        <label for="" class="tituloCajaTextoFormulario">Confirmar Contraseña:</label>
                        <input type="password" name="#" id="#" class="form-control cajaTextoFormulario widthRegister">
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 col-sm-12 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                <div class="form-group">
                    <div class="form-group">
                        <label for="" class="tituloCajaTextoFormulario">Teléfono:</label>
                        <input type="text" name="#" id="#" class="form-control cajaTextoFormulario widthRegister mb-0">
                    </div>

                    <label for="" class="tituloCajaTextoFormulario">Género:</label>
                    <!-- Combobox, si se desea usar, copiar todo el div que incluye la clase
                    cbCitiger, para cambiarle el tamaño, crear un id en cbCitiger y usar el width
                    deseado en el combobox  -->
                    <div class="cbCitiger widthRegister">
                        <select class="custom-select">
                            <option selected="">Seleccionar...</option>
                        </select> 
                    </div>
                
                    <div class="form-group mt-3">
                        <label for="" class="tituloCajaTextoFormulario">Dirección:</label>
                        <textarea class="form-control cajaTextoFormulario widthRegister heightDireccion" name="#" id=""></textarea>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 col-sm-12 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                <div class="form-group">
                    <!-- Cargar Fotografia -->
                    <div class="d-flex flex-column justify-content-center align-items-center">
                        <div class="bordeDivFotografia">
                            <div class="divFotografia" id="divFoto">
                                <img src="../../resources/img/67641302_948622395468919_4792483860753416192_n.jpg" alt="#" class="fit-images rounded-circle" width="150px">
                            </div>
                        </div>
                        <div id="btnAgregarFoto">
                            <button class="btn btnCargarFoto2 mx-2" id="botonFoto"><span class="fas fa-plus"></span></button>
                        </div>
                        <input id="archivo_usuario" type="file" class="d-none" name="archivo_usuario" accept=".gif, .jpg, .png">
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center my-4">
            <div class="col-12 d-flex justify-content-center">
                <button type="submit" class="btn botonesListado"><span class="fas fa-check mr-3 tamañoIconosBotones"></span>Finalizar</button>
            </div>
        </div>
    </div>
   
    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/08b7535157.js" crossorigin="anonymous"></script>
  </body>
</html> 