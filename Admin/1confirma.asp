<!-- #include file="../includes/conn.inc" -->
<!-- #include file="../includes/valida_sesion.inc" --><%

Dim Cn, Rs
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion 



Usuario = Session("usuario")
family = Session("familia")
asiento = Request("asiento")
color = Request("color")


sSql = "select * from reserva1 where asiento = '" & asiento & "'  "
'sSql = "select * from reserva1 where asiento = '" & asiento & "' and familia = '" & family & "' "
Rs.Open sSql, Cn
If NOT Rs.EOF Then
   idReserva = Rs("idReserva")
   Asiento   = Rs("asiento")
   familia   = Rs("familia")
   ticket    = Rs("ticket")
   fecha     = Rs("fecha")
   estado    = Rs("estado")
End If
Rs.Close%>

<!DOCTYPE html>
<html lang="es">
<head>
   <meta charset="UTF-8">
   <title>Reservas</title>
<meta http-equiv="Content-Language" content="es-pe">
<script language=javascript> 
function grabar(){
<%If color = "verde" Then%>
   if (frmAlumnos.pago[0].checked == false && frmAlumnos.pago[1].checked == false){
       alert("Debe seleccionar el medio de pago")
       frmAlumnos.pago[0].focus();
       return;
   }
<%End If%>
   frmAlumnos.submit()
}

function cerrar(){
   opener.location.reload();
   window.close();
}
</script>

<style type="text/css">
.auto-style1 {
	text-align: center;
}
.auto-style2 {
	font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
}
.auto-style3 {
	font-family: Arial, Helvetica, sans-serif;
}
.auto-style4 {
	color: #FF0000;
}
.auto-style5 {
	font-size: x-small;
	font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
	color: #0000FF;
}
.auto-style6 {
	font-size: medium;
}
.auto-style7 {
	font-size: medium;
	font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
	color: #0000FF;
}
.auto-style8 {
	font-family: "Arial Narrow";
}
.auto-style9 {
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	color: #FF0000;
}
</style>


</head>
<body>
<form name="frmAlumnos" method="post" action="1graba.asp">
<!-- Campos tipo HIDDEN -->
<input type="hidden" name="hdnColor" value="<%= color %>" />
<input type="hidden" name="idReserva" value="<%= idReserva %>" />
<input type="hidden" name="Asiento" value="<%= Asiento %>" />
<!-- Campos tipo HIDDEN -->

<table width="100%" border=1 style="border-collapse: collapse" bordercolor="#0000FF">
   <tr>
      <td>
         <table border="0" width="100%">
         	<tr>
         		<td></td>
         	</tr>
         	<tr>
         		<td class="auto-style1"><b><font face="Arial" size="2">Familia: 
				<%= familia %> </font></b><font face="Arial" color="#FF0000" size="2"><b>
				<span class="auto-style6">&nbsp;<%= family %></span> </b></font></td>
         	</tr>
         	<tr>
         		<td></td>
         	</tr>
         	<tr>
         		<td class="auto-style1">
         		
         		<%If estado = "1" and familia <> session("usuario") Then %>
					<span class="auto-style9"><strong>Lo sentimos el asiento fue ocupado en este instante!</strong></span> 
         	    <% Else %>
	         		<%If color = "azul" Then%>
		         		<span class="auto-style7">Est&aacute; seguro de anular el asiento?</span><strong><span class="auto-style5">:</span></strong><span class="auto-style2">&nbsp;</span>&nbsp;<strong><span class="auto-style3"><span class="auto-style4"> 
						<span class="auto-style6">F<%= Trim(Asiento) %></span></span></span></strong>
					<%Else%>
		         		<span class="auto-style7">Est&aacute; seguro de reservar 
						el asiento?</span><strong><span class="auto-style5">:</span></strong><span class="auto-style2">&nbsp;</span>&nbsp;<strong><span class="auto-style3"><span class="auto-style4"> 
						<span class="auto-style6">F<%= Trim(Asiento) %></span></span></span></strong>
					<%End If%>
				<%End If%>
				</td>
         	</tr>
         	<tr>
         		<td></td>
         	</tr>
         	
         	
         	
      		<%If estado = "1" and familia <> session("usuario") Then %>
      		
         	<tr>
         		<td >&nbsp;</td>
         	</tr>

         	<tr>
         		<td class="auto-style1"><input type="button" value="Cancelar" class="button" onclick="cerrar();" style="color: #003366; font-weight: bold; background-color: #E7DFCE"></td>
         	</tr>
			<% Else %>

	         	<%If color = "verde" Then%>
	         	<tr>
	         		<td class="auto-style1"><span class="auto-style8">Pago banco</span>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
					<input name="pago" type="radio" value="Banco"><br>
					<span class="auto-style8">Pago en efectivo</span> <input name="pago" type="radio" value="Efectivo"></td>
	         	</tr>
	         	<tr><td>&nbsp;</td></tr>
	         	<tr>
	         		<td class="auto-style1">    <input name=cmdIrCambiar1 type="button" value="Aceptar" onclick="grabar()" class="button" style="color: #003366; font-weight: bold; background-color: #E7DFCE" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
	         	     <input type="button" value="Cancelar" class="button" onclick="cerrar();" style="color: #003366; font-weight: bold; background-color: #E7DFCE"></td>
	         	</tr>
	         	<%End If%>
         	
         	<% End If %>
         	
	        <%If color = "azul" Then%>
         	<tr><td>&nbsp;</td></tr>
       	
         	<tr>
         		<td class="auto-style1">    <input name=cmdIrCambiar1 type="button" value="Aceptar" onclick="grabar()" class="button" style="color: #003366; font-weight: bold; background-color: #E7DFCE" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
         	     <input type="button" value="Cancelar" class="button" onclick="cerrar();" style="color: #003366; font-weight: bold; background-color: #E7DFCE"></td>
         	</tr>
         	<%End If%>




         	<tr>
         		<td></td>
         	</tr>
         	</table>
      </td>
   </tr>
</table>
</form>
</body>
</html>
