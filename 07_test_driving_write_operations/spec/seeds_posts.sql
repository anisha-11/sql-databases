TRUNCATE TABLE users RESTART IDENTITY CASCADE;
TRUNCATE TABLE posts RESTART IDENTITY;

INSERT INTO users (email, name) VALUES ('name-1@gmail.com', 'name-1');
INSERT INTO users (email, name) VALUES ('name-2@gmail.com', 'name-2');


INSERT INTO posts (title, content, views, user_id) VALUES ('title-1', 'content-1', 10, 1);
INSERT INTO posts (title, content, views, user_id) VALUES ('title-2', 'content-2', 5, 2);
