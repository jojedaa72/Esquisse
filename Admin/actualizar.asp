<!-- #include file="../includes/conn.inc" -->
<!-- #include file="../includes/valida_sesion.inc" -->

<head>
<meta http-equiv="Content-Language" content="es-pe">
<META http-equiv="refresh" content="1;URL=codigo.asp">
</head>
<link href="../css/normal.css" type=text/css rel=stylesheet>

<style type="text/css">
<!--
td     {font-family: Arial; font-size: 10px; color: #636363; font-weight: bold;}
th     {font-family: Arial; font-size: 11px; color: #003399;}
.title     {font-family: Arial; font-size: 16px; color: #0066CC; font-weight: bold;}
.boton     {font-family: Arial; font-size: 11px; color: #FFFFFF; font-weight: bold; background-color: #003399;}
.text      {font-family: Arial; font-size: 11px; color: #003399; background-color: #FFFFFF; border: 1px solid #003399; text-transform: uppercase}
select     {font-family: Arial; font-size: 11px; color: #003399; background-color: #FFFFFF;}
.Estilo1 {font-weight: bold}
-->
</style>
<%
codigo 	= request.querystring("codigo")


	cotros_nombres 	=	Request.Form("txtotros_nombres")
	cNombres		=	Request.Form("txtnombre")
	cApellidos		=	Request.Form("txtapellidos")
	cNombreCompleto	=	Request.Form("txtnombrecompleto")
	cRegimen		=	Request.Form("txtregimen")
	cEtapa			=	Request.Form("txtetapa")
	fFecIngPenal	=	Request.Form("datefecingpenal")
	fFecIngSist		=	Request.Form("datefecingsist")
	c_fec_pago  =	Request.Form("datefecPago")
	c_can_boleto =	Request.Form("txtboteto")
	c_importe    =	Request.Form("txtimporte")
	c_comentario =	Request.Form("txtcomentario")



Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Cn = Server.CreateObject("ADODB.Connection")
Cn.Open CadenaConexion

	Sql = "select Ano, Seccion, Alumno, fec_nac, LoginFamilia, ApellidosFamilia, Nivel,  fec_pago, can_boleto, importe, total, comentario from familias where  apellidosfamilia = '"& codigo &"'"
	Rs.Open Sql, Cn




If Not Rs.EOF Then %>
		<table width="430" border=1 style="border-collapse: collapse" bordercolor="#003399"><tr><td>
		<table width="100%"><tr><td>&nbsp;<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</td>
			<p>&nbsp;</td></tr><tr><th><p><font size="3">SE GUARDO CORRECTAMENTE</font></p>
				<p><font size="2" color="#003399" face="Microsoft Sans Serif">En 
				2 seg. se cerrara esta pagina</font></p></th></tr><tr><td>&nbsp;<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p align="center">&nbsp;<p align="center">&nbsp;</td></tr></table>
		</td></tr>
		</tr>
		</table>
	

		<% sSql = "UPDATE familias  SET	fec_pago = '"& c_fec_pago  &"' , can_boleto = "& c_can_boleto &" , importe =  "& c_can_boleto &" * 30 ,total = "& c_can_boleto &" * 30 , comentario = '"& c_comentario &"' "
		sSql = ssql & " where apellidosfamilia = '"& codigo &"' " 				
	
		
 Else %>
		<table width="430" border=1 style="border-collapse: collapse" bordercolor="#003399"><tr><td> 
		<table border="0" width="100%"><tr><td>&nbsp;<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</td>
		    </tr><tr><th><p><font size="3">SE GUARDO CORRECTAMENTE</font></p>
				<p><font size="2" color="#003300" face="Microsoft Sans Serif">En 
				2 seg. se cerrara esta pagina</font></p></th></tr><tr><td>&nbsp;<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p align="center">&nbsp;<p align="center">&nbsp;</td></tr></table>
		</td></tr>
		</tr>
		</table>

			                       
		<%	sSql = "insert into internos ( otros_nombres, Nombres, Apellidos, NombreCompleto, Regimen, Etapa, FecIngPenal, FecIngSist, Mot_Ingreso, Pabellon, Piso, Celda, "
		sSql = ssql & " Delito_Gen, Delito_Esp, Delitogen_Est, Delitoesp_Est, Agraviado, Juzgado_Ini, Secretario, Expediente_Ini, Observaciones, Situacion, "
		sSql = ssql & " Anos_Senten, Aut_Senten, Fecha_Senten, Exped_Resolu, Fec_Ini_Pena, Fec_Term_Pena, Distrito_Nac, Provincia_Nac, Depart_Nac, Documento, "
		sSql = ssql & " Nro_Ingresos, FecNacimiento, Pais, Est_Civil, Num_Hijos, Nivel_Inst, Ocupacion )"		                       



		sSql = sSql & " values ( '"& cotros_nombres  &"' , '"& cNombres  &"' , '"& cApellidos  &"' , '"& cNombreCompleto  &"' , '"& cRegimen  &"' , '"& cEtapa  &"' , '"& fFecIngPenal  &"' , '" & _
									fFecIngSist  &"' , '"& cMot_Ingreso  &"' , '"& cPabellon  &"' , '"& cPiso  &"' , '"& cCelda  &"' , '"& cDelito_Gen  &"' , '"& cDelito_Esp  &"' ,  '" &_
									cDelitogen_Est  &"' , '"& cDelitoesp_Est  &"' , '"& cAgraviado  &"' , '"& cJuzgado_Ini  &"' , '"& cSecretario  &"' , '"& cExpediente_Ini  &"' , '" & _ 
									cObservaciones  &"' , '"& cSituacion  &"' , '"& cAnos_Senten  &"' , '"& cAut_Senten  &"' , '"& cFecha_Senten  &"' , '"& cExped_Resolu  &"'  , '" & _
									cFec_Ini_Pena  &"' , '"& cFec_Term_Pena  &"' , '"& cDistrito_Nac  &"' , '"& cProvincia_Nac  &"' , '"& cDepart_Nac  &"' , '"& cDocumento  &"'  , '" & _ 
									cNro_Ingresos  &"' , '"& fFecNacimiento  &"' , '"& cPais  &"' , '"& cEst_Civil  &"' , '"& cNum_Hijos  &"' , '"& cNivel_Inst  &"' , '"& cOcupacion  &"' )"	
		
		                       
End If

Cn.Execute(sSql)
Cn.Close
Set Cn = Nothing %>
