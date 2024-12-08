@ECHO OFF
chcp 65001 > nul
title PastaSegura
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST PastaSegura goto MDLOCKER
:MENU
echo 1. Bloquear/Desbloquear Pasta
echo 2. Calculadora
echo 3. Sair
set /p "option=>"
if %option%==1 goto LOCK_MENU
if %option%==2 goto CALCULATOR
if %option%==3 goto END
echo Escolha inválida.
goto MENU

:LOCK_MENU
:CONFIRM
echo Tem certeza que deseja bloquear a pasta(S/N)
set/p "cho=>"
if %cho%==S goto LOCK
if %cho%==s goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo Escolha inválida.
goto CONFIRM

:LOCK
ren PastaSegura "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Pasta bloqueada
goto MENU

:UNLOCK
echo Digite a Senha da pasta para DESBLOQUEAR
set/p "pass=>"
if NOT %pass%==3636 goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" PastaSegura
echo Pasta desbloqueada com sucesso
goto MENU

:FAIL
echo Senha inválida
goto MENU

:MDLOCKER
md PastaSegura
echo Pasta criada com sucesso
goto MENU

:CALCULATOR
echo Calculadora
set /p "num1=Digite o primeiro número: "
set /p "num2=Digite o segundo número: "
echo Escolha a operação (+, -, *, /):
set /p "op=Operação: "
if %op%==+ set /a result=%num1%+%num2%
if %op%== - set /a result=%num1%-%num2%
if %op%==* set /a result=%num1%*%num2%
if %op%==/ set /a result=%num1%/%num2%
echo O resultado é: %result%
goto MENU

:END
exit
