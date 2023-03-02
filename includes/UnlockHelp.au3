#include-once

Func SearchForData($model)
	Global $v = 0
	Global $compare = False
	Global $narray[]= [""]
	Global $sArrayModels[94] = ["SM-J260T", "SM-J260T1", "SM-J737T", "SM-J737T1", "SM-G360T", "SM-G360T1", "SM-G530T", "SM-G530T1", "SM-N920T", "SM-N920T1", "SM-G920T", "SM-G920T1", "SM-G925T", "SM-G925T1", "SM-G928T", "SM-G928T1", "SM-J700T", "SM-J700T1", "SM-G550T", "SM-G550T1", "SM-J327T", "SM-J327T1", "SPH-L720", "SPH-L720T", "SM-J320P", "SM-J700P", "SM-G860P", "SM-G900P", "SM-G920P", "SM-G925P", "SM-G928P", "SM-N900P", "SM-N910P", "SM-N915P", "SM-N920P", "SM-N930", "SM-T337P", "SM-T587P", "SM-J327P", "SM-J727P", "SM-G930P", "SM-G935P", "SM-N930P", "SM-G950U", "SM-G955U", "SM-N950U", "GT-S7710", "GT-i9502", "GT-I9295", "GT-I9230", "GT-I9190", "GT-I9105", "GT-S6310", "GT-S5303", "SM-G3812", "GT-I8550", "GT-S7572", "GT-S5280", "GT-S7260", "GT-S7582", "SM-G910S", "GT-S5310", "SM-N900", "GT-I9200", "GT-I8730", "GT-I8260", "GT-i9500", "SGH-i337", "SGH-i545", "SGH-M919", "SHV-E330S", "GT-i9505G", "GT-i9515", "GT-i9515L", "SCH-i535", "SGH-i747", "SGH-T999", "SPH-L710", "GT-S7560M", "GT-S7500", "SGH-I827", "SGH-S730M", "SGH-i437", "GT-S6500D", "GT-S6500", "SGH-i717", "SGH-T879", "GT-S5570i", "SGH-i547", "SGH-T769", "GT-S7562", "SGH-T699", "SCH-i415", "SPH-L300"]
	For $i = 0 To UBound($sArrayModels, $UBOUND_ROWS) - 1
		If StringInStr($sArrayModels[$i], $model ) <> 0 Then
			_ArrayAdd($narray, $sArrayModels[$i])
			$v = 1
		EndIf
	Next
	If $v  <>  0 Then
		If UBound($narray, $UBOUND_ROWS) > 2 Then
			$iResult = _ArrayToString($narray, "|")
			Global $iResultN = $iResult
			For $q = 1 to StringLen($iResult)
				if StringRight($iResult, 1) == "|" Then
					Global $iResultN = StringTrimRight($iResult, 1)
				Else
					ExitLoop
				EndIf
			Next
			#Region ### START Koda GUI section ### Form=
			Global $Security = GUICreate("Model Selection", 314, 132, -1, -1)
			Global $Group1 = GUICtrlCreateGroup("Available Models for Unlock", 16, 8, 281, 105)
			Global $Combo1 = GUICtrlCreateCombo("", 64, 40, 177, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
			GUICtrlSetData($Combo1, $iResultN)
			Global $Button1 = GUICtrlCreateButton("Unlock Info", 112, 72, 75, 25)
			GUICtrlCreateGroup("", -99, -99, 1, 1)
			GUISetState(@SW_SHOW)
			#EndRegion ### END Koda GUI section ###
			While 1
				$nMsg = GUIGetMsg()
				Switch $nMsg
					Case $GUI_EVENT_CLOSE
						GUIDelete($Security)
						ExitLoop

					Case $Button1
						Global $compare = GUICtrlRead($Combo1)
						GUIDelete($Security)
						ExitLoop
				EndSwitch
			WEnd
			Return $compare
		Else
			Return $narray[1]
		EndIf
	Else
		Return False
	EndIf

EndFunc