VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ProgressBar 
   Caption         =   "Processamento"
   ClientHeight    =   1305
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4695
   OleObjectBlob   =   "ProgressBar.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "ProgressBar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False






Option Explicit


Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
    If CloseMode = vbFormControlMenu Then
        Cancel = True
        'MsgBox "Favor sair do programa clicando no botão 'Sair'" _
          , vbCritical _
          , "Erro"
    End If
End Sub

Private Sub Label1_Click()

End Sub

Private Sub Label2_Click()

End Sub

Private Sub Label3_Click()

End Sub

Private Sub TextBox5_Change()

End Sub

Private Sub Userform_Activate()

    Application.Cursor = xlWait
    ProgressBar.MousePointer = fmMousePointerHourGlass
    DoEvents
    Call CalculateData
     
    'ActiveWorkbook.Save
    Application.Cursor = xlDefault
    
    Unload Me

End Sub

Private Sub UserForm_Initialize()

    
    
   ' salva.Visible = False
    'Label3.Visible = True

    'TextBox2.Left = TextBox1.Left
    'TextBox2.Top = TextBox1.Top + 3
    'TextBox4.Left = TextBox3.Left
    'TextBox4.Top = TextBox3.Top + 3
    'TextBox2.Width = 0
    TextBox3.Width = 200
    TextBox5.Width = 0
End Sub

Sub CalculateData()

Dim totaL1          As Long
Dim Total2          As Long
Dim X               As Long
Dim Y               As Long
Dim MyTimer         As Double

    
    totaL1 = 1
    Total2 = 2500
    
    For X = 1 To totaL1
        For Y = 1 To Total2
            MyTimer = Timer
            ProgressBar.TextBox5.Width = (Y / Total2) * 200
            ProgressBar.Label2.Caption = Y / 25 & "%"
            DoEvents
        Next Y
        ProgressBar.TextBox4.Width = (X / totaL1) * 100
        'ProgressBar.Label1.Caption = "Gráfico: " & x & " de " & Total1
       
    Next X

End Sub
