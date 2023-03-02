#include-once

Func _InterpreterKNOXQCOMM($key)

If $key == 0 Then
	Return "Error"
Else
	Global $Auth = $key
	Global $Size = FileGetSize(@TempDir & "\QCKK")
	Global $sInFilename = @TempDir & "\QCKK"
	Global $aRetArray
	_FileReadToArray($sInFilename, $aRetArray)
	Global $pasar = $aRetArray[1]
	Global $hBuffer = DllStructCreate("ubyte buffer[" & $Size & "]")
	DllStructSetData($hBuffer, "buffer", $pasar)
	Global $pBuffer = DllStructGetPtr($hBuffer)
	_WinAPI_LoadLibrary(@TempDir & "\kex.dll")
	Global $AbrirDll = DllOpen(@TempDir & "\kex.dll")
	Global $aResult = DllCall($AbrirDll, "ptr", "KexChallengeReply", "ptr", $pBuffer, "str", $Auth)
	Global $SecPtr = $aResult[0]
	Global $str = DllStructCreate("char[128]", $SecPtr)
	Global $mystring = DllStructGetData($str, 1)
	Return $mystring
EndIf

EndFunc

Func _Interpreterqcwipe2($key)

If $key == 0 Then
	Return "Error"
Else
	Global $Auth = $key
	Global $Size = FileGetSize(@TempDir & "\WIPEK")
	Global $sInFilename = @TempDir & "\WIPEK"
	Global $aRetArray
	_FileReadToArray($sInFilename, $aRetArray)
	Global $pasar = $aRetArray[1]
	Global $hBuffer = DllStructCreate("ubyte buffer[" & $Size & "]")
	DllStructSetData($hBuffer, "buffer", $pasar)
	Global $pBuffer = DllStructGetPtr($hBuffer)
	_WinAPI_LoadLibrary(@TempDir & "\kex.dll")
	Global $AbrirDll = DllOpen(@TempDir & "\kex.dll")
	Global $aResult = DllCall($AbrirDll, "ptr", "KexChallengeReply", "ptr", $pBuffer, "str", $Auth)
	Global $SecPtr = $aResult[0]
	Global $str = DllStructCreate("char[128]", $SecPtr)
	Global $mystring = DllStructGetData($str, 1)
	Return $mystring
EndIf

EndFunc

Func _Interpreterqcwipe($key)

If $key == 0 Then
	Return "Error"
Else
	Global $Auth = $key
	Global $Size = FileGetSize(@TempDir & "\QCWIPK")
	Global $sInFilename = @TempDir & "\QCWIPK"
	Global $aRetArray
	_FileReadToArray($sInFilename, $aRetArray)
	Global $pasar = $aRetArray[1]
	Global $hBuffer = DllStructCreate("ubyte buffer[" & $Size & "]")
	DllStructSetData($hBuffer, "buffer", $pasar)
	Global $pBuffer = DllStructGetPtr($hBuffer)
	_WinAPI_LoadLibrary(@TempDir & "\kex.dll")
	Global $AbrirDll = DllOpen(@TempDir & "\kex.dll")
	Global $aResult = DllCall($AbrirDll, "ptr", "KexChallengeReply", "ptr", $pBuffer, "str", $Auth)
	Global $SecPtr = $aResult[0]
	Global $str = DllStructCreate("char[128]", $SecPtr)
	Global $mystring = DllStructGetData($str, 1)
	Return $mystring
EndIf

EndFunc

Func _Interpretereact($key)

	If $key == 0 Then
		Return "Error"
	Else
		Global $Auth = $key
		Global $Size = FileGetSize(@TempDir & "\REACTK")
		Global $sInFilename = @TempDir & "\REACTK"
		Global $aRetArray
		_FileReadToArray($sInFilename, $aRetArray)
		Global $pasar = $aRetArray[1]
		Global $hBuffer = DllStructCreate("ubyte buffer[" & $Size & "]")
		DllStructSetData($hBuffer, "buffer", $pasar)
		Global $pBuffer = DllStructGetPtr($hBuffer)
		_WinAPI_LoadLibrary(@TempDir & "\kex.dll")
		Global $AbrirDll = DllOpen(@TempDir & "\kex.dll")
		Global $aResult = DllCall($AbrirDll, "ptr", "KexChallengeReply", "ptr", $pBuffer, "str", $Auth)
		Global $SecPtr = $aResult[0]
		Global $str = DllStructCreate("char[128]", $SecPtr)
		Global $mystring = DllStructGetData($str, 1)
		Return $mystring
	EndIf

EndFunc

Func _Interpreterqcomcert($key)

If $key == 0 Then
	Return "Error"
Else
	Global $Auth = $key
	Global $Size = FileGetSize(@TempDir & "\ATSHK")
	Global $sInFilename = @TempDir & "\ATSHK"
	Global $aRetArray
	_FileReadToArray($sInFilename, $aRetArray)
	Global $pasar = $aRetArray[1]
	Global $hBuffer = DllStructCreate("ubyte buffer[" & $Size & "]")
	DllStructSetData($hBuffer, "buffer", $pasar)
	Global $pBuffer = DllStructGetPtr($hBuffer)
	_WinAPI_LoadLibrary(@TempDir & "\kex.dll")
	Global $AbrirDll = DllOpen(@TempDir & "\kex.dll")
	Global $aResult = DllCall($AbrirDll, "ptr", "KexChallengeReply", "ptr", $pBuffer, "str", $Auth)
	Global $SecPtr = $aResult[0]
	Global $str = DllStructCreate("char[128]", $SecPtr)
	Global $mystring = DllStructGetData($str, 1)
	Return $mystring
EndIf

EndFunc

Func _InterpreterExyCertNoRoot($key)

If $key == 0 Then
	Return "Error"
Else
	Global $Auth = $key
	Global $Size = FileGetSize(@TempDir & "\ATSHK")
	Global $sInFilename = @TempDir & "\ATSHK"
	Global $aRetArray
	_FileReadToArray($sInFilename, $aRetArray)
	Global $pasar = $aRetArray[1]
	Global $hBuffer = DllStructCreate("ubyte buffer[" & $Size & "]")
	DllStructSetData($hBuffer, "buffer", $pasar)
	Global $pBuffer = DllStructGetPtr($hBuffer)
	_WinAPI_LoadLibrary(@TempDir & "\kex.dll")
	Global $AbrirDll = DllOpen(@TempDir & "\kex.dll")
	Global $aResult = DllCall($AbrirDll, "ptr", "KexChallengeReply", "ptr", $pBuffer, "str", $Auth)
	Global $SecPtr = $aResult[0]
	Global $str = DllStructCreate("char[128]", $SecPtr)
	Global $mystring = DllStructGetData($str, 1)
	FileDelete(@TempDir & "\ATSHK")
	Return $mystring
EndIf

EndFunc

Func _InterpreterKNOX($key)

If $key == 0 Then
	Return "Error"
Else
	Global $Auth = $key
	Global $Size = FileGetSize(@TempDir & "\EKK")
	Global $sInFilename = @TempDir & "\EKK"
	Global $aRetArray
	_FileReadToArray($sInFilename, $aRetArray)
	Global $pasar = $aRetArray[1]
	Global $hBuffer = DllStructCreate("ubyte buffer[" & $Size & "]")
	DllStructSetData($hBuffer, "buffer", $pasar)
	Global $pBuffer = DllStructGetPtr($hBuffer)
	_WinAPI_LoadLibrary(@TempDir & "\kex.dll")
	Global $AbrirDll = DllOpen(@TempDir & "\kex.dll")
	Global $aResult = DllCall($AbrirDll, "ptr", "KexChallengeReply", "ptr", $pBuffer, "str", $Auth)
	Global $SecPtr = $aResult[0]
	Global $str = DllStructCreate("char[128]", $SecPtr)
	Global $mystring = DllStructGetData($str, 1)
	FileDelete(@TempDir & "\EKK")
	Return $mystring
EndIf

EndFunc

Func _Interpreter($key)

If $key == 0 Then
	Return "Error"
Else
	Global $Auth = $key
	Global $Size = FileGetSize(@TempDir & "\SPRK")
	Global $sInFilename = @TempDir & "\SPRK"
	Global $aRetArray
	_FileReadToArray($sInFilename, $aRetArray)
	Global $pasar = $aRetArray[1]
	Global $hBuffer = DllStructCreate("ubyte buffer[" & $Size & "]")
	DllStructSetData($hBuffer, "buffer", $pasar)
	Global $pBuffer = DllStructGetPtr($hBuffer)
	_WinAPI_LoadLibrary(@TempDir & "\kex.dll")
	Global $AbrirDll = DllOpen(@TempDir & "\kex.dll")
	Global $aResult = DllCall($AbrirDll, "ptr", "KexChallengeReply", "ptr", $pBuffer, "str", $Auth)
	Global $SecPtr = $aResult[0]
	Global $str = DllStructCreate("char[128]", $SecPtr)
	Global $mystring = DllStructGetData($str, 1)
	Return $mystring
EndIf

EndFunc

Func _Interpreterlg($key)

If $key == 0 Then
	Return "Error"
Else
	Global $Auth = $key
	Global $Size = FileGetSize(@TempDir & "\lGSPRK")
	Global $sInFilename = @TempDir & "\lGSPRK"
	Global $aRetArray
	_FileReadToArray($sInFilename, $aRetArray)
	Global $pasar = $aRetArray[1]
	Global $hBuffer = DllStructCreate("ubyte buffer[" & $Size & "]")
	DllStructSetData($hBuffer, "buffer", $pasar)
	Global $pBuffer = DllStructGetPtr($hBuffer)
	_WinAPI_LoadLibrary(@TempDir & "\kex.dll")
	Global $AbrirDll = DllOpen(@TempDir & "\kex.dll")
	Global $aResult = DllCall($AbrirDll, "ptr", "KexChallengeReply", "ptr", $pBuffer, "str", $Auth)
	Global $SecPtr = $aResult[0]
	Global $str = DllStructCreate("char[128]", $SecPtr)
	Global $mystring = DllStructGetData($str, 1)
	FileDelete(@TempDir & "\lGSPRK")
	Return $mystring
EndIf

EndFunc

Func _Interpretersprnoroot($key)

If $key == 0 Then
	Return "Error"
Else
	Global $Auth = $key
	Global $Size = FileGetSize(@TempDir & "\SPRNK")
	Global $sInFilename = @TempDir & "\SPRNK"
	Global $aRetArray
	_FileReadToArray($sInFilename, $aRetArray)
	Global $pasar = $aRetArray[1]
	Global $hBuffer = DllStructCreate("ubyte buffer[" & $Size & "]")
	DllStructSetData($hBuffer, "buffer", $pasar)
	Global $pBuffer = DllStructGetPtr($hBuffer)
	_WinAPI_LoadLibrary(@TempDir & "\kex.dll")
	Global $AbrirDll = DllOpen(@TempDir & "\kex.dll")
	Global $aResult = DllCall($AbrirDll, "ptr", "KexChallengeReply", "ptr", $pBuffer, "str", $Auth)
	Global $SecPtr = $aResult[0]
	Global $str = DllStructCreate("char[128]", $SecPtr)
	Global $mystring = DllStructGetData($str, 1)
	FileDelete(@TempDir & "\SPRNK")
	Return $mystring
EndIf

EndFunc

Func _Interpretersprnewsec($key)

If $key == 0 Then
	Return "Error"
Else
	Global $Auth = $key
	Global $Size = FileGetSize(@TempDir & "\SPRNSK")
	Global $sInFilename = @TempDir & "\SPRNSK"
	Global $aRetArray
	_FileReadToArray($sInFilename, $aRetArray)
	Global $pasar = $aRetArray[1]
	Global $hBuffer = DllStructCreate("ubyte buffer[" & $Size & "]")
	DllStructSetData($hBuffer, "buffer", $pasar)
	Global $pBuffer = DllStructGetPtr($hBuffer)
	_WinAPI_LoadLibrary(@TempDir & "\kex.dll")
	Global $AbrirDll = DllOpen(@TempDir & "\kex.dll")
	Global $aResult = DllCall($AbrirDll, "ptr", "KexChallengeReply", "ptr", $pBuffer, "str", $Auth)
	Global $SecPtr = $aResult[0]
	Global $str = DllStructCreate("char[128]", $SecPtr)
	Global $mystring = DllStructGetData($str, 1)
	FileDelete(@TempDir & "\SPRNSK")
	Return $mystring
EndIf

EndFunc

Func _Interpretermsl($key)

If $key == 0 Then
	Return "Error"
Else
	Global $Auth = $key
	Global $Size = FileGetSize(@TempDir & "\UNSECK")
	Global $sInFilename = @TempDir & "\UNSECK"
	Global $aRetArray
	_FileReadToArray($sInFilename, $aRetArray)
	Global $pasar = $aRetArray[1]
	Global $hBuffer = DllStructCreate("ubyte buffer[" & $Size & "]")
	DllStructSetData($hBuffer, "buffer", $pasar)
	Global $pBuffer = DllStructGetPtr($hBuffer)
	_WinAPI_LoadLibrary(@TempDir & "\kex.dll")
	Global $AbrirDll = DllOpen(@TempDir & "\kex.dll")
	Global $aResult = DllCall($AbrirDll, "ptr", "KexChallengeReply", "ptr", $pBuffer, "str", $Auth)
	Global $SecPtr = $aResult[0]
	Global $str = DllStructCreate("char[128]", $SecPtr)
	Global $mystring = DllStructGetData($str, 1)
	FileDelete(@TempDir & "\UNSECK")
	Return $mystring
EndIf

EndFunc