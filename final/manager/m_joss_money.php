<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>金紙代燒紀錄</title>
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

<body style="background-color:#2A3D45;">
    <div class="container d-flex h-100 align-items-center justify-content-center">
        <div class="row justify-content-center">
            <div class="col-md-12 ">
                <div class="card mt-5">
                    <div class="card-header">
                        <h1 class="display-6 text-center">代燒紙錢紀錄</h1>
                    </div>
                    <div class="card-body">
                        <form action="" method="POST" class="mb-3">
                            <div class="input-group">
                                <input type="date" name="selected_date" class="form-control" required>
                                <button type="submit" class="btn btn-primary">篩選</button>
                            </div>
                        </form>
                        <?php
                        include("SQLserver.php");

                        // 檢查是否有任何篩選條件被傳遞
                        if (isset($_POST['selected_date']) && !empty($_POST['selected_date'])) {
                            $selectedDate = $_POST['selected_date'];

                            $sql = "SELECT * FROM joss_money WHERE joss_date = ?";
                            $stmt = mysqli_prepare($link, $sql);
                            mysqli_stmt_bind_param($stmt, "s", $selectedDate);
                            mysqli_stmt_execute($stmt);
                            $result = mysqli_stmt_get_result($stmt);

                            if (mysqli_num_rows($result) > 0) {
                                echo '<table class="table table-striped">';
                                echo '<thead><tr><th>編號</th><th>會員編號</th><th>神明名稱</th><th>日期</th><th>金額</th></tr></thead>';
                                echo '<tbody>';
                                while ($row = mysqli_fetch_assoc($result)) {
                                    echo '<tr>';
                                    echo '<td>' . $row['joss_id'] . '</td>';
                                    echo '<td>' . $row['member_id'] . '</td>';
                                    echo '<td>' . $row['joss_name'] . '</td>';
                                    echo '<td>' . $row['joss_date'] . '</td>';
                                    echo '<td>' . $row['joss_price'] . '</td>';
                                    echo '</tr>';
                                }
                                echo '</tbody>';
                                echo '</table>';
                            } else {
                                echo '<p class="text-center">沒有符合篩選日期的燒紙錢紀錄</p>';
                            }

                            mysqli_stmt_close($stmt);
                            } else {
                                $sql = "SELECT * FROM joss_money"; // 顯示所有資料
                                $result = mysqli_query($link, $sql);

                                if (mysqli_num_rows($result) > 0) {
                                    echo '<table class="table table-striped">';
                                    echo '<thead><tr><th>編號</th><th>會員編號</th><th>神明名稱</th><th>日期</th><th>金額</th></tr></thead>';
                                    echo '<tbody>';
                                    while ($row = mysqli_fetch_assoc($result)) {
                                        echo '<tr>';
                                        echo '<td>' . $row['joss_id'] . '</td>';
                                        echo '<td>' . $row['member_id'] . '</td>';
                                        echo '<td>' . $row['joss_name'] . '</td>';
                                        echo '<td>' . $row['joss_date'] . '</td>';
                                        echo '<td>' . $row['joss_price'] . '</td>';
                                        echo '</tr>';
                                    }
                                    echo '</tbody>';
                                    echo '</table>';
                                } else {
                                    echo '<p class="text-center">没有燒紙錢紀錄</p>';
                                }
                            }

                        mysqli_close($link);
                        ?>    
                        <div class="text-center mt-3">
                            <button id="showAllButton" class="btn btn-primary">顯示全部資料</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("showAllButton").addEventListener("click", function() {
            var form = document.querySelector("form");
            var dateInput = form.querySelector("input[name='selected_date']");
            dateInput.value = ""; // Set the selected date to an empty value
            form.submit();
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.1/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/"></script>
</body>
</html>