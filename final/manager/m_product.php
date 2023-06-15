<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品管理列表</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url("photo/test.jpg");
            background-size: 100% 100%;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            margin-bottom: 40px;
        }

        .product-picture {
            width: 300px;
            height: 300px;
            object-fit: cover;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .product-title {
            text-align: center;
            width: 200px;
            margin-top: 15px;
            font-weight: bold;
            font-size: 18px;
            word-wrap: break-word;
            word-break: break-all;
        }

        .product-price {
            text-align: center;
            margin-top: 10px;
            font-size: 16px;
            color: #777;
        }

        .list-group-item {
            display: flex;
            flex-direction: column;
            background-color: #fff;
            border: none;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            height: 500px;
        }


        .list-group-item:not(:last-child) {
            margin-bottom: 20px;
        }

        .product-link {
            text-decoration: none;
            color: inherit;
        }

        .button-group {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 0px;
        }

        .button-group button {
            margin-right: 10px;
            margin-left: 10px;
        }
    </style>
</head>

<body>
    <?php include("manager_nav.php");?>
    <div class="container">
        <h1 class="mt-4">商品列表</h1>
        <div class="d-flex flex-wrap mt-4">
            <?php
            include("SQLserver.php");

            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["delete_product_id"])) {
                $delete_product_id = $_POST["delete_product_id"];
                $sql = "DELETE FROM product WHERE product_id = '$delete_product_id'";
                if (mysqli_query($link, $sql)) {
                    echo "<script>alert('刪除成功。'); window.location = 'm_product.php';</script>";
                    exit;
                } else {
                    $error_message = mysqli_error($link);
                    echo "<script>alert('刪除失敗. Error: $error_message'); window.location = 'm_product.php';</script>";
                    exit;
                }
            }

            $sql = "SELECT * FROM product";
            $result = mysqli_query($link, $sql);

            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo '<div class="list-group-item flex-fill">';
                    echo '<div class="d-flex flex-column align-items-center">';
                    echo '<img src="' . $row["product_picture"] . '" alt="' . $row["product_name"] . '" class="product-picture img-fluid">';
                    echo '<h4 class="mt-3 product-title">' . $row["product_name"] . '</h4>';
                    echo '<p><strong>價格:</strong> $' . $row["product_price"] . '</p>';
                    echo '</div>';
                    echo '<div class="button-group">';
                    echo '<a href="edit_product.php?id=' . $row["product_id"] . '" class="btn btn-secondary">編輯</a>';
                    echo '<form method="POST" action="' . htmlspecialchars($_SERVER["PHP_SELF"]) . '">';
                    echo '<input type="hidden" name="delete_product_id" value="' . $row["product_id"] . '">';
                    echo '<button type="submit" class="btn btn-danger" onclick="return confirmDelete()">刪除</button>';
                    echo '</form>';
                    echo '</div>';
                    echo '</div>';
                }
            } else {
                echo '<div class="list-group-item">目前沒有任何商品。</div>';
            }

            mysqli_close($link);
            ?>
        </div>
    </div>

    <script>
        function confirmDelete() {
            return confirm('確定要刪除嗎？');
        }
    </script>
</body>

</html>
