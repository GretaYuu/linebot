<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>修改</title>
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
    tr{
        font-size: 20px;
        font-weight: bold;
    }
    input{
        border-radius: 10px;
        color: rgb(131, 131, 131);
        padding: 5px;
    }
    #button{
        font-size: 20px;
        border-width: 3px;
        font-weight: bold;
        border-radius: 18px;
    }
</style>
<body>
    <?php
    include('manager_nav.php');
    include('SQLserver.php');
    $id = $_GET['id'];
    $code = "SELECT * FROM `member` WHERE member_id = $id";
    $member = mysqli_query($link,$code);
    $member_array = mysqli_fetch_array($member);
    echo"<div class='container text-center'>";
    echo"<form method='GET' action='member_update_action.php'>";
    echo"<table class='table table-borderless'>";
    echo"<tr><td>姓名 : <input type='text' value='".$member_array['member_name']."' name='name'></td></tr>";
    echo"<tr><td>帳號 : <input type='text' value='".$member_array['member_account']."' name='account'></td></tr>";
    echo"<tr><td>密碼 : <input type='text' value='".$member_array['member_password']."' name='password'></td></tr>";
    echo"<tr><td>電話 : <input type='text' value='".$member_array['member_phone']."' name='phone'></td></tr>";
    echo"<tr><td>電子郵件 : <input type='text' value='".$member_array['member_mail']."' name='mail'></td></tr>";
    echo"<tr><td>性別 : <input type='text' value='".$member_array['member_gender']."' name='gender'></td></tr>";
    echo"<tr><td>生日: <input type='date' value='".$member_array['member_birthday']."' name='birthday'></td></tr>";
    echo"</table>";
    echo"<input type='hidden' value='". $id ."'name='id'>";
    echo"<button class='btn btn-outline-danger' id='button' type='submit'>送出</button>";
    echo"</form>";
    echo"</div>";
?>
</body>
</html>
