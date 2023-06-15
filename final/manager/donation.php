<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>預約管理</title>
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
    include('manager_nav.php');
    include('SQLserver.php');
    $find_donation = "SELECT * FROM donation";
    $donation = mysqli_query($link, $find_donation);
    echo"<div class='container text-center'><table class='table table-hover table-borderless'><tr>";
    echo"<th class='align-middle'>信徒姓名</th>";
    echo"<th class='align-middle'>捐贈金額</th>";
    echo"<th class='align-middle'>捐贈日期</th>";
    echo"<th class='align-middle'>備註</th>";
    echo"</tr>";
    while($donation_array = mysqli_fetch_array($donation)){
        echo"<tr>";
            echo"<th class='align-middle'>".$donation_array['donation_name']."</th>";
            echo"<th class='align-middle'>".$donation_array['donation_price']."</th>";
            echo"<th class='align-middle'>".$donation_array['donation_date']."</th>";
            echo"<th class='align-middle'>".$donation_array['donation_content']."</th>";
        echo"</tr>";
    }
    echo"</div>";
    ?>
</body>
</html> 