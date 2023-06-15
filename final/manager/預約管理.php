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
    $find_ask = "SELECT * FROM ask";
    $ask = mysqli_query($link, $find_ask);
    echo"<div class='container text-center'><table class='table table-hover table-borderless'><tr>";
    echo"<th class='align-middle'>預約日期</th>";
    echo"<th class='align-middle'>預約人</th>";
    echo"<th class='align-middle'>預約時間</th>";
    echo"<th class='align-middle'>預約人數</th>";
    echo"<th class='align-middle'>預約金額</th>";
    echo"<th class='align-middle'>預約狀態</th>";
    echo"</tr>";
    while($ask_array = mysqli_fetch_array($ask)){
        echo"<tr>";
            echo"<th class='align-middle'>".$ask_array['ask_date']."</th>";
            echo"<th class='align-middle'>".$ask_array['ask_name']."</th>";
            echo"<th class='align-middle'>".$ask_array['ask_time']."</th>";
            echo"<th class='align-middle'>".$ask_array['ask_number']."</th>";
            echo"<th class='align-middle'>".$ask_array['ask_total']."</th>";
            if($ask_array['ask_state'] == '3'){
                echo"<th class='align-middle'>已取消</th>";
            }
            else if($ask_array['ask_state']=='2'){
                echo"<th class='align-middle'>未完成</th>";
                echo '<th class="align-middle"><input type="button" class="btn btn-outline-success" id="button" value="已完成" onclick="window.location.href=\'ask_finish.php?id=' . $ask_array['ask_id'] . '\'"></th>';        
            }
            else{
                echo"<th class='align-middle'>已完成</th>";
            }
        echo"</tr>";
    }
    echo"</div>";
    ?>
</body>
</html> 