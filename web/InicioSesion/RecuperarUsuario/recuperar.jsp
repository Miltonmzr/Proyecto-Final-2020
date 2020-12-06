<%-- 
    Document   : recuperar
    Created on : Nov 17, 2020, 4:37:46 PM
    Author     : Andres
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="clases.JavaMail"%>
<%@page import="clases.Herramientas"%>
<%@page import="clases.Seguridad"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.MySQL"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%

    JavaMail email = new JavaMail();

    String mail = request.getParameter("mail");
    String pass = Seguridad.md5(Herramientas.random(6));

    MySQL bd = new MySQL();
    bd.conectar();
    ResultSet rs = null;
    String sql = "CALL sp_newPass('" + mail + "','" + Seguridad.md5(pass) + "');";
    rs = bd.getStmt().executeQuery(sql);
    
        String m = "Se envio un e-mail al correo que nos proporciono con una nueva contraseña";
        String cuerpo = "<h2>Se genero una clave de acceso nueva</h2>";
        cuerpo += "<p>Su contraseña nueva es: " + pass + "</p>";
        cuerpo += "<p>Haga click <a href='http://env-7014554.es-1.axarnet.cloud/R/'>aqui</a> para ingresar a su cuenta para personaliza su contraseña. </p>";
        email.enviarMail(mail, "Nueva clava", cuerpo);
        response.sendRedirect("../index.jsp?msj=" + m + "");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar Contraseña</title>
    </head>
    <body>
        esta madre no jala
    </body>
</html>
