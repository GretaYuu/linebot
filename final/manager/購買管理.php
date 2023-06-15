<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>購買管理</title>
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
        $find_order = "SELECT * FROM `order_record`";
        $order_result = mysqli_query($link, $find_order);
        echo"<div class='container text-center'><table class='table table-hover table-borderless'><tr>";
        echo"<th class='align-middle'>姓名</th>";
        echo"<th class='align-middle'>商品名稱</th>";
        echo"<th class='align-middle'>商品數量</th>";
        echo"<th class='align-middle'>總計</th>";
        echo"<th class='align-middle'>運送地址</th>";
        echo"<th class='align-middle'>出貨狀態</th>";
        echo"</tr>";
        while($order_array = mysqli_fetch_array($order_result)){
            echo"<tr>";
            $member_id = $order_array['member_id'];
            $cart_id = $order_array['cart_id'];
            $find_member = mysqli_query($link, "SELECT * FROM `member` WHERE `member_id` = $member_id");
            $member_row = mysqli_fetch_assoc($find_member);
            echo"<th class='align-middle'>".$member_row['member_name']."</th>";
            $find_cart = mysqli_query($link, "SELECT * FROM `cart_secondary` WHERE `cart_id` = $cart_id");
            echo"<th class='align-middle'>";
            if (mysqli_num_rows($find_cart) > 0) {
                while ($cart_row = mysqli_fetch_assoc($find_cart)) {
                    $product_id = $cart_row['product_id'];
                    $find_product = mysqli_query($link, "SELECT * FROM `product` WHERE `product_id` = $product_id");
                    $product_row = mysqli_fetch_assoc($find_product);
                    echo $product_row['product_name'];
                    echo "<br>";
                }
            }
            else{
                $cart_row = mysqli_fetch_assoc($find_cart);
                $product_id = $cart_row['product_id'];
                $find_product = mysqli_query($link, "SELECT * FROM `product` WHERE `product_id` = $product_id");
                $product_row = mysqli_fetch_assoc($find_product);
                echo $product_row['product_name'];
            }
            echo"</th>";
            echo"<th class='align-middle'>";
            $find_cart_num = mysqli_query($link, "SELECT * FROM `cart_secondary` WHERE `cart_id` = $cart_id");
            if (mysqli_num_rows($find_cart_num) > 0) {
                while ($row = mysqli_fetch_assoc($find_cart_num)) {
                    echo $row['product_num'];
                    echo "<br>";
                }
            }
            else{
                $row = mysqli_fetch_assoc($find_cart_num);
                echo $row['product_num'];
            }
            echo"</th>";
            echo"<th class='align-middle'>".$order_array['total']."</th>";
            echo"<th class='align-middle'>".$order_array['address']."</th>";
            
            echo"<th class='align-middle'>";
            $state = $order_array['order_state'];
            if($state == 1){
                echo"<span style='color:red;'>已付款</span>";
            }
            else if($state == 2){
                echo"<span style='color:blue;'>運送中</span>";
            }
            else{
                echo"<span style='color:green;'>已完成</span>";
            }
            echo"</th>";
            echo '<th class="align-middle"><input type="button" class="btn btn-outline-primary" id="button" value="運送中" onclick="window.location.href=\'order_state_ship.php?id=' . $order_array['order_id'] . '\'"></th>';        
            echo '<th class="align-middle"><input type="button" class="btn btn-outline-success" id="button" value="已完成" onclick="window.location.href=\'order_state_finish.php?id=' . $order_array['order_id']  . '\'"></th>';        
            echo"</tr>";
        }
    ?>
</body>
</html>