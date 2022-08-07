<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="style_detail.css">
  <link rel="stylesheet" type="text/css" href="./css/zebra_dialog.css">
  <title><?=$_GET['product_name']?></title>
</head>
<body>
  <main>
   <?php 
     $product_id=$_GET['product_id'];
     $host = 'localhost'; // адрес сервера
     $db_name = 'storedb'; // имя базы данных
     $user = 'root'; // имя пользователя
     $password = 'root'; // пароль
     $connection = mysqli_connect($host, $user, $password, $db_name);
     $query_image = "SELECT I.url FROM images AS I JOIN prod_img AS PI ON PI.image_id = I.id where PI.product_id='$product_id'";  
     $result_image = mysqli_query($connection, $query_image);
     $query_prod = "SELECT P.name, price_wo_disc, price, price_promo, category_id, C.id, C.name AS category FROM products AS P JOIN categories AS C ON category_id=C.id where P.id='$product_id'";  
     $result_prod = mysqli_query($connection, $query_prod);
     $row_prod = mysqli_fetch_assoc($result_prod);
     mysqli_close($connection);
   ?>
    <div class = "layout">
      <div class="product">
        <div class="product__preview">
          <div class ="product__thumbnails">
            <?php
              while ($row = mysqli_fetch_assoc($result_image)) {
                echo "<img class=\"product__prev\" src=$row[url]><br>";
              };
            ?>
          </div>
          <div class="product__viewsection">
            <?php 
              mysqli_data_seek($result_image,0);
              $row = mysqli_fetch_assoc($result_image);
            ?>  
            <img class="product__currentimage" src="<?=$row['url']?>">
          </div>  
        </div>
        <div class="product__description">
          <h2 class="product__title"><?=$row_prod['name']?></h2>
          <nav class="product__navigation">
            <a href="chapter.php?category_id=<?=$row_prod['id']?>&category_name=<?=$row_prod['category']?>"><?=$row_prod['category']?></a>
          </nav>
          <div class="product__pricing">
            <?php
            if ($row_prod['price_wo_disc'] > 0)
              echo "<div class=\"product__oldprice\">$row_prod[price_wo_disc]</div>";
            if ($row_prod['price'] > 0)
              echo "<div class=\"product__actualprice\">$row_prod[price]</div>";
            if ($row_prod['price_promo'] > 0) {
              echo "<div class=\"product__promoprice\">$row_prod[price_promo]</div>";
              echo "<div class=\"product__promotext\"> - с промокодом</div>";
            }
            ?>
          </div>
          <div class="product__info">
            <div class="product__info-item">
              <img src="./icons/icon_check.png"> В наличии в магазине <a href="#">Lamoda</a>  
            </div>
            <div class="product__info-item">
              <img src="./icons/icon_deliv.png"> Бесплатная доставка  
            </div>
          </div>
          <div class="product__counter">
            <button class="product__less product__valuecorrector">-</button>
            <input class="product__value" type="text" maxlength="3" placeholder="1" value="1" required name="Количество"><br>
            <button class="product__more product__valuecorrector">+</button>
          </div>
          <div class="product__buttons-block">
            <button class="product__button product__button--blue product__button--store">купить</button>
            <button class="product__button">в избранное</button>
          </div>
          <div class="product__text">  
            <p>
              Рубашка Medicine выполнена из вискозной ткани с клетчатым узором.
            </p>
            <p>
              Детали: прямой крой; отложной воротник; планка и манжеты на пуговицах; карман на груди.  
            </p>
          </div>
          <div class="product__share">
            <div class="product__share-title">поделиться:</div>
            <a href="#" target="_blank"><img src="./icons/icon_ggl.png" alt="g+"></a>
            <a href="#" target="_blank"><img src="./icons/icon_vk.png" alt="vk"></a>
            <a href="#" target="_blank"><img src="./icons/icon_fb.png" alt="fb"></a>
            <a href="#" target="_blank"><img src="./icons/icon_twitter.png" alt="twitter"></a>
          </div>
        </div>
      </div>
    </div>
  </main>
  <script src="https://yastatic.net/jquery/3.3.1/jquery.min.js"></script>
  <script type="text/javascript" src="script.js"></script>
  <script src="zebra_dialog.min.js"></script>
</body>
</html>
