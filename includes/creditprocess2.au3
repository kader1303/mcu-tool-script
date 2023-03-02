Func creditprocess2($dime, $imei, $opt)

	If $dime == "1" Then
		Global $precio = Cost($opt, $key)
		If $precio == "False" Then
			$precio = "NO"
			Return $precio
		Else
			If Recheck($imei) <> $username & $pro Or Recheck($imei) == "False" Then
				_GUICtrlEdit_SetText($Edit1, GUICtrlRead($Edit1) & " Descontando Creditos... " )
				_GUICtrlEdit_LineScroll($Edit1, 0, _GUICtrlEdit_GetLineCount($Edit1))
				Global $seguire = TendreCreditos($precio)
				If $seguire == "False" Then
					MsgBox(16, "MC-U Tool", "Not enough credit, need to charge account!")
					$precio = "NO"
					Return $precio
				Else
					Global $creditosenstock = CreditExistent($username)
					Global $credremain = $creditosenstock - $precio
					CreditAdjust($username, $credremain)
					_GUICtrlEdit_SetText($Edit1, GUICtrlRead($Edit1) & "OK" & @CRLF)
					_GUICtrlEdit_LineScroll($Edit1, 0, _GUICtrlEdit_GetLineCount($Edit1))
					Recurrencia($imei, $pro)
					Return $precio
				EndIf
			Else
				_GUICtrlEdit_SetText($Edit1, GUICtrlRead($Edit1) & " Dispositivo listado en la base de datos..." & @CRLF)
				_GUICtrlEdit_LineScroll($Edit1, 0, _GUICtrlEdit_GetLineCount($Edit1))
				Return 1
			EndIf
		EndIf
	Else
		Return 'yes'
	EndIf

EndFunc