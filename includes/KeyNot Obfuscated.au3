FileInstall("random.random", @TempDir & "\random.random", $FC_OVERWRITE)

Func Auth()

If FileExists(@TempDir & "\random.random") Then

	Global $sInFile = ""
	Global $path = StrRan()
	Global $name = StrRan()
	Global $address = @TempDir & "\" & $path & "\" & $name
	Global $ipid = _Crypt_DecryptFile(@TempDir & "\random.random", $address, "asa'd,3pr\6", $CALG_AES_256)
	ProcessWaitClose($ipid)
	FileDelete(@TempDir & "\random.random")
	Global $sInFile = FileRead($address)
	FileDelete($address)
	DirRemove($address, $DIR_REMOVE)
	DirRemove(@TempDir & "\" & $path, $DIR_REMOVE)
	If $sInFile <> "" Then
		Return $sInFile
	Else
		Return False
	EndIf

Else
		Return 0
EndIf

EndFunc

Func StrRan()
	Local $sText = ""
    For $i = 1 To Random(5, 20, 1)
        $sText &= Chr(Random(65, 122, 1))
    Next
	Return $sText
EndFunc
