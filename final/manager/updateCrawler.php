<?php
    if(isset($_POST['update_crawler'])){
        shell_exec("python crawler.py");
    }
    header("location: update.php");
?>

