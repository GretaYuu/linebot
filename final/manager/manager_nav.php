<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="manager_nav.css">
    
</head>

<body>
    <!-- <?php
        session_start();
    ?> -->
    <!-- navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <!-- logo -->
            <a class="navbar-brand" href="manager_front.php"><img width="165px" src="photo/Logo.png"></a>

            <!-- phone -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#linkbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- computer -->
            <div class="collapse navbar-collapse" id="linkbar">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="會員管理.php">會員管理</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="購買管理.php">訂單管理</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="預約管理.php">預約紀錄管理</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="donation.php">捐款管理</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="點燈管理.php">點燈紀錄</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="product.php">商品管理</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="joss.php">燒紙錢紀錄</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="update.php">手動更新</a>
                    </li>
                </ul>

                <?php
                    if(isset($_SESSION['username']) && !empty($_SESSION['username'])) {
                ?>
                        <button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false" onclick="logout()">
                            <img class="login-image" src="photo/login.png" alt="Login Image">
                        </button>
                        
                <?php
                    } else {
                ?>
                        <button class="btn btn-warning" type="submit" id="loginBtn-1" data-bs-toggle="modal" data-bs-target="#login">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                            </svg> 登入
                        </button>
                <?php
                    }
                ?>
                <script>
                    function logout() {
                        $.get("logout.php", function(data) {
                            if (data === "success") {
                                window.location.href = "../term_project/front_page.php";
                            }
                        });
                    }
                </script>
                <div class="modal fade" id="login">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 style="Microsoft JhengHei;">會&nbsp;員<br>登&nbsp;入</h3>                                    
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <form action="process.php" method="POST">
                                    <div class="form-group">
                                        <input type="email" class="account form-control" name="user" placeholder="帳號" required autofocus>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="password form-control" name="password" placeholder="密碼" required>
                                    </div>
                                    <button class="btn btn-warning btn-login" type="submit" id="loginBtn" data-bs-toggle="modal" data-bs-target="#login">
                                        <img src="photo/loginBtn.png" alt="Login Image" style="width: 130px; height: 200px; margin-top: -50px; margin-left: -23px;">
                                    </button>
                                </form>
                                <div class="sigeup">
                                <button type="button" class="btn btn-outline-danger btn-register" style="padding: 0;">
                                    <img src="photo/registerBtn.png" alt="Register Image" style="width: 150px; height: 200px; margin-top: -40px; margin-left: -12px;">
                                </button>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </nav>
</body>
</html>
