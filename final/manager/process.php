<?php
session_start();
$username = $_POST['user'];
$password = $_POST['password'];

$username = stripslashes($username);
$password = stripslashes($password);

$conn = mysqli_connect("localhost", 'root', '', 'term_project');
if (!$conn) {
    die("Failed to connect to database: " . mysqli_connect_error());
}

$username = mysqli_real_escape_string($conn, $username);
$password = mysqli_real_escape_string($conn, $password);

$result = mysqli_query($conn, "SELECT * FROM member WHERE member_account = '$username'");
if (!$result) {
    die("Failed to query database: " . mysqli_error($conn));
}

$row = mysqli_fetch_array($result);
if ($row) {
    if ($row['member_password'] == $password) {
        $_SESSION['username'] = $username;
        $_SESSION['password'] = $password;
        $_SESSION['member_id'] = $row['member_id'];
        $_SESSION['member_posstion'] = $row['member_posstion'];
        if ($_SESSION['member_posstion'] == 1){
            header("Location: ../manager_front.php");
        }elseif($_SESSION['member_posstion'] == 0){
            header("Location: ../term_project/front_page.php");
        }
        else{
            echo '<script>alert("此帳號已停用.");</script>';
            echo '<script>history.back();</script>';
        }
    } else {
        echo '<script>alert("密碼錯誤");</script>';
        echo '<script>history.back();</script>';
    }
} else {
    echo '<script>alert("帳號錯誤");</script>';
    echo '<script>history.back();</script>';
}

mysqli_close($conn);
?>
