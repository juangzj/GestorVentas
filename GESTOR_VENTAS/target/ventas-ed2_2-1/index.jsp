<%@include file="libs/header.jsp" %>
<!-- Contenedor para el formulario -->
<div class="d-flex justify-content-center align-items-center min-vh-100 bg-light">
    <div class="card p-4 shadow" style="width: 500px; border-radius: 10px;">
        <!-- Navegación de pestañas -->
        <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="tab-iniciar-sesion" data-mdb-toggle="pill" data-mdb-target="#pills-iniciar-sesion" role="tab" aria-controls="pills-iniciar-sesion" aria-selected="true">Iniciar sesión</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="tab-registrarse" data-mdb-toggle="pill" data-mdb-target="#pills-registrarse" role="tab" aria-controls="pills-registrarse" aria-selected="false">Registrarse</a>
            </li>
        </ul>
        <!-- Navegación de pestañas -->

        <!-- Contenido de pestañas -->
        <div class="tab-content">
            <div class="tab-pane fade show active" id="pills-iniciar-sesion" role="tabpanel" aria-labelledby="tab-iniciar-sesion">
                <form action="SvSesion" method="POST"> 
                    <div class="text-center mb-3">
                        <p class="fw-bold">Inicia sesión con:</p>
                        <div>
                            <button type="button" class="btn btn-link btn-floating mx-1 text-primary" aria-label="Iniciar sesión con Facebook">
                                <i class="fab fa-facebook-f"></i>
                            </button>
                            <button type="button" class="btn btn-link btn-floating mx-1 text-danger" aria-label="Iniciar sesión con Google">
                                <i class="fab fa-google"></i>
                            </button>
                            <button type="button" class="btn btn-link btn-floating mx-1 text-info" aria-label="Iniciar sesión con Twitter">
                                <i class="fab fa-twitter"></i>
                            </button>
                            <button type="button" class="btn btn-link btn-floating mx-1" aria-label="Iniciar sesión con GitHub">
                                <i class="fab fa-github"></i>
                            </button>
                        </div>
                    </div>

                    <p class="text-center">o:</p>

                    <!-- Entrada de correo electrónico -->
                    <div class="form-outline mb-4">
                        <input type="email" name="correoIngresar" class="form-control" required />
                        <label class="form-label" for="nombreIniciarSesion">Correo electrónico</label>
                    </div>

                    <!-- Entrada de contraseña -->
                    <div class="form-outline mb-4">
                        <input type="password" name="contraseniaIngresar" class="form-control" required />
                        <label class="form-label" for="contraseñaIniciarSesion">Contraseña</label>
                    </div>

                    <!-- Botón de enviar -->
                    <button type="submit" class="btn btn-primary btn-block mb-4">Iniciar sesión</button>

                </form>
            </div>

            <div class="tab-pane fade" id="pills-registrarse" role="tabpanel" aria-labelledby="tab-registrarse">
                <form action="registrarUsuario" method="POST">
                    <div class="text-center mb-3">
                        <p class="fw-bold">Regístrate con:</p>
                        <div>
                            <button type="button" class="btn btn-link btn-floating mx-1 text-primary" aria-label="Registrarse con Facebook">
                                <i class="fab fa-facebook-f"></i>
                            </button>
                            <button type="button" class="btn btn-link btn-floating mx-1 text-danger" aria-label="Registrarse con Google">
                                <i class="fab fa-google"></i>
                            </button>
                            <button type="button" class="btn btn-link btn-floating mx-1 text-info" aria-label="Registrarse con Twitter">
                                <i class="fab fa-twitter"></i>
                            </button>
                            <button type="button" class="btn btn-link btn-floating mx-1" aria-label="Registrarse con GitHub">
                                <i class="fab fa-github"></i>
                            </button>
                        </div>
                    </div>

                    <p class="text-center">o:</p>

                    <!-- Entrada de nombre -->
                    <div class="form-outline mb-4">
                        <input type="text" id="nombre" name="nombreRegistrar" class="form-control" required />
                        <label class="form-label" for="nombreRegistrarse">Nombre</label>
                    </div>

                    <!-- Entrada de correo electrónico -->
                    <div class="form-outline mb-4">
                        <input type="email" id="email" name="emailRegistrar" class="form-control" required />
                        <label class="form-label" for="correoRegistrarse">Correo electrónico</label>
                    </div>

                    <!-- Entrada de contraseña -->
                    <div class="form-outline mb-4">
                        <input type="password" id="contrasenia" name="contraseniaRegistrar" class="form-control" required />
                        <label class="form-label" for="contraseñaRegistrarse">Contraseña</label>
                    </div>

                    <!-- Botón de enviar -->
                    <button type="submit" class="btn btn-primary btn-block mb-3">Registrarse</button>
                </form>
            </div>
        </div>
        <!-- Contenido de pestañas -->
    </div>
</div>

<%@include file="libs/foother.jsp" %>