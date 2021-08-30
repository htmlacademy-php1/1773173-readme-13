
#Заполняем список типов контента для постов
INSERT INTO content_types (content_type_name, icon_view) VALUES ('Текст', 'text');
INSERT INTO content_types (content_type_name, icon_view) VALUES ('Цитата', 'quote');
INSERT INTO content_types (content_type_name, icon_view) VALUES ('Фото', 'photo');
INSERT INTO content_types (content_type_name, icon_view) VALUES ('Видео', 'video');
INSERT INTO content_types (content_type_name, icon_view) VALUES ('Ссылка', 'link');

#Добавляем 2х пользователей 
INSERT INTO users (email, name, password, avatar_path) VALUES ('user_1@mail.ru', 'Лариса', '0803ba11', 'userpic-larisa-small.jpg');
INSERT INTO users (email, name, password, avatar_path) VALUES ('user_2@mail.ru', 'Владик', '0803ba22', 'userpic.jpg');      
INSERT INTO users (email, name, password, avatar_path) VALUES ('user_3@mail.ru', 'Виктор', '0803ba33', 'userpic-mark.jpg');

#Добавляем посты
INSERT INTO posts (user_id, content_type, hashtag_id, title, post_text, author_quote, img_path, video_path, link, views_number) VALUES (1, 2, 0, 'Цитата', 'Мы в жизни любим только раз, а после ищем лишь похожих', '', '', '', '', 0);
INSERT INTO posts (user_id, content_type, hashtag_id, title, post_text, author_quote, img_path, video_path, link, views_number) VALUES (2, 1, 0, 'Игра престолов', 'Не могу дождаться начала финального сезона своего любимого сериала!', '', '', '', '', 0);
INSERT INTO posts (user_id, content_type, hashtag_id, title, post_text, author_quote, img_path, video_path, link, views_number) VALUES (3, 3, 0, 'Наконец, обработал фотки!', '', '', 'rock-medium.jpg', '', '', 0);
INSERT INTO posts (user_id, content_type, hashtag_id, title, post_text, author_quote, img_path, video_path, link, views_number) VALUES (1, 3, 0, 'Моя мечта', '', '', 'coast-medium.jpg', '', '', 0);
INSERT INTO posts (user_id, content_type, hashtag_id, title, post_text, author_quote, img_path, video_path, link, views_number) VALUES (2, 5, 0, 'Лучшие курсы', '', '', '', '', 'www.htmlacademy.ru', 0);

#Добавляем комментарии к постам
INSERT INTO comments (user_id, post_id, comment_text) VALUES (1, 2, 'Отличный пост.');
INSERT INTO comments (user_id, post_id, comment_text) VALUES (2, 2, 'Прекрасное место! Где это находиться?');
INSERT INTO comments (user_id, post_id, comment_text) VALUES (2, 1, 'Я тоже люблю этот сериал!');

#Обновил количество просмотров
UPDATE posts SET views_number = 20 WHERE content_type = 5;
UPDATE posts SET views_number = 10 WHERE content_type = 1;
UPDATE posts SET views_number = 27 WHERE content_type = 2;

# получить список постов с сортировкой по популярности и вместе с именами авторов и типом контента;
SELECT p.title, u.name, c.content_type_name FROM posts p 
JOIN users u ON p.user_id = u.id
JOIN content_types c ON p.content_type = c.id                   
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