<?php
include('SQLserver.php');
$order_id = $_GET['id'];
$update = "UPDATE `order_record` SET `order_state` = '3' WHERE `order_record`.`order_id` = $order_id";
mysqli_query($link,$update);
echo "<script language='Javascript'>";
    echo "location.href='購買管理.php'";
echo "</script>";
?>