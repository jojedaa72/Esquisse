<!-- #include file="../includes/conn.inc" --><%
activo = "A"

Session("strMsg") =""

strUsr = Replace(Request.Form("txtUsr"), "'", "")
strUsr = Replace(strUsr, chr(34), "")
strPsw = Request.Form("sclave2")

Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")

Cn.Open CadenaConexion

sSql = "SELECT * FROM USUARIO WHERE ds_usuario = '" & strUsr & "' AND ds_clave = '" & strPsw & "' "
Rs.Open sSql, Cn

'ssSql = " select rtrim (apellidopaterno)+' '+rtrim (apellidomaterno)+', '+rtrim(nombres) from hrdbg.dbo.Hr_Postulantes "
'ssSql = ssSql & " where postulante =  '" & strUsr & "' "
'Rs1.Open ssSql, Cn

deuda = " select  st_reg from USUARIO "
deuda = deuda & " where ds_usuario = '" & strUsr & "' " 
Rs2.Open deuda, Cn

'response.write rs("st_reg")
'response.end

   If Rs.EOF Then
	   Session("strMsg1") = "Intente Nuevamente "
	   Response.Redirect("../")
	   Err.Clear
	   Response.end
    Else

	If rs2(0) = "B" Then
	   Session("strMsg1") = "Señor padre de Familia : El acceso esta restringido asta el dia Lunes 28 Enero 2008 "
	   Response.Redirect("../")
	   Err.Clear
	   Response.end
	   
	Elseif rs2(0) = "C" Then
	   Session("strMsg1") = "Señor padre de Familia : Siendo de todos el deseo de mejorar la calidad educativa de nuestra institución, mucho agradeceremos cancelar la deuda con APAFA. Nuestro servicio de informacion académica vía extranet se habilitará en el término de las 24 horas hábiles una vez realizado el pago. Agradezco su atencion. Atte. Liceo Naval Almirante Guise"
	   Response.Redirect("../")
	   Err.Clear
	   Response.end

     Else
 	   usu = Rs("id_usuario")
	   tip = Rs("ds_tipo")
	   If IsNull(Rs("fe_ulting")) Then
	      Session("ult") = "Primera vez"
	   Else
	      Session("ult") = Rs("fe_ulting")
	   End If
	   Session("usuario") = Rs("ds_usuario")
	   Session("familia") = Rs("ds_familia")
'	   Session("padre") = Rs1(0)
    End If
    end if
    Rs.Close


'If Rs.EOF Then
'   Session("strMsg") = "Usuario o clave incorrecto, sus intentos fallidos seran registrados...!"
'   Response.Redirect("../")
'   Err.Clear
'   Response.end
'Else
'   usu = Rs("id_usuario")
'   tip = Rs("ds_tipo")
'   If IsNull(Rs("fe_ulting")) Then
'      Session("ult") = "Primera vez"
'   Else
'      Session("ult") = Rs("fe_ulting")
'   End If
'   Session("usuario") = Rs("ds_usuario")
'   Session("padre") = Rs1(0)
'End If
'Rs.Close

If tip = "A" Then
   sSql = "SELECT * "
   sSql = sSql & " FROM alumno a "
   sSql = sSql & " WHERE a.id_usuario = " & usu
   sSql = sSql & "  AND a.st_reg = 'A'"
   Rs.Open sSql, Cn
   If Not Rs.EOF Then
      sexo = Rs("ds_sexo")
      Session("usu") = Rs("id_usuario")
      Session("cla") = strPsw
      Session("alu") = Rs("id_alumno")
      Session("nom") = Rs("ds_apellidos") & " " & Rs("ds_nombres")
      Session("ema") = Rs("ds_email")
   End If
   Rs.Close

ElseIf tip = "P" Then
   sSql = "SELECT * FROM profesor WHERE id_usuario = " & usu
   Rs.Open sSql, Cn
   If Not Rs.EOF Then
      sexo = Rs("ds_sexo")
      'Session("usu") = usu
      Session("nom") = Rs("ds_apellidos") & " " & Rs("ds_nombres")
      Session("ema") = Rs("ds_email_tra")
   End If
   Rs.Close
ElseIf tip = "Z" Then
   'Session("usu") = usu
   Session("nom") = "Administrador del Sistema"
End If

If sexo = "F" Then
   Session("saludo") = "Bienvenida : "
Else
   Session("saludo") = "Bienvenido : "
End If
sSql = "UPDATE usuario SET fe_ulting = getdate() WHERE id_usuario = " & usu
Cn.Execute(sSql)

ipvisita = Request.ServerVariables("REMOTE_ADDR")

sSql = "INSERT INTO visita(id_usuario, ds_ip, fe_ingreso) values('" & usu & "', '" & ipvisita & "', getdate())"
Cn.Execute(sSql)
sSql = "SELECT Max(id_visita) FROM visita"
Rs.Open sSql, Cn
If Not Rs.EOF Then
   Session("codvisita") = Rs(0)
End If
Rs.Close
'Rs1.Close

Cn.Close

Set Rs = Nothing
Set Rs1 = Nothing

Set Cn = Nothing
Session("paso") = 0
Response.Redirect("menu.asp")
%>