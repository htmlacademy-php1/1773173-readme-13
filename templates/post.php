<?php
require_once('helpers.php');
require_once('my_function.php');
?>

<article class="popular__post post post-<?=($item['icon_view']);?>">
    <header class="post__header">
        <h2><?= htmlspecialchars($item['title']);?></h2>
    </header>
    <div class="post__main">
        <?php if ($item['content_type'] == 3): ?>
            <div class="post-photo__image-wrapper">
                <img src="img/<?=($item['img_path']);?>" alt="Фото от пользователя" width="360" height="240">
            </div>
        <?php elseif ($item['content_type'] == 2): ?>
            <blockquote>
                <p>
                    <?=htmlspecialchars($item['post_text']);?> 
                </p>
                <cite>Лариса</cite>
            </blockquote>

        <?php elseif ($item['content_type'] == 1): ?>
            
        <p>
            <?php
                $textPost = htmlspecialchars($item['post_text']);
                $tagLink = '<br> <a class="post-text__more-link" href="#">Читать далее</a>';
                $processedText = cutLongText($textPost);    
                        
                if (mb_strlen($textPost) > 300) {
                    echo "{$processedText}...{$tagLink}";
                } else {
                    echo $processedText;
                }
                    
            ?>    
        </p>

        <?php elseif ($item['content_type'] == 5): ?>
            <div class="post-link__wrapper">
                <a class="post-link__external" href="http://" title="Перейти по ссылке">
                    <div class="post-link__info-wrapper">
                        <div class="post-link__icon-wrapper">
                            <img src="https://www.google.com/s2/favicons?domain=vitadental.ru" alt="Иконка">
                        </div>
                        <div class="post-link__info">
                            <h3><?=htmlspecialchars($item['link']);?></h3>
                        </div>
                    </div>
                    <span><?=htmlspecialchars($item['post_text']);?></span>
                </a>
            </div>

        <?php elseif ($item['content_type'] == 4): ?>
            <div class="post-video__block">
                <div class="post-video__preview">
                    <?=embed_youtube_cover(/* вставьте ссылку на видео */); ?>
                    <img src="img/coast-medium.jpg" alt="Превью к видео" width="360" height="188">
                </div>
                <a href="post-details.html" class="post-video__play-big button">
                    <svg class="post-video__play-big-icon" width="14" height="14">
                        <use xlink:href="#icon-video-play-big"></use>
                    </svg>
                    <span class="visually-hidden">Запустить проигрыватель</span>
                </a>
            </div>
        
        <?php endif; ?>
    </div>
    <footer class="post__footer">
        <div class="post__author">
            <a class="post__author-link" href="#" title="Автор">
                <div class="post__avatar-wrapper">
                    <img class="post__author-avatar" src="img/<?= ($item['avatar_path']);?>" alt="Аватар пользователя">
                </div>
                <div class="post__info">
                    <b class="post__author-name"><?= htmlspecialchars($item['name']);?></b>
                    <time class="post__time" 
                        datetime="<?=getPostTime($index);?>" 
                        title="<?=date_format(date_create(getPostTime($index)), 'd.m.Y H:i');?>"><?=getAltTime($index);?> 
                    </time>
                </div>
            </a>
        </div>
        <div class="post__indicators">
            <div class="post__buttons">
                <a class="post__indicator post__indicator--likes button" href="#" title="Лайк">
                    <svg class="post__indicator-icon" width="20" height="17">
                        <use xlink:href="#icon-heart"></use>
                    </svg>
                    <svg class="post__indicator-icon post__indicator-icon--like-active" width="20" height="17">
                        <use xlink:href="#icon-heart-active"></use>
                    </svg>
                    <span>0</span>
                    <span class="visually-hidden">количество лайков</span>
                </a>
                <a class="post__indicator post__indicator--comments button" href="#" title="Комментарии">
                    <svg class="post__indicator-icon" width="19" height="17">
                        <use xlink:href="#icon-comment"></use>
                    </svg>
                    <span>0</span>
                    <span class="visually-hidden">количество комментариев</span>
                </a>
            </div>
        </div>
    </footer>
</article>

            