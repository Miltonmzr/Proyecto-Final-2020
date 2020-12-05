package org.apache.jsp.InicioSesion.Login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\" >\n");
      out.write("<head>\n");
      out.write("  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("  <title>Login-Singin</title>\n");
      out.write("  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'><link rel=\"stylesheet\" href=\"./style.css\">\n");
      out.write("  <title>Inicio de sesion</title>\n");
      out.write("</head>\n");
      out.write("<script>\n");
      out.write("  window.fbAsyncInit = function() {\n");
      out.write("    FB.init({\n");
      out.write("      appId      : '407669133722304',\n");
      out.write("      cookie     : true,\n");
      out.write("      xfbml      : true,\n");
      out.write("      version    : 'v9.0'\n");
      out.write("    });\n");
      out.write("      \n");
      out.write("    FB.AppEvents.logPageView();   \n");
      out.write("      \n");
      out.write("  };\n");
      out.write("\n");
      out.write("  (function(d, s, id){\n");
      out.write("     var js, fjs = d.getElementsByTagName(s)[0];\n");
      out.write("     if (d.getElementById(id)) {return;}\n");
      out.write("     js = d.createElement(s); js.id = id;\n");
      out.write("     js.src = \"https://connect.facebook.net/en_US/sdk.js\";\n");
      out.write("     fjs.parentNode.insertBefore(js, fjs);\n");
      out.write("   }(document, 'script', 'facebook-jssdk'));\n");
      out.write("   function onLogin(){\n");
      out.write("       FB.login((response)=>\n");
      out.write("       if(response.authResponse){\n");
      out.write("           FB.api('/me',(response)=>{\n");
      out.write("               console.log(response)\n");
      out.write("           })\n");
      out.write("       }\n");
      out.write("    })\n");
      out.write("   }\n");
      out.write("</script>\n");
      out.write("<body>\n");
      out.write("<!-- login -->\n");
      out.write("<div class=\"cont\">\n");
      out.write("  <div class=\"form sign-in\">\n");
      out.write("    <h2>Bienvenido de nuevo!</h2>\n");
      out.write("    <center>\n");
      out.write("    ");
  if (request.getParameter("msj") != null) {
                        out.print("<h3>" + request.getParameter("msj") + "<h3>");
                    }
                
      out.write("\n");
      out.write("    </center>            \n");
      out.write("    <form action=\"../Iniciar.jsp\" method=\"post\">\n");
      out.write("    <label>\n");
      out.write("      <span>Correo o usuario</span>\n");
      out.write("      <input class=\"form-control\" type=\"text\" name=\"user\" title=\"Introdusca usuario\" placeholder=\"\" required>\n");
      out.write("    </label>\n");
      out.write("    <label>\n");
      out.write("      <span>Contraseña</span>\n");
      out.write("      <input class=\"form-control\" type=\"password\" name=\"pass\" title=\"Introdusca contraseña\" placeholder=\"\" required>\n");
      out.write("    </label>\n");
      out.write("    <p class=\"forgot-pass\">Olvidaste tu contraeña?</p>\n");
      out.write("    <button type=\"submit\" class=\"submit\" value=\"Entrar\">Log in</button>\n");
      out.write("    </form>\n");
      out.write("    <button type=\"button\" class=\"fb-btn\">Connect with <span>facebook</span></button><br>\n");
      out.write("    <button type=\"button\" class=\"go-btn\">Connect with <span>Google</span></button>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"sub-cont\">\n");
      out.write("    <div class=\"img\">\n");
      out.write("      <div class=\"img__text m--up\">\n");
      out.write("        <h2>Aun no te has registrado?</h2>\n");
      out.write("        <p>Ingresa Ahora!</p>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"img__text m--in\">\n");
      out.write("        <h2>Ya estas registrado?</h2>\n");
      out.write("        <p>Solo logeate es mas facil!</p>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"img__btn\">\n");
      out.write("        <span class=\"m--up\">Sing in</span>\n");
      out.write("        <span class=\"m--in\">Log in</span>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("      <!-- login end-->\n");
      out.write("      <!-- Sing in -->\n");
      out.write("    <div class=\"form sign-up\">\n");
      out.write("        <center><h3>Registrate Facil!</h3></center>\n");
      out.write("        <form action=\"../Usuario/registro.jsp\" method=\"post\">\n");
      out.write("      <label>\n");
      out.write("        <span>Usuario</span>\n");
      out.write("        <input class=\"form-control\" type=\"text\" name=\"user\" title=\"Introdusca usuario\" placeholder=\"\" required>\n");
      out.write("      </label>\n");
      out.write("      <label>\n");
      out.write("        <span>Nombre</span>\n");
      out.write("        <input class=\"form-control\" type=\"text\" name=\"names\" title=\"Introdusca nombre\" placeholder=\"\" required>\n");
      out.write("      </label>\n");
      out.write("      <label>\n");
      out.write("        <span>Apellido</span>\n");
      out.write("        <input class=\"form-control\" type=\"text\" name=\"surnames\" title=\"Introdusca apellido\" placeholder=\"\" required>\n");
      out.write("      </label>\n");
      out.write("      <label>\n");
      out.write("        <span>Correo</span>\n");
      out.write("        <input class=\"form-control\" type=\"email\" name=\"e-mail\" title=\"Introdusca email\" placeholder=\"\" required>\n");
      out.write("      </label>\n");
      out.write("      <label>\n");
      out.write("        <span>Contraseña</span>\n");
      out.write("        <input class=\"form-control\" type=\"password\" name=\"pass1\" title=\"Introdusca usuario\" placeholder=\"\" required>\n");
      out.write("      </label>\n");
      out.write("      <label>\n");
      out.write("        <span>Confirme contraseña</span>\n");
      out.write("        <input class=\"form-control\" type=\"password\" name=\"pass2\" title=\"Confirme contraseña\" placeholder=\"\" required>\n");
      out.write("      </label>\n");
      out.write("      <button type=\"submit\" class=\"submit\">Sign Up</button>\n");
      out.write("      <button type=\"button\" class=\"fb-btn\">Unirse con <span>facebook</span></button>\n");
      out.write("      <br>\n");
      out.write("      <button type=\"button\" class=\"go-btn\">Unirse con <span>Google</span></button>\n");
      out.write("        </form>\n");
      out.write("  </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("<!-- Singin end -->\n");
      out.write("\n");
      out.write("<!-- partial -->\n");
      out.write("  <script  src=\"./script.js\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
