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