<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>手動更新</title>
    
</head>
<style>
    body {
        background-image: url("photo/test.jpg");
        background-size: 100% 100%;
        background-repeat: no-repeat;
        background-attachment: fixed;
    }
    #button{
        font-size: 30px;
        border-width: 3px;
        font-weight: bold;
        border-radius: 18px;
        margin-top: 50px;
        margin-left: 50%;
        left: auto;
        right: auto;
    }
</style>
<body >
    <?php include("manager_nav.php")?>
    <form action="updateCrawler.php" method="POST">
        <button type="submit" name="update_crawler" id="button">手動更新</button>
    </form>
</body>
</html>