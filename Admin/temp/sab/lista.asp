<!-- #include file="../../../includes/conn.inc" -->
<!-- #include file="../../../includes/valida_sesion.inc" -->

<%
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")

Cn.Open CadenaConexion
a = 0
Usuario = Session("usuario")
Familia = Session("familia")

sSql = "select familia,count (familia) as pepe, ds_familia from reserva1 where estado = '1' AND not familia = 'ADMIN' AND not familia = 'UNIFE' AND not familia = 'RESERVADO' group by familia, ds_familia order by ds_familia "
Rs.Open sSql, Cn
%>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
<style>
tr:hover td{background:#FFFFFF; font-weight: bold;}

</style>
</head>
<body>
	<H1>Sábado 23</H1>
	<TABLE border='1' cellpadding = '2' cellspacing = '1'>
		<% do while not rs.eof 
		a = a + 1 
		%>
			<TR>
				<%
				sSql = "select r.asiento, r.familia, u.ds_usuario, u.ds_familia, u.fe_ulting, r.final, r.pago from RESERVA1 r, usuario u where r.familia = u.ds_usuario and r.familia = '" & Rs("familia") & "' and r.estado = '1' "
				Rs1.Open sSql, Cn %>
				<td style=" font-family: sans-serif;" width="5" style="text-align:center;"><%= a %></td>
				<td style=" font-family: sans-serif;" width="50"><a href="entradas01.asp?printer=<%= Rs1("familia") %>&familias=<%= Rs1("ds_familia") %> "><%= Rs1("familia") %></td>
				<td style=" font-family: sans-serif;" width="300"><%= Rs1("ds_familia") %></td>
				<td style=" font-family: sans-serif; text-align:center;" width="20"><%= Rs("pepe") %></td>
				<% do while not rs1.eof 
				If isNull(Rs1("final")) then %>
					<td style=" font-family: sans-serif; text-align:center;" width="70" ><a href="deleteasiento.asp?asiento=<%= Rs1("asiento") %>"><%= Rs1("asiento") %></td>
				<% Else	%>
					<td style=" font-family: sans-serif; text-align:center;" width="70" ><a href="deleteasiento.asp?asiento=<%= Rs1("asiento") %>"><%= Rs1("asiento") %></td>
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
</html>
