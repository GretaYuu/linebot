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
</style>
<body>
    <?php
    include("manager_nav.php");
    include('SQLserver.php');
    $find_joss = "SELECT * FROM `joss_money`";
    $joss = mysqli_query($link, $find_joss);
    echo"<div class='container text-center'><table class='table table-hover table-borderless'><tr>";
    echo"<th class='align-middle'>信徒姓名</th>";
    echo"<th class='align-middle'>供奉神明</th>";
    echo"<th class='align-middle'>日期</th>";
    echo"<th class='align-middle'>總額</th>";
    echo"</tr>";
    while($joss_array = mysqli_fetch_array($joss)){
        echo"<tr>";
            echo"<th class='align-middle'>".$joss_array['joss_user']."</th>";
            echo"<th class='align-middle'>".$joss_array['joss_name']."</th>";
            echo"<th class='align-middle'>".$joss_array['joss_date']."</th>";
            echo"<th class='align-middle'>".$joss_array['joss_price']."</th>";
        echo"</tr>";
    }
    echo"</div>";
    ?>
</body>
</html>