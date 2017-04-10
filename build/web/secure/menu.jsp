<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
  <head>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <title>Home Page</title>
      <script src="https://use.fontawesome.com/470690823f.js"></script>
  </head>
<body>
<div id="content">
<h1>Sistema de Gestión</h1>
<%
if (request.getParameter("logoff") != null) {
session.invalidate();
response.sendRedirect("../index.jsp");
return;
}
%>
<p>Hola <%= request.getUserPrincipal().getName() %> ; este es el menu de la aplicación:</p>

<h3>Módulo Ventas</h3></td>
<p><a href="ventas/gestion_clientes.jsp">Operación: gestionar clientes </a>
    <%
        if (request.isUserInRole("GV"))
        { 
            out.print("<i class='fa fa-check'></i>");
        }
        else
        {
            out.print("<i class='fa fa-times'></i>");
        }
    %>
        </p>
<p><a href="ventas/gestion_presupuestos.jsp">Operación: gestionar presupuestos</a>
<%
        if (request.isUserInRole("GV"))
        { 
            out.print("<i class='fa fa-check'></i>");
        }
        else
        {
            out.print("<i class='fa fa-times'></i>");
        }
    %>
</p>
<p><a href="ventas/gestion_facturas.jsp">Operación: gestionar facturas</a>
<%
        if (request.isUserInRole("GV"))
        { 
            out.print("<i class='fa fa-check'></i>");
        }
        else
        {
            out.print("<i class='fa fa-times'></i>");
        }
    %>
</p>

<h3>Módulo Compras</h3></td>
<p><a href="compras/gestion_proveedores.jsp">Operación: gestionar proveedores</a>
<%
        if (request.isUserInRole("GC"))
        { 
            out.print("<i class='fa fa-check'></i>");
        }
        else
        {
            out.print("<i class='fa fa-times'></i>");
        }
    %>
</p>
<p><a href="compras/gestion_compras.jsp">Operación: gestionar compras</a>
<%
        if (request.isUserInRole("GC"))
        { 
            out.print("<i class='fa fa-check'></i>");
        }
        else
        {
            out.print("<i class='fa fa-times'></i>");
        }
    %>
</p>
<p><a href="compras/autorizar_compras.jsp">Operación: autorizar compras</a>
<%
        if (request.isUserInRole("AC"))
        { 
            out.print("<i class='fa fa-check'></i>");
        }
        else
        {
            out.print("<i class='fa fa-times'></i>");
        }
    %>
</p>


<h3>Módulo Nóminas</h3></td>
<p><a href="nominas/gestion_trabajadores.jsp">Operación: gestionar trabajadores</a>
<%
        if (request.isUserInRole("GN"))
        { 
            out.print("<i class='fa fa-check'></i>");
        }
        else
        {
            out.print("<i class='fa fa-times'></i>");
        }
    %>
</p>
<p><a href="nominas/gestion_nominas.jsp">Operación: gestionar nóminas</a>
<%
        if (request.isUserInRole("GN"))
        { 
            out.print("<i class='fa fa-check'></i>");
        }
        else
        {
            out.print("<i class='fa fa-times'></i>");
        }
    %>
</p>

Pulse para cerrar la sesión 
<a href='<%= response.encodeURL("menu.jsp?logoff=true") %>'>aquí</a>.
</body>
</html>
