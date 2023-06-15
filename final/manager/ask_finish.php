<?php
    include('SQLserver.php');
    $id = $_GET['id'];
    $update = "UPDATE `ask` SET `ask_state` = '1' WHERE `ask`.`ask_id` = $id";
    mysqli_query($link,$update);
    echo "<script language='Javascript'>";
        echo "location.href='預約管理.php'";
    echo "</script>";
?>