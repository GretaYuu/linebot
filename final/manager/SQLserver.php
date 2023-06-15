<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?php
$server_name = "localhost";
//資料庫名稱
$dbname = "term_project";
//資料庫管理者帳號
$username = "root";
//資料庫管理者密碼
$password = "";
//埠號
$db_port = "3306";

//對資料庫連線
$link = mysqli_connect($server_name, $username, $password, $dbname, $db_port);
if (!@mysqli_connect($server_name, $username, $password, $dbname, $db_port)) {
    die("無法連線至資料庫");}
//資料庫連線採UTF8
mysqli_query($link,"SET NAMES UTF8");

?> 
