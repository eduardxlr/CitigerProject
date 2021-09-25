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
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css">

    <!-- Estilos -->
    <link rel="stylesheet" href="../../resources/css/citigerstyles.css">
    <link rel="stylesheet" href="../../resources/css/all.min.css">
    <link rel="stylesheet" href="../../resources/css/fontawesome.min.css">
    <link rel="stylesheet" href="../../resources/css/animate.min.css">

    <!-- Fuentes -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200;300;400;500;600;700;800&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Manrope&family=Quicksand&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@700&display=swap" rel="stylesheet">
    <link rel="icon" type="image/png" href="../../resources/img/iconocitiger.png" />


    <title>Iniciar Sesión | Citiger</title>
</head>

<body>
    <input type="text" id="txtModo" class="d-none" text="">
    <!-- Contenedor Principal -->
    <div id="containerr">
        <div id="contenedor">
            <div class="row justify-content-center">
                <!-- Imagen -->
                <div class="col-6 col-md-6 col-sm-12 col-xs-12 mt-5 pt-4" id="imagenInicio">
                    <img id="imagenPrincipal" src="../../resources/img/Interaction Design-pana.png"
                        class="img-fluid animate__animated animate__bounceIn animate__slow">
                </div>
                <!-- Contenido -->
                <div class="d-flex justify-content-center align-items-center col-xl-6 col-md-12 col-sm-12 col-xs-12">
                    <form method="post" id="login-form" autocomplete="off">
                        <input type="number" name="txtId" id="txtId" class="d-none">
                        <input type="number" name="txtBitacora" id="txtBitacora" class="d-none">
                        <div class="row my-2">
                            <div class="col-12">
                                <img id="CitigerLogo" src="../../resources/img/CitigerWhiteLogo.png" alt=""
                                    class="img-fluid animate__animated animate__bounceIn animate__slow">
                                <h1 class="titulo mt-2 animate__animated animate__bounceIn animate__slow">Iniciar Sesión
                                </h1>
                            </div>
                        </div>
                        <!-- Input Correo -->
                        <div class="form-group mb-4 animate__animated animate__bounceIn animate__slow">
                            <h1 class="tituloCajasLogin">Correo Electrónico:</h1>
                            <input type="email" class="form-control cajaTextoLogin" id="txtCorreo" name="txtCorreo"
                                aria-describedby="emailHelp" onChange="checkCorreo('txtCorreo')"
                                placeholder="Ingrese su correo electrónico..." Required>
                        </div>
                        <!-- Input Contraseña -->
                        <div class="form-group mb-1 animate__animated animate__bounceIn animate__slow">
                            <h1 class="tituloCajasLogin">Contraseña:</h1>
                            <input type="password" class="form-control cajaTextoLogin  mb-1" id="txtContrasenia"
                                name="txtContrasenia" onChange="checkInput('txtContrasenia')"
                                placeholder="Ingrese su contraseña..." Required>

                            <input id="mostrarContraseña" type="checkbox" class="checkboxCitiger"
                                onChange="showHidePassword('mostrarContraseña', 'txtContrasenia')">
                            <label class="checkboxLabel checkboxCitiger mt-2" for="mostrarContraseña"> Mostrar
                                Contraseña</label>
                        </div>
                        <!-- Botones -->
                        <div class="row justify-content-center animate__animated animate__bounceIn animate__slow">
                            <div class="col-12 d-flex justify-content-center align-items-center">
                                <button class="btn botonLogin my-3" type="submit">Iniciar Sesión →</button>
                            </div>
                        </div>
                        <div class="row">
                            <div
                                class="col-12 d-flex justify-content-center align-items-center animate__animated animate__bounceIn animate__slow">
                                <h1 class="texto"> ¿Sucede algo? </h1>
                            </div>
                        </div>
                        <div class="row justify-content-center animate__animated animate__bounceIn animate__slow">
                            <div class="col-12 d-flex justify-content-center align-items-center">
                                <button type="button" data-toggle="modal" data-target="#recuperarContraseña"
                                    class="btn botonLogin2 my-2">Olvidé mi contraseña →</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="obligatorioContrasena" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content justify-content-center px-3 py-2">
                <!-- Cabecera del Modal -->
                <div class="modal-header">
                    <!-- Titulo -->
                    <h5 class="modal-title tituloModal" id="exampleModalLabel"><span
                            class="fas fa-info-circle mr-4 iconoModal"></span>Actualizar Contraseña por seguridad</h5>
                    <!-- Boton para Cerrar -->
                    <button type="button" class="close closeModalButton lead" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <br>
                <!-- Contenido del Modal -->
                <div class="textoModal px-3 pb-4 mt-2">
                    <div class="row">
                        <div class="col-12">
                            <div class="alert yellowAlert alert-dismissible fade show" role="alert">
                                <strong>Importante.</strong> Tu contraseña debe de cumplir con los siguientes
                                requisitos: <br>
                                <br>
                                - Mínimo 8 caracteres <br>
                                - Máximo 15 <br>
                                - Al menos una letra mayúscula <br>
                                - Al menos una letra minúscula <br>
                                - Al menos un dígito <br>
                                - No espacios en blanco <br>
                                - Al menos 1 carácter especial
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <form method="post" id="90password-form">
                        <input type="number" name="txtBitacoraPassword" id="txtBitacoraPassword" class="d-none">
                        <div class="row">
                            <div
                                class="col-xl-6 col-md-6 col-sm-12 col-xs-12 d-flex flex-column justify-content-center align-items-center">
                                <div class="form-group">
                                    <label class="tituloCajaTextoFormulario" for="txtNuevaContrasena1">Nueva
                                        Contraseña:</label>
                                    <input autocomplete="off" onChange="checkContrasena('txtNuevaContrasena1')"
                                        type="password" class="form-control cajaTextoModal2" id="txtNuevaContrasena1"
                                        name="txtNuevaContrasena1" placeholder="">
                                </div>
                            </div>
                            <div
                                class="col-xl-6 col-md-6 col-sm-12 col-xs-12 d-flex flex-column justify-content-center align-items-center">
                                <div class="form-group">
                                    <label class="tituloCajaTextoFormulario" for="txtConfirmarContrasena">Confirmar
                                        Contraseña:</label>
                                    <input autocomplete="off" onChange="checkContrasena('txtConfirmarContrasena1')"
                                        type="password" class="form-control cajaTextoModal2"
                                        id="txtConfirmarContrasena1" name="txtConfirmarContrasena1" placeholder="">
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-12 d-flex flex-column justify-content-center align-items-center">
                                <div class="form-group w-xl-50 w-md-50">
                                    <label class="tituloCajaTextoFormulario" for="txtContrasenaActual1">Contraseña
                                        Actual:</label>
                                    <input autocomplete="off" onChange="checkContrasena('txtContrasenaActual1')"
                                        type="password" class="form-control cajaTextoModal2" id="txtContrasenaActual1"
                                        name="txtContrasenaActual1" placeholder="">
                                </div>
                            </div>
                        </div>

                        <div class="row justify-content-center">
                            <div class="col-12 d-flex justify-content-center align-items-center">
                                <div class="custom-control custom-switch">
                                    <input
                                        onchange="showHidePassword3('cbMostrarContraseña1', 'txtContrasenaActual1', 'txtNuevaContrasena1', 'txtConfirmarContrasena1')"
                                        type="checkbox" class="p-0 custom-control-input" id="cbMostrarContraseña1">
                                    <label class="p-0 custom-control-label" for="cbMostrarContraseña1">Mostrar
                                        Contraseña</label>
                                </div>
                            </div>
                        </div>

                        <!-- Botones de Acción del Formulario -->
                        <div class="row justify-content-center mt-4">
                            <div class="col-12 d-flex justify-content-center align-items-center text-center">
                                <button id="btnActualizarContrasenaObligatorio" type="submit" name="btnActualizar"
                                    href="#" class="btn btnAgregarFormulario mr-2"><span
                                        class="fas fa-check mr-3 tamañoIconosBotones"></span>Cambiar Contraseña</button>
                            </div>
                        </div>
                    </form>
                    <!-- Fin del Contenido del Modal -->
                </div>
            </div>
        </div>
    </div>
    <!-- Fin del Modal -->

    <!-- Modal para verificar el codigo de verificación en la doble autenticación -->
    <div class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" id="verificarCodigoAuth"
        tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content justify-content-center px-3 py-2">
                <!-- Cabecera del Modal -->
                <div class="modal-header">
                    <!-- Titulo -->
                    <h5 class="modal-title tituloModal"><span class="fas fa-info-circle mr-4 iconoModal"></span>Código
                        de Verificación</h5>

                </div>

                <!-- Contenido del Modal -->
                <div class="modal-body textoModal px-3 pb-4 mt-2">
                    <div class="row">
                        <div class="col-xl-6 col-md-12 col-sm-12 col-xs-12">
                            <img src="../../resources/img/undraw_Newsletter_re_wrob.png" class="img-fluid">
                        </div>
                        <div
                            class="col-xl-6 col-md-12 col-sm-12 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                            <form autocomplete="off" action="/form" method="post" id="checkCodeAuth-form">
                                <div class="d-flex justify-content-center align-items-center mb-2">
                                    <div class="alert w-75 yellowAlert alert-dismissible fade show" role="alert">
                                        <strong>Factor de Autenticación en dos pasos.</strong> Ingresa el código de
                                        verificación enviado a tu
                                        correo.<br>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center align-items-center mb-2">
                                    <!-- Input Correo -->
                                    <div class="form-group mb-4" style="width: 300px;">
                                        <h1 class="tituloCajasLogin">Código de Verificación:</h1>
                                        <div class="d-flex justify-content-center align-items-center">
                                            <input type="text" id="1a" name="1a"
                                                onKeyup="autotab(this, document.getElementById('2a'),document.getElementById('1a'))"
                                                onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                Required maxlength="1" class="form-control cajaCodigo" Required>
                                            <input type="text" id="2a" name="2a"
                                                onKeyup="autotab(this, document.getElementById('3a'),document.getElementById('1a'))"
                                                onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                Required maxlength="1" class="form-control cajaCodigo" Required>
                                            <input type="text" id="3a" name="3a"
                                                onKeyup="autotab(this, document.getElementById('4a'),document.getElementById('2a'))"
                                                onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                Required maxlength="1" class="form-control cajaCodigo" Required>
                                            <input type="text" id="4a" name="4a"
                                                onKeyup="autotab(this, document.getElementById('5a'),document.getElementById('3a'))"
                                                onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                Required maxlength="1" class="form-control cajaCodigo" Required>
                                            <input type="text" id="5a" name="5a"
                                                onKeyup="autotab(this, document.getElementById('6a'),document.getElementById('4a'))"
                                                onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                Required maxlength="1" class="form-control cajaCodigo" Required>
                                            <input type="text" id="6a" name="6a"
                                                onKeyup="autotab(this, document.getElementById('6a'),document.getElementById('5a'))"
                                                onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                Required maxlength="1" class="form-control cajaCodigo" Required>
                                            <input type="number" class="d-none" id="codigoAuth" name="codigoAuth">
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center align-items-center">
                                    <button type="submit" href="#" class="btn btnAgregarFormulario mr-2"><span
                                            class="fas fa-check mr-3 tamañoIconosBotones"></span>Verificar
                                        Código</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Fin del Contenido del Modal -->
                </div>
            </div>
        </div>
    </div>
    <!-- Fin del Modal -->

    <!-- Modal para recuperar la contraseña -->
    <div class="modal fade" id="recuperarContraseña" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content justify-content-center px-3 py-2">
                <!-- Cabecera del Modal -->
                <div class="modal-header">
                    <!-- Titulo -->
                    <h5 class="modal-title tituloModal" id="exampleModalLabel"><span
                            class="fas fa-info-circle mr-4 iconoModal"></span>Recuperar Contraseña</h5>
                    <!-- Boton para Cerrar -->
                    <button type="button" class="close closeModalButton lead" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <!-- Contenido del Modal -->
                <div class="modal-body textoModal px-3 pb-4 mt-2">
                    <div class="row">
                        <div class="col-xl-6 col-md-12 col-sm-12 col-xs-12">
                            <img src="../../resources/img/undraw_my_password_d6kg.png" class="img-fluid">
                        </div>
                        <div
                            class="col-xl-6 col-md-12 col-sm-12 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                            <form autocomplete="off" action="/form" id="checkMail-form">
                                <div class="d-flex justify-content-center align-items-center mb-2">
                                    <div class="alert w-75 yellowAlert alert-dismissible fade show" role="alert">
                                        <strong>Importante.</strong> Ingresa tu correo electrónico para poder recuperar
                                        tu contraseña. <br>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center align-items-center mb-2">
                                    <!-- Input Correo -->
                                    <div class="form-group mb-4" style="width: 300px;">
                                        <h1 class="tituloCajasLogin">Correo Electrónico:</h1>
                                        <input type="email" autocomplete="off" class="form-control cajaTextoLogin"
                                            id="txtCorreoRecu" name="txtCorreoRecu" aria-describedby="emailHelp"
                                            onChange="checkCorreo('txtCorreoRecu')"
                                            placeholder="Ingrese su correo electrónico..." Required>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center align-items-center">
                                    <button type="submit" id="btnVerificar" name="btnVerificar"
                                        class="btn btnAgregarFormulario mr-2"><span
                                            class="fas fa-check mr-3 tamañoIconosBotones"></span>Verificar
                                        Correo</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Fin del Contenido del Modal -->
                </div>
            </div>
        </div>
    </div>
    <!-- Fin del Modal -->

    <!-- Modal para verificar el codigo de verificación en la recuperación de contraseña -->
    <div class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" id="verificarCodigoRecuperacion"
        tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content justify-content-center px-3 py-2">
                <!-- Cabecera del Modal -->
                <div class="modal-header">
                    <!-- Titulo -->
                    <h5 class="modal-title tituloModal"><span class="fas fa-info-circle mr-4 iconoModal"></span>Código
                        de Verificación</h5>

                </div>

                <!-- Contenido del Modal -->
                <div class="modal-body textoModal px-3 pb-4 mt-2">
                    <div class="row">
                        <div class="col-xl-6 col-md-12 col-sm-12 col-xs-12">
                            <img src="../../resources/img/undraw_Envelope_re_f5j4.png" class="img-fluid">
                        </div>
                        <div
                            class="col-xl-6 col-md-12 col-sm-12 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                            <form autocomplete="off" action="/form" id="checkCode-form">
                                <div class="d-flex justify-content-center align-items-center mb-2">
                                    <div class="alert w-75 yellowAlert alert-dismissible fade show" role="alert">
                                        <strong>Importante.</strong> Ingresa el código de verificación enviado a tu
                                        correo.<br>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center align-items-center mb-2">
                                    <!-- Input Correo -->
                                    <div class="form-group mb-4" style="width: 300px;">
                                        <h1 class="tituloCajasLogin">Código de Verificación:</h1>
                                        <div class="d-flex justify-content-center align-items-center">
                                            <input type="text" id="1" name="1"
                                                onKeyup="autotab(this, document.getElementById('2'),document.getElementById('1'))"
                                                onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                Required maxlength="1" class="form-control cajaCodigo" Required>
                                            <input type="text" id="2" name="2"
                                                onKeyup="autotab(this, document.getElementById('3'),document.getElementById('1'))"
                                                onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                Required maxlength="1" class="form-control cajaCodigo" Required>
                                            <input type="text" id="3" name="3"
                                                onKeyup="autotab(this, document.getElementById('4'),document.getElementById('2'))"
                                                onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                Required maxlength="1" class="form-control cajaCodigo" Required>
                                            <input type="text" id="4" name="4"
                                                onKeyup="autotab(this, document.getElementById('5'),document.getElementById('3'))"
                                                onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                Required maxlength="1" class="form-control cajaCodigo" Required>
                                            <input type="text" id="5" name="5"
                                                onKeyup="autotab(this, document.getElementById('6'),document.getElementById('4'))"
                                                onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                Required maxlength="1" class="form-control cajaCodigo" Required>
                                            <input type="text" id="6" name="6"
                                                onKeyup="autotab(this, document.getElementById('6'),document.getElementById('5'))"
                                                onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"
                                                Required maxlength="1" class="form-control cajaCodigo" Required>
                                            <input type="text" class="d-none" id="codigo" name="codigo">
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center align-items-center">
                                    <button type="submit" href="#" class="btn btnAgregarFormulario mr-2"><span
                                            class="fas fa-check mr-3 tamañoIconosBotones"></span>Verificar
                                        Código</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Fin del Contenido del Modal -->
                </div>
            </div>
        </div>
    </div>
    <!-- Fin del Modal -->

    <!-- Modal para cambiar la contraseña despues de haber verificado el código-->
    <div class="modal fade" data-backdrop="static" data-keyboard="false" id="cambiarContraseña" tabindex="-1"
        aria-labelledby="labelCambiarContraseña" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
            <div class="modal-content justify-content-center px-3 py-2">
                <!-- Cabecera del Modal -->
                <div class="modal-header">
                    <!-- Titulo -->
                    <h5 class="modal-title tituloModal" id="labelCambiarContraseña"><span
                            class="fas fa-info-circle mr-4 iconoModal"></span>Cambiar Contraseña</h5>
                </div>
                <!-- Contenido del Modal -->
                <div class="modal-body textoModal px-3 pb-4 mt-2">
                    <div class="row">
                        <div class="col-xl-6 col-md-12 col-sm-12 col-xs-12">
                            <img src="../../resources/img/undraw_Forgot_password_re_hxwm.png" class="img-fluid">
                        </div>
                        <div
                            class="col-xl-6 col-md-12 col-sm-12 col-xs-12 d-flex justify-content-center align-items-center flex-column">
                            <form autocomplete="off" action="/form" id="update-form">
                                <div class="d-flex justify-content-center align-items-center mb-2">
                                    <div class="alert w-75 yellowAlert alert-dismissible fade show" role="alert">
                                        <strong>Importante.</strong> Tu contraseña debe de cumplir con los siguientes
                                        requisitos: <br>
                                        <br>
                                        - Mínimo 8 caracteres <br>
                                        - Máximo 15 <br>
                                        - Al menos una letra mayúscula <br>
                                        - Al menos una letra minúscula <br>
                                        - Al menos un dígito <br>
                                        - No espacios en blanco <br>
                                        - Al menos 1 carácter especial
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center align-items-center mb-2">
                                    <!-- Input Contraseña -->
                                    <div class="form-group mx-2">
                                        <h1 class="tituloCajasLogin">Nueva Contraseña:</h1>
                                        <input type="password" class="form-control cajaTextoLogin  mb-1"
                                            id="txtContrasenia1" name="txtContrasenia1"
                                            onChange="checkInput('txtContrasenia')"
                                            placeholder="Ingrese su contraseña..." Required>
                                    </div>
                                    <!-- Input Contraseña -->
                                    <div class="form-group mx-2">
                                        <h1 class="tituloCajasLogin">Confirmar Contraseña:</h1>
                                        <input type="password" class="form-control cajaTextoLogin  mb-1"
                                            id="txtContrasenia2" name="txtContrasenia2"
                                            onChange="checkInput('txtContrasenia')"
                                            placeholder="Ingrese su contraseña..." Required>
                                    </div>
                                </div>
                                <div class="mb-4 d-flex justify-content-center align-items-center">
                                    <div class="custom-control custom-switch">
                                        <input
                                            onchange="showHidePassword2('cbMostrarContraseña', 'txtContrasenia1', 'txtContrasenia2')"
                                            type="checkbox" class="p-0 custom-control-input" id="cbMostrarContraseña">
                                        <label class="p-0 custom-control-label" for="cbMostrarContraseña">Mostrar
                                            Contraseña</label>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center align-items-center">
                                    <button id="btnUpdate" type="submit" name="btnUpdate" href="#"
                                        class="btn btnAgregarFormulario mr-2"><span
                                            class="fas fa-check mr-3 tamañoIconosBotones"></span>Cambiar
                                        Contraseña</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Fin del Contenido del Modal -->
                </div>
            </div>
        </div>
    </div>

    <!-- JS -->
    <script src="../../resources/js/jquery-3.5.1.slim.min.js"></script>
    <script src="../../resources/js/popper.min.js"></script>
    <script src="../../resources/js/bootstrap.min.js"></script>
    <script src="../../resources/js/datatables.min.js"></script>
    <script src="../../resources/js/sweetalert.min.js"></script>
    <script src="../../resources/js/chart.min.js"></script>
    <script src="../../app/helpers/components.js"></script>
    <script type="text/javascript" src="../../app/controllers/caseta/index.js"></script>
    <script>
        document.getElementById('txtModo').value = 'light'
    </script>
</body>

</html>