<!-- #include file="../includes/conn.inc" --><%

Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")

Cn.Open CadenaConexion


sSql = "select orden from contador "
Rs.Open sSql, Cn


struser = "I"+Rs("orden")
strPsw = Request.Form("usuario")


ssSql = "INSERT INTO usuario (ds_usuario, ds_familia,ds_clave, ds_tipo, st_reg, st_deuda) VALUES ('" & struser & "','" & strPsw & "','123','A','1','2')"
Rs1.Open ssSql, Cn

ssSql = "UPDATE CONTADOR SET ORDEN = ORDEN + 1 "
Rs2.Open ssSql, Cn


Response.Redirect("usuario.asp")
%>