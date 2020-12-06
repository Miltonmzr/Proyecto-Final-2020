<%-- 
    Document   : index
    Created on : Dec 6, 2020, 4:07:11 AM
    Author     : Andres
--%>

<%@page import="clases.JavaMail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    JavaMail mail = new JavaMail();
    
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String txtarea = request.getParameter("txtarea");
    
    mail.enviarMail(name, email, txtarea);
    
    

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
