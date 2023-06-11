VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} GRAFICOS 
   ClientHeight    =   9435.001
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   15135
   OleObjectBlob   =   "GRAFICOS.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "GRAFICOS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim ChartNum As Integer


Private Sub CommandButton4_Click()

On Error GoTo erro_carregamento

'Fechar form

Application.ScreenUpdating = False
Application.Calculation = xlCalculationManual


     ActiveWorkbook.Unprotect Password:="LeAfArD.P053230PoRtUgAl,.;~~]´´[="

   
Sheets("gráficos").Visible = False
'Sheets("dados").Visible = False


Sheets("Menu Inicial").Select
ActiveWorkbook.Protect Password:="LeAfArD.P053230PoRtUgAl,.;~~]´´[=", Structure:=True, Windows:=True
ActiveSheet.Protect Password:="LeAfArD.P053230PoRtUgAl,.;~~]´´[=", DrawingObjects:=True, Contents:=True, Scenarios:=True
    ActiveSheet.EnableSelection = xlNoSelection

      Application.DisplayFullScreen = True

Application.Calculation = xlCalculationAutomatic

Application.ScreenUpdating = True

Unload Me

Exit Sub
erro_carregamento:
MsgBox vbCrLf & "Ops! Ocorreu um erro." & vbCrLf & "Se o erro persistir, feche o programa ou tente mais tarde!", 16, "Ocorrência de Erro"

End Sub

Private Sub Frame1_Click()

End Sub

Private Sub Frame74_Click()

End Sub

Private Sub Image1_BeforeDragOver(ByVal Cancel As MSForms.ReturnBoolean, ByVal Data As MSForms.DataObject, ByVal X As Single, ByVal Y As Single, ByVal DragState As MSForms.fmDragState, ByVal Effect As MSForms.ReturnEffect, ByVal Shift As Integer)

End Sub

Private Sub Image1_Click()

End Sub

Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
    If CloseMode = vbFormControlMenu Then
        Cancel = True
        'MsgBox "Favor sair do programa clicando no botão 'Sair'" _
          , vbCritical _
          , "Erro"
    End If
End Sub

Private Sub UpdateChart()

    Set CurrentChart = Sheets("Gráficos").ChartObjects(ChartNum).Chart
    CurrentChart.Parent.Width = 650
    CurrentChart.Parent.Height = 350

'   Save chart as GIF
    Fname = ThisWorkbook.Path & Application.PathSeparator & "temp.gif"
    CurrentChart.Export Filename:=Fname, FilterName:="GIF"

'   Show the chart
    Image1.Picture = LoadPicture(Fname)
End Sub


Private Sub ANO_Change()

''Application.Calculation = xlCalculationManual

If ANO.Value = "2013" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 1
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2014" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 2
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2015" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 3
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2

'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2016" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 4
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2017" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 5
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2018" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 6
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value


ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2019" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 7
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value


ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2020" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 8
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2021" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 9
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2022" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 10
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2023" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 11
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2024" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 12
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2025" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 13
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2026" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 14
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2027" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 15
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2028" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 16
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2029" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 17
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2030" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 18
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2031" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 19
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2032" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 20
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2033" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 21
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2034" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 22
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart



Exit Sub

ElseIf ANO.Value = "2035" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 23
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2036" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 24
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2037" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 25
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2038" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 26
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart



Exit Sub

ElseIf ANO.Value = "2039" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 27
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2040" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 28
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart



Exit Sub

ElseIf ANO.Value = "2041" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 29
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2042" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 30
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2043" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 31
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2044" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 32
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart


Exit Sub

ElseIf ANO.Value = "2045" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 33
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2046" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 34
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2047" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 35
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2048" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 36
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2049" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 37
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart

Exit Sub

ElseIf ANO.Value = "2050" Then
'Application.Calculation = xlCalculationManual

Sheets("Caixa Loja").Range("v6").Value = 38
'GRAFICO.Caption = Sheets("DESPESAS MES").Range("I2").Value
'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

ChartNum = 2
'Application.Calculation = xlCalculationAutomatic

UpdateChart




End If
End Sub

'Option Explicit
'Autor: Tomás Vásquez. - Santo André-SP-BR
'       tomas.vasquez.sites.uol.com.br
'       tomas.vasquez.blog.uol.com.br
'       tomas.vasquez@uol.com.br
'Data:  15 de Janeiro de 2007.
'Versão: 1.00 - Em VBA Microsoft Excel 2003
'Fórum: http://www.juliobattisti.com.br/forum
'       [Excel Avançado - Macros e Vba]
'Private TextoDigitado As String









Private Sub NextButton_Click()
If ChartNum = 4 Then ChartNum = 1 Else ChartNum = ChartNum + 1
'GRAFICO.Caption = Sheets("Caixa Loja").Range("R2").Value
'ANO.Visible = True
'Label104.Visible = True



    UpdateChart
End Sub

Private Sub PreviousButton_Click()
 If ChartNum = 1 Then ChartNum = 4 Else ChartNum = ChartNum - 1
 'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value
'ANO.Visible = False
'Label104.Visible = False

    UpdateChart
End Sub



Private Sub Userform_Activate()



End Sub


Private Sub UserForm_Initialize()
  
'Application.Calculation = xlCalculationManual


  Application.ScreenUpdating = False
     ActiveWorkbook.Unprotect Password:="LeAfArD.P053230PoRtUgAl,.;~~]´´[="

     Sheets("Gráficos").Select
   
      

    ActiveSheet.ChartObjects("Gráfico 3").Activate
    ActiveChart.SeriesCollection(1).Select
    With ActiveChart.ChartGroups(1)
        .VaryByCategories = True
        .FirstSliceAngle = 0
    End With
    
    
    ActiveSheet.ChartObjects("Gráfico 4").Activate
    ActiveChart.SeriesCollection(1).Select
    With ActiveChart.ChartGroups(1)
        .VaryByCategories = True
        .FirstSliceAngle = 0
    End With
    
        Sheets("Menu Inicial").Select

'Application.Calculation = xlCalculationAutomatic

Application.ScreenUpdating = True
  
  
  
  



   
onOff = True
'inicia o ciclo de a cada segundo actualizar as horas no formulário
Application.OnTime Now + TimeValue("00:00:01"), "MostrarHoras"

ChartNum = 2
UpdateChart


'GRAFICO.Caption = Sheets("Caixa Loja").Range("CD2").Value

    
ANO.AddItem "2013"
ANO.AddItem "2014"
ANO.AddItem "2015"
ANO.AddItem "2016"
ANO.AddItem "2017"
ANO.AddItem "2018"
ANO.AddItem "2019"
ANO.AddItem "2020"
ANO.AddItem "2021"
ANO.AddItem "2022"
ANO.AddItem "2023"
ANO.AddItem "2024"
ANO.AddItem "2025"
ANO.AddItem "2026"
ANO.AddItem "2027"
ANO.AddItem "2028"
ANO.AddItem "2029"
ANO.AddItem "2030"
ANO.AddItem "2031"
ANO.AddItem "2032"
ANO.AddItem "2033"
ANO.AddItem "2034"
ANO.AddItem "2035"
ANO.AddItem "2036"
ANO.AddItem "2037"
ANO.AddItem "2038"
ANO.AddItem "2039"
ANO.AddItem "2040"
ANO.AddItem "2041"
ANO.AddItem "2042"
ANO.AddItem "2043"
ANO.AddItem "2044"
ANO.AddItem "2045"
ANO.AddItem "2046"
ANO.AddItem "2047"
ANO.AddItem "2048"
ANO.AddItem "2049"
ANO.AddItem "2050"
  
 
    
End Sub




