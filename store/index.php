<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
  <title>Магазин одежды</title>
</head>
<body>
  <main class="layout">
<?php 
   $host = 'localhost'; // адрес сервера
   $db_name = 'storedb'; // имя базы данных
   $user = 'root'; // имя пользователя
   $password = 'root'; // пароль
   $connection = mysqli_connect($host, $user, $password, $db_name);
   $query = 'SELECT C.name, C.id, I.url, (SELECT COUNT(category_id) FROM products where category_id = C.id) AS count FROM products AS P JOIN categories AS C ON P.category_id = C.id JOIN images AS I ON C.image_id = I.id group by C.name HAVING count > 0 order by count desc';  
    
   $result = mysqli_query($connection, $query);
   mysqli_close($connection);
?>
    <div class = "group">
      <?php
      while ($row = mysqli_fetch_assoc($result)) {
        $category_name = $row['name'];
        $count = $row['count'];
        $url = $row['url'];
        require 'cat.php';
      }
      ?>
    </div>
  </main>
</body>
</html>
