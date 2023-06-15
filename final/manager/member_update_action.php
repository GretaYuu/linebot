<?php
    include("SQLserver.php");
    $name = $_GET['name'];
    $account = $_GET['account'];
    $password = $_GET['password'];
    $id = $_GET['id'];
    $phone = $_GET['phone'];
    $birthday = $_GET['birthday'];
    $gender = $_GET['gender'];
    $mail = $_GET['mail'];
    $code = "SELECT * FROM `member` WHERE member_id = $id";
    $member = mysqli_query($link,$code);
    $member_array = mysqli_fetch_array($member);
    if($member_array[1] != $account){
        $update = "UPDATE `member` SET `member_account` = '$account' WHERE `member`.`member_id` = $id";
        mysqli_query($link,$update);
    }
    if($member_array[2] != $password){
        $update = "UPDATE `member` SET `member_password` = '$password' WHERE `member`.`member_id` = $id";
        mysqli_query($link,$update);
    }
    if($member_array[3] != $name){
        $update = "UPDATE `member` SET `member_name` = '$name' WHERE `member`.`member_id` = $id";
        mysqli_query($link,$update);
    }
    if($member_array[4] != $phone){
        $update = "UPDATE `member` SET `member_phone` = '$phone' WHERE `member`.`member_id` = $id";
        mysqli_query($link,$update);
    }
    if($member_array[5] != $mail){
        $update = "UPDATE `member` SET `member_mail` = '$mail' WHERE `member`.`member_id` = $id";
        mysqli_query($link,$update);
    }
    if($member_array[6] != $gender){
        $update = "UPDATE `member` SET `member_gender` = '$gender' WHERE `member`.`member_id` = $id";
        mysqli_query($link,$update);
    }
    if($member_array[7] != $birthday){
        $update = "UPDATE `member` SET `member_birthday` = '$birthday' WHERE `member`.`member_id` = $id";
        mysqli_query($link,$update);
    }
    echo "<script>alert('修改完成')</script>";
    echo "<script language='Javascript'>";
        echo "location.href='會員管理.php'";
    echo "</script>";
?>