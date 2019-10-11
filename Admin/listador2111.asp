<!-- #include file="../includes/conn.inc" -->

<%
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion
a = 0
Usuario = Session("usuario")
Familia = Session("familia")

sSql = "select familia,count (familia) as pepe, ds_familia from reserva where estado = '1' and not familia = 'DIRECCION' and not familia = 'ADMIN' group by familia, ds_familia order by ds_familia "
Rs.Open sSql, Cn %>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
		<style>
		tr:hover td{background:#ACDDDE;}
		div { 
				font-family: 'Roboto', sans-serif;
			}
	</style>
</head>
<div>
<body bgcolor="#ecf0eb">
	<h1>VIERNES 22 - IMPRESION</h1>
	<TABLE border='1' cellpadding = '4' cellspacing = '2'>
		<th>Nro.</th>
		<th>Usuario</th>
		<th width="200">Fecha</th>		
		<th>Familia</th>
		<th>Cant.</th>

		<th colspan="20">Entradas Reservadas</th>
		<% do while not rs.eof 
		a = a + 1 
		%>
			<TR>
				<%
				sSql = " select r.asiento, r.familia, u.ds_usuario, u.ds_familia, u.fe_ulting, r.final , r.pago from RESERVA r, usuario u where r.familia = u.ds_usuario and r.familia = '" & Rs("familia") & "' and r.estado = '1' "
				Rs1.Open sSql, Cn %>
				<td width="5" style="text-align:center;"><%= a %></td>
				<td width="50"><a href="entradas01.asp?printer=<%= Rs1("familia") %>&familias=<%= Rs1("ds_familia") %> "><%= Rs1("familia") %></td>
				<td width="200"><%= Rs1("fe_ulting") %></td>
				<td width="300"><%= Rs1("ds_familia") %></td>
				<td width="20"><%= Rs("pepe") %></td>

				<% do while not rs1.eof 
				if Rs1(6) = "Efectivo" then %>
					<td bgcolor="#F87070" width="50" >F<%= Rs1("asiento") %></td>
				<% Else	%>
					<td  width="50" >F<%= Rs1("asiento") %></td>
				<%  End If
				rs1.movenext
				loop
				rs1.close %>
			</TR>
		<% rs.movenext
		loop
		rs.close %>
	</TABLE>
</body>
</div>
</html>
