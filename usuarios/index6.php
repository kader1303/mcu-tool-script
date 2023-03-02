<?php
require_once ('include/functions.php');

validateClient() or die('error');

require_once ('include/MysqliDb.php');
require_once ('config.php');

if (isset($_GET['act']) && _notEmpty($_GET['act']))
{
	$action = strtolower($_GET['act']);
	$db = new MysqliDb ($db_host, $db_username, $db_password, $db_name);
	
	switch ($action) {
		case 'login':
			if (isset($_POST['username'], $_POST['password'], $_POST['hwid']))
			{
				$username = $_POST['username'];
				$password = $_POST['password'];
				$hwid = $_POST['hwid'];
				
				if (validateUsername($username) && _notEmpty($password))
				{
					// Hash password
					$password = md5($password);

					$db->where('username', $username);
					$db->where('password', $password);
					$db->where('hwid', $hwid);
					
					$online = $db->getValue('users', 'is_online');

					if (_notEmpty($online))
					{
						// Update online status
						if ( ! $online)
						{
							$data = array('is_online' => 1);
							$db->where('username', $username);
							$db->update('users', $data);

							_output(TRUE); // Login Success
						}
						else
							_output(FALSE); // Already logged-in
					}
				}
			}
			break;

		case 'logout':
			if (isset($_POST['username']) && validateUsername($_POST['username']))
			{
				$username = $_POST['username'];
				$data = array('is_online' => 0);
				$db->where('username', $username);
				if ($db->update('users', $data))
					_output(TRUE);
				else
					_output(FALSE);
			}
			break;
			
		case 'activate':
			if (isset($_POST['username']) && validateUsername($_POST['username']))
			{
				$username = $_POST['username'];
				$t = strtotime('+1 year');
				$data = array(
				'reg_date' => date("Y-m-d H:i:s"),
				'fin_date' => date('Y-m-d H:i:s', $t),
				'current_status' => 1
				);
				$db->where('username', $username);
				if ($db->update('users', $data))
					_output(TRUE);
				else
					_output(FALSE);
			}
			break;
			
			case 'deactivate':
			if (isset($_POST['username']) && validateUsername($_POST['username']))
			{
				$username = $_POST['username'];
				$data = array('current_status' => 0);
				$db->where('username', $username);
				if ($db->update('users', $data))
					_output(TRUE);
				else
					_output(FALSE);
			}
			break;
			
			case 'password':
			if (isset($_POST['username']) && validateUsername($_POST['username']))
			{
				$username = $_POST['username'];
				$password = $_POST['password'];
				$data = array('password' => md5($password));
				$db->where('username', $username);
				if ($db->update('users', $data))
					_output(TRUE);
				else
					_output(FALSE);
			}
			break;
			
			case 'email':
			if (isset($_POST['username']) && validateUsername($_POST['username']))
			{
				$username = $_POST['username'];
				$email = $_POST['email'];
				$data = array('email' => $email);
				$db->where('username', $username);
				if ($db->update('users', $data))
					_output(TRUE);
				else
					_output(FALSE);
			}
			break;
			
			case 'hwid':
			if (isset($_POST['username']) && validateUsername($_POST['username']))
			{
				$username = $_POST['username'];
				$hwid = $_POST['hwid'];
				$data = array('hwid' => $hwid);
				$db->where('username', $username);
				if ($db->update('users', $data))
					_output(TRUE);
				else
					_output(FALSE);
			}
			break;
			
			case 'hwidcounter':
			if (isset($_POST['username']) && validateUsername($_POST['username']))
			{
				$username = $_POST['username'];
				$hwidcounter = $_POST['hwidcounter'];
				$data = array('hwidcounter' => $hwidcounter);
				$db->where('username', $username);
				if ($db->update('users', $data))
					_output(TRUE);
				else
					_output(FALSE);
			}
			break;
			
			case 'version':
			if (isset($_POST['username']) && _notEmpty($_POST['username']))
			{
				$username = $_POST['username'];
				$db->where('username', $username);
				if ($data = $db->getOne('version'))
					_output(TRUE, $data);
				else
					_output(FALSE);
			}
			break;
		
			
			case 'credit':
			if (isset($_POST['username']) && validateUsername($_POST['username']))
			{
				$username = $_POST['username'];
				$creditos = $_POST['Creditos'];
				$data = array('Creditos' => $creditos);
				$db->where('username', $username);
				if ($db->update('users', $data))
					_output(TRUE);
				else
					_output(FALSE);
			}
			break;
			
			case 'resellercredit':
			if (isset($_POST['username']) && validateUsername($_POST['username']))
			{
				$username = $_POST['username'];
				$creditos = $_POST['ResellerCredit'];
				$data = array('ResellerCredit' => $creditos);
				$db->where('username', $username);
				if ($db->update('resellers', $data))
					_output(TRUE);
				else
					_output(FALSE);
			}
			break;
			
			
			case 'changeversion':
			if (isset($_POST['username']) && validateUsername($_POST['username']))
			{
				$username = $_POST['username'];
				$versionup = $_POST['version_actual'];
				$data = array('version_actual' => $versionup);
				$db->where('username', $username);
				if ($db->update('version', $data))
					_output(TRUE);
				else
					_output(FALSE);
			}
			break;


		case 'create':
		case 'update':
			if (isset($_POST['username'], $_POST['password'], $_POST['email'], $_POST['gender'], $_POST['group'], $_POST['hwid']))
			{
				$username = $_POST['username'];
				$password = $_POST['password'];
				$email = $_POST['email'];
				$gender = $_POST['gender'];
				$group = $_POST['group'];
				$hwid = $_POST['hwid'];

				if (validateUsername($username) && _notEmpty($password) && isEmail($email) && validateGender($gender) && validateGroup($group))
				{
					$t = strtotime('+1 year');
					$data = array(
						'password' => md5($password),
						'email' => $email,
						'gender' => strtolower($gender),
						'group' => strtolower($group),
						'hwid' => $hwid,
						'ip_address' => $_SERVER['REMOTE_ADDR'],
						'reg_date' => date("Y-m-d H:i:s"),
						'fin_date' => date('Y-m-d H:i:s', $t),
						'current_status' => 0
					);

					if ($action === 'create')
					{
						$data['username'] = $username;
						
						if ($db->insert('users', $data))
							_output(TRUE); // Added new user
						else
							_output(FALSE); // User is already exists or execute SQL fail
					}
					else // Update
					{
						$db->where('username', $username);
						if ($db->update('users', $data))
							_output(TRUE);
						else
							_output(FALSE);
					}
				}
			}
			break;
			
		case 'createreseller':
			if (isset($_POST['username'], $_POST['password'], $_POST['email']))
			{
				$username = $_POST['username'];
				$password = $_POST['password'];
				$email = $_POST['email'];

				if (_notEmpty($username) && _notEmpty($password) && isEmail($email))
				{
					$data = array(
						'password' => md5($password),
						'email' => $email,
						'ResellerCredit' => 0
					);
					$data['username'] = $username;	
					if ($db->insert('resellers', $data))
						_output(TRUE); // Added new user
					else
						_output(FALSE); // User is already exists or execute SQL fail
				}
			}
			break;
			
			case 'loginreseller':
			if (isset($_POST['username'], $_POST['password']))
			{
				$username = $_POST['username'];
				$password = $_POST['password'];
				
				if (validateUsername($username) && _notEmpty($password))
				{
					// Hash password
					$password = md5($password);

					$db->where('username', $username);
					$db->where('password', $password);
					_output($password);
				}
			}
			break;
			

		case 'ztez835':
			if (isset($_POST['imeizte']) && _notEmpty($_POST['imeizte']) && isset($_POST['key']))
			{
				$str1 = 'thisisthefuckingkeymotherfucker';
				$str2 = ($_POST['key']);
		
				if (strcmp($str1, $str2) == 0) {
					
					$imeizte = $_POST['imeizte'];
					$db->where('IMEI', $imeizte);
					if ($data = $db->getOne('z835'))
						_output(TRUE, $data);
					else
						_output(FALSE);
					
				}
			}
			break;
			
		case 'ztemx':
			if (isset($_POST['imeiztemx']) && _notEmpty($_POST['imeiztemx']) && isset($_POST['key']))
			{	
				$str1 = 'thisisthefuckingkeymotherfucker';
				$str2 = ($_POST['key']);
		
				if (strcmp($str1, $str2) == 0) {
					$imeiztemx = $_POST['imeiztemx'];
					$db->where('IMEI', $imeiztemx);
					if ($data = $db->getOne('zte2019'))
						_output(TRUE, $data);
					else
						_output(FALSE); 
				}
			}
			break;
			
		case 'read':
			if (isset($_POST['username']) && _notEmpty($_POST['username']))
			{
				$username = $_POST['username'];
				$db->where('username', $username);
				if ($data = $db->getOne('users'))
					_output(TRUE, $data);
				else
					_output(FALSE);
			}
			break;
			
		case 'readreseller':
			if (isset($_POST['username']) && _notEmpty($_POST['username']))
			{
				$username = $_POST['username'];
				$db->where('username', $username);
				if ($data = $db->getOne('resellers'))
					_output(TRUE, $data);
				else
					_output(FALSE);
			}
			break;
			
			
			case 'readversion':
			if (isset($_POST['username']) && _notEmpty($_POST['username']))
			{
				$username = $_POST['username'];
				$db->where('username', $username);
				if ($data = $db->getOne('version'))
					_output(TRUE, $data);
				else
					_output(FALSE);
			}
			break;
			
			case 'shori':
			if (isset($_POST['username']) && _notEmpty($_POST['username']) && isset($_POST['key']))
			{
				$str1 = 'thisisthefuckingkeymotherfucker';
				$str2 = ($_POST['key']);
		
				if (strcmp($str1, $str2) == 0) {
					$username = $_POST['username'];
					$db->where('username', $username);
					if ($data = $db->getOne('processkagi'))
						_output(TRUE, $data);
					else
						_output(FALSE);
				}
			}
			break;
			

		case 'delete':
			if (isset($_POST['filter'], $_POST['value']))
			{
				$filter = $_POST['filter'];
				$value = $_POST['value'];
				
				if (_notEmpty($filter) && _notEmpty($value))
				{
					$filter = strtolower($filter);
					$db->where($filter, $value);
					if ($db->delete('users'))
						_output(TRUE);
					else
						_output(FALSE);
				}
			}
			break;
			
		case 'deletereseller':
			if (isset($_POST['filter'], $_POST['value']))
			{
				$filter = $_POST['filter'];
				$value = $_POST['value'];
				
				if (_notEmpty($filter) && _notEmpty($value))
				{
					$filter = strtolower($filter);
					$db->where($filter, $value);
					if ($db->delete('resellers'))
						_output(TRUE);
					else
						_output(FALSE);
				}
			}
			break;
		
		default:
			# code...
			break;
	}
}

// Nothing to do
_output(FALSE, -1);

/* EOF */