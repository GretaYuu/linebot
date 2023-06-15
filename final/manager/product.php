<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品管理</title>
</head>
<style>
    body {
    background-image: url("photo/test.jpg");
    background-size: 100% 100%;
    background-repeat: no-repeat;
    background-attachment: fixed;
    }
    .container-intro{
        margin-top: 200px;
        margin-left: 500px;
    }
    .row img{
        width: 50%;
        border: 8px black solid;
        border-radius: 30px 30px 30px 30px
    }
</style>
<body>
    <?php include('manager_nav.php')?>
    <div class="container-intro text-center">
        <div class="row">
            <div class="col-sm-3" id="pho">
                <a href="product_upload.php"><img src="photo/add.png"></a>
            </div>
            <div class="col-sm-3">
                <a href="m_product.php"><img src="photo/reset.png"></a>
            </div>
            
        </div>
        <div class="row">
            <div class="col-sm-3" id="pho">
                <h2>新增商品</h2>
            </div>
            <div class="col-sm-3">
                <h2>修改商品資訊</h2>
            </div>
            
        </div>
    </div>
</body>
</html>