//This is the server end of the application, place this on a php 5+ webserver and point to it in the main applications configuration
<?php
function generateRandomString($length) {
    $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    };
    return $randomString;
}
if($_GET['create'] == 'true') {
	$id = generateRandomString(6);
	$chatfile = $id . '.txt';
	while (file_exists($chatfile)){
		$id = generateRandomString(6);
		$chatfile = $id . '.txt';
	};
	$tempfile = fopen($chatfile, "w"); 
	echo $id;
	file_put_contents($chatfile, "Welcome to the chat! Type a message and press send to continue!", FILE_APPEND);	
} else {
	$chatfile = $_GET['chatid'] . '.txt';
	if($_GET['new'] == 'true') {
		$handle = fopen ($chatfile, "w+");
		fclose($handle);
		file_put_contents($chatfile, "Welcome to the chat! Type a message and press send to continue!", FILE_APPEND);
		echo file_get_contents($chatfile);
	} else if ($_GET['clean'] == 'true') {
		$handle = fopen ($chatfile, "w+");
		fclose($handle);
		file_put_contents($chatfile, 'Chat cleaned!', FILE_APPEND);
		echo file_get_contents($chatfile);
	} else if($_GET['add'] == 'true') {
		$chatText = str_replace('--nbsp--',' ',$_GET['text']);
		$chatText = str_replace('--amp--','&',$chatText);
		$chatText = str_replace('--equalsi--','=',$chatText);
		$chatText = str_replace('--questsi--','?',$chatText);
		$chatData = $_GET['name'] . ": " . $chatText . "\n";
		$chatData .= file_get_contents($chatfile);
		file_put_contents($chatfile, $chatData);
		echo file_get_contents($chatfile);
	} else {
		echo file_get_contents($chatfile);
	};
};
?>
