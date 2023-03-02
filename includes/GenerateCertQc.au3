#include-once

Func GenerateQcomCert($modelsam, $imei, $Serial, $imeisign, $PUBKEYOR, $PUBKEYSIGNOR)

	Global $counter3 = 1
	While 1
		Global $nameran = StrRandom()
		Global $cert = FileOpen(@TempDir & $nameran, 2)
		FileWriteLine($cert, "; MC-U Backuped Cert do not modify this file")
		FileWriteLine($cert, "[cert]")
		FileWriteLine($cert, "Model=" & $modelsam)
		FileWriteLine($cert, "IMEI=" & $imei)
		FileWriteLine($cert, "SerNo=" & $Serial)
		FileWriteLine($cert, "ImeiSign=" & $imeisign)
		FileWriteLine($cert, "PubKey=" & $PUBKEYOR)
		FileWriteLine($cert, "PubKeySign=" & $PUBKEYSIGNOR)
		FileMove(@TempDir & $nameran, @MyDocumentsDir & "\Backup_MCU\CERT\" & $modelsam & "_" & $Serial & "_" & $imei & ".cert", $FC_OVERWRITE + $FC_CREATEPATH)
		Sleep(1000)
		If FileExists(@MyDocumentsDir & "\Backup_MCU\CERT\" & $modelsam & "_" & $Serial & "_" & $imei & ".cert") Then
			ExitLoop
		Else
			$counter3 += 1
		EndIf
		If $counter3 > 3 Then
			Return False
			ExitLoop
		EndIf
	WEnd

EndFunc