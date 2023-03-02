Func _GetHardwareID($iFlags = Default, $fIs64Bit = Default)
    Local $sBit = ''
    If @AutoItX64 Then
        $sBit = '64'
    EndIf
    If Not ($fIs64Bit = Default) Then
        $sBit = '' ; Reset to 32-bit.
        If $fIs64Bit And @AutoItX64 Then
            $sBit = '64' ; Use 64-bit if $fIs64Bit is True and AutoIt is a 64-bit process.
        EndIf
    EndIf

    If $iFlags = Default Then
        $iFlags = $UHID_MB
    EndIf
    Local $aSystem = ['Identifier', 'VideoBiosDate', 'VideoBiosVersion'], _
            $iResult = 0, _
            $sHKLM = 'HKEY_LOCAL_MACHINE' & $sBit, $sOutput = '', $sText = ''

    For $i = 0 To UBound($aSystem) - 1
        $sOutput &= RegRead($sHKLM & '\HARDWARE\DESCRIPTION\System\', $aSystem[$i])
    Next
    $sOutput &= @CPUArch
    $sOutput = StringStripWS($sOutput, $STR_STRIPALL)

    If BitAND($iFlags, $UHID_BIOS) Then
        Local $aBIOS = ['BaseBoardManufacturer', 'BaseBoardProduct', 'BaseBoardVersion', 'BIOSVendor', 'BIOSReleaseDate']
        $sText = ''
        For $i = 0 To UBound($aBIOS) - 1
            $sText &= RegRead($sHKLM & '\HARDWARE\DESCRIPTION\System\BIOS\', $aBIOS[$i])
        Next
        $sText = StringStripWS($sText, $STR_STRIPALL)
        If $sText Then
            $iResult += $UHID_BIOS
            $sOutput &= $sText
        EndIf
    EndIf
    If BitAND($iFlags, $UHID_CPU) Then
        Local $aProcessor = ['ProcessorNameString', '~MHz', 'Identifier', 'VendorIdentifier']
        $sText = ''
        For $i = 0 To UBound($aProcessor) - 1
            $sText &= RegRead($sHKLM & '\HARDWARE\DESCRIPTION\System\CentralProcessor\0\', $aProcessor[$i])
        Next
        For $i = 0 To UBound($aProcessor) - 1
            $sText &= RegRead($sHKLM & '\HARDWARE\DESCRIPTION\System\CentralProcessor\1\', $aProcessor[$i])
        Next
        $sText = StringStripWS($sText, $STR_STRIPALL)
        If $sText Then
            $iResult += $UHID_CPU
            $sOutput &= $sText
        EndIf
    EndIf
    If BitAND($iFlags, $UHID_HDD) Then
        $sText = ''
        Local $aDrives = DriveGetDrive('FIXED')
        If @error = 0 Then
            For $i = 1 To $aDrives[0]
                $sText &= DriveGetSerial($aDrives[$i])
            Next
        EndIf
        $sText = StringStripWS($sText, $STR_STRIPALL)
        If $sText Then
            $iResult += $UHID_HDD
            $sOutput &= $sText
        EndIf
    EndIf
    Local $sHash = StringTrimLeft(_Crypt_HashData($sOutput, $CALG_MD5), StringLen('0x'))
    If $sHash = '' Then
        Return SetError(4, 0, '')
    EndIf
    Return SetExtended($iResult, StringRegExpReplace($sHash, '([[:xdigit:]]{8})([[:xdigit:]]{4})([[:xdigit:]]{4})([[:xdigit:]]{4})([[:xdigit:]]{12})', '{\1-\2-\3-\4-\5}'))
EndFunc   ;==>_GetHardwareID
