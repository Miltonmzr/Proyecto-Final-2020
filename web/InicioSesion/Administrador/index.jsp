<%-- 
    Document   : index
    Created on : Nov 16, 2020, 11:29:06 PM
    Author     : Andres
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="clases.Herramientas"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.MySQL"%>
<%@page import="clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("client") == null) {
        String e = "Identifiquese por favor.";
        response.sendRedirect("../index.jsp?msj=" + e + "");
    }

    String id = (String) sesion.getAttribute("client");
    Usuario administrador = new Usuario();

    MySQL bd = new MySQL();
    bd.conectar();
    ResultSet rs = null;
    try {
        String sql = "CALL sp_getUsuario('" + id + "');";
        rs = bd.getStmt().executeQuery(sql);
        while (rs.next()) {
            administrador.setIdUsuario(rs.getString("idUsuario"));
            administrador.setCorreo(rs.getString("correo"));
            administrador.setNombres(rs.getString("nombres"));
            administrador.setApellidos(rs.getString("apellidos"));
            administrador.setClave(rs.getString("clave"));
            administrador.setTipo(Integer.parseInt(rs.getString("tipo")));
            administrador.setAlta(rs.getDate("alta"));
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
    if (administrador.getTipo() != 1) {
        String e = "Identifiquese como administrador";
        response.sendRedirect("../index.jsp?msj=" + e + "");
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="../Administrador/CSS/Inicio.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
    </head>
    <body>
        <div class="container">
            <h1>Bienvenido <i><%=administrador.getNombres() + " " + administrador.getApellidos()%></i></h1>
            <h4>Usuario desde : <%=Herramientas.formatFecha(administrador.getAlta())%> </h4>
        </div>

        <div class="navbar-wrapper">
            <div class="container">
                <div class="navbar navbar-inverse navbar-static-top" role="navigation">
                    <div class="container">
                        <div class="navbar-header">

                            <a href="#">Papeleria</a>
                            <a href="#about">Colaboladores</a>
                            <a href="../cerrar.jsp">Cerrar sesion</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%
            bd.conectar();
            rs = null;
            LinkedList<Usuario> usuarios = new LinkedList<Usuario>();
            try {
                String sql = "CALL sp_getUsuarios(2);";
                rs = bd.getStmt().executeQuery(sql);
                while (rs.next()) {
                    Usuario usuario = new Usuario();
                    usuario.setIdUsuario(rs.getString("idUsuario"));
                    usuario.setCorreo(rs.getString("correo"));
                    usuario.setNombres(rs.getString("nombres"));
                    usuario.setApellidos(rs.getString("apellidos"));
                    usuario.setClave(rs.getString("clave"));
                    usuario.setTipo(Integer.parseInt(rs.getString("tipo")));
                    usuario.setAlta(rs.getDate("alta"));
                    usuarios.add(usuario);
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
        %>

        <div class="container marqueting">
            <%
                if (usuarios.size() < 1) {
                    out.println("<h3>No hay usuarios en la base de datos</h3>");
                } else {
                    int contador = 0;
                    for (int i = 0; i < usuarios.size(); i++) {
                        if (contador == 0) {
                            out.println("<div class='row'>");
                        }
                        out.println("<div class='col-lg-4'>");
                        out.println("<h2>" + usuarios.get(i).getNombres() + " " + usuarios.get(i).getApellidos() + "</h2>");
                        out.println("<ul>");
                        out.println("<li>Correo electronico: " + usuarios.get(i).getCorreo() + "</li>");
                        out.println("<li>Usuario desde: " + Herramientas.formatFecha(usuarios.get(i).getAlta()) + "</li>");
                        out.println("</ul>");
                        out.println("<p><a class='btn btn-default' href='eliminar.jsp?id=" + usuarios.get(i).getIdUsuario() + "'role ='button'>Borrar usuario</a></p>");
                        out.println("</div>");
                        if (contador == 3 || (usuarios.size() == (i + 1) && contador < 3)) {
                            out.println("</div>");
                            contador = 0;
                        }
                        contador++;
                    }
                }
            %>
            <footer>
                <p>&COPY; 2020 Centro Universitario de Tonala &middot; <a href="https://www.facebook.com/D105n03x1573/">Facebook</a></p>
            </footer>
        </div>
    </body>
</html>
