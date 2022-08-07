      <div class="card">
        <a href="chapter.php?category_id=<?=$row['id']?>&category_name=<?=$row['name']?>">
        <div class="card-img">
          <img src="<?=$url?>"> 
        </div>
        <div class="card-info">
          <div><?= $category_name?></div>
          <div class=card-info__count>Всего товаров <?=$count?></div>
        </div>
        </a>
      </div>
        
      
