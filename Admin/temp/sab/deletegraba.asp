<!-- #include file="../../../includes/conn.inc" -->
<!-- #include file="../../../includes/valida_sesion.inc" -->

<%
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion 

Usuario = Request("usuario")
color     = Request.Form("hdnColor")
idReserva = Request.Form("idReserva")
Asiento   = Request.Form("asiento")
ticket    = Request.Form("ticket")
fecha     = Request.Form("fecha")
estado    = Request.Form("estado1")
pago      = Request.Form("pago")
familia   = Session("familia")


	sSql = "update reserva1 set estado = null "
	sSql = sSql & ", familia  = null "
	sSql = sSql & ", pago = null "
	sSql = sSql & ", fecha   = null " 
	sSql = sSql & ", ds_familia = null " 
	sSql = sSql & ", final = null "
	sSql = sSql & " where idReserva = '" & idReserva & "'"

Cn.Execute(ssql)

	
Cn.Close
Set Cn = Nothing%>

<!DOCTYPE html>
<html>
	<head>
	<script>
	function redirect(){
	   frmcurso.submit();
	}
	</script>
	</HEAD>
	<BODY class="textobody" onload="redirect()">
	<form name="frmcurso" method="post" action="lista.asp">
		
	</form>
</body>
</html>
