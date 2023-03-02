#Include-once

Func DecryptKey($llave)
	Global $keynew = StringReverse($llave)
	Global $crypted = StringTrimLeft(_Crypt_HashData($keynew, $CALG_MD5, True), 2)
	Return $crypted
EndFunc
