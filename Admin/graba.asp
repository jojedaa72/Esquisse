<!-- #include file="../includes/conn.inc" -->
<!-- #include file="../includes/valida_sesion.inc" --><%


Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion 


color     = Request.Form("hdnColor")
idReserva = Request.Form("idReserva")
Asiento   = Request.Form("asiento")
ticket    = Request.Form("ticket")
fecha     = Request.Form("fecha")
usuario   = Session("usuario")
estado    = Request.Form("estado1")
pago      = Request.Form("pago")
familia   = Session("familia")

If color = "azul" Then
	sSql = "update reserva set estado = null "
	sSql = sSql & ", familia  = null "
	sSql = sSql & ", pago = null "
	sSql = sSql & ", fecha   = null " 
	sSql = sSql & ", ds_familia = null " 
	sSql = sSql & " where idReserva = '" & idReserva & "'"
Else
	sSql = "update reserva set estado = '1'"
	sSql = sSql & ", ticket  = '" & ticket & "'"
	sSql = sSql & ", familia = '" & usuario & "'"
	sSql = sSql & ", pago = '" & pago & "'"
	sSql = sSql & ", fecha   = getdate() " 
	sSql = sSql & ", ds_familia = '" & familia & "' " 
	sSql = sSql & " where idReserva = '" & idReserva & "'"
End If
Cn.Execute(ssql)

	
Cn.Close
Set Cn = Nothing%>
<html>
<head>
<script>
   opener.location.reload();
   window.close();
</script>
</html>
