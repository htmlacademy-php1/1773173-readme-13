
#Заполняем список типов контента для постов
INSERT INTO content_types (name, icon_view) VALUES ('Текст', 'text');
INSERT INTO content_types (name, icon_view) VALUES ('Цитата', 'quote');
INSERT INTO content_types (name, icon_view) VALUES ('Картинка', 'photo');
INSERT INTO content_types (name, icon_view) VALUES ('Видео', 'video');
INSERT INTO content_types (name, icon_view) VALUES ('Ссылка', 'link');

#Добавляем 2х пользователей
INSERT INTO users (email, name, password, avatar_path) VALUES ('user_1@mail.ru', 'Nikita', '0803ba11', 0);
INSERT INTO users (email, name, password, avatar_path) VALUES ('user_2@mail.ru', 'Vera', '0803ba22', 0);

#Добавляем посты
INSERT INTO posts (user_id, content_type_id, hashtag_id, title, post_text, author_quote, img_path, video_path, link, views_number) VALUES (1, 2, 0, 'Цитата', 'Мы в жизни любим только раз, а после ищем лишь похожих', '', '', '', '', 0);
INSERT INTO posts (user_id, content_type_id, hashtag_id, title, post_text, author_quote, img_path, video_path, link, views_number) VALUES (2, 1, 0, 'Игра престолов', 'Не могу дождаться начала финального сезона своего любимого сериала!', '', '', '', '', 0);
INSERT INTO posts (user_id, content_type_id, hashtag_id, title, post_text, author_quote, img_path, video_path, link, views_number) VALUES (2, 3, 0, 'Наконец, обработал фотки!', '', '', 'rock-medium.jpg', '', '', 0);
INSERT INTO posts (user_id, content_type_id, hashtag_id, title, post_text, author_quote, img_path, video_path, link, views_number) VALUES (1, 3, 0, 'Моя мечта', '', '', 'coast-medium.jpg', '', '', 0);
INSERT INTO posts (user_id, content_type_id, hashtag_id, title, post_text, author_quote, img_path, video_path, link, views_number) VALUES (2, 5, 0, 'Лучшие курсы', '', '', '', '', 'www.htmlacademy.ru', 0);

#Добавляем комментарии к постам
INSERT INTO comments (user_id, post_id, comment_text) VALUES (1, 2, 'Отличный пост.');
INSERT INTO comments (user_id, post_id, comment_text) VALUES (2, 2, 'Прекрасное место! Где это находиться?');
INSERT INTO comments (user_id, post_id, comment_text) VALUES (2, 1, 'Я тоже люблю этот сериал!');

#Обновил количество просмотров
UPDATE posts SET views_number = 20 WHERE content_type_id = 5;
UPDATE posts SET views_number = 10 WHERE content_type_id = 1;
UPDATE posts SET views_number = 27 WHERE content_type_id = 2;

# получить список постов с сортировкой по популярности и вместе с именами авторов и типом контента;
SELECT p.title, u.name, c.name FROM posts p 
JOIN users u JOIN content_types c 
ON p.user_id = u.id and p.content_type_id = c.id
ORDER BY views_number DESC;

# получить список постов для конкретного пользователя;
SELECT * FROM posts WHERE user_id = 1;

# получить список комментариев для одного поста, в комментариях должен быть логин пользователя;
SELECT c.comment_text, u.name FROM comments c
JOIN users u 
ON c.user_id = u.id 
WHERE post_id = 2;

# добавить лайк к посту;
INSERT INTO likes (user_id, post_id) VALUES (1, 3);

# подписаться на пользователя.
INSERT INTO subscriptions (user_id, favorite_user_id) VALUES (1, 2);