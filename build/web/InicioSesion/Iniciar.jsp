<%-- 
    Document   : Iniciar
    Created on : Nov 16, 2020, 9:03:31 PM
    Author     : Andres
--%>

<%@page import="clases.Seguridad" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="clases.MySQL" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String user = "";
    String clave = "";

    if (request.getParameter("user") == null) {
        String e = "Introdusca un usuario o correo";
        response.sendRedirect("index.jsp?msj=" + e + "");
    } else {
        user = request.getParameter("user");
        if (request.getParameter("pass") == null) {
            String e = "Introdusca una clave de acceso";
            response.sendRedirect("index.jsp?msj=" + e + "");
        } else {
            clave = request.getParameter("pass");
        }
    }

    MySQL bd = new MySQL();
    bd.conectar();
    ResultSet rs = null;
    clave = Seguridad.md5(clave);
    String sql = "CALL sp_verifSesion('" + user + "','" + clave + "');";
    try {
        rs = bd.getStmt().executeQuery(sql);
        while (rs.next()) {
            if ((user.equals(rs.getString("idUsuario")) || user.equals(rs.getString("correo"))) && clave.equals(rs.getString("clave"))) {

                if (Integer.parseInt(rs.getString("tipo")) == 1) {
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("client", rs.getString("idUsuario"));
                    response.sendRedirect("Administrador");
                } else if (Integer.parseInt(rs.getString("tipo")) == 2) {
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("client", rs.getString("idUsuario"));
                    response.sendRedirect("Cliente");
                } else {
                    String e = "Error anormal en la logica del proyecto";
                    response.sendRedirect("index.jsp?msj=" + e + "");
                }
            } else {
                String e = "Verifique su usuario o contraseña";
                response.sendRedirect("index.jsp?msj=" + e + "");
            }
        }
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

%>
