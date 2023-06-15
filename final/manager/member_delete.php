<?php
    include('SQLserver.php');
    $id = $_GET['id'];
    $code = "SELECT * FROM `member` WHERE member_id = $id";
    $member = mysqli_query($link, $code);
    $member_array = mysqli_fetch_array($member);
    $member_array['member_position'] = -1;
    
    $updateCode = "UPDATE `member` SET `member_position` = -1 WHERE member_id = $id";
    mysqli_query($link, $updateCode);

    if (mysqli_error($link)) {
        echo "更新失敗：" . mysqli_error($link);
    } else {
        echo "<script language='Javascript'>";
        echo "location.href='會員管理.php'";
        echo "</script>";
    }
?>