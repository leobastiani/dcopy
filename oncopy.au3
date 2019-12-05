#include <Misc.au3>

_Singleton("dcopy")
AutoItSetOption("TrayAutoPause", 0)

If UBound($CmdLine) == 1 Then
    MsgBox(4096, "Usage", "oncopy [command]")
EndIf

HotKeySet("{ESC}", "Terminate")

$hWnd = WinGetHandle("[REGEXPTITLE:(?i)(\d+% concluído\(s\)|.*Descoberto.*)]")
If WinGetState($hWnd) = 5 Then
    Exit
EndIf
While 1
    If WinGetState($hWnd) = 5 Then
        ; se for diferente, pode sair
        ExitLoop
    EndIf
    Sleep(3000)
WEnd
Run("cmd /c " & $CmdLine[1])


Func Terminate()
    Exit
EndFunc   ;==>Terminate