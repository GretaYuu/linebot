<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品上傳</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<style>
    body {
        background-image: url("photo/test.jpg");
        background-size: 100% 100%;
        background-repeat: no-repeat;
        background-attachment: fixed;
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
include("manager_nav.php");
include("SQLserver.php");

//表單提交
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $product_name = $_POST["product_name"];
    $product_price = $_POST["product_price"];
    $product_stocks = $_POST["product_stocks"];
    $product_information = $_POST["product_information"];
    $product_description = $_POST["product_description"];
    $product_ship = $_POST["product_ship"];

    // Handle file upload
    $target_directory = "uploads/"; // 設定上傳檔案的目錄
    $target_file = $target_directory . basename($_FILES["product_picture"]["name"]);
    $upload_ok = true;
    $image_file_type = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // 檢查上傳的檔案是否為有效的圖片
    $check = getimagesize($_FILES["product_picture"]["tmp_name"]);
    if ($check === false) {
        echo "<script>alert('上傳的文件不是有效的圖片。');</script>";
        $upload_ok = false;
    }

    // 檢查檔案是否已經存在
    if (file_exists($target_file)) {
        echo "<script>alert('相同檔名的圖片已存在。');</script>";
        $upload_ok = false;
    }

    // 檢查檔案大小限制
    if ($_FILES["product_picture"]["size"] > 5000000) { // 限制文件大小為 5MB
        echo "<script>alert('檔案大小超過限制。');</script>";
        $upload_ok = false;
    }

    // 允許上傳的圖片格式
    $allowed_image_types = array("jpg", "jpeg", "png", "gif");
    if (!in_array($image_file_type, $allowed_image_types)) {
        echo "<script>alert('只允許上傳 JPG, JPEG, PNG, GIF 格式的圖片。');</script>";
        $upload_ok = false;
    }

    if ($upload_ok) {
        if (move_uploaded_file($_FILES["product_picture"]["tmp_name"], $target_file)) {
            $product_picture = $target_file;
    
            $sql = "INSERT INTO product (product_name, product_price, product_stocks, product_information, product_description, product_ship, product_picture)
                    VALUES ('$product_name', '$product_price', '$product_stocks', '$product_information', '$product_description', '$product_ship', '$product_picture')";
    
            if (mysqli_query($link, $sql)) {
                echo "<script>alert('文件上傳成功且資料插入資料庫成功。'); window.location = 'product.php';</script>";
            } else {
                echo "<script>alert('文件上傳成功，但資料插入資料庫失敗。');</script>";
            }
    
        } else {
            echo "<script>alert('圖片上傳失敗。');</script>";
        }
    } else {
        echo "<script>alert('文件上傳失敗。');</script>";
    }   
}
mysqli_close($link);
?>
<body style="background-color:#2A3D45;">
    <div class="container d-flex h-100 align-items-center justify-content-center">
        <div class="row justify-content-center">
            <div class="col-md-12 ">
                <div class="card text-center">
                    <div class="card-header rounded-2">
                        <h1 class="display-4 fw-normal text-black">商品上傳頁面</h1>
                        <p class="text-black">請填寫以下商品資訊</p>
                    </div>
                    <div class="card-body">
                        <form action="product_upload.php" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="product_name" class="form-label text-black">商品名稱</label>
                                <textarea id="product_name" name="product_name" class="form-control" placeholder="請輸入商品名稱" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="product_price" class="form-label text-black">商品價格</label>
                                <input type="number" id="product_price" name="product_price" class="form-control" placeholder="請輸入商品價格" required>
                            </div>
                            <div class="mb-3">
                                <label for="product_stocks" class="form-label text-black">商品庫存</label>
                                <input type="number" id="product_stocks" name="product_stocks" class="form-control" min="0" step="1" placeholder="請輸入商品庫存" required>
                            </div>
                            <div class="mb-3">
                                <label for="product_picture" class="form-label text-black">商品圖片</label>
                                <input type="file" id="product_picture" name="product_picture" class="form-control-file" accept="image/*" required>
                            </div>
                            <div class="mb-3">
                                <label for="product_information" class="form-label text-black">商品資訊</label>
                                <textarea id="product_information" name="product_information" class="form-control" rows="4" placeholder="商品詳細資訊" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="product_description" class="form-label text-black">商品說明</label>
                                <textarea id="product_description" name="product_description" class="form-control" rows="4" placeholder="商品簡短說明" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="product_ship" class="form-label text-black">商品運送說明</label>
                                <textarea id="product_ship" name="product_ship" class="form-control" rows="4" placeholder="商品運送方式及說明" required>這是個運送政策，適合加入與運送方法、包裝和費用相關的資訊。撰寫政策時，請盡量開門見山，以便建立互信，讓顧客有信心購買您的產品。
                                </textarea>
                            </div>
                            <input type="submit" class="btn btn-secondary" value="上傳商品"></input>
                        </form>
                    </div>
                    <div class="card-footer text-muted rounded-2">
                        <p class="fs-5 mt-4 text-black">感謝您使用我們的商品上傳頁面</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php if ($_SERVER["REQUEST_METHOD"] == "POST") : ?>
    <?php if ($upload_ok) : ?>
        <?php if (move_uploaded_file($_FILES["product_picture"]["tmp_name"], $target_file)) : ?>
            <?php if (mysqli_query($link, $sql)) : ?>
                <script>
                    console.log("文件上傳成功且資料插入資料庫成功。");
                </script>
            <?php else : ?>
                <script>
                    console.log("文件上傳成功，但資料插入資料庫失敗。");
                </script>
            <?php endif; ?>
        <?php else : ?>
            <script>
                console.log("圖片上傳失敗。");
            </script>
        <?php endif; ?>
    <?php else : ?>
        <script>
            console.log("文件上傳失敗。");
        </script>
    <?php endif; ?>
<?php endif; ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.1/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/"></script>
</body>
</html>