<!-- #include file="../includes/conn.inc" -->
<!-- #include file="../includes/valida_sesion.inc" -->
<%
nombre = Request.Form("apellidoPaterno")

Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion 
'response.write codigo

%>
<!DOCTYPE html>
<html lang="es" xml:lang="es">
<head>
<meta http-equiv="Content-Language" content="es-pe">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Actualización de Datos</title>
<style>
.navy      {font-family: Arial; font-size: 11px; color: #003399; font-weight: bold;}
.error     {font-family: Arial; font-size: 11px; color: #BB0000; font-weight: bold;}
.nobold    {font-family: Arial; font-size: 11px; color: #003399; font-weight: normal;}
.white     {font-family: Arial; font-size: 11px; color: #FFFFFF; font-weight: bold;}
.title     {font-family: Arial; font-size: 16px; color: #0066CC; font-weight: bold;}
.boton     {font-family: Arial; font-size: 11px; color: #FFFFFF; font-weight: bold; background-color: #003399;}
.text      {font-family: Arial; font-size: 11px; color: #003399; background-color: #FFFFFF; border: 1px solid #003399; text-transform: uppercase}
select     {font-family: Arial; font-size: 11px; color: #003399; background-color: #FFFFFF;}
</style>
</head>
<BODY>
<form method="POST" action="codigo.asp">
<div align="center">
<table width="424" border="1" cellpadding="5" class="navy" bordercolor="#003366" style="border-collapse: collapse">
<tr>
  <td align=center>
  <table border=0 width="100%" cellspacing="0" cellpadding="2" class="navy" bgcolor=#F3F9FF>

	<tr>
		<td width="73" bgcolor="#F2F2F2">
		Apellidos :</td>
		<td width="175" bgcolor="#F2F2F2">
		<input type="text" name="apellidoPaterno" size="29" class="text" >
		</td>
				<td width="67" bgcolor="#F2F2F2">
		<input type="submit" value="Enviar" name="B1"></td>
	</tr>
		
	</table>
    </table>
  </div>
  </td>
</tr>
</table>
<p align="center"></p>
</form>


<%
if 	Nombre <> "" then

	Sql = "select loginfamilia, apellidosfamilia, can_boleto, reserva, reserva2 from familias where  apellidosfamilia like '"& nombre &"%' or loginfamilia like '"& nombre &"%'  order by 2"
	Rs.Open Sql, Cn

Else %>
		
<div align="center">
		
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; color:#FF0000" bordercolor="#111111" width="100%" id="AutoNumber2">

</table>
</div>
<div align="center">
  <center>
<%end if%>

<table border="0" width="439" class="navy" cellspacing="0" cellpadding="2" style="border-collapse: collapse" align=center>
<tr>
  <th class=white bgcolor="#0066CC" height="19">Nro.</th>
  <th class=white bgcolor="#0066CC" height="19">Código</th>
  <th class=white bgcolor="#0066CC" height="19">Apellidos</th>  
    <th class=white bgcolor="#0066CC" height="19">Pagadas</th>  
    <th class=white bgcolor="#0066CC" height="19">Reserva<br>&nbsp;01</th>  
    <th class=white bgcolor="#0066CC" height="19">Reserva<br>&nbsp;02</th> 
</tr>
  
<%
if Nombre <>"" then

j = o
Do Until Rs.EOF
   j = j +1
%>   
   
<tr>
<td width="20" height=18 align=center span class="text"><A href='seleccion.asp?nombre=<% = rs(1)%>'><%=j%></span></td>
<td width="38" height=18 &nbsp;span class="text"><A href='seleccion01.asp?nombre=<% = rs(1)%>'> <%=Rs(0)%></span></td>
<td width="247" height=18 &nbsp;span class="text"><%=Rs(1)%></span></td>
<td width="45" height=18 &nbsp;span class="text"><%=Rs(2)%></span></td>
<td width="64" height=18 &nbsp;span class="text"><%=Rs(3)%></span></td>
<td width="64" height=18 &nbsp;span class="text"><%=Rs(4)%></span></td>
</tr>

<%
   Rs.MoveNext
   Response.Write "</tr>" & vbCrLf
Loop
end if
%>
</table>
  </center>
</div>
<script language=javascript> 
function ventanaChica (URL){ 
   window.open(URL,"ventana1","width=1000, height=705, top=5, left=5, toolbar=no, location=no, directories=no, status=no, menubar=no,  resizable=no") 
} 
</script>




</body>

</html>
