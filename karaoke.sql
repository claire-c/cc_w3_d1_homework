DROP TABLE guests;
DROP TABLE rooms_songs;
DROP TABLE bars;
DROP TABLE rooms;
DROP TABLE songs;


CREATE TABLE songs (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  artist VARCHAR(255)
);

CREATE TABLE rooms (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  till INT
);

CREATE TABLE bars (
  id SERIAL8 PRIMARY KEY,
  till INT,
  room_id INT8 REFERENCES rooms(id)
);

CREATE TABLE rooms_songs (
  id SERIAL8 PRIMARY KEY,
  room_id INT8 REFERENCES rooms(id),
  song_id INT8 REFERENCES songs(id)
);

CREATE TABLE guests (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  wallet INT,
  room_id INT8 REFERENCES rooms(id),
  song_id INT8 REFERENCES songs(id)
);

INSERT INTO songs (title, artist)
  VALUES ('Pop', 'NSync');
INSERT INTO songs (title, artist)
  VALUES ('Backstreets Back', 'Backstreet Boys');
INSERT INTO songs (title, artist)
  VALUES ('Survivor', 'Destinys Child');
INSERT INTO songs (title, artist)
  VALUES ('No Scrubs', 'TLC');
INSERT INTO songs (title, artist)
  VALUES ('Touch Me', 'Rui De Silva');
INSERT INTO songs (title, artist)
  VALUES ('Drugs Dont Kill People, Rappers Do', 'Goldie Lookin Chain');


INSERT INTO rooms (name, till)
  VALUES ('Cheesy Pop', 500);
INSERT INTO rooms (name, till)
  VALUES ('Slightly Less Cheesy Pop', 300);


INSERT INTO bars (till, room_id)
  VALUES (50, 1);
INSERT INTO bars (till, room_id)
  VALUES (100, 2);


INSERT INTO rooms_songs (room_id, song_id)
  VALUES (1, 1);
INSERT INTO rooms_songs (room_id, song_id)
  VALUES (1, 2);
INSERT INTO rooms_songs (room_id, song_id)
  VALUES (1, 3);
INSERT INTO rooms_songs (room_id, song_id)
  VALUES (1, 4);
INSERT INTO rooms_songs (room_id, song_id)
  VALUES (1, 5);
INSERT INTO rooms_songs (room_id, song_id)
  VALUES (2, 1);
INSERT INTO rooms_songs (room_id, song_id)
  VALUES (2, 6);
INSERT INTO rooms_songs (room_id, song_id)
  VALUES (2, 5);
INSERT INTO rooms_songs (room_id, song_id)
  VALUES (2, 4);


INSERT INTO guests (name, wallet, room_id, song_id)
  VALUES ('Claire', 20, 1, 6);
INSERT INTO guests (name, wallet, room_id, song_id)
  VALUES ('Simon', 10, 1, 2);
INSERT INTO guests (name, wallet, room_id, song_id)
  VALUES ('Jaime', 40, 1, 2);
INSERT INTO guests (name, wallet, room_id, song_id)
  VALUES ('Michelle', 15, 2, 3);
INSERT INTO guests (name, wallet, room_id, song_id)
  VALUES ('Ewa', 100, 1, 1);


SELECT * FROM songs;
SELECT * FROM rooms;
SELECT * FROM rooms_songs;
SELECT * FROM guests;
SELECT * FROM bars;

UPDATE guests
  SET wallet = 30 WHERE id = 2;
UPDATE guests
  SET name = 'Karaoke Killer' WHERE name = 'Ewa';
UPDATE songs
  SET title = 'Say My Name' WHERE id = 3;
UPDATE rooms_songs
  SET song_id = 2 WHERE id = 9;
UPDATE bars
  SET till = 25 WHERE room_id = 1;

SELECT * FROM songs;
SELECT * FROM rooms;
SELECT * FROM rooms_songs;
SELECT * FROM guests;
SELECT * FROM bars;

SELECT title FROM songs;
SELECT name FROM rooms;
SELECT name, wallet FROM guests;
SELECT id FROM bars;
SELECT room_id FROM rooms_songs;

SELECT wallet, song_id FROM guests
  WHERE name = 'Claire';
SELECT name FROM rooms
  WHERE id = 1;
SELECT room_id FROM rooms_songs
  WHERE song_id = 1;
SELECT room_id FROM rooms_songs
  WHERE room_id = 1;

SELECT * FROM guests
  WHERE name = 'Simon';
SELECT * FROM songs
  WHERE title = 'Say My Name';
