<?php
function validateClient()
{
	// print_r($_SERVER);
	// exit;
	if (StringInStr($_SERVER['HTTP_USER_AGENT'], 'Juno_okyo - AutoIt'))
	{
		if (StringInStr($_SERVER['HTTP_REFERER'], 'junookyo.blogspot.com'))
		{
			if (is_ajax_request())
			{
				return TRUE;
			}
		}
	}

	return FALSE;
}

function is_ajax_request()
{
	return ( ! empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest');
}

function StringInStr($string, $subString)
{
	return (strpos($string, $subString) !== FALSE);
}

function validateGroup($str)
{
	$str = strtolower($str);
	return ($str == 'member' OR $str == 'admin');
}

function validateGender($str)
{
	$str = strtolower($str);
	return ($str == 'male' OR $str == 'female');
}

function validateUsername($str)
{
	$len = strlen($str);
	return ($len > 0 && $len < 16);
}

function _notEmpty($str)
{
	return (strlen($str) > 0);
}

function isEmail($str)
{
	return (preg_match('/\b[\D\d._%+-]+@[\D\d.-]+\.[\D]{2,6}\b/i', $str));
}

function _output($success, $data = '')
{
	$output = array(
		'success' => $success,
		'error' => ( ! $success),
		'data' => $data
	);

	header('Content-Type: application/json');
	echo json_encode($output);
	exit;
}
