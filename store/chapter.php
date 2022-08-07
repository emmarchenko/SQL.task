<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
  <title><?=$_GET['category_name']?></title>
</head>
<body>
  <main class="layout">
<?php 
   $category_id = $_GET['category_id'];
   $host = 'localhost'; // адрес сервера
   $db_name = 'storedb'; // имя базы данных
   $user = 'root'; // имя пользователя
   $password = 'root'; // пароль
   $connection = mysqli_connect($host, $user, $password, $db_name);
   $query = "SELECT P.name, P.id, I.url, I.ALT FROM products AS P JOIN images AS I ON P.image_id = I.id where P.category_id = '$category_id'";
   $result = mysqli_query($connection, $query);
   $num_rows = mysqli_num_rows($result);
   mysqli_close($connection);
?>  
   <a href="index.php">В каталог</a>
   <?php
      for ($i = 1; $i <=$num_rows/4+1; $i++){
      echo '<div class = "group">';
      for ($k=1; $k<=3; $k++){
        $row = mysqli_fetch_assoc($result);
        $product_name = $row['name'];
        $url = $row['url'];
        $ALT = $row['ALT'];
        require 'prod_prev.php';
      };
      echo "</div>";
    }
   ?>
    
  </main>
</body>
</html>
