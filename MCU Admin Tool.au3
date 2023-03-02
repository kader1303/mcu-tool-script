#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=MCU Tool\Icono.ico
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Fileversion=1.0
#AutoIt3Wrapper_Res_ProductVersion=1.0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

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
#include 'includes/BinaryCall.au3'
#include 'includes/JSON.au3'
#include 'includes/http.au3'
#EndRegion Includes

Global $permiso = '0'

Global Const $DEBUG_MODE = False ; Please change value to False when compile

Global Const $SERVER = 'https://usuarios.mcu-tool.com/index.php'
Global Const $SERVERLOG = 'https://registro.mcu-tool.com/index.php'
Global Const $ENDPOINT_LOGIN = $SERVER & 'login'
Global Const $ENDPOINT_LOGOUT = $SERVER & 'logout'
Global Const $ENDPOINT_CREATE = $SERVER & 'create'
Global Const $ENDPOINT_UPDATE = $SERVER & 'update'
Global Const $ENDPOINT_READ = $SERVER & 'read'
Global Const $ENDPOINT_DELETE = $SERVER & 'delete'
Global Const $ENDPOINT_ACTIVATE = $SERVER & 'activate'
Global Const $ENDPOINT_DEACTIVATE = $SERVER & 'deactivate'
Global Const $ENDPOINT_PASSWORD = $SERVER & 'password'
Global Const $ENDPOINT_HWID = $SERVER & 'hwid'
Global Const $ENDPOINT_EMAIL = $SERVER & 'email'
Global Const $ENDPOINT_VERSREAD = $SERVER & 'readversion'
Global Const $ENDPOINT_VERSCHANGE = $SERVER & 'changeversion'
Global Const $ENDPOINT_CREATELOG = $SERVERLOG & 'create'

#Region ### START Koda GUI section ### Form=
Global $FormAdmin = GUICreate("Admin Panel MCU Tool", 595, 505, -1, -1)
Global $operaciones = GUICtrlCreateGroup("Operaciones", 8, 8, 577, 297)
Global $ActivationGroup = GUICtrlCreateGroup("Activacion", 24, 24, 185, 97)
Global $ActivactionInput1 = GUICtrlCreateInput("", 48, 48, 121, 21)
Global $ActivateButton = GUICtrlCreateButton("Activate", 72, 80, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $PasswordGroup = GUICtrlCreateGroup("Password", 24, 128, 185, 169)
Global $UsuarioInputpass = GUICtrlCreateInput("", 48, 168, 121, 21)
Global $PasswordButton = GUICtrlCreateButton("Change", 72, 256, 75, 25)
Global $PasswordInput = GUICtrlCreateInput("", 48, 224, 121, 21)
Global $UserLabel = GUICtrlCreateLabel("Usuario", 48, 144, 40, 17)
Global $PasswordLabel = GUICtrlCreateLabel("New Password", 48, 200, 75, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $HwidGroup = GUICtrlCreateGroup("HWID", 224, 24, 353, 97)
Global $UserInputhwid = GUICtrlCreateInput("", 320, 48, 137, 21)
Global $HwidButton = GUICtrlCreateButton("Change", 488, 48, 75, 25)
Global $userLabel1 = GUICtrlCreateLabel("Usuario", 248, 48, 40, 17)
Global $Hwidnput = GUICtrlCreateInput("", 320, 88, 241, 21)
Global $HwidLabel = GUICtrlCreateLabel("Hwid", 249, 90, 28, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $MiscGroup = GUICtrlCreateGroup("Misc", 224, 128, 353, 169)
Global $UserInputMisc = GUICtrlCreateInput("", 304, 152, 121, 21)
Global $UserLabelmisc = GUICtrlCreateLabel("Usuario", 249, 156, 40, 17)
Global $GetButton = GUICtrlCreateButton("User Info", 464, 152, 75, 25)
Global $EmailInput1 = GUICtrlCreateInput("", 288, 192, 153, 21)
Global $EmailLabel1 = GUICtrlCreateLabel("Email", 248, 192, 29, 17)
Global $EmailButton = GUICtrlCreateButton("Change", 464, 192, 75, 25)
Global $DeleteButton = GUICtrlCreateButton("Delete", 256, 256, 75, 25)
Global $DeactiivateButton = GUICtrlCreateButton("Deactivate", 368, 256, 75, 25)
Global $LogoutButton = GUICtrlCreateButton("Logout", 480, 256, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $EditBox = GUICtrlCreateEdit("", 224, 312, 361, 153, BitOR($GUI_SS_DEFAULT_EDIT,$ES_READONLY))
GUICtrlSetData(-1, "")
Global $UpdateGroup1 = GUICtrlCreateGroup("Version", 8, 304, 217, 161)
Global $UsuarioLabelVersion = GUICtrlCreateLabel("Usuario", 22, 334, 40, 17)
Global $versionInputUser = GUICtrlCreateInput("", 80, 331, 121, 21)
Global $VerLabel = GUICtrlCreateLabel("Version", 20, 377, 40, 17)
Global $VersionInput = GUICtrlCreateInput("", 79, 374, 121, 21)
Global $ChangeButtonVersion = GUICtrlCreateButton("Change", 120, 416, 75, 25)
Global $readversionButton1 = GUICtrlCreateButton("Check", 16, 416, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateStatusBar($FormAdmin, 260)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
	global $nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $ActivateButton
			Activate()
		Case  $DeactiivateButton
			Deactivate()
		Case $PasswordButton
			Password()
		Case $GetButton
			 ButtonSearchClick()
		Case $DeleteButton
			Delete()
		Case $LogoutButton
			Logout()
		Case $HwidButton
			hwid()
	    Case $EmailButton
			EmailChange()
		Case $readversionButton1
			readinfoversion()
		Case $ChangeButtonVersion
			VersionChange()
	EndSwitch
WEnd



Func GUICtrlCreateStatusBar($gui, $space = 280, $text = 'Developed by MCU Team', $copyright = 'MC')
	Local $statusBar = _GUICtrlStatusBar_Create($gui)
	Local $statusBar_PartsWidth[2] = [$space, -1]
	_GUICtrlStatusBar_SetParts($statusBar, $statusBar_PartsWidth)
	_GUICtrlStatusBar_SetText($statusBar, $text, 0)
	_GUICtrlStatusBar_SetText($statusBar, 'Copyright ' & Chr(169) & ' ' & @YEAR & ' ' & $copyright, 1)
	_GUICtrlStatusBar_SetMinHeight($statusBar, 3)
	Return $statusBar
EndFunc   ;==>GUICtrlCreateStatusBar

Func Activate()
	Local $usuario = GUICtrlRead($ActivactionInput1)

	If $usuario <> '' Then
			Local $data = 'username=' & urlEncode($usuario)

			Local $request = _httpRequest($ENDPOINT_ACTIVATE, 'POST', $data)
			Local $json = Json_Decode($request[2])
			Local $success = Json_Get($json, '["success"]')

		If $success Then
         MsgBox(64, 'MCU Admin Tool', 'OK')
		Else
			MsgBox(64, 'MCU Admin Tool', 'Chequea que el usuario sea correcto. Proceso Fallido!')
			Return False
		EndIf
		Else
		MsgBox(64, 'MCU Admin Tool', 'Entre nombre de usuario')
	EndIf
	EndFunc

Func Deactivate()
	Local $usuario = GUICtrlRead($UserInputMisc)

	If $usuario <> '' Then
			Local $data = 'username=' & urlEncode($usuario)
			Local $request = _httpRequest($ENDPOINT_DEACTIVATE, 'POST', $data)
			Local $json = Json_Decode($request[2])
			Local $success = Json_Get($json, '["success"]')

		If $success Then
         MsgBox(64, 'MCU Admin Tool', 'OK')
		Else
			MsgBox(64, 'MCU Admin Tool', 'Chequea que el usuario sea correcto. Proceso Fallido!')
			Return False
		EndIf
		Else
		MsgBox(64, 'MCU Admin Tool', 'Entre el nombre de usuario y el Password que desea asignar')
	EndIf
EndFunc

Func Password()
	Local $usuario = GUICtrlRead($UsuarioInputpass)
    Local $pass = GUICtrlRead($PasswordInput)

	If $usuario <> '' Then
		If $pass <> '' Then
			Local $data = 'username=' & urlEncode($usuario) & _
			      '&password=' & urlEncode($pass)

			Local $request = _httpRequest($ENDPOINT_PASSWORD, 'POST', $data)
			Local $json = Json_Decode($request[2])
			Local $success = Json_Get($json, '["success"]')

			If $success Then
			 MsgBox(64, 'MCU Admin Tool', 'OK')
			Else
			MsgBox(64, 'MCU Admin Tool', 'Chequea que el usuario sea correcto. Proceso Fallido!')
			Return False
		EndIf
		Else
		MsgBox(64, 'MCU Admin Tool', 'Entre el nuevo password que desea asignar')
		EndIf
	Else
		MsgBox(64, 'MCU Admin Tool', 'Entre el nombre de usuario')
	EndIf
	EndFunc

Func ButtonSearchClick()
	Local $usuario = GUICtrlRead($UserInputMisc)

	If $usuario <> '' Then
		Local $data = 'username=' & urlEncode($usuario)
		Local $request = _httpRequest($ENDPOINT_READ, 'POST', $data)
		Local $json = Json_Decode($request[2])
		Local $success = Json_Get($json, '["success"]')
		If $success Then
			Local $status = (Json_Get($json, '["data"]["is_online"]') = 1) ? 'Online' : 'Offline'
			Local $id = Json_Get($json, '["data"]["id"]')
			Local $user = Json_Get($json, '["data"]["username"]')
			Local $pass = Json_Get($json, '["data"]["password"]')
			Local $correo = Json_Get($json, '["data"]["email"]')
			Local $hardid = Json_Get($json, '["data"]["hwid"]')
			Local $regdate = Json_Get($json, '["data"]["reg_date"]')
			Local $findate = Json_Get($json, '["data"]["fin_date"]')
			Local $current = Json_Get($json, '["data"]["current_status"]')
			Local $ip = Json_Get($json, '["data"]["ip_address"]')
			_GUICtrlEdit_SetText($EditBox, "")
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " Status: " & $status & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " ID: " & $id & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " Usuario: " & $user & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " Pass: " & $pass & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " Correo: " & $correo & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " HWID: " & $hardid & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " Fecha de registro: " & $regdate & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " Fecha final: " & $findate & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " Licencia: " & $current & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " IP: " & $ip & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
	Else
		MsgBox(64, '', 'Usuario Incorrecto')
	EndIf
	Else
		MsgBox(64, '', 'Entre Nombre de Usuario')
	EndIf
EndFunc   ;==>ButtonSearchClick

Func Delete()

    Local $filter = 'username'
	Local $value = GUICtrlRead($UserInputMisc)

	If $value <> '' Then
			Local $data = 'filter=' & urlEncode($filter) & _
					'&value=' & urlEncode($value)

			Local $request = _httpRequest($ENDPOINT_DELETE, 'POST', $data)
			Local $json = Json_Decode($request[2])
			Local $success = Json_Get($json, '["success"]')
		If $success Then
			MsgBox(64, 'MCU Tool Admin', 'Usuario Borrado')
		Else
			MsgBox(64, 'MCU Tool Admin', 'El Usuario no existe')
		EndIf
	Else
	 MsgBox(64,'MCU Tool Admin', 'Entre el usuario a borrar')
	EndIf
EndFunc

Func Logout()
	Local $username, $data, $request
	$username = GUICtrlRead($UserInputMisc)
	$data = 'username=' & urlEncode($username)
	$request = _httpRequest($ENDPOINT_LOGOUT, 'POST', $data)
	Local $json = Json_Decode($request[2])
	Local $success = Json_Get($json, '["success"]')

	If $success Then
	 MsgBox(64, 'MCU Tool Admin', 'Usuario: ' & $username & ' desligado')
	Else
	 MsgBox(64, 'MCU Tool Admin', 'Por Favor entre usuario a desligar')
	EndIf
EndFunc   ;==>Logout

Func hwid()
    Local $usuario = GUICtrlRead($UserInputhwid)
    Local $hwid = GUICtrlRead($Hwidnput)

	If $usuario <> '' Then
		If $hwid <> '' Then
			Local $data = 'username=' & urlEncode($usuario) & _
			      '&hwid=' & urlEncode($hwid)

			Local $request = _httpRequest($ENDPOINT_HWID, 'POST', $data)
			Local $json = Json_Decode($request[2])
			Local $success = Json_Get($json, '["success"]')

			If $success Then
			 MsgBox(64, 'MCU Admin Tool', 'OK')
			Else
			MsgBox(64, 'MCU Admin Tool', 'Chequea que el usuario sea correcto. Proceso Fallido!')
			Return False
		EndIf
		Else
		MsgBox(64, 'MCU Admin Tool', 'Entre el nuevo HWID que desea asignar')
		EndIf
	Else
		MsgBox(64, 'MCU Admin Tool', 'Entre el nombre de usuario')
	EndIf
EndFunc

Func EmailChange()

	Local $usuario = GUICtrlRead($UserInputMisc)
    Local $email = GUICtrlRead($EmailInput1)

	If $usuario <> '' Then
		If $email <> '' Then
			Local $data = 'username=' & urlEncode($usuario) & _
					'&email=' & urlEncode($email)

			Local $request = _httpRequest($ENDPOINT_EMAIL, 'POST', $data)
			Local $json = Json_Decode($request[2])
			Local $success = Json_Get($json, '["success"]')
			If $success Then
				MsgBox(64, 'MCU Tool Admin', 'Email cambiado')
			Else
				MsgBox(64, 'MCU Tool Admin', 'El Usuario no existe')
			EndIf
		Else
			MsgBox(64,'MCU Tool Admin', 'Entre el E-Mail')
		EndIf
	Else
	    MsgBox(64,'MCU Tool Admin', 'Entre el Usuario')
	EndIf
EndFunc

Func readinfoversion()
	Local $keyword = 'admin'

	Local $data = 'username=' & urlEncode($keyword)
	Local $request = _httpRequest($ENDPOINT_VERSREAD, 'POST', $data)
	Local $json = Json_Decode($request[2])
	Local $success = Json_Get($json, '["success"]')
		If $success Then
			Local $user = Json_Get($json, '["data"]["username"]')
			Local $pass = Json_Get($json, '["data"]["password"]')
			Local $correo = Json_Get($json, '["data"]["email"]')
			Local $act = Json_Get($json, '["data"]["version_actual"]')
			_GUICtrlEdit_SetText($EditBox, "")
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " Usuario: " & $user & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " Pass: " & $pass & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " Correo: " & $correo & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
			_GUICtrlEdit_SetText($EditBox, GUICtrlRead($EditBox) & " Version: " & $act & @CRLF)
			_GUICtrlEdit_LineScroll($EditBox, 0, _GUICtrlEdit_GetLineCount($EditBox))
		Else
			MsgBox(64, '', '0')
		EndIf

EndFunc

Func VersionChange()

	Local $usuario = GUICtrlRead($versionInputUser)
    Local $versionup = GUICtrlRead($VersionInput)

	If $usuario <> '' Then
		If $versionup <> '' Then
			Local $data = 'username=' & urlEncode($usuario) & _
					'&version_actual=' & urlEncode($versionup)

			Local $request = _httpRequest($ENDPOINT_VERSCHANGE, 'POST', $data)
			Local $json = Json_Decode($request[2])
			Local $success = Json_Get($json, '["success"]')
			If $success Then
				MsgBox(64, 'MCU Tool Admin', 'Version actualizada')
			Else
				MsgBox(64, 'MCU Tool Admin', 'Usuario incotrrecto')
			EndIf
		Else
			MsgBox(64,'MCU Tool Admin', 'Entre la nueva version')
		EndIf
	Else
	    MsgBox(64,'MCU Tool Admin', 'Entre el Usuario')
	EndIf
EndFunc

Func AddLog()

  Local $pro = 'procesowe'
  Local $us = 'admin'
  Local $hwi = 'sdgerae'

	Local $data = 'process=' & urlEncode($pro) & _
			'&user=' & urlEncode($us) & _
			'&hwid=' & urlEncode($hwi)

	If $DEBUG_MODE Then
		MsgBox(262144, 'Debug line ~' & @ScriptLineNumber, 'Selection:' & @CRLF & '$data' & @CRLF & @CRLF & 'Return:' & @CRLF & $data) ;### Debug MSGBOX
	EndIf

	Local $request = _httpRequest($ENDPOINT_CREATELOG, 'POST', $data)
	Local $json = Json_Decode($request[2])
	Local $success = Json_Get($json, '["success"]')

	If $DEBUG_MODE Then _ArrayDisplay($request)

	If $success Then
		MsgBox(64, '', 'ok')
	Else
		MsgBox(64, '', 'no')
		EndIf
EndFunc   ;==>_user