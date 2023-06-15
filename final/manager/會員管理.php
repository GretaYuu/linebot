<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>會員管理</title>
</head>
<style>
    body {
        background-image: url("photo/test.jpg");
        background-size: 100% 100%;
        background-repeat: no-repeat;
        background-attachment: fixed;
    }
    .table{
        background-color: rgba(250, 239, 175, 0.726);
        margin-top:30px ;
        border-radius: 20px;
    }
    #button{
        font-size: 15px;
        border-width: 3px;
        font-weight: bold;
        border-radius: 18px;
    }
</style>
<body>
    <?php
        include("manager_nav.php"); 
        include('SQLserver.php');
        $find_member = "SELECT * FROM member";
        $member = mysqli_query($link,$find_member);
        echo"<div class='container text-center'><table class='table table-hover table-borderless'><tr>";
        echo"<th class='align-middle'>姓名</th>";
        echo"<th class='align-middle'>帳號</th>";
        echo"<th class='align-middle'>密碼</th>";
        echo"<th class='align-middle'>電話</th>";
        echo"<th class='align-middle'>電子郵件</th>";
        echo"<th class='align-middle'>性別</th>";
        echo"<th class='align-middle'>生日</th>";
        echo"</tr>";
            while($member_array = mysqli_fetch_array($member)){
                if($member_array['member_position'] == 0){
                    echo"<tr>";
                    echo"<th class='align-middle'>".$member_array['member_name']."</th>";
                    echo"<th class='align-middle'>".$member_array['member_account']."</th>";
                    echo"<th class='align-middle'>".$member_array['member_password']."</th>";
                    echo"<th class='align-middle'>".$member_array['member_phone']."</th>";
                    echo"<th class='align-middle'>".$member_array['member_mail']."</th>";
                    echo"<th class='align-middle'>".$member_array['member_gender']."</th>";
                    echo"<th class='align-middle'>".$member_array['member_birthday']."</th>";
                    echo '<th class="align-middle"><input type="button" class="btn btn-outline-danger" value="修改" id="button" onclick="window.location.href=\'member_update.php?id=' . $member_array['member_id'] . '\'"></th>';
                    echo '<th class="align-middle"><input type="button" class="btn btn-outline-secondary" value="停用" id="button" onclick="window.location.href=\'member_delete.php?id=' . $member_array['member_id'] . '\'"></th>';
                    echo"</tr>";
                }
                elseif($member_array['member_position'] == -1){
                    echo"<tr>";
                    echo"<th class='align-middle'>".$member_array['member_name']."</th>";
                    echo"<th class='align-middle'>".$member_array['member_account']."</th>";
                    echo"<th class='align-middle'>".$member_array['member_password']."</th>";
                    echo"<th class='align-middle'>".$member_array['member_phone']."</th>";
                    echo"<th class='align-middle'>".$member_array['member_mail']."</th>";
                    echo"<th class='align-middle'>".$member_array['member_gender']."</th>";
                    echo"<th class='align-middle'>".$member_array['member_birthday']."</th>";
                    echo '<th class="align-middle">已停用</th>';
                    echo"</tr>";
                }
            }
            echo "</table></div>";
    ?>
</body>
</html>