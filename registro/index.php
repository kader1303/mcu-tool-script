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
			if (isset($_POST['process'], $_POST['user'], $_POST['hwid']))
			{
				$process = $_POST['process'];
				$username = $_POST['user'];
				$hwid = $_POST['hwid'];
				
				$data = array(
						'user' => $username,
						'hwid' => $hwid,
						'date' => date("Y-m-d H:i:s"),
						'ip_address' => $_SERVER['REMOTE_ADDR']
					);
	
				$data['process'] = $process;
						
					if ($db->insert('procesos', $data))
						_output(TRUE); // Added new user
					else
						_output(FALSE); // User is already exists or execute SQL fail
				
			}
			break;
			
		case 'addimei':
			if (isset($_POST['user'], $_POST['imei'], $_POST['proceso']))
			{
				$user = $_POST['user'];
				$imei = $_POST['imei'];
				$proceso = $_POST['proceso'];
				
				$data = array(
						'imei' => $imei,
						'proceso' => $proceso,
						'date' => date("Y-m-d H:i:s"),
						'ip_address' => $_SERVER['REMOTE_ADDR']
					);
	
				$data['user'] = $user;
						
					if ($db->insert('recurrencia', $data))
						_output(TRUE); // Added new user
					else
						_output(FALSE); // User is already exists or execute SQL fail
				
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

		case 'checkrecurrencia':
			if (isset($_POST['imei']) && _notEmpty($_POST['imei']))
			{
				$imei = $_POST['imei'];
				$db->where('imei', $imei);
				if ($data = $db->getOne('recurrencia'))
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

		case 'delete':
			if (isset($_POST['filter'], $_POST['value']))
			{
				$filter = $_POST['filter'];
				$value = $_POST['value'];
				
				if (_notEmpty($filter) && _notEmpty($value))
				{
					$filter = strtolower($filter);
					$db->where($filter, $value);
					if ($db->delete('recurrencia'))
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