<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>點燈管理</title>
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
            font-size: 20px;
            border-width: 3px;
            font-weight: bold;
            border-radius: 18px;
        }
</style>
<body>
    <?php include('manager_nav.php');?>
    <div class='container text-right'>
    <form method='get' action='點燈查詢.php'>
    <input type='date' name='date'>
    <input type='submit' class='btn btn-outline-primary' id='button' value='送出'>
    </form>
    <?php
    include("SQLserver.php");
    $code ="SELECT * FROM `light_record` ";
    $light = mysqli_query($link,$code);
    echo"<div class='container text-center'> <table class='table table-hover table-borderless'><tr>";
    echo"<th class='align-middle'>姓名</th>";
    echo"<th class='align-middle'>燈</th>";
    echo"<th class='align-middle'>點燈日期</th>";
    echo"<th class='align-middle'>生辰八字</th>";
    echo"<th class='align-middle'>生日</th>";
    echo"<th class='align-middle'>地址</th>";
    echo"</tr>";
    while($light_array = mysqli_fetch_array($light)){
        echo"<tr>";
            $light_id = $light_array['light_id'];
            $code1 = "SELECT * FROM `light_up` WHERE `light_id` = '$light_id'";
            $main_light = mysqli_query($link,$code1);
            $main_light_array = mysqli_fetch_array($main_light);
            echo"<th class='align-middle'>".$light_array['light_record_name']."</th>";
            echo"<th class='align-middle'>".$main_light_array['light_name']."</th>";
            echo"<th class='align-middle'>".$light_array['light_record_date']."</th>";
            echo"<th class='align-middle'>".$light_array['light_record_time']."</th>";
            echo"<th class='align-middle'>".$light_array['light_record_birthday']."</th>";
            echo"<th class='align-middle'>".$light_array['light_record_address']."</th>";
        echo"</tr>";
    }
    echo"</div>";
    ?>
    <div>
</body>
</html>