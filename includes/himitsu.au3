#include-once
#Region Includes
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <GuiStatusBar.au3>
#include <GuiListView.au3>
#include <GuiTab.au3>
#include <GuiEdit.au3>
#include <Array.au3>
#include <Misc.au3>
#include <APIDiagConstants.au3>
#include <Crypt.au3>
#include <StringConstants.au3>
#include 'Samaraskaya.au3'
#EndRegion Includes

Func Sakido($Arr, $kagipass)
	Local $aArrayfinal[3] = ["", "", ""]
	for $i = 0 to 2
		Local $dPlaintextUTF8 = StringToBinary($aArray[$i], $SB_UTF8)
		Local $dEncrypted = _Crypt_EncryptData($dPlaintextUTF8, $kagipass, $CALG_AES_256)
		Local $dDecrypted = _Crypt_DecryptData($dEncrypted, $kagipass, $CALG_AES_256)
		Local $sDecrypted = BinaryToString($dDecrypted, $SB_UTF8)
		_ArrayInsert($aArrayfinal, $i, $sDecrypted)
	Next
	Return $aArrayfinal
EndFunc

