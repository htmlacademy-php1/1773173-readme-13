CREATE DATABASE readme
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(128) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL UNIQUE,
    password CHAR(32) NOT NULL,
    avatar_path VARCHAR(255)
);

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    content_type_id INT NOT NULL,
    hashtag_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    title VARCHAR(255) NOT NULL UNIQUE,
    post_text TEXT,
    author_quote VARCHAR(255),
    img_path VARCHAR(255),
    video_path VARCHAR(255),
    link VARCHAR(255),
    views_number INT,
    FOREIGN  KEY (user_id) REFERENCES users(id),
    FOREIGN  KEY (content_type) REFERENCES content_types(id),
    CREATE INDEX hashtag_type ON posts(hashtag_id),
    CREATE INDEX content_id ON posts(content_type),
    CREATE INDEX user_id ON posts(user_id)
);

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comment_text TEXT NOT NULL,
    FOREIGN  KEY (user_id) REFERENCES users(id),
    FOREIGN  KEY (post_id) REFERENCES posts(id),
    CREATE INDEX user_id ON comments(user_id),
    CREATE INDEX post_id ON comments(post_id)
);

CREATE TABLE likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    FOREIGN  KEY (user_id) REFERENCES users(id),
    FOREIGN  KEY (post_id) REFERENCES posts(id),
    CREATE INDEX user_id ON likes(user_id),
    CREATE INDEX post_id ON likes(post_id)
);

CREATE TABLE subscriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    favorite_user_id INT NOT NULL,
    FOREIGN  KEY (user_id) REFERENCES users(id),
    FOREIGN  KEY (favorite_user_id) REFERENCES posts(id),
    CREATE INDEX user_id ON subscriptions(user_id),
    CREATE INDEX favorite_user_id ON subscriptions(favorite_user_id)
);


CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    recipient_user_id INT NOT NULL,
    sender_user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    message_text TEXT NOT NULL,
    FOREIGN  KEY (recipient_user_id) REFERENCES users(id),
    FOREIGN  KEY (sender_user_id) REFERENCES posts(id),
    CREATE INDEX recipient_user_id ON messages(recipient_user_id),
    CREATE INDEX sender_user_id ON messages(sender_user_id)
);

CREATE TABLE hashtags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE content_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content_type_name VARCHAR(255) NOT NULL,
    icon_view VARCHAR(255) NOT NULL
);
