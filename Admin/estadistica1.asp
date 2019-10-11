<!-- #include file="../includes/conn.inc" -->

<%
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Set Rs4 = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion
a = 0


Sql = "select count (familia) - 50 as direccion, count (familia)-50  as total, 828 - count (familia) as reservadas, (count (familia)*100)/828 as tota1  from reserva where estado = '1' "
Rs.Open Sql, Cn

sSql = "select count (familia) - 50 as direccion, count (familia)-50 as total, 828 - count (familia) as reservadas, (count (familia)*100)/828 as tota1 from reserva1 where estado = '1' "
Rs1.Open sSql, Cn

ssSql = "select day(fecha),month(fecha), count(day(fecha)) from reserva where NOT familia is NULL group by  day(fecha),month(fecha) "
Rs2.Open ssSql, Cn

sssSql = "select day(fecha),month(fecha), count(day(fecha)) from reserva1 where NOT familia is NULL group by  day(fecha),month(fecha) "
Rs3.Open sssSql, Cn

Sql = "select day(fecha),month(fecha), count(day(fecha)) from reserva where NOT familia is NULL group by  day(fecha),month(fecha)  "
Rs4.Open Sql, Cn
%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">		
				<div class="panel-heading"><strong>Estadística en línea - Esquisse 2017 </strong></div>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">	
		<div class="col-md-12">
			<TABLE class="table table-bordered text-center">
				<H4>Viernes 22</H4>
				<div class="progress">
  					<div class="progress-bar" role="progressbar" aria-valuenow="<%= Rs(3) %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= Rs(3) %>%;"><%= Rs(3) %>%</div>
				</div>
					<ul class="list-group">
					  <li class="list-group-item">
					    <span class="badge">50</span>
					    Reserva Dirección
					  </li>
					  <li class="list-group-item">
					    <span class="badge"><%= Rs(1) %></span>
					    Reservas Familias
					  </li>
					  <li class="list-group-item">
					    <span class="badge"><%= Rs(2) %></span>
					    Asientos Disponibles
					  </li>
					  <li class="list-group-item">
					    <span class="badge">828</span>
					    Total
					  </li>
					</ul>
			</TABLE>
		</div>
	</div>	
	<div class="row">	
		<div class="col-md-12">
			<TABLE class="table table-bordered text-center">
				<H4>Sábado 23</H4>
				<div class="progress">
  					<div class="progress-bar" role="progressbar" aria-valuenow="<%= Rs1(3) %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= Rs1(3) %>%;"><%= Rs1(3) %>%</div>
				</div>	
					<ul class="list-group">
					  <li class="list-group-item">
					    <span class="badge">50</span>
					    Reserva Dirección
					  </li>
					  <li class="list-group-item">
					    <span class="badge"><%= Rs1(1) %></span>
					    Reservas Familias
					  </li>
					  <li class="list-group-item">
					    <span class="badge"><%= Rs1(2) %></span>
					    Asientos Disponibles
					  </li>
					  <li class="list-group-item">
					    <span class="badge">828</span>
					    Total
					  </li>
					</ul>
			</TABLE>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col_md_12">
		<h4>Venta por dias</h4>
		<table class="table table-striped">
			<tr>
				<td>
					<table class="table text-center">
						<tr class="active">
							<th class=text-center>Fecha</th>
						</tr>
						<% do while not rs2.eof 
						a = a + 1 %>
							<tr>
								<td><%= Rs2(0) %>/<%= Rs2(1) %></td>
							</tr>
						<% rs2.movenext
						loop
						rs2.close %>
					</table>
				</td>
				<td>
					<table class="table text-center">
						<tr class="active">
							<th class=text-center>Viernes 22</th>
						</tr>
						<% do while not rs4.eof 
						a = a + 1 %>
							<tr>
								<td><%= Rs4(2) %></td>
							</tr>
						<% rs4.movenext
						loop
						rs4.close %>
					</table>
				</td>
				<td>	
					<table class="table text-center">
						<tr class="active">
							<th class=text-center>Sábado 23</th>
						</tr>
						<% do while not rs3.eof %>
							<tr> 	
								<td><%= Rs3(2) %></td>
							</tr> 	
						<% rs3.movenext
						loop
						rs3.close %>		
					</table> 
				</td>
			</tr>
		</table>		
		</div>
	</div>
</div>

</body>
</html>
