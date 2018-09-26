<?php
// $_POST['directory'] = 'D:\#\test';
if($_POST['action'] == 'getlist') {
    getList();
}
else if($_POST['action'] == 'assort') {
    assort();
}

function getList() {
    $file_list = [];
    $directory = $_POST['directory'];
    
    if ($handle = opendir($directory)) {
        while (false !== ($file = readdir($handle)))
        {
            $file_extension = strtolower(substr($file, strrpos($file, '.') + 1));
            if ($file != "." && $file != ".." && $file_extension  == 'rar')
            {
                // $thelist .= '<li><a href="'.$file.'">'.$file.'</a></li>';
                $file_list[] = $file;
            }
        }
        closedir($handle);
    }
    header('Content-type:application/json;charset=utf-8');
    echo json_encode($file_list);
}

function assort() {
    header('Content-type:application/json;charset=utf-8');
    $origin_path = $_POST['origin_path'];
    $destination_path = $_POST['destination_path'];

    if(!file_exists($origin_path)) {
        $response = ['status' => 'error', 'message' => 'source file is not found'];
        echo json_encode($response);
        return;
    }
    
    $directory = dirname($destination_path);
    if(!file_exists($directory)) {
        mkdir($directory);
    }

    if(file_exists($destination_path)) {
        $response = ['status' => 'error', 'message' => 'file already exist'];
        echo json_encode($response);
        return;
    }
    
    $exec = rename($origin_path, $destination_path);
    if($exec) {
        $response = ['status' => 'success'];
        echo json_encode($response);
        return;
    }
    else {
        $response = ['status' => 'error', 'message' => 'moving failed'];
        echo json_encode($response);
        return;
    }
}

?>