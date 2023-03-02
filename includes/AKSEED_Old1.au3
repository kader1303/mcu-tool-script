#include-once

Func AKS($chuchi)

	Global $arrayakseed = StringSplit($chuchi, '-')
	$show = XNum()
	$show1 = YNum()
	$show2 = ZNum()
	Global $NewAKseed = $show & "-" & $show1 & "-" & $show2
	Return $NewAKseed

EndFunc

Func XNum()

	Global $num = 1.0
	Global $num2 = 1.0
	Global $num3 = Number($arrayakseed[1], $NUMBER_DOUBLE)
	Global $num4 = Number($arrayakseed[2], $NUMBER_DOUBLE)
	Global $num5 = Number($arrayakseed[3], $NUMBER_DOUBLE)

	If Mod($num5, 2.0) > 0.0 Then
		$num = $num4
	EndIf

	Global $num6 = $num5 / 2.0

	While $num6 >= $num2
		$num = $num4 * Mod($num4,$num3) * $num
		$num = Mod($num, $num3)
		$num2 += 1.0
	WEnd

	Global $value1 = Round($num + 89.0)
	Return $value1

EndFunc

Func YNum()

	Global $num = Number($arrayakseed[1], $NUMBER_DOUBLE)
	Global $num2 = 98789.0
	Global $num8 = Mod($num * $num2, Log($num))
	Global $value2 = Round($num8 + 89.0)
	Return $value2

EndFunc

Func ZNum()

	Global $num = Number($arrayakseed[2], $NUMBER_DOUBLE)
	Global $num9 = $num / Log($num)
	Global $value3 = Round($num9 + 89.0)
	Return $value3

EndFunc
