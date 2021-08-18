<?php
function cutLongText(string $text, int $length = 300): string 
{
    if (mb_strlen($text) <= $length) {
        return $text;
    }

    $words = explode(' ', $text);
    $textLength = -1;
    $newTextWords = [];

    foreach ($words as $index => $word) {
        if ($textLength >= $length) {
            break;
        }

        $textLength += mb_strlen($word) + 1;
        $newTextWords[] = $word;
    }

    return implode(' ', $newTextWords);
    
}

function getPostTime(int $index)
{  
    $postDate = generate_random_date($index);
    return $postDate;
}

function getAltTime(int $index)
{   
    //date_default_timezone_set('Asia/Omsk'); Нужно ли менять часовой пояс?
    $postDate = getPostTime($index);

    $curDate = strtotime('now');
    $postDate = strtotime($postDate);
    $diff = $curDate - $postDate;
    
    if ($diff/60 < 60) {
        $diff = ceil($diff/60);
        $wordPlForm = get_noun_plural_form($diff, 'минута', 'минуты', 'минут');
        $altTime = "{$diff} {$wordPlForm} назад";
    } elseif ($diff/60 >= 60 && $diff/60 < 1440) {
        $diff = ceil($diff/pow(60, 2));
        $wordPlForm = get_noun_plural_form($diff, 'час', 'часа', 'часов');
        $altTime = "{$diff} {$wordPlForm} назад";
    } elseif ($diff/60 >= 1440 && $diff/60 < 10080) {
        $diff = ceil($diff/(pow(60, 2)*24));
        $wordPlForm = get_noun_plural_form($diff, 'день', 'дня', 'дней');
        $altTime = "{$diff} {$wordPlForm} назад";
    } elseif ($diff/60 >= 10080 && $diff/60 < 50400) {
        $diff = ceil($diff/(pow(60, 2)*24*7));
        $wordPlForm = get_noun_plural_form($diff, 'неделя', 'недели', 'недель');
        $altTime = "{$diff} {$wordPlForm} назад";
    } else {
        $diff = ceil($diff/(pow(60, 2)*24*7*4));
        $wordPlForm = get_noun_plural_form($diff, 'месяц', 'месяца', 'месяцев');
        $altTime = "{$diff} {$wordPlForm} назад";
    }
     
    return $altTime;
}