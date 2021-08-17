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