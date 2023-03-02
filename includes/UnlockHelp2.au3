#include-once

Func SearchForData($model)

	Global $fArray[1] = [""]
	Global $j = 0
	Global $k = 1
	Global $fFlag = 0
	Global $shandle =  FileOpen(@ScriptDir & "\Help\SamMod")
	Global $slines = _FileCountLines($shandle)
	For $i = 1 to $slines
		Global $line =  FileReadLine($shandle, $i)
		If StringInStr($line, $model) <> 0 Then
			Global $sfirst = StringSplit($line, ",")
			If StringInStr($sfirst[1], $model) <> 0 Then
				For $h = $j to $j + 4
					_ArrayAdd($fArray, $sfirst[$k])
					$k += 1
				Next
				$fFlag = 1
			EndIf
		EndIf
		$j += 5
		$k = 1
	Next
	If $fFlag <>  0 Then

		If UBound($fArray, $UBOUND_ROWS) > 6 Then
			Global $narray[]= [""]
			Global $v = 0
			For $i = 1 To UBound($fArray, $UBOUND_ROWS) - 1
				Global $sFileName = $fArray[$i]
				If @error Then ExitLoop
				_ArrayInsert($narray,$v,$sFileName)
				$i += 4
				$v += 1
			Next
			$iResult = _ArrayToString($narray, "|")
			Global $iResultN = $iResult
			For $q = 1 to StringLen($iResult)
				if StringRight($iResult, 1) == "|" Then
					Global $iResultN = StringTrimRight($iResult, 1)
				Else
					ExitLoop
				EndIf
			Next
			Global $xCounter = 0
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
						For $y = 1 To UBound($fArray, $UBOUND_ROWS) - 1
							Global $ssFileName = $fArray[$y]
							If $compare == $fArray[$y] Then
								Global $xCounter = $y
								ExitLoop
							EndIf
						Next
						ExitLoop
				EndSwitch
			WEnd
			Global $pArray[] = [""]
			For $n = $xCounter to $xCounter + 4
				_ArrayAdd($pArray,$fArray[$n])
			Next
			Return $pArray
		Else
			Return $fArray
		EndIf

	Else
		Return False
	EndIf

EndFunc

