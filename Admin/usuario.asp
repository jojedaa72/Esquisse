<!-- #include file="../includes/conn.inc" --><%
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")

Cn.Open CadenaConexion

sSql = "select orden from contador "
Rs.Open sSql, Cn

struser = "I"+Rs("orden") %>


<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
		<meta charset="UTF-8">
	<title>Venta</title>
	<!-- Optimizar el sitio en dispositivos móviles -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Importar CSS de Bootstrap  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- Importar Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<!-- Importar Funciones JavaScript de Bootstrap -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- Sweet Alert 2 -->
	<script src="https://limonte.github.io/sweetalert2/dist/sweetalert2.min.js"></script>
	<link rel="stylesheet" href="https://limonte.github.io/sweetalert2/dist/sweetalert2.min.css">

	<!-- Datatables -->
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">

<style type="text/css">
.auto-style1 {
	text-align: center;
	font-size: x-large;
	font-family: Arial, Helvetica, sans-serif;
	color: #1D0909;
}
.auto-style2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: x-large;
	color: #FF0000;
}
</style>

</HEAD>
<BODY>
<form action="crear.asp" method="post">  
<div class="container">
	<div class="row">
		<div class="col-md-12">


			<h1><strong>GRATIS</strong></td></h1>

			<p>Nombre de Usuario:</p> 

			<p style="color=red;"><h1><strong><%= struser %></strong></h1></p>


			<p>Ingresar Apellidos y Nombre: </p> 

			<input name="usuario" type="text" value="" required style="width: 314px; height: 28px">  

			<input id="enviar" name="Grabar" type="submit" value="Grabar"> 

		</div>
	</div>
</div>

 
</form>  
</div>  
</BODY>
</HTML>