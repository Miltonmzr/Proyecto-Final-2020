package org.apache.jsp.InicioSesion.LogingFacebook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class fbloging_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write(" <head> \n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<center>\n");
      out.write("<h1>Login Page</h1> \n");
      out.write("<script>\n");
      out.write(" // This is called with the results from from FB.getLoginStatus().\n");
      out.write(" function statusChangeCallback(response) {\n");
      out.write(" console.log('statusChangeCallback');\n");
      out.write(" console.log(response);\n");
      out.write(" // The response object is returned with a status field that lets the\n");
      out.write(" // app know the current login status of the person.\n");
      out.write(" // Full docs on the response object can be found in the documentation\n");
      out.write(" // for FB.getLoginStatus().\n");
      out.write(" if (response.status === 'connected') {\n");
      out.write(" // Logged into your app and Facebook.\n");
      out.write(" testAPI();\n");
      out.write(" } else if (response.status === 'not_authorized') {\n");
      out.write(" // The person is logged into Facebook, but not your app.\n");
      out.write(" document.getElementById('status').innerHTML = 'Login with Facebook ';\n");
      out.write(" } else {\n");
      out.write(" // The person is not logged into Facebook, so we're not sure if\n");
      out.write(" // they are logged into this app or not.\n");
      out.write(" document.getElementById('status').innerHTML = 'Login with Facebook ';\n");
      out.write(" }\n");
      out.write(" }\n");
      out.write(" // This function is called when someone finishes with the Login\n");
      out.write(" // Button. See the onlogin handler attached to it in the sample\n");
      out.write(" // code below.\n");
      out.write(" function checkLoginState() {\n");
      out.write(" FB.getLoginStatus(function(response) {\n");
      out.write(" statusChangeCallback(response);\n");
      out.write(" });\n");
      out.write(" }\n");
      out.write(" window.fbAsyncInit = function() {\n");
      out.write(" FB.init({ \n");
      out.write(" appId : 'UPDATE YOUR APP ID HERE',\n");
      out.write(" cookie : true, // enable cookies to allow the server to access \n");
      out.write(" // the session\n");
      out.write(" xfbml : true, // parse social plugins on this page\n");
      out.write(" version : 'v2.2' // use version 2.2\n");
      out.write(" });\n");
      out.write(" // Now that we've initialized the JavaScript SDK, we call \n");
      out.write(" // FB.getLoginStatus(). This function gets the state of the\n");
      out.write(" // person visiting this page and can return one of three states to\n");
      out.write(" // the callback you provide. They can be:\n");
      out.write(" //\n");
      out.write(" // 1. Logged into your app ('connected')\n");
      out.write(" // 2. Logged into Facebook, but not your app ('not_authorized')\n");
      out.write(" // 3. Not logged into Facebook and can't tell if they are logged into\n");
      out.write(" // your app or not.\n");
      out.write(" //\n");
      out.write(" // These three cases are handled in the callback function.\n");
      out.write("\n");
      out.write(" FB.getLoginStatus(function(response) {\n");
      out.write(" statusChangeCallback(response);\n");
      out.write(" });\n");
      out.write(" };\n");
      out.write(" // Load the SDK asynchronously\n");
      out.write(" (function(d, s, id) {\n");
      out.write(" var js, fjs = d.getElementsByTagName(s)[0];\n");
      out.write(" if (d.getElementById(id)) return;\n");
      out.write(" js = d.createElement(s); js.id = id;\n");
      out.write(" js.src = \"//connect.facebook.net/en_US/sdk.js\";\n");
      out.write(" fjs.parentNode.insertBefore(js, fjs);\n");
      out.write(" }(document, 'script', 'facebook-jssdk')); \n");
      out.write("\n");
      out.write(" // Here we run a very simple test of the Graph API after login is\n");
      out.write(" // successful. See statusChangeCallback() for when this call is made.\n");
      out.write(" function testAPI() { \n");
      out.write(" console.log('Welcome! Fetching your information.... ');\n");
      out.write(" FB.api('/me?fields=name,email', function(response) {\n");
      out.write(" console.log('Successful login for: ' + response.name); \n");
      out.write(" \n");
      out.write(" document.getElementById(\"status\").innerHTML = '<p>Welcome '+response.name+'! <a href=fblogincontroller.jsp?user_name='+ response.name.replace(\" \", \"_\") +'&user_email='+ response.email +'>Continue with facebook login</a></p>'\n");
      out.write(" });\n");
      out.write(" } \n");
      out.write("</script> \n");
      out.write("<!--\n");
      out.write(" Below we include the Login Button social plugin. This button uses\n");
      out.write(" the JavaScript SDK to present a graphical Login button that triggers\n");
      out.write(" the FB.login() function when clicked.\n");
      out.write("-->\n");
      out.write("<br><br>\n");
      out.write("<fb:login-button scope=\"public_profile,email\" onlogin=\"checkLoginState();\">\n");
      out.write("</fb:login-button>\n");
      out.write("<div id=\"status\">\n");
      out.write("</div> \n");
      out.write(" <script type=\"text/javascript\">\n");
      out.write("</script>\n");
      out.write("</center>\n");
      out.write("</body>\n");
      out.write("</html>");
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
