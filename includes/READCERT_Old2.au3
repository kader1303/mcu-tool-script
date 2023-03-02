#include-once
#include <StringConstants.au3>

Func GetImei($array, $lineas)

    If $lineas > 1 Then
		For $i = 0 To $lineas
			Global $string = $array[$i]
			If StringInStr($string, "IMEI", $STR_CASESENSE) <> 0 Then
				Global $imeiarray = StringSplit($string, "=")
				Global $imei = $imeiarray[2]
				ExitLoop
			EndIf
		Next
	Else
		Return "error 02"
	EndIf

	Return $imei
EndFunc

Func Sign($array, $lineas)

	For $i = 1 To $lineas
		Global $string = $array[$i]
		If StringInStr($string, "ImeiSign", $STR_CASESENSE) <> 0 Then
			Global $imeiarray = StringSplit($string, "=")
			Global $imeisign = $imeiarray[2]
			ExitLoop
		EndIf
	Next

	For $i = 1 To $lineas
		Global $string = $array[$i]
		If StringInStr($string, "PubKey", $STR_CASESENSE) <> 0 Then
			Global $imeiarray = StringSplit($string, "=")
			Global $PubKey = $imeiarray[2]
			ExitLoop
		EndIf
	Next

	For $i = 1 To $lineas
		Global $string = $array[$i]
		If StringInStr($string, "PubKeySign", $STR_CASESENSE) <> 0 Then
			Global $imeiarray = StringSplit($string, "=")
			Global $PubKeySign = $imeiarray[2]
			ExitLoop
		EndIf
	Next
	Return $imeisign & "," & $PubKey & "," & $PubKeySign

EndFunc

Func Sign2($array, $lineas)

	For $i = 1 To $lineas
		Global $string = $array[$i]
		If StringInStr($string, "ImeiSign2", $STR_CASESENSE) <> 0 Then
			Global $imeiarray = StringSplit($string, "=")
			Global $imeisign = $imeiarray[2]
			ExitLoop
		EndIf
	Next

	For $i = 1 To $lineas
		Global $string = $array[$i]
		If StringInStr($string, "PubKey2", $STR_CASESENSE) <> 0 Then
			Global $imeiarray = StringSplit($string, "=")
			Global $PubKey = $imeiarray[2]
			ExitLoop
		EndIf
	Next

	For $i = 1 To $lineas
		Global $string = $array[$i]
		If StringInStr($string, "PubKeySign2", $STR_CASESENSE) <> 0 Then
			Global $imeiarray = StringSplit($string, "=")
			Global $PubKeySign = $imeiarray[2]
			ExitLoop
		EndIf
	Next
	Return $imeisign & "," & $PubKey & "," & $PubKeySign

EndFunc

Func GetImei2($array, $lineas)

    If $lineas > 1 Then
		For $i = 0 To $lineas
			Global $string = $array[$i]
			If StringInStr($string, "IMEI2", $STR_CASESENSE) <> 0 Then
				Global $imeiarray = StringSplit($string, "=")
				Global $imei = $imeiarray[2]
				ExitLoop
			EndIf
		Next
	Else
		Return "error 02"
	EndIf

	Return $imei
EndFunc

Func GetQcomm($array, $lineas)

	If $lineas > 1 Then
		For $i = 0 To $lineas
			Global $string = $array[$i]
			If StringInStr($string, "ImeiSign", $STR_CASESENSE) <> 0 Then
				Global $imeiarray = StringSplit($string, "=")
				Global $imeisign = $imeiarray[2]
				ExitLoop
			EndIf
		Next
		For $i = 0 To $lineas
			Global $string = $array[$i]
			If StringInStr($string, "PubKey", $STR_CASESENSE) <> 0 Then
				Global $imeiarray = StringSplit($string, "=")
				Global $pubkey = $imeiarray[2]
				ExitLoop
			EndIf
		Next
		For $i = 0 To $lineas
			Global $string = $array[$i]
			If StringInStr($string, "PubKeySign", $STR_CASESENSE) <> 0 Then
				Global $imeiarray = StringSplit($string, "=")
				Global $keysign = $imeiarray[2]
				ExitLoop
			EndIf
		Next
		If $imeisign <> '' And $pubkey <> '' And $keysign <> '' Then
			Global $text = $imeisign & "," & $pubkey & "," & $keysign
			Return $text
		Else
			Return "error 02"
		EndIf
	Else
		Return "error 02"
	EndIf

EndFunc

Func GetQcomm2($array, $lineas)

	If $lineas > 1 Then
		For $i = 0 To $lineas
			Global $string = $array[$i]
			If StringInStr($string, "ImeiSign2", $STR_CASESENSE) <> 0 Then
				Global $imeiarray = StringSplit($string, "=")
				Global $imeisign = $imeiarray[2]
				ExitLoop
			EndIf
		Next
		For $i = 0 To $lineas
			Global $string = $array[$i]
			If StringInStr($string, "PubKey2", $STR_CASESENSE) <> 0 Then
				Global $imeiarray = StringSplit($string, "=")
				Global $pubkey = $imeiarray[2]
				ExitLoop
			EndIf
		Next
		For $i = 0 To $lineas
			Global $string = $array[$i]
			If StringInStr($string, "PubKeySign2", $STR_CASESENSE) <> 0 Then
				Global $imeiarray = StringSplit($string, "=")
				Global $keysign = $imeiarray[2]
				ExitLoop
			EndIf
		Next
		If $imeisign <> '' And $pubkey <> '' And $keysign <> '' Then
			Global $text = $imeisign & "," & $pubkey & "," & $keysign
			Return $text
		Else
			Return "error 02"
		EndIf
	Else
		Return "error 02"
	EndIf

EndFunc

Func GetIMEIArray($text)

	Global $i = 500
	Local $aArray_Base[1] = [""]
	Local $aArray = $aArray_Base
	Global $textn = $text
	For $h = 0 To 4
		Global $insert = StringLeft($textn, 500)
		$textn = StringTrimLeft($text, $i)
		_ArrayInsert($aArray, $h, $insert)
		$i += 500
	Next

	Return $aArray

EndFunc
