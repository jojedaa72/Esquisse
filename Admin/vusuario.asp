<!-- #include file="../includes/conn.inc" --><%
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")

Cn.Open CadenaConexion

sSql = "select orden from contador "
Rs.Open sSql, Cn

struser = "V"+Rs("orden") %>

<HTML>
<HEAD>

<style type="text/css">
.auto-style1 {
	color: #E30101;
	font-size: xx-large;
	font-family: Arial, Helvetica, sans-serif;
}
.auto-style2 {
	text-align: center;
	font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
	font-size: xx-large;
	color: #F31515;
	border: 0 solid #FFFF00;
	background-color: #FFFF00;
}
</style>

</HEAD>
<BODY>
<form action="vcrear.asp" method="post">  
<table>

	<tr>
		<td class="auto-style2" colspan="2">
			<strong>VENTA</strong></td>
	</tr>

	<tr>
		<td>
			Nombre de Usuario:  
		</td>
		<td font-size: 22px; class="auto-style1">
			<strong>
			<%= struser %> 
			</strong> 
		</td>
	</tr>

	<tr>
		<td>
			Ingresar Apellidos y Nombre:  
		</td>
		<td>
			<input name="usuario" type="text" value="" style="width: 344px; height: 33px">  
		</td>
	</tr>
</table>
	<input id="enviar" name="Grabar" type="submit" value="Grabar">  
</form>  
</div>  
</BODY>
</HTML>
