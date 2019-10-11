<%@ Language=VBScript %>
<%
OPTION EXPLICIT

DIM pdf,a
DIM x1, y1, x2, y2, salto

%>
<!--#INCLUDE FILE="adovbs.inc"-->
<%

comenzar

'_________________________________________________ __________________________________________________ ____
Private Sub comenzar()
Imprimir
End Sub
'_________________________________________________ __________________________________________________ _____

'_________________________________________________ __________________________________________________ _____
Private Sub Imprimir()
%>
<!--#include file="fpdf.asp"-->
<%
Set pdf=CreateJsObject("FPDF")
pdf.CreatePDF "p","mm","Letter"
pdf.SetPath("fpdf/")
pdf.Open()

' COORDENADAS INICIALES
x1 = 6
y1 = 7
x2 = 193
y2 = 140

pdf.AddPage()

salto = 0
PDF.rect x1, y1+salto, x2, y2 'dibujo rectangulo principal

' ENCABEZADO
pdf.SetFont "times","B",12 'Tamaño de la letra
PDF.Text x1+7, y1+7+salto, "UNIVERSIDAD DE COQUIMBO"

pdf.SetFont "times","B",10
PDF.Text x1+152, y1+7+salto, "Factura #"

pdf.SetFont "times","B",10
PDF.Text x1+150, y1+10+salto, "Banco de Mi Casa"

PDF.rect x1+7, y1+10+salto, 62, 10 'dibujo rectangulo
pdf.SetFont "times","B",16
PDF.Text x1+17, y1+17+salto, "Como va quedando ? "

pdf.SetFont "times","B",20
PDF.Text x1+62, y1+28+salto, "TITULO "&a
pdf.SetFont "times","B",8 
pdf.SetFont "times","B",8
PDF.Text x1+15, y1+39+salto, "Veronica" 'escribir datos en rectangulo
PDF.Text x1+70, y1+39+salto, "Alejandro" 
PDF.Text x1+120, y1+39+salto, "Javier"


PDF.rect x1+7, y1+35+salto, 180, 5 'dibujo rectangulo
pdf.SetFont "times","B",8
PDF.Text x1+15, y1+34+salto, "DATOS 1"
PDF.Text x1+70, y1+34+salto, "DATOS 2"
PDF.Text x1+120, y1+34+salto, "DATOS 3"

' Contenido
pdf.SetFont "times","B",8

PDF.rect x1+7, y1+45+salto, 30, 5 'dibujo rectangulo
PDF.rect x1+40, y1+45+salto, 30, 5 'dibujo rectangulo

pdf.SetFont "times","B",8
PDF.Text x1+9, y1+44+salto, "otro datos"
PDF.Text x1+42, y1+44+salto, "mas datos"
' Contenido
pdf.SetFont "times","B",8
PDF.Text x1+9, y1+49+salto, "Constanza"
PDF.Text x1+42, y1+49+salto, "Chile"


pdf.line 1, y2+13+salto, 215, y2+13+salto ' Linea continua
salto = salto + 92

pdf.Close()
pdf.Output()

End Sub


%> 