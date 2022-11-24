TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (email, name) VALUES ('name-1@gmail.com', 'name-1');
INSERT INTO users (email, name) VALUES ('name-2@gmail.com', 'name-2');