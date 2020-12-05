<%-- 
    Document   : registro
    Created on : Nov 17, 2020, 12:34:51 AM
    Author     : Andres
--%>
<%@page import="clases.Seguridad" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="clases.MySQL" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.JavaMail" %>
<%
    JavaMail email = new JavaMail();

    String user = "";
    String mail = "";
    String names = "";
    String surnames = "";
    String pass1 = "";
    String pass2 = "";

    if (request.getParameter("user") == null) {
        String e = "Introdusca un usuario o alias";
        response.sendRedirect("Login/index.jsp?msj=" + e + "");
    } else {
        user = request.getParameter("user");
    }

    if (request.getParameter("e-mail") == null) {
        String e = "Introdusca correo electronico";
        response.sendRedirect("Login/index.jsp?msj=" + e + "");
    } else {
        mail = request.getParameter("e-mail");
    }

    if (request.getParameter("names") == null) {
        String e = "Introdusca su nombre(s)";
        response.sendRedirect("Login/index.jsp?msj=" + e + "");
    } else {
        names = request.getParameter("names");
    }

    if (request.getParameter("surnames") == null) {
        String e = "Introdusca sus apellidos";
        response.sendRedirect("Login/index.jsp?msj=" + e + "");
    } else {
        surnames = request.getParameter("surnames");
    }

    if (request.getParameter("pass1") == null || request.getParameter("pass2") == null) {
        String e = "Introdusca su clave de acceso y confirmela";
        response.sendRedirect("Login/index.jsp?msj=" + e + "");
    } else {
        pass1 = request.getParameter("pass1");
        pass2 = request.getParameter("pass2");
        if (!pass1.equals(pass2)) {
            String e = "Las contraseñas no coinciden";
            response.sendRedirect("Login/index.jsp?msj=" + e + "");
        }
    }

    MySQL bd = new MySQL();
    bd.conectar();
    ResultSet rs = null;
    String sql1 = "CALL sp_verifUsuario('" + user + "','" + mail + "');";
    try {
        rs = bd.getStmt().executeQuery(sql1);
        if (!rs.next()) {
            String m = "Se envio un e-mail al correo que nos proporciono";
            String cuerpo = "<h2>Bienvenido a la papeleria de miltoner</h2>";
            cuerpo += "<p>A continuacion se te muestra la informacion de tu cuenta</p>";
            cuerpo += "<p>Usuario: " + user + "</p>";
            cuerpo += "<p>Correo: " + mail + "</p>";
            cuerpo += "<p>Nombre: " + names + " " + surnames + "</p>";
            cuerpo += "<p>Contraseña: " + pass1 + "</p>";
            email.enviarMail(mail, "Usuario nuevo", cuerpo);
            String sql2 = "CALL sp_newUsuario('" + user + "','" + mail + "','" + names + "','" + surnames + "','" + Seguridad.md5(pass1) + "');";
            bd.abc(sql2);
            bd.cerrar();
            response.sendRedirect("Login/index.jsp?msj=" + m + "");
        } else {
            String e = "El " + user + " ya existe, si no recuerda su contraseña solicitela";
            response.sendRedirect("Login/index.jsp?msj=" + e + "");
        }

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
%>
