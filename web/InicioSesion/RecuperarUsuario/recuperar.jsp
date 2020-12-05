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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String user = "";
    if (request.getParameter("user") == null) {
        String e = "Introdusca un usuario o e-mail";
        response.sendRedirect("../Login/index.jsp?msj=" + e + "");
    } else {

        MySQL bd = new MySQL();
        bd.conectar();
        ResultSet rs = null;
        try {
            String sql = "CALL sp_getUsuario('" + user + "');";
            rs = bd.getStmt().executeQuery(sql);
            if (rs.next()) {
                //String token = Seguridad.md5(Herramientas.random(6));
                String m = "Se envio un e-mail al correo que nos proporciono";
                String cuerpo = "<h2>Recuperar clave de acceso</h2>";
                //cuerpo += "<p>Si usted no solicito el cambio de contraseña de click <a href='Token/fail.jsp?token=" + token + "'>Aqui </a></p>";
                //cuerpo += "<p>Para restaurar su cuenta de click <a href='Token/recovery.jsp?token=" + token + "&id=" + user + "'>Aqui </a></p>";
                JavaMail.enviarMail(rs.getString("correo"), "Recuperar clave", cuerpo);
                response.sendRedirect("../Login/index.jsp?msj=" + m + "");
            } else {
                String e = "El usuario o correo no se encuentran registrados";
                response.sendRedirect("../Login/index.jsp?msj=" + e + "");
            }
            rs.close();
            bd.cerrar();
        } catch (SQLException e) {
            System.out.println("Exception SQL : ");
            System.out.println("Mensaje : " + e.getMessage());
            System.out.println("SQLState : " + e.getSQLState());
            System.out.println("Codigo Proveedor : " + e.getErrorCode());
            e.printStackTrace();
        } catch (Exception ex) {
            System.out.println("Se ha lanzado una Exception no SQL : ");
            ex.printStackTrace();
        }
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar Contraseña</title>
    </head>
    <body>

    </body>
</html>
