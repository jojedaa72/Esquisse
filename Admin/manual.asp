<!-- #include file="../includes/conn.inc" -->
<!-- #include file="../includes/valida_sesion.inc" -->
<%

Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")

Cn.Open CadenaConexion

a = 0
Usuario = Session("usuario")
Familia = Session("familia")



sSql = " select deuda, ds_familia from usuario where ds_usuario = '" & Usuario & "' "
Rs.Open sSql, Cn
'response.write usuario


%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
	p { 
	  margin-left: 20px;
	  text-indent: -20px;
	  padding-left: 15px;
	  padding-right: 15px;
	}
	</style>

</head>
<body>

<div class="container-fluid">
	<div class="row">

		<div class="col-sx-12 col-md-12">
			<img src="../img/esquisse_banner.jpg" alt="" class = "img-responsive img-thumbnail center-block">
		</div>

	</div>

<% If Rs(0) = "1" Then %>

	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
		<br>
		<div class="panel panel-success">		
			<div class="panel-heading"><h3><strong>:: Información</strong></h3></div>
		
				<p><h4>Estimada familia : <strong>	<%= familia %> </strong><br> <br>Agradeceremos acercarse a la recepción del colegio para realizar su reserva de entradas en la modalidad de pago en efectivo.</h4></p><br>
	<button type="button" class="btn btn-primary btn-lg" onclick ='location.href="../ingreso/salir.asp"'>Salir</button>


			</div>
		</div>	
	<div class="col-md-3">
	</div>
	</div>
	</div>



<% Else %>


	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
		<br>
		<div class="panel panel-info">		
			<div class="panel-heading"><strong>:: Indicaciones</strong></div>
			<div class="table-responsive">
				<table>
				<br>
				    <tr>
				    	<td colspan="2"><p>1.- Utilice los navegadores web Google Chrome <img src="../img/Chrome.png"> o Safari - Apple <img src="../img/safari-icon.png"></p></td>
				    </tr>
				    <tr>
				    	<td colspan="2"><p>2.- Seleccione los asientos en las ubicaciones deseadas, teniendo en cuenta lo siguiente:</p>
							<ul>
								<li>Asientos de color <span class="label label-success"> Verde</span> se encuentran <strong>DISPONIBLES</strong></li>
								<li>Asientos de color <span class="label label-danger">Rojo</span> se encuentran <strong>OCUPADOS</strong></li>
								<li>Asientos de color <span class="label label-primary">Azul</span> se encuentra <strong>RESERVADO</strong> por su usuario</li>
							</ul>
				    	</td>
				    </tr>
				    <tr>
				    	<td colspan="2"><p>3.- Al hacer clic a un asiento disponible aparecerá una ventana donde deberá seccionar la forma de pago:</p>
							<ul>
								<li>Pago en Banco (Cargándolo en el sistema de pensiones, rubro comedor)</li>
								<li>Pago en efectivo (En la recepción del colegio Alpamayo)</li>
							</ul>

				    	</td>
				    </tr>
				    <tr>
				    	<td colspan="2"><p>4.- Para finalizar con la selección presione el botón de color azul que se encuentra en la parte inferior centro de la pantalla que dice <span class="label label-primary">FINALIZAR SELECCIÓN</span>, posteriormente imprima el boleto donde se indica el número de asientos reservados.</p></td>
				    </tr>
				    <tr>
				    	<td colspan="2"><p>5.- Recuerde que después de finalizar e imprimir el boleto con sus asientos ya no podrá anular los asientos ya seccionados pero si podrá ingresar nuevamente para adquirir más asientos.</p></td>
				    </tr>
				    <br/>
					<tr>

						
				    	<td class="text-center"><button type="button" class="btn btn-primary btn-lg" onclick ='location.href="reservas.asp"'>Viernes 20</button></td> 
				    	<td class="text-center"><button type="button" class="btn btn-primary btn-lg" onclick ='location.href="1reservas.asp"'>Sábado 21</button></td>
				    </tr>
				   
				</table>
			</div>
		</div>	
	<div class="col-md-3">
	</div>
	</div>
	</div>


<% End IF %>

</div>
</body>
</html>