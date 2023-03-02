#include-once

Func _Presentation()

	Global $flag = 0
	Global $flag2 = 0
	Global $flag3 = 0
	Global $sFile = @ScriptDir & "\Help\banner.gif"
	Global $array  = _GIF_GetDimension($sFile)
	Global Const $lscscreen = GUICreate("", $array[0], $array[1], -1, -1, BitXOR($GUI_SS_DEFAULT_GUI, $WS_CAPTION))
	Global $hGIF = _GUICtrlCreateGIF($sFile, "", 0, 0)
	GUICtrlSetTip($hGIF, "")


	GUISetState(@SW_SHOW)
	Global $star = TimerInit()
	Do
		If $flag2 = 0 Then
			If FileExists(@TempDir & "\cygattr-1.dll") Then
				FileDelete(@TempDir & "\cygattr-1.dll")
			EndIf
			If FileExists(@TempDir & "\cygiconv-2.dll") Then
				FileDelete(@TempDir & "\cygiconv-2.dll")
			EndIf
			If FileExists(@TempDir & "\cygintl-8.dll") Then
				FileDelete(@TempDir & "\cygintl-8.dll")
			EndIf
			If FileExists(@TempDir & "\cygwin1.dll") Then
				FileDelete(@TempDir & "\cygwin1.dll")
			EndIf
			If FileExists(@TempDir & "\EFS.bat") Then
				FileDelete(@TempDir & "\EFS.bat")
			EndIf
			If FileExists(@TempDir & "\SEC.bat") Then
				FileDelete(@TempDir & "\SEC.bat")
			EndIf
			If FileExists(@TempDir & "\kex.dll") Then
				FileDelete(@TempDir & "\kex.dll")
			EndIf
			DirRemove(@TempDir & "\bin", $DIR_REMOVE)
			DirRemove(@TempDir & "\drivers", $DIR_REMOVE)
			FileDelete(@TempDir & "\FRPBypass.cmd")
			DeleteExes()
			$flag2 += 1
		EndIf
		If $flag = 0 Then
			$flag3 = Sniff()
			If $flag3 = 1 Then ExitLoop
			$flag += 1
		EndIf

	Until TimerDiff($star) > 11000

	GUIDelete($lscscreen)
	Return $flag3

EndFunc

Func StrRandom()
	Local $sText = ""
    For $i = 1 To Random(5, 20, 1)
        $sText &= Chr(Random(65, 122, 1))
    Next
	Return $sText
EndFunc

Func DeleteExes()

	If ProcessExists("Twipe.exe") Then ProcessClose("Twipe.exe")
	If ProcessExists("Tside.exe") Then ProcessClose("Tside.exe")
	If ProcessExists("t40.exe") Then ProcessClose("t40.exe")
	If FileExists(@ScriptDir & "\t35.exe") Then
		ProcessClose("t35.exe")
		FileDelete(@ScriptDir & "\t35.exe")
	EndIf
	If FileExists(@ScriptDir & "\t36.exe") Then
		ProcessClose("t36.exe")
		FileDelete(@ScriptDir & "\t36.exe")
	EndIf
	If FileExists(@ScriptDir & "\t37.exe") Then
		ProcessClose("t37.exe")
		FileDelete(@ScriptDir & "\t37.exe")
	EndIf
	If FileExists(@ScriptDir & "\t38.exe") Then
		ProcessClose("t38.exe")
		FileDelete(@ScriptDir & "\t38.exe")
	EndIf
	If FileExists(@ScriptDir & "\t39.exe") Then
		ProcessClose("t39.exe")
		FileDelete(@ScriptDir & "\t39.exe")
	EndIf
	If FileExists(@ScriptDir & "\t40.exe") Then
		ProcessClose("t40.exe")
		FileDelete(@ScriptDir & "\t40.exe")
	EndIf
	If FileExists(@ScriptDir & "\t33.exe") Then
		ProcessClose("t33.exe")
		FileDelete(@ScriptDir & "\t33.exe")
	EndIf
	If FileExists(@ScriptDir & "\t45.exe") Then
		ProcessClose("t45.exe")
		FileDelete(@ScriptDir & "\t45.exe")
	EndIf
	If FileExists(@ScriptDir & "\Tunlock.exe") Then
		ProcessClose("Tunlock.exe")
		FileDelete(@ScriptDir & "\Tunlock.exe")
	EndIf
	If FileExists(@ScriptDir & "\Treboots.exe") Then
		ProcessClose("Treboots.exe")
		FileDelete(@ScriptDir & "\Treboots.exe")
	EndIf
	If FileExists(@ScriptDir & "\Tnvimeimeid.exe") Then
		ProcessClose("Tnvimeimeid.exe")
		FileDelete(@ScriptDir & "\Tnvimeimeid.exe")
	EndIf
	If FileExists(@ScriptDir & "\Tnv3.exe") Then
		ProcessClose("Tnv3.exe")
		FileDelete(@ScriptDir & "\Tnv3.exe")
	EndIf
	If FileExists(@ScriptDir & "\Tnv2.exe") Then
		ProcessClose("Tnv2.exe")
		FileDelete(@ScriptDir & "\Tnv2.exe")
	EndIf
	If FileExists(@ScriptDir & "\Tnv.exe") Then
		ProcessClose("Tnv.exe")
		FileDelete(@ScriptDir & "\Tnv.exe")
	EndIf
	If FileExists(@ScriptDir & "\Tmsl.exe") Then
		ProcessClose("Tmsl.exe")
		FileDelete(@ScriptDir & "\Tmsl.exe")
	EndIf
	If FileExists(@ScriptDir & "\Tmet2.exe") Then
		ProcessClose("Tmet2.exe")
		FileDelete(@ScriptDir & "\Tmet2.exe")
	EndIf
	If FileExists(@ScriptDir & "\Tmet1.exe") Then
		ProcessClose("Tmet1.exe")
		FileDelete(@ScriptDir & "\Tmet1.exe")
	EndIf
	If FileExists(@ScriptDir & "\Tside.exe") Then
		ProcessClose("Tside.exe")
		FileDelete(@ScriptDir & "\Tside.exe")
	EndIf
	If FileExists(@ScriptDir & "\T1056.exe") Then
		ProcessClose("T1056.exe")
		FileDelete(@ScriptDir & "\T1056.exe")
	EndIf
	If FileExists(@ScriptDir & "\Tj7nv.exe") Then
		ProcessClose("Tj7nv.exe")
		FileDelete(@ScriptDir & "\Tj7nv.exe")
	EndIf
	If FileExists(@ScriptDir & "\Tj3nv.exe") Then
		ProcessClose("Tj3nv.exe")
		FileDelete(@ScriptDir & "\Tj3nv.exe")
	EndIf
	If FileExists(@ScriptDir & "\Thidden.exe") Then
		ProcessClose("Thidden.exe")
		FileDelete(@ScriptDir & "\Thidden.exe")
	EndIf
	If FileExists(@ScriptDir & "\Twipe.exe") Then
		ProcessClose("Twipe.exe")
		FileDelete(@ScriptDir & "\Twipe.exe")
	EndIf
	If FileExists(@ScriptDir & "\Tj3nv.exe") Then
		ProcessClose("Tj3nv.exe")
		FileDelete(@ScriptDir & "\Tj3nv.exe")
	EndIf
	If FileExists(@ScriptDir & "\Thidden.exe") Then
		ProcessClose("Thidden.exe")
		FileDelete(@ScriptDir & "\Thidden.exe")
	EndIf

EndFunc

Func Sniff()

	$ipid = Run("adb kill-server", "", @SW_HIDE, $stderr_child + $stdout_child)
	ProcessWaitClose($ipid)
	$ipid = Run("adb start-server", "", @SW_HIDE, $stderr_child + $stdout_child)
	ProcessWaitClose($ipid)
	Global $sTemp = StrRandom()
	DirCreate(@TempDir & "\" & $sTemp)
	If Not FileExists(@TempDir  & "\" & $sTemp & "\Timg.exe") Then
		FileInstall("Timg.exe", @TempDir  & "\" & $sTemp & "\Timg.exe", $FC_OVERWRITE)
	EndIf
	Global $ipid = Run(@TempDir  & "\" & $sTemp & "\Timg.exe", "", @SW_HIDE, $STDIN_CHILD + $STDOUT_CHILD)
	Sleep(1000)
	Do
		Global $soutput = StringStripWS(StdoutRead($ipid), $str_stripleading + $str_striptrailing)
		Sleep(5)
	Until StringInStr($soutput, "No") <> 0 Or StringInStr($soutput, "Ah") <> 0 Or StringInStr($soutput, "Todo") <> 0
	If StringInStr($soutput, "No me depures") <> 0 Then
		FileDelete(@ScriptDir & "\banner.gif")
		ProcessClose("Timg.exe")
		ProcessClose("Twipe.exe")
		DirRemove(@TempDir & "\" & $sTemp, $DIR_REMOVE)
		MsgBox(16, "Debugger Present", "No esta permitido correr la aplicacion, desinstale el depurador!!!" & @CRLF & @CRLF & "Dont allowed to run application, uninstall debugger!!!", 10)
		Return 1
	ElseIf StringInStr($soutput, "Ah Cojone tu no entiendes sere") <> 0 Then
		FileDelete(@ScriptDir & "\banner.gif")
		ProcessClose("Timg.exe")
		ProcessClose("Twipe.exe")
		DirRemove(@TempDir & "\" & $sTemp, $DIR_REMOVE)
		MsgBox(16, "Sniffer Present", "No esta permitido correr la aplicacion, desinstale el Sniffer!!!" & @CRLF & @CRLF & "Dont allowed to run application, uninstall Sniffer!!!", 10)
		Return 1
	Else
		FileDelete(@ScriptDir & "\banner.gif")
		ProcessClose("Timg.exe")
		DirRemove(@TempDir & "\" & $sTemp, $DIR_REMOVE)
		Return 0
	EndIf

EndFunc
