Attribute VB_Name = "Módulo1"
Function PegarPrimeiroESegundoNome(Texto As String) As String
    Dim Nomes() As String
    Texto = RemoverAcentos(Texto) ' Remove acentos
    Nomes = Split(Texto, " ") ' Divide o texto por espaço

    ' Verifica se há pelo menos dois nomes
    If UBound(Nomes) >= 1 Then
        PegarPrimeiroESegundoNome = Nomes(0) & " " & Nomes(1) ' Primeiro e segundo nome
    Else
        PegarPrimeiroESegundoNome = Nomes(0) ' Retorna apenas o primeiro nome se houver só um
    End If
End Function

Function RemoverAcentos(Texto As String) As String
    Dim Acentos As String
    Dim SemAcentos As String
    Dim i As Integer

    Acentos = "áàâãäéèêëíìîïóòôõöúùûüçÁÀÂÃÄÉÈÊËÍÌÎÏÓÒÔÕÖÚÙÛÜÇ"
    SemAcentos = "aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC"
    
    RemoverAcentos = Texto
    
    For i = 1 To Len(Acentos)
        RemoverAcentos = Replace(RemoverAcentos, Mid(Acentos, i, 1), Mid(SemAcentos, i, 1))
    Next i
End Function

