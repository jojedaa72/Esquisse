<!-- #include file="../includes/conn.inc" --><%

Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")

Cn.Open CadenaConexion

a = 0
Usuario = Session("usuario")
Familia = Session("familia")


For i=1 to 2000 Step 1 

	sSql = "INSERT INTO ALUMNO (id_usuario, id_nivel,id_pais,ds_sexo,st_reg) VALUES ('" & i & "','1','172','M','A')"
	Rs.Open sSql, Cn

Next	


%>