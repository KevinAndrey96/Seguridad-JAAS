<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
  <head>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <title>Home Page</title>
  </head>
<body>
<div id="content">
<h1>Sistema de Gestión</h1>
<!--<form method="POST" action="Autenticador">
    <input type="text" name="Usuario" placeholder="Usuario"><br>
    <input type="password" name="Contrasena" placeholder="Contrasena"><br>
<input type="submit" value="Iniciar Sesión">
</form>-->

<form method="POST" name="j_security_check" action="j_security_check">
    <input type="text" name="j_username" placeholder="Usuario"><br>
    <input type="password" name="j_password" placeholder="Contrasena"><br>
<input type="submit" value="Iniciar Sesión">
</form>
<p>
<a href="secure/menu.jsp">Acceso al Sistema</a></p>
</div>
</body>
</html>
