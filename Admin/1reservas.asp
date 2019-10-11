<!-- #include file="../includes/conn.inc" -->
<!-- #include file="../includes/valida_sesion.inc" --><%

Set Cn = Server.CreateObject("ADODB.Connection")
Set Rs = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")

Cn.Open CadenaConexion

a = 0
Usuario = Session("usuario")
Familia = Session("familia")


sSql = "select COUNT(*) from reserva1 where existe = 1 and Not fila in ('30','31','32')"
Rs.Open sSql, Cn

sSql = " select asiento from RESERVA1 where estado = '1' and familia = '" & Usuario & "' "
Rs2.Open sSql, Cn

total = Rs(0)
Rs.Close %>

<html lang="es">
<head>
  <meta charset="UTF-8">
<title>Reservas</title>

<style type="text/css">
.azul    {font: normal 8px Courier New; background-color:blue; padding-left: 3px; color: #FFFFFF; border: 1px; height: 15px; width: 23px;}
.rojo    {font: normal 8px Courier New; background-color:red; padding-left: 3px; color: #FFFFFF; border: 1px; height: 15px; width: 23px;}
.verde   {font: normal 8px Courier New; background-color:#AAFF7F; padding-left: 3px; color: #CC0000; border: 1px; height: 15px; width: 23px;}
.tooltip {font: bold 35px Geneva, Arial, Helvetica, sans-serif; border:3px solid #3B73AC; background:#FFEFF5; color:#3B73AC!important;}
<!--
a.tooltip            {font: bold 35px Geneva, Arial, Helvetica, sans-serif; color:#CC3E6E; text-decoration:none;}
a.tooltip:hover      {text-decoration:none;}
a.tooltip span       {display:none; margin: 0 0 0 10px; padding:10px 10px; }
a.tooltip:hover span {display:inline; position:absolute; border: 3px solid #3B73AC; background:#FFEFF5; color:#3B73AC!important;}


.auto-style3 {
	color: #FF0000;
	font-size: small;
}


.auto-style4 {
	border-collapse: collapse;
	border: 1px solid #0000FF;
	background-color: #FFFFFF;
}


.auto-style5 {
	border: 1px solid #FFFF00;
	font-family: "Arial Narrow";
	font-size: x-small;
	text-align: center;
	background-color: #0000FF;
}


.auto-style8 {
	font-size: small;
}
.auto-style10 {
	border-left-color: #FFFFFF;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	font-size: x-small;
	color: #000066;
}


.auto-style12 {
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	font-size: x-small;
	color: #0000FF;
}


.auto-style13 {
	border-left-color: #FFFFFF;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	font-size: x-small;
	color:#990000;
}


.auto-style14 {
	color: #FFFFFF;
}
.auto-style15 {
	font-size: medium;
}


.auto-style16 {
	text-align: center;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	color: #FF0000;
}


.auto-style17 {
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
}
.auto-style19 {
	color: #000080;
}


-->

  .button
  {
  border: 2px solid #DBE1EB;
  font-size: 18px;
  font-family: Arial, Verdana;
  padding-left: 7px;
  padding-right: 7px;
  padding-top: 5px;
  padding-bottom: 5px;
  border-radius: 7px;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  -o-border-radius: 5px;
  background: #4972B5;
  background: linear-gradient(left, #4972B5, #618ACB);
  background: -moz-linear-gradient(left, #4972B5, #618ACB);
  background: -webkit-linear-gradient(left, #4972B5, #618ACB);
  background: -o-linear-gradient(left, #4972B5, #618ACB);
  color: #FFFFFF;
  }
   
  .button:hover
  {
  background: #365D9D;
  background: linear-gradient(left, #365D9D, #436CAD);
  background: -moz-linear-gradient(left, #365D9D, #436CAD);
  background: -webkit-linear-gradient(left, #365D9D, #436CAD);
  background: -o-linear-gradient(left, #365D9D, #436CAD);
  color: #FFFFFF;
  border-color: #FBFFAD;
  }
.auto-style21 {
	color: #000066;
}
.auto-style22 {
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	font-size: x-small;
	color: #000066;
}
.auto-style23 {
	font-family: Arial, Helvetica, sans-serif;
}
.auto-style24 {
	font-size: x-small;
}
.auto-style25 {
	color: #FF0000;
}
.auto-style26 {
	font-size: large;
}
.auto-style27 {
	color: #FF0000;
	font-size: large;
}
</style>

<script>
function ventanagrande(obj, color){
   asiento = obj.name;
   window.open("1confirma.asp?asiento=" + asiento + "&color=" + color,"ventana1","width=420, height=180, top=150, left=580, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no")
}

function over(obj) {
   idAsiento.style.visibility = "visible";
   idAsiento.style.left = document.body.scrollLeft + event.clientX;
   idAsiento.style.top  = document.body.scrollTop + event.clientY;
   idAsiento.innerText = obj.value;
}

function out() {
   idAsiento.style.visibility = "hidden";
}

function makeArray(n){
  this.length = n;
  for (i=1;i<=n;i++){
    this[i]=0;
  }
  return this;
}

function Muestrafecha() {
//arreglo de los meses
  var meses = new makeArray(12);
  meses[0]  = "Enero";
  meses[1]  = "Febrero";
  meses[2]  = "Marzo";
  meses[3]  = "Abril";
  meses[4]  = "Mayo";
  meses[5]  = "Junio";
  meses[6]  = "Julio";
  meses[7]  = "Agosto";
  meses[8]  = "Septiembre";
  meses[9]  = "Octubre";
  meses[10] = "Noviembre";
  meses[11] = "Deciembre";

//arreglo de los dias
  var dias_de_la_semana = new makeArray(7);
  dias_de_la_semana[0]  = "Domingo";
  dias_de_la_semana[1]  = "Lunes";
  dias_de_la_semana[2]  = "Martes";
  dias_de_la_semana[3]  = "Miércoles";
  dias_de_la_semana[4]  = "Jueves";
  dias_de_la_semana[5]  = "Viernes";
  dias_de_la_semana[6]  = "Sábado";

  var today = new Date();
  var day   = today.getDate();
  var month = today.getMonth();
  var year  = today.getYear();
  var dia = today.getDay();

  if (year < 1000) {year += 1900; }

// mostrar la fecha
return( " " + dias_de_la_semana[dia] + ", " + day + " de " + meses[month] + " del " + year);
}
</script>



</head>
<body >

<form name="frmAlumnos" method="post" action="1entradas.asp">
<table width="100%" border=1 style="border-collapse: collapse" bordercolor="#0000FF">
   <tr>
      <td>
         <table width="100%" border=1 style="border-collapse: collapse" bordercolor="#0000FF">
            <tr>
               <td align="center">
                  <table width="100%" cellpadding="0" style="border-collapse: collapse" height="41">
                    <tr>
                       <td style="width: 32%">
                  		&nbsp;
                  		<img border="0" src="../img/LOGO_ALPAMAYO_1.JPG" width="154" height="49"></td>
                       <td align="center" style="width: 31%"><font face="Arial" color="#000080" size="4"><b>
					   <span ><span class="auto-style8">RESERVA DE ASIENTOS</span></span><br class="auto-style8">
					   ESQUISSE 2019<span><span class="auto-style3"><br></span>
					   <span class="auto-style27">** SÁBADO </span>
					   <span class="auto-style26"> 21
					   <span class="auto-style25">**</span></span></span></b></font></td>
                       <td width="40%" align="right"><font face="Arial" color="#000080" size="2"><b>&nbsp;<script type="text/javascript" language="JavaScript">document.write (Muestrafecha());</script></b></font>&nbsp; </td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
         <table class="auto-style4">
         <tr>
         <td style="height: 3; width: 86px;" ><span class="auto-style21">&nbsp;</span><span class="auto-style22"><strong>Familia</strong></span><span class="auto-style21">: 
         </span> 
         <td style="height: 23; width: 242" class="auto-style13"> <strong> <%= familia %>
		 </strong></td>

         <td style="height: 23; width: 177;" class="auto-style10" ><strong>Asientos reservados :  
		 </strong>  </td>
        
         
		<% do while not rs2.eof 
		
		a = a + 1 %>
		<td width="60" style="height: 22" class="auto-style5"><strong>
		<span class="auto-style14"><span class="auto-style15">F<%= Rs2("asiento") %></span>
		</span>
		</strong></td>
		<% rs2.movenext
		loop
		rs2.close %>
		<td></td>
		<td><span class="auto-style12"><strong>Cantidad de asientos :</strong></span></td>
		<td class="auto-style16" style="width: 29px"><strong><%= a %></strong></td>

         </tr>
         </table>

         <table align=center border="0" cellpadding="1" cellspacing="0" bordercolor="#008AB8"  style="border-collapse: collapse" width="600">
                                             
            <tr><td colspan="60" style="height: 19px"></td>
            <%
            sSql = "select fila, isnull(letra, '') as letra from filas order by 1 desc"
            Rs1.Open sSql, Cn
            Do Until Rs1.EOF%>
            <tr>
              <% If Rs1("letra") = "" Then %>
              <td colspan="11">
              <td>&nbsp;&nbsp;</td>
              <td colspan="14">
              <td>&nbsp;&nbsp;</td>
              <td colspan="14">
              <td>&nbsp;&nbsp;</td>
               <td colspan="60" align="center" style="height:10px"></td><%
               Else
                  sSql = "select columna, existe, asiento, estado, familia, final from reserva1 where fila = '" & Rs1("letra") & "'"
                  Rs.Open sSql, Cn
                  Do Until Rs.EOF
                     If Rs("estado") Then
                        reservas = reservas + 1
                        If Rs("familia") = Session("usuario") Then
	                        clase = "azul"
                        Else
                        	clase = "rojo"
                        End If
                     Else
                        clase = "verde"
                     End If%>
                        <td nowrap><%If Rs("existe") Then%><input type="button" name="<%= Rs("asiento") %>" value="F<%= Rs("asiento") %>" class="<%= clase %>" <%If clase = "rojo" Then%> disabled="disabled"<%End If%> <% If Rs("final") = "1" Then%> <% If clase = "azul" Then %> disabled="disabled" <% End If  %> <% End If %> onclick="ventanagrande(this, '<%= clase %>')" onmouseover="over(this)" onmouseout="out()"/></a><%End If%></td><%
                     Rs.MoveNext
                  Loop
                  Rs.Close
               End If%>
            </tr><%
               Rs1.MoveNext
            Loop
            Rs1.Close%>
            <tr><td colspan="60" style="height: 20px"></td>
            <tr>
               <td colspan="60" align="center">
	         	   <table border="1" width="86%" bgcolor="#3399FF" style="border-collapse: collapse" bordercolor="#000080">
	         		   <tr>
	         			   <td align="center">
	         			      <font face="Arial Black"><b>
	         			         E&nbsp;&nbsp;&nbsp;&nbsp;
	         			         S&nbsp;&nbsp;&nbsp;&nbsp;
	         			         C&nbsp;&nbsp;&nbsp;&nbsp;
	         			         E&nbsp;&nbsp;&nbsp;&nbsp;
	         			         N&nbsp;&nbsp;&nbsp;&nbsp;
	         			         A&nbsp;&nbsp;&nbsp;&nbsp;
	         			         R&nbsp;&nbsp;&nbsp;&nbsp;
	         			         I&nbsp;&nbsp;&nbsp;&nbsp;
	         			         O</b>
	         			      </font>
	         			   </td>
	         		   </tr>
	         	   </table>
	            </td>
            </tr>
            <tr><td colspan="75" style="height: 21px"></td></tr>
         </table>
         <table width="100%" border=1 style="border-collapse: collapse" bordercolor="#0000FF">
            <tr>
               <td align="center">
                  <table width="100%" border="0" cellpadding="0" style="border-collapse: collapse">
                    <tr>
                       <td style="height: 19px; width: 26%;"><b><font size="2" color="#000066" face="Arial">TOTAL ASIENTOS 
					   RESERVADOS&nbsp; </font><font face="Arial" color="#000066">:  </font><font face="Arial" color="#CC0000"> &nbsp;<%= a %>&nbsp; </font></b></td>
                       <td class="auto-style17" rowspan="2">&nbsp;<input type="submit" class="button" value="FINALIZAR SELECCION ===>"></td>
                        <td >  
						<strong>
					    <span >
					    <span class="auto-style19"><span class="auto-style23">
						<span class="auto-style24">RESERVADOS</span></span></span><span class="auto-style23"><span class="auto-style24"><span class="auto-style25">:<%= reservas %></span></span></span></span></strong></td>
                     
                     <tr>
                      <td style="width: 26%"><b>
					  <font size="2" color="#000066" face="Arial">IMPORTE TOTAL </font><font face="Arial" color="#CC0000">:  </font><font face="Arial" color="#CC0000">  
					  S/. &nbsp;<%= a * 50 %>&nbsp; </font></b></td>


                     <td><b><font face="Arial" color="#000066" size="2">DISPONIBLES: </font><font face="Arial" color="#CC0000">&nbsp;<%= total - reservas %></font></b></td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>
</form>
<span id="idAsiento" class="tooltip" style="position:absolute; left:5px; top:5px; z-index:7; overflow: visible"></span>
</body>
</html><%
Cn.Close
Set Rs = Nothing
Set Rs1= Nothing
Set Cn = Nothing
%>
