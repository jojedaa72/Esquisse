<!-- #include file="../includes/conn.inc" -->
<!-- #include file="../includes/valida_sesion.inc" -->
<% 
Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Cn.Open CadenaConexion 


c_nombre     = Request("nombre")


	Sql = "select Ano, Seccion, Alumno, fec_nac, LoginFamilia, ApellidosFamilia, Nivel,  fec_pago, can_boleto, importe, total, comentario from familias where  apellidosfamilia = '"& c_nombre&"'"
	Rs.Open Sql, Cn

	

  
If Not Rs.EOF Then  
	c_Ano			= Rs("Ano")
	c_Seccion		= Rs("Seccion")
	c_Alumno		= Rs("Alumno")
	c_fec_nac		= Rs("fec_nac")
	c_LoginFamilia		= Rs("LoginFamilia")
	c_ApellidosFamilia	= Rs("ApellidosFamilia")
	c_Nivel			= Rs("Nivel")

	c_fec_pago = Rs("fec_pago")
	c_can_boleto = Rs("can_boleto")
	c_importe = Rs("importe")
	c_total = Rs("total")
	c_comentario = Rs("comentario")
	

	Rs.Close
			
			
  Else
	Rs.Close

End If %>
<html>

<head>
<title></title>

<!-- Estilos y Script  -->

<script language=javascript> 
function valida_envia(){

    if (document.frmreserva.datefecPago.value.length==0){
       alert("Ingrese Fecha de Pago")
       document.frmreserva.datefecPago.focus()
       return false;
    }

    if (document.frmreserva.txtboteto.value.length==0){
       alert("Ingrese la Cantidad de boletos")
       document.frmreserva.txtboteto.focus()
       return false;
    }

    if (document.frmreserva.txtimporte.selectedIndex==0){
       alert("Ingrese el Importe")
       document.frmreserva.txtimporte.focus()
       return false;
    }    
 
    if (document.frmreserva.cregimen.selectedIndex==0){
       alert("Debe seleccionar el Regimen.")
       document.frmreserva.cregimen.focus()
       return false;
    }
} 


function copia_portapapeles(){ 
   document.frmreserva.txtboteto.select() 
   window.clipboardData.setData("Text", document.frmreserva.txtboteto.value); 
} 

</script>





<script language="JavaScript" src="../css/calendar_us.js"></script>
<link rel="stylesheet" href="../css/calendar.css">
<link href="../css/normal.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
td     {font-family: Arial; font-size: 11px; color: #636363; font-weight: bold;}
th     {font-family: Arial; font-size: 12px; color: #003300; left:auto;}
.title {font-family: Arial; font-size: 16px; color: #0066CC; font-weight: bold;}
.boton {font-family: Arial; font-size: 11px; color: #FFFFFF; font-weight: bold; background-color: #003399;}
.text  {font-family: Arial; font-size: 11px; color: #003300; background-color: #FFFFFF; border: 1px solid #003399; text-transform: uppercase}
select {font-family: Arial; font-size: 11px; color: #003300; background-color: #FFFFFF;}
.Estilo1 {font-weight: bold}
-->
</style>

</head>

<body>
<table border="1" width="452" style="border-collapse: collapse" bordercolor="#003399">
		<tr>
			<th align=left width="448" colspan="3" >&nbsp; <font color="#FF0000">FAMILIA :</font> <%= c_ApellidosFamilia %></font></th>
		</tr>
	<tr>
	<td>
	
	<form  name="frmreserva" method="POST" action="actualizar.asp?codigo=<%= (c_ApellidosFamilia) %>">
	
	<div align="center">
	<table border="0" width="441">

		<tr>
			<td align="right" style="width: 85px">&nbsp;</td>
			<td width="285">
			&nbsp;</td>
		</tr>
		<tr>
			<td align="right" style="width: 85px">Familia: </td>
			<td width="285">
			<input class="text" type="text" name="txtboteto" size="5" value="<%= c_ApellidosFamilia %>" style="width: 293px"></td>
		</tr>
		<tr>
			<td align="right" style="width: 85px">&nbsp;</td>
			<td width="285">
			&nbsp;</td>
		</tr>
		</table>

	
	</div>

		<p align="center">&nbsp; <input type="button"   class="boton" value="Copiar" onclick="copia_portapapeles()"> 
	<p align="center">&nbsp;<input type="button"  class="boton"  value="Cancelar" onclick ='location.href="codigo.asp"' size="10" ></p>
</form>
		
		</td>

	</tr>

</table>

</body>

</html>
