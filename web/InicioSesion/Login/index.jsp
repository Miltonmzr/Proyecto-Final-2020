<!DOCTYPE html>
<html lang="en" >
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Login-Singin</title>
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'><link rel="stylesheet" href="./style.css">
  <title>Inicio de sesion</title>
</head>
<body>
<!-- login -->
<div class="cont">
  <div class="form sign-in">
    <h2>Bienvenido de nuevo!</h2>
    <center>
    <%  if (request.getParameter("msj") != null) {
                        out.print("<h3>" + request.getParameter("msj") + "<h3>");
                    }
                %>
    </center>            
    <form action="../Iniciar.jsp" method="post">
    <label>
      <span>Correo o usuario</span>
      <input class="form-control" type="text" name="user" title="Introdusca usuario" placeholder="" required>
    </label>
    <label>
      <span>Contraseña</span>
      <input class="form-control" type="password" name="pass" title="Introdusca contraseña" placeholder="" required>
    </label>
    <p class="forgot-pass">Olvidaste tu contraeña?</p>
    <button type="submit" class="submit" value="Entrar">Log in</button>
    <button type="button" class="fb-btn">Connect with <span>facebook</span></button><br>
    <button type="button" class="go-btn">Connect with <span>Google</span></button>
    </form>
  </div>
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2>Aun no te has registrado?</h2>
        <p>Ingresa Ahora!</p>
      </div>
      <div class="img__text m--in">
        <h2>Ya estas registrado?</h2>
        <p>Solo logeate es mas facil!</p>
      </div>
      <div class="img__btn">
        <span class="m--up">Sing in</span>
        <span class="m--in">Log in</span>
      </div>
    </div>
      <!-- login end-->
      <!-- Sing in -->
    <div class="form sign-up">
        <center><h3>Registrate Facil!</h3></center>
        <form action="../Usuario/registro.jsp" method="post">
      <label>
        <span>Usuario</span>
        <input class="form-control" type="text" name="user" title="Introdusca usuario" placeholder="" required>
      </label>
      <label>
        <span>Nombre</span>
        <input class="form-control" type="text" name="names" title="Introdusca nombre" placeholder="" required>
      </label>
      <label>
        <span>Apellido</span>
        <input class="form-control" type="text" name="surnames" title="Introdusca apellido" placeholder="" required>
      </label>
      <label>
        <span>Correo</span>
        <input class="form-control" type="email" name="e-mail" title="Introdusca email" placeholder="" required>
      </label>
      <label>
        <span>Contraseña</span>
        <input class="form-control" type="password" name="pass1" title="Introdusca usuario" placeholder="" required>
      </label>
      <label>
        <span>Confirme contraseña</span>
        <input class="form-control" type="password" name="pass2" title="Confirme contraseña" placeholder="" required>
      </label>
      <button type="submit" class="submit">Sign Up</button>
      <button type="button" class="fb-btn">Unirse con <span>facebook</span></button>
      <br>
      <button type="button" class="go-btn">Unirse con <span>Google</span></button>
        </form>
  </div>
    </div>
  </div>
<!-- Singin end -->

<!-- partial -->
  <script  src="./script.js"></script>

</body>
</html>
