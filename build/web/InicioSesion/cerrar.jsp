<%-- 
    Document   : cerrar
    Created on : Nov 17, 2020, 12:14:27 AM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    sesion.removeAttribute("client");
    sesion.removeAttribute("pw");
    sesion.removeAttribute("names");
    sesion.invalidate();
    String m = "Sesion concluida exitosamente";
    response.sendRedirect("index.jsp?msj="+m+"");
%>