<?php

// A list of permitted file extensions
$allowed = array('png', 'jpg', 'gif', 'zip', 'mp3', 'ogg', 'mp4', 'wav', 'bmp', 'pdf', 'docx', 'xlsx', 'pptx', 'rar', '7z', 'jpeg', 'txt', 'log', 'mkv', 'avi', 'url');

if(isset($_FILES['upl']) && $_FILES['upl']['error'] == 0){

	$extension = pathinfo($_FILES['upl']['name'], PATHINFO_EXTENSION);

	// if(!in_array(strtolower($extension), $allowed)){
	// 	echo '{"status":"error"}';
	// 	exit;
	// }

	if(move_uploaded_file($_FILES['upl']['tmp_name'], '../storage/'.$_FILES['upl']['name'])){
		echo '{"status":"success"}';
		exit;
	}
}

echo '{"status":"error"}';
exit;