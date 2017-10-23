<?
if ( !$_GET['to'] || !$_GET['type'] ){
	$to = $argv[1];
	$type = (int)$argv[2];

	$data = "";
	for( $i=3; $i<$argc; $i++ ){
		$data .= ($data ? " " : "" ) . $argv[$i];
	}

	$data = urlencode ( $data );
	$to = urlencode( $to );

//	echo "sending "."http://www.myt.com.br/uo/email.php?to=$to&type=$type&data=$data";
	$fp = fopen( "http://www.myt.com.br/uo/email.php?to=$to&type=$type&data=$data","r" );
	while( $fp && !feof( $fp ) ){
		fread( $fp, 1024 );
	}
	fclose ( $fp );
//	echo "DONE";
}

else{
	$to = $_GET['to'];
	$type = (int)$_GET['type'];
	$data = $_GET['data'];

	switch( $type ){
		//confirm email
		case 1:
			$body = "
Para confirmar seu endereço de email, entre com sua conta e digite:

.confirme $data

Obrigado

Equipe Mystical Tales
			";
			break;

		//accepted
		case 2:
			$body = "
Seu formulário foi aceito. Você agora já pode desfrutar de todos os sistemas no mundo de Mystical Tales.

Nota do GM:
$data

Até Breve!

Equipe Mystical Tales
			";
			break;

		//rejected
		case 3:
			$body = "
Seu formulário foi recusado. Para maiores informações entre em nosso shard ou consulte algum GM.

Nota do GM:
$data

Obrigado

Equipe Mystical Tales
			";
			break;

		default:
			exit();
	}


	$path = '/home/myt/php';
	set_include_path(get_include_path() . PATH_SEPARATOR . $path);

	require_once "Mail.php";

	$from = "Mystical Tales <contas@myt.com.br>";
	$subject = "Mystical Tales Shard";
	$host = "smtp.myt.com.br";
	$username = "";
	$password = "";

	$headers = array (
		'From' => $from,
		'To' => $to,
		'Subject' => $subject
	);

	$smtp = Mail::factory('smtp',
		array (
			'host' => $host,
			'auth' => false,
			'username' => $username,
			'password' => $password)
	);

	$mail = $smtp->send($to, $headers, $body);

	if (PEAR::isError($mail)) {
  		echo("<p>" . $mail->getMessage() . "</p>");
	}
}
?>