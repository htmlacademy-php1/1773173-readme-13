<?php
require_once('helpers.php');
require_once('init.php');

if (!$link) {
   $error = mysqli_connect_error();
   $content = include_template('error.php', ['error' => $error]);
}
else {
   $sql = 'SELECT content_types.icon_view, content_types.content_type_name FROM posts ';
     
   $result = mysqli_query($link, $sql);

   if ($result){
      $contentsType = mysqli_fetch_all($result, MYSQLI_ASSOC);
   } 
   else {
      $error = mysqli_error($link);
      $content = include_template('error.php', ['error' => $error]);
   }
   
   $sql = 'SELECT posts.content_type, posts.post_text, posts.link, posts.title, posts.img_path, users.name, content_types.icon_view, users.avatar_path FROM posts '
        . 'JOIN users ON posts.user_id = users.id '
        . 'JOIN content_types ON content_types.id = posts.content_type '
        . 'ORDER BY views_number DESC'; 

   if ($res = mysqli_query($link, $sql)) {
      $posts = mysqli_fetch_all($res, MYSQLI_ASSOC);
      $content = include_template('main.php', ['posts' => $posts]);
   }
   else {
      $content = include_template('error.php', ['error' => mysqli_error($link)]);
   }
}

print(include_template('layout.php', ['content' => $content, 'contentsType' => $contentsType, 'user_name' => 'Алексей', 'title' => 'readme: популярное']));


