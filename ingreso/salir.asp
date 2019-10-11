<!-- #include file="../includes/conn.inc" -->

<%
Dim cod_visita, cod_usuario, exito
cod_visita = Session("codvisita")
cod_usuario = Session("codigo")

activo = "A"

Session("strMsg") =""

strUsuario = Request.Form("txtUsuario")
strPassword = Request.Form("txtClave")

strUsuario = Replace(Request.Form("txtusuario"),"'","''")
strPassword = Replace(Request.Form("txtclave"),"'","''")

Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rsmatri = Server.CreateObject("ADODB.Recordset")
Set Rsvisita = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion


Set Session("usuario") = Nothing
Set Session("familia") = Nothing
Set Session("codigo") = Nothing
Set Session("strMsg") = Nothing
Session.Abandon
Response.Redirect("../default.asp")
%>
