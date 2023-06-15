<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品編輯</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<style>
    body {
        background-color: #2a3d45;
    }
    
    .container {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .card {
        width: 100%;
        max-width: 600px;
        background-color: #f8f9fa;
        border: none;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        padding: 30px;
    }
    
    .card h1 {
        font-size: 2.5rem;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
        color: #2a3d45;
    }
    
    .card p {
        font-size: 1.5rem;
        font-weight: bold;
        margin-bottom: 10px;
        color: #2a3d45;
    }
    
    .form-control {
        border-radius: 10px;
        font-size: 1.2rem;
        color: #2a3d45;
        background-color: #e9ecef;
        border: none;
    }
    
    .form-control:focus {
        box-shadow: none;
        outline: none;
    }
    
    .btn {
        font-size: 1.5rem;
        font-weight: bold;
        background-color: #2a3d45;
        border-radius: 10px;
        border: none;
    }
    
    .btn:hover {
        background-color: #354f52;
    }
    
    .text-muted {
        font-size: 1.2rem;
        font-style: italic;
        color: #6c757d;
    }
</style>
<?php
include("SQLserver.php");

if (!isset($_GET["id"])) {
    echo "<script>alert('Invalid product ID.'); window.location = 'product.php';</script>";
    exit;
}

$product_id = $_GET["id"];

$sql = "SELECT * FROM product WHERE product_id = '$product_id'";
$result = mysqli_query($link, $sql);
$product = mysqli_fetch_assoc($result);

if (!$product) {
    echo "<script>alert('Product not found.'); window.location = 'product.php';</script>";
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $product_name = $_POST["product_name"];
    $product_price = $_POST["product_price"];
    $product_stocks = $_POST["product_stocks"];
    $product_information = $_POST["product_information"];
    $product_description = $_POST["product_description"];
    $product_ship = $_POST["product_ship"];
    $product_picture = $_POST["product_picture"];

    $sql = "UPDATE product SET
            product_name = '$product_name',
            product_price = '$product_price',
            product_stocks = '$product_stocks',
            product_information = '$product_information',
            product_description = '$product_description',
            product_ship = '$product_ship',
            product_picture = '$product_picture'
            WHERE product_id = '$product_id'";

    if (mysqli_query($link, $sql)) {
        echo "<script>alert('Product updated successfully.'); window.location = 'm_product.php';</script>";
        exit;
    } else {
        echo "<script>alert('Failed to update product.'); window.location = 'edit_product.php?id=$product_id';</script>";
        exit;
    }
}

?>

<body>
    <div class="container d-flex h-100 align-items-center justify-content-center">
        <div class="card">
            <h1>編輯商品</h1>
            <form method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]) . '?id=' . $product_id; ?>">
                <div class="form-group">
                    <label for="product_name">商品名稱</label>
                    <input type="text" class="form-control" id="product_name" name="product_name" value="<?php echo $product['product_name']; ?>" required>
                </div>
                <div class="form-group">
                    <label for="product_price">商品價格</label>
                    <input type="number" class="form-control" id="product_price" name="product_price" value="<?php echo $product['product_price']; ?>" required>
                </div>
                <div class="form-group">
                    <label for="product_stocks">商品庫存</label>
                    <input type="number" class="form-control" id="product_stocks" name="product_stocks" value="<?php echo $product['product_stocks']; ?>" required>
                </div>
                <div class="form-group">
                    <label for="product_information">商品資訊</label>
                    <textarea class="form-control" id="product_information" name="product_information" rows="5" required><?php echo $product['product_information']; ?></textarea>
                </div>
                <div class="form-group">
                    <label for="product_description">商品描述</label>
                    <textarea class="form-control" id="product_description" name="product_description" rows="5" required><?php echo $product['product_description']; ?></textarea>
                </div>
                <div class="form-group">
                    <label for="product_ship">商品運送</label>
                    <textarea class="form-control" id="product_ship" name="product_ship" rows="5" required><?php echo $product['product_ship']; ?></textarea>
                </div>
                <div class="form-group">
                    <label for="product_picture">商品圖片(注意副檔名)</label>
                    <input type="text" class="form-control" id="product_picture" name="product_picture" value="<?php echo $product['product_picture']; ?>" required>
                </div>
                <div class="text-center">
                    <br>
                    <button type="submit" class="btn btn-primary">完成編輯</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
