<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="author" content="Script Tutorials" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <title>HTML5 Audio player with playlist | Script Tutorials</title>

    <!-- add styles and scripts -->
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.21.custom.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
</head>
<body>
    <!-- <header>
        <h2>Back to '<a href="http://www.script-tutorials.com/html5-audio-player-with-playlist/">HTML5 Audio player with playlist</a>' tutorial</h2>
    </header> -->
    <div class="example">

        <div class="player">
            <div class="pl"></div>
            <div class="title"></div>
            <div class="artist"></div>
            <div class="cover"></div>
            <div class="controls">
                <div class="play"></div>
                <div class="pause"></div>
                <div class="rew"></div>
                <div class="fwd"></div>
            </div>
            <div class="volume"></div>
            <div class="tracker"></div>
        </div>
        <ul class="playlist hidden-x">
            <?php
            
            // $directory = 'data/';
            
            // $it = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($directory));
            
            // while($it->valid()) {
            
            //     if (!$it->isDot() && $it->getSubPathName() != '.htaccess') {
            
            //         // echo 'SubPathName: ' . $it->getSubPathName() . "\n";
            //         // echo 'SubPath:     ' . $it->getSubPath() . "\n";
            //         // echo 'Key:         ' . $it->key() . "\n\n";

            //         echo '<li audiourl="' . $it->getSubPathName() . '">' . $it->getSubPathName() . '</li>';
            //     }
            
            //     $it->next();
            // }


            // if($handle = opendir('data/')) {
            //     while(false !== ($entry = readdir($handle))) {
            //         if($entry != "." && $entry != ".." && $entry !== ".htaccess") {
            //             echo '<li audiourl="' . $entry . '">' . $entry . '</li>';
            //         }
            //     }

            //     closedir($handle);
            // }

            $dir = opendir('../storage/');

            $files = array();
            while($files[] = readdir($dir));
            sort($files);
            closedir($dir);

            
            foreach($files as $file) {

                $ext = pathinfo($file, PATHINFO_EXTENSION);
                
                if($file != "." && $file != ".." && $file != ".htaccess" && in_array($ext, ['mp3', 'ogg', 'wav'])) {
                    echo '<li audiourl="' . rawurldecode($file) . '">' . rawurldecode($file) . '</li>';
                }
            }
            
            ?>
            <!-- <li audiourl="01.mp3" cover="cover1.jpg" artist="Artist 1">01.mp3</li>
            <li audiourl="02.mp3" cover="cover2.jpg" artist="Artist 2">02.mp3</li>
            <li audiourl="03.mp3" cover="cover3.jpg" artist="Artist 3">03.mp3</li>
            <li audiourl="04.mp3" cover="cover4.jpg" artist="Artist 4">04.mp3</li>
            <li audiourl="05.mp3" cover="cover5.jpg" artist="Artist 5">05.mp3</li>
            <li audiourl="06.mp3" cover="cover6.jpg" artist="Artist 6">06.mp3</li>
            <li audiourl="07.mp3" cover="cover7.jpg" artist="Artist 7">07.mp3</li> -->
        </ul>

    </div>
</body>
</html>