<%-- 
    Document   : fail
    Created on : Nov 17, 2020, 6:01:38 PM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String token = "";
    if (request.getParameter("token") == null) {
        String e = "Comuniquese con un administrador";
        response.sendRedirect("index.jsp?msj=" + e + "");
    }else{
        
    }
    

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
