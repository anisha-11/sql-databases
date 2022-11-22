-- -- Write your SQL seed here. 

-- -- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- -- so we can start with a fresh state.
-- -- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE albums RESTART IDENTITY;


INSERT INTO albums (title, release_year, artist_id) VALUES ('Surfer Rosa', '1988', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Super Trooper', '1980', '2');