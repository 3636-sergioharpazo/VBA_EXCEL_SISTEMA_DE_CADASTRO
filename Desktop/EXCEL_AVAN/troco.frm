VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} troco 
   ClientHeight    =   9360.001
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   8445.001
   OleObjectBlob   =   "troco.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "troco"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CODIGO_Click()

'TextBox24.Value.Enabled = True
VALORPERCENT.Visible = False
VALORDESCONTO.Visible = False

VALORPERCENT.Value = ""
VALORDESCONTO.Value = ""

VALORPERCENT.Enabled = False
VALORDESCONTO.Enabled = False


TextBox24.SetFocus


End Sub

Private Sub CommandButton1_Click()

Unload Me

If CODIGO.Value = True And (TextBox24.Value = "%" Or TextBox24.Value = "") Then

UserForm2.desconto.Value = 0

Exit Sub

ElseIf PROD.Value = True And VALORPERCENT.Value = "" Then

UserForm2.desconto.Value = 0

Exit Sub

ElseIf CODIGO.Value = True And (TextBox24.Value <> "%" Or TextBox24.Value <> "") Then

UserForm2.desconto.Value = TextBox24.Value

Exit Sub

ElseIf PROD.Value = True And VALORPERCENT.Value <> "" Then

UserForm2.desconto.Value = VALORPERCENT.Value


End If

End Sub

Private Sub Frame1_Click()

End Sub

Private Sub Frame2_Click()

End Sub


Private Sub Label42_Click()

End Sub

Private Sub Label43_Click()

End Sub

Private Sub PROD_Click()

VALORPERCENT.Visible = True
'VALORPERCENT.Locked = True
VALORDESCONTO.Visible = True


'TextBox24.Enabled = False
VALORDESCONTO.Enabled = True

VALORDESCONTO.SetFocus


TextBox24.Value = ""
TextBox20.Value = ""



End Sub

Private Sub TextBox25_Change()

End Sub

Private Sub textbox26_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
'TextBox1.Value = Format(Me.TextBox1.Value, "-#.##,")

      Select Case KeyAscii
        ' BackSpace e numericos
        Case 8, 48 To 57
        ' Virgula, só permite uma, para separador de decimais
        Case 44
          If InStr(1, TextBox26.Text, Chr(44), vbTextCompare) > 1 Then _
              KeyAscii = 0
              
        'Case 45
        
         ' If InStr(1, TextBox1.Text, Chr(45), vbTextCompare) > 1 Then _
          '    KeyAscii = 0
        
        Case Else ' o resto é travado
            KeyAscii = 0
      End Select
End Sub
Private Sub TextBox26_Change()

If TextBox26.Value = "" Or TextBox26.Value = "," Then

TextBox23.Value = ""
TextBox26.Value = ""

Exit Sub


ElseIf TextBox20.Value = "" And TextBox26.Value <> "" Then

    sVal3 = Format(CDbl(TextBox26.Value), "#,##0.00")
    
    'Devolve na variavel o valor do txt_desc e formata para Numerico
    sVal4 = Format(CDbl(TextBox22.Value), "#,##0.00")
    


    'Calcula o Resultado, formata como Moeda e coloca o resultado no textbox
    TextBox23 = Format((sVal3 - sVal4), "Currency")

'TextBox23.Value = TextBox26.Value - TextBox22.Value

Exit Sub

ElseIf TextBox20.Value <> "" And TextBox26.Value <> "" Then


    sVal5 = Format(CDbl(TextBox26.Value), "#,##0.00")
    
    'Devolve na variavel o valor do txt_desc e formata para Numerico
    sVal6 = Format(CDbl(TextBox20.Value), "#,##0.00")
    


    'Calcula o Resultado, formata como Moeda e coloca o resultado no textbox
    TextBox23 = Format((sVal5 - sVal6), "Currency")

'TextBox23.Value = TextBox26.Value - TextBox20.Value

End If
End Sub


Private Sub TextBox26_AfterUpdate()
    TextBox26 = Format(TextBox26, "R$ #,##0.00")
End Sub
'Private Sub TextBox26_Exit(ByVal Cancel As MSForms.ReturnBoolean)

'TextBox26.Value = Format(Me.TextBox26.Value, "R$ #,##0.00")

'End Sub
Private Sub TextBox26_Enter()

TextBox26.Value = ""
'TextBox20.Value = "R$ " & "0,00"
'TextBox20.SetFocus
'TextBox23.Value = ""
'TextBox20.Value = ""
'TextBox25.BackColor = &HFFFFFF



End Sub





Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
    If CloseMode = vbFormControlMenu Then
        Cancel = True
        'MsgBox "Favor sair do programa clicando no botão 'Sair'" _
          , vbCritical _
          , "Erro"
    End If
End Sub
Private Sub CommandButton2_Click()

End Sub

Private Sub Label39_Click()

End Sub

Private Sub TextBox20_AfterUpdate()


If TextBox20.Value > 0 And TextBox20.Value <> "," And TextBox20.Value <> "" Then

TextBox23.Value = "R$ " & CDbl(TextBox20.Value) - CDbl(TextBox22.Value)

Else


TextBox23.Value = ""
TextBox24.Value = ""

End If

Exit Sub
erro_carregamento:
MsgBox vbCrLf & "Ops! Ocorreu um erro." & vbCrLf & "Se o erro persistir, feche o programa ou tente mais tarde!", 16, "Ocorrência de Erro"

End Sub


Private Sub TextBox20_Enter()
TextBox20.Value = ""
'TextBox20.Value = "R$ " & "0,00"
TextBox20.SetFocus
TextBox23.Value = ""
TextBox24.Value = ""
TextBox25.BackColor = &HFFFFFF


End Sub

Private Sub TextBox20_change()

TextBox20.BackColor = &HFFFFFF

If TextBox20.Value = "," Then


TextBox20.Value = ""


End If


End Sub
Private Sub TextBox20_Exit(ByVal Cancel As MSForms.ReturnBoolean)

TextBox20.Value = Format(Me.TextBox20.Value, "R$ #,##0.00")

If TextBox20.Value = "R$ ,00" Then


TextBox20.Value = ""
  TextBox20.BackColor = &HFFFF&
      TextBox20.SetFocus


End If

End Sub



Private Sub textbox20_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
'TextBox1.Value = Format(Me.TextBox1.Value, "-#.##,")

      Select Case KeyAscii
        ' BackSpace e numericos
        Case 8, 48 To 57
        ' Virgula, só permite uma, para separador de decimais
        Case 44
          If InStr(1, TextBox20.Text, Chr(44), vbTextCompare) > 1 Then _
              KeyAscii = 0
              
        'Case 45
        
         ' If InStr(1, TextBox1.Text, Chr(45), vbTextCompare) > 1 Then _
          '    KeyAscii = 0
        
        Case Else ' o resto é travado
            KeyAscii = 0
      End Select
End Sub




Private Sub TextBox22_Change()

End Sub

Private Sub TextBox23_Change()
 Me.TextBox23 = Format(Me.TextBox23, "R$ #,##0.00")

End Sub

Private Sub textbox24_AfterUpdate()


End Sub
Private Sub Textbox24_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
      Select Case KeyAscii
        ' BackSpace e numericos
        Case 8, 48 To 57
        ' Virgula, só permite uma, para separador de decimais
        Case 44
          If InStr(1, TextBox24.Text, Chr(44), vbTextCompare) > 1 Then _
             KeyAscii = 0
        'TextBox11.Value = ""
        Case Else ' o resto é travado
            KeyAscii = 0
      End Select
End Sub

Private Sub TextBox24_Change()

On Error GoTo erro_carregamento


If TextBox24.Value = "%" Then

TextBox24.Value = "%"
TextBox25.Value = ""

  TextBox25.BackColor = &HFFFFFF


'TextBox23.Value = "R$ " & CDbl(TextBox20.Value) - CDbl(TextBox22.Value)

'Exit Sub

'ElseIf TextBox24.Value > 100 Then

'TextBox24.Value = "100%"

TextBox20.Value = ""


Else

  TextBox25.BackColor = &HFF00&
  TextBox26.Value = ""
TextBox23.Value = ""

Me.TextBox24.Value = Format(Val(TextBox24.Value) / 100, "##%")
TextBox24.SelStart = Len(TextBox24.Value) - 1


    sVal1 = Format(CDbl(TextBox22.Value), "#,##0.00")
    
    'Devolve na variavel o valor do textbox e formata para Numerico
    sVal2 = Format(Val(TextBox24.Value), "#,##0.00")
    

    'Calcula o Resultado, formata como Moeda e coloca o resultado no textbox
    TextBox25 = Format((sVal1 * sVal2 / 100), "Currency")
  '  TextBox26 = (sVal1 * sVal2 / 100)
    
  
  
  TextBox20.Value = TextBox22.Value - TextBox25.Value


TextBox20.Value = Format(Me.TextBox20.Value, "R$ #,##0.00")



 End If
 
If TextBox24.Value > 0 And TextBox24.Value <> "%" And TextBox20.Value <> "" Then

TextBox23.Value = "R$ " & CDbl(TextBox20.Value) - (CDbl(TextBox22.Value) - CDbl(TextBox25.Value))

Exit Sub

ElseIf TextBox24.Value = "%" And TextBox20 <> "" Then

TextBox23.Value = "R$ " & CDbl(TextBox20.Value) - CDbl(TextBox22.Value)
TextBox25.BackColor = &HFFFFFF
'Else

'TextBox23.Value = ""
End If

Exit Sub
erro_carregamento:
MsgBox vbCrLf & "Ops! Ocorreu um erro." & vbCrLf & "Se o erro persistir, feche o programa ou tente mais tarde!", 16, "Ocorrência de Erro"

End Sub

Private Sub UserForm_Initialize()
Application.ScreenUpdating = True

'   TextBox24.BackColor = &HFFFF&
   TextBox24.SetFocus
   'TextBox20.TabStop

'CODIGO.Value = True

'

TextBox22.Value = UserForm2.TextBox16.Value
End Sub




Private Sub VALORDESCONTO_Enter()
VALORDESCONTO.Value = ""
TextBox26.Value = ""
TextBox23.Value = ""



End Sub

Private Sub VALORDESCONTO_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
      Select Case KeyAscii
        ' BackSpace e numericos
        Case 8, 48 To 57
        ' Virgula, só permite uma, para separador de decimais
        Case 44
          If InStr(1, VALORDESCONTO.Text, Chr(44), vbTextCompare) > 1 Then _
             KeyAscii = 0
        'TextBox11.Value = ""
        Case Else ' o resto é travado
            KeyAscii = 0
      End Select
End Sub
Private Sub VALORDESCONTO_Change()


If VALORDESCONTO.Value = "," Then


VALORDESCONTO.Value = ""


ElseIf VALORDESCONTO.Value = "" Or VALORDESCONTO.Value = 0 Then

VALORPERCENT.Value = ""
TextBox20.Value = ""
TextBox23.Value = ""



Else

VALORPERCENT.Value = Format((VALORDESCONTO.Value / TextBox22.Value), "percent")

TextBox20.Value = TextBox22.Value - VALORDESCONTO.Value
TextBox20.Value = Format(Me.TextBox20.Value, "R$ #,##0.00")

'TextBox23.Value = TextBox26.Value - TextBox20.Value
'TextBox23.Value = Format(Me.TextBox23.Value, "R$ #,##0.00")


End If
End Sub

Private Sub VALORDESCONTO_AfterUpdate()
    VALORDESCONTO = Format(VALORDESCONTO, "R$ #,##0.00")
End Sub
'Private Sub VALORDESCONTO_Exit(ByVal Cancel As MSForms.ReturnBoolean)

'VALORDESCONTO = Format(VALORDESCONTO.Value, "R$ #,##0.00")

'End Sub


Private Sub VALORPERCENT_Change()

End Sub
