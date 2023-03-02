Func GenerateQcomCert($modelsam, $imei, $Serial, $imeisign, $PUBKEYOR, $PUBKEYSIGNOR)

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
	_Crypt_EncryptFile(@MyDocumentsDir & "\Backup_MCU\CERT\" & $modelsam & "_" & $Serial & "_" & $imei & ".cert", @MyDocumentsDir & "\Backup_MCU\CERT\" & $modelsam & "_" & $Serial & "_" & $imei & ".cert.mcu", $decrypt, $iAlgorithm)
	_GUICtrlEdit_SetText($Edit1, GUICtrlRead($Edit1) & " Cert guardado en: " & @MyDocumentsDir & "\Backup_MCU\CERT\" & $modelsam & "_" & $Serial & "_" & $imei & ".cert.mcu" & @CRLF)
	_GUICtrlEdit_LineScroll($Edit1, 0, _GUICtrlEdit_GetLineCount($Edit1))
	FileDelete(@MyDocumentsDir & "\Backup_MCU\CERT\" & $modelsam & "_" & $Serial & "_" & $imei & ".cert")

EndFunc