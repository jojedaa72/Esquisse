<%@ language="vbscript" codepage="65001" %>
<%
Response.CharSet = "utf-8"
%>

<!-- #include file="../includes/conn.inc" -->

<%
Usuario = Session("usuario")
Familia = Session("familia")


Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")

Cn.Open CadenaConexion

a = 0
Usuario = Request("printer")
familia = Request("familias")

sSql = " select asiento, pago from RESERVA1 where estado = '1' and familia = '" & Usuario & "' "
Rs.Open sSql, Cn

sSqls = " select st_deuda from usuario where st_reg = '1' and ds_usuario = '" & Usuario & "' "
Rs1.Open sSqls, Cn


If Not Rs.eof Then
   total = Rs(0)
  Else
End If %>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
 
  <style>
  .button
  {
  border: 2px solid #DBE1EB;
  font-size: 18px;
  font-family: Arial, Verdana;
  padding-left: 7px;
  padding-right: 7px;
  padding-top: 5px;
  padding-bottom: 5px;
  border-radius: 7px;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  -o-border-radius: 5px;
  background: #4972B5;
  background: linear-gradient(left, #4972B5, #618ACB);
  background: -moz-linear-gradient(left, #4972B5, #618ACB);
  background: -webkit-linear-gradient(left, #4972B5, #618ACB);
  background: -o-linear-gradient(left, #4972B5, #618ACB);
  color: #FFFFFF;
  }
   
  .button:hover
  {
  background: #365D9D;
  background: linear-gradient(left, #365D9D, #436CAD);
  background: -moz-linear-gradient(left, #365D9D, #436CAD);
  background: -webkit-linear-gradient(left, #365D9D, #436CAD);
  background: -o-linear-gradient(left, #365D9D, #436CAD);
  color: #FFFFFF;
  border-color: #FBFFAD;
  }
  .auto-style1 {
	  border-collapse: collapse;
	  border: 2px solid #365D9D;
  }
  .auto-style2 {
	  text-align: center;
  }
  .auto-style3 {
	  text-align: center;
	  font-family: Verdana, Geneva, Tahoma, sans-serif;
	  color: #000080;
  }
  .auto-style4 {
	  font-family: Arial, Helvetica, sans-serif;
  }
  .auto-style5 {
	  font-size: small;
  }
  .auto-style6 {
	  font-size: small;
	  font-family: Arial, Helvetica, sans-serif;
	  text-align: center;
  }
  .auto-style7 {
	  font-family: Arial, Helvetica, sans-serif;
	  font-size: medium;
  }
  .auto-style8 {
	  font-size: medium;
  }
  .auto-style9 {
	  color: #FF0000;
  }
  .auto-style10 {
	  font-family: "Arial Narrow";
	  font-size: x-small;
  }
  .auto-style12 {
	  text-align: center;
	  font-family: "Arial Narrow";
	  background-color: #C0C0C0;
  }
  .auto-style13 {
	  font-family: Verdana, Geneva, Tahoma, sans-serif;
  }
  .auto-style14 {
	  font-family: "Arial Narrow";
  }
  .auto-style15 {
	  color: #0007FF;
  }
  .auto-style16 {
	  text-align: center;
	  font-family: "Arial Narrow";
  }
  .auto-style17 {
	  color: #365D9D;
  }
  .auto-style18 {
	  font-family: Arial, Helvetica, sans-serif;
	  color: #FF0000;
  }
  
  
function window.onbeforeprint(){ 
noprint.style.visibility = 'hidden'; 
noprint.style.position = 'absolute';
}
function window.onafterprint(){ 
noprint.style.visibility = 'visible'; 
noprint.style.position = 'relative'; 
}
  

  
 </style>
 </head>
<body>

<form name="frmAlumnos" method="POST" action="reservas1.asp">
<div class="auto-style2">

<% If not RS.eof then %>
<table style="width: 640px" align="center" class="auto-style1">

	<TR>
	 <td class="auto-style3" colspan="2"><strong>:: ESQUISSE 2018 :: </strong></td>
	</TR>
	<TR>
			 <td class="auto-style3" colspan="2" ><strong>- SABADO 22 - </strong></td>
	</TR>
	<br>
	<TR>
	  <td style="height: 21px; width: 356px;">	</td>
	  <td style="width: 280px"></td>
	</TR>
	<TR>
	   <td class="auto-style2" colspan="2"> <span class="auto-style13"><strong>Familia :</strong></span>&nbsp;<strong><span class="auto-style13"><span class="auto-style9"> <%= familia %>
	   </span></span></strong></td>
	</TR>
	<tr>
	<td colspan="2">
			<table style="width: 315px" class="auto-style1" align="center">
				<tr>
				  <td class="auto-style12" style="height: 21px; width: 28px;">
				  <strong>Nro.</strong></td>
				  <td class="auto-style12" style="height: 21px">
				  <strong>Asiento</strong></td>
				  <td style="height: 21" class="auto-style12"><strong>Form. Pago</strong></td>
				</tr>
		         
				<% do while not rs.eof 
				a = a + 1 %>
				<tr>
					<td style="height: 22; width: 28px;" class="auto-style16"><%= a %></td>
					<td style="height: 22; width: 57px;" class="auto-style2"><strong><span class="auto-style14"><span class="auto-style15">
					<span class="auto-style4"><span class="auto-style5">F<%= Rs("asiento") %></span></span></span></span></strong></td>
					<td width="60" style="height: 22" class="auto-style6"><%= Rs("pago") %></td>
				</tr>
				<% rs.movenext
				loop
				rs.close %>
			</table>
	</td>
	</tr>
	<tr>
		<td style="width: 356px"> &nbsp;</td>
		<td style="width: 280px"> &nbsp;</td>
	</tr>
<tr>
<td style="width: 356px" class="auto-style2">
<span class="auto-style7"><strong><span class="auto-style17">DONACI&OacuteN</span> :  </strong></span><strong>

<% If Rs1(0) = "2" then %>
<span class="auto-style8"><span class="auto-style4"><span class="auto-style9">CORTESÍA</span></span></span></strong>
<% Else %>
<span class="auto-style8"><span class="auto-style4"><span class="auto-style9">S/. &nbsp;<%= a * 50 %>.00</span></span></span></strong>
<% End If %>

</td>
<td class="auto-style2" style="width: 280px">
 <span class="auto-style10">Fecha:&nbsp;&nbsp;
 Sábado 22 de Setiembre  a las 19:00 horas
</span><br class="auto-style10"><span class="auto-style10">&nbsp;Lugar:&nbsp; Polideportivo - Colegio Alpamayo</span></td>

</tr>

</table>

<br>

<table align="center">
<TR>
<TD id="noprint">
<input name="imprimir" type="button" class="button" onClick="window.print();" value="IMPRIMIR">
<br><br>
<span class="auto-style14"><strong><span class="auto-style15"></a></span></strong></span>
</TD>
</TR>
</table>

<% Else %>

<table style="width: 640px" align="center" class="auto-style1">

	<TR>
	 <td class="auto-style3" colspan="2"><strong>:: ESQUISSE 2017 :: </strong></td>
	</TR>
	<br>
	<TR>
	  <td style="height: 21px; width: 356px;">	</td>
	  <td style="width: 280px"></td>
	</TR>
	<TR>
	   <td class="auto-style2" colspan="2"> <span class="auto-style13"><strong>Familia :</strong></span>&nbsp;<strong><span class="auto-style13"><span class="auto-style9"> <%= familia %>
	   </span></span></strong></td>
	</TR>
	<tr>
	<td colspan="2" class="auto-style2">
			<strong><span class="auto-style18"><br>NO SE ENCONTRARON REGISTROS</span><br class="auto-style18"><span class="auto-style18">POR FAVOR 
			SELECCIONE MINIMO UN ASIENTO</span></strong></td>
	</tr>
	<tr>
		<td style="width: 356px"> &nbsp;</td>
		<td style="width: 280px"> &nbsp;</td>
	</tr>
<tr>
<td class="auto-style2" colspan="2">
 <span class="auto-style10">Fecha:&nbsp;&nbsp;
 Viernes 27 de noviembre
</span><br class="auto-style10"><span class="auto-style10">&nbsp;Lugar:&nbsp; Teatro de la UNIF&Eacute</span></td>

</tr>

</table>
<br>
<input type="submit" class="button" onclick="history.back()" value="<=== REGRESAR"> <br><br>
	<span class="auto-style14"><strong><span class="auto-style15"><a href="../ingreso/salir.asp">Cerrar sesi&oacuten</a></span></strong></span>


<% End If %>



<br>
		</div>

</form>

</body>
</html>




