<%-- 
    Document   : index
    Created on : Nov 13, 2020, 11:26:43 PM
    Author     : Andres
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="../recursos/CSS/Estilos.css" rel="stylesheet" type="text/css"/>
        <title>Papeleria el miltoner</title>
    </head>
    <body>
        <div class="container col-lg-3">
            <div class="form-group text-center">
                <img src="../recursos/img/user.png" heigth="80" width="80"/>
                <p><strong> <a>Bienvenidos </a></strong></p>
                <%  if (request.getParameter("msj") != null) {
                        out.print("<h3>" + request.getParameter("msj") + "<h3>");
                    }
                %>
            </div>
            <form action="Iniciar.jsp" method="post">
                <div class="form-group">
                    <label>Usuario o e-mail</label>
                    <input class="form-control" type="text" name="user" title="Introdusca usuario" placeholder="Usuario o e-mal" required>
                </div>
                <div class="form-group">
                    <label>
                        Contraseña
                        <a class="label-link"  href="../InicioSesion/RecuperarUsuario/Recuperar.html">
                            ¿Olvido su contraseña?
                        </a>
                    </label>
                    <input class="form-control" type="password" name="pass" title="Introdusca contraseña" placeholder="Contraseña" required>
                </div>
                <div class="form-group text-center">
                    <input class="btn btn-danger "  type="submit" title="Presione para entrar" value="Entrar">
                </div>
                <div>
                    <a class="label-link"  href="../InicioSesion/Usuario/Registro.html">
                        
                            Registrar nuevo usuario
                        </a>
                </div>
            </form>
        </div>
    </body>
</html>
