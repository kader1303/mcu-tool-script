#include-once

Func _InterpreterExyCertNoRoot($key)

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

EndFunc

Func _InterpreterKNOX($key)

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
Return $mystring

EndFunc

Func _Interpreter($key)

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

EndFunc

Func _Interpretersprnoroot($key)

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
Return $mystring

EndFunc

Func _Interpretersprnewsec($key)

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
Return $mystring

EndFunc
