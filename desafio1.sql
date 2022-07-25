DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
    plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plano_titulo VARCHAR(20) NOT NULL,
    plano_valor DECIMAL(3,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    user_age INT(3) NOT NULL,
    user_plano INT NOT NULL,
    user_subscription_date DATE NOT NULL,
    FOREIGN KEY (user_plano) REFERENCES SpotifyClone.planos (plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
    artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_title VARCHAR(50) NOT NULL,
    album_artist INT NOT NULL,
    album_release_year YEAR NOT NULL,
    FOREIGN KEY (album_artist) REFERENCES SpotifyClone.artists (artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.tracks(
    track_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    track_title VARCHAR(50) NOT NULL,
    track_album INT NOT NULL,
    track_duration INT(4) NOT NULL,
    FOREIGN KEY (track_album) REFERENCES SpotifyClone.album (album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.play_history(
    user_id INT NOT NULL,
    track_id INT NOT NULL,
    reproduction_date DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, track_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
    FOREIGN KEY (track_id) REFERENCES SpotifyClone.tracks (track_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.followed_artists(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users (user_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists (artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (plano_titulo, plano_valor)
VALUES
  ("gratuito", 0.00),
  ("familiar", 7.99),
  ("universitário", 5.99),
  ("pessoal", 6.99);

INSERT INTO SpotifyClone.users (user_name, user_age, user_plano, user_subscription_date)
VALUES
  ("Thati", 23, 1, "2019-10-20"),
  ("Cintia", 35, 2, "2017-12-30"),
  ("Bill", 20, 3, "2019-06-05"),
  ("Roger", 45, 4, "2020-05-13"),
  ("Norman", 58, 4, "2017-02-17"),
  ("Patrick", 33, 2, "2017-01-06"),
  ("Vivian", 26, 3, "2018-01-05"),
  ("Carol", 19, 3, "2018-02-14"),
  ("Angelina", 42, 2, "2018-04-29"),
  ("Paul", 46, 2, "2017-01-17");

INSERT INTO SpotifyClone.artists (artist_name)
VALUES
  ("Walter Phoenix"),
  ("Peter Strong"),
  ("Lance Day"),
  ("Freedie Shannon"),
  ("Tyler Isle"),
  ("Fog");

INSERT INTO SpotifyClone.album (album_title, album_artist, album_release_year)
VALUES
  ("Envious", 1, 1990),
  ("Exuberant", 1, 1993),
  ("Hallowed Steam", 2, 1995),
  ("Incandescent", 3, 1998),
  ("Temporary Culture", 4, 2001),
  ("Library of liberty", 4, 2003),
  ("Chained Down", 5, 2007),
  ("Cabinet of fools", 5, 2012),
  ("No guarantees", 5, 2015),
  ("Apparatus", 6, 2015);

INSERT INTO SpotifyClone.tracks (track_title, track_album, track_duration)
VALUES
  ("Soul For Us", 1, 200),
  ("Reflections Of Magic", 1, 163),
  ("Dance With Her Own", 1, 116),
  ("Troubles Of My Inner Fire", 2, 203),
  ("Time Fireworks", 2, 152),
  ("Magic Circus", 3, 105),
  ("Honey, So Do I", 3, 207),
  ("Sweetie, Let's Go Wild", 3, 139),
  ("She Knows", 3, 244),
  ("Fantasy For Me", 4, 100),
  ("Celebration Of More", 4, 146),
  ("Rock His Everything", 4, 223),
  ("Home Forever", 4, 231),
  ("Diamond Power", 4, 241),
  ("Let's Be Silly", 4, 132),
  ("Thang Of Thunder", 5, 240),
  ("Words Of Her Life", 5, 185),
  ("Without My Streets", 5, 176),
  ("Need Of The Evening", 6, 190),
  ("History Of My Roses", 6, 222),
  ("Without My Love", 6, 111),
  ("Walking And Game", 6, 123),
  ("Young And Father", 6, 197),
  ("Finding My Traditions", 7, 179),
  ("Walking And Man", 7, 229),
  ("Hard And Time", 7, 135),
  ("Honey, I'm A Lone Wolf", 7, 150),
  ("She Thinks I Won't Stay Tonight", 8, 166),
  ("He Heard You're Bad For Me", 8, 154),
  ("He Hopes We Can't Stay", 8, 210),
  ("I Know I Know", 8, 117),
  ("He's Walking Away", 9, 159),
  ("He's Trouble", 9, 138),
  ("I Heard I Want To Bo Alone", 9, 120),
  ("I Ride Alone", 9, 151),
  ("Honey", 10, 79),
  ("You Cheated On Me", 10, 95),
  ("Wouldn't It Be Nice", 10, 213),
  ("Baby", 10, 136),
  ("You Make Me Feel So..", 10, 83);

INSERT INTO SpotifyClone.play_history (user_id, track_id, reproduction_date)
VALUES
  (1, 36, "2020-02-28 10:45:55"),
  (1, 25, "2020-05-02 05:30:35"),
  (1, 23, "2020-03-06 11:22:33"),
  (1, 14, "2020-08-05 08:05:17"),
  (1, 15, "2020-09-14 16:32:22"),
  (2, 34, "2020-01-02 07:40:33"),
  (2, 24, "2020-05-16 06:16:22"),
  (2, 21, "2020-10-09 12:27:48"),
  (2, 39, "2020-09-21 13:14:46"),
  (3, 6, "2020-11-13 16:55:13"),
  (3, 3, "2020-12-05 18:38:30"),
  (3, 26, "2020-07-30 10:00:00"),
  (4, 2, "2021-08-15 17:10:10"),
  (4, 35, "2021-07-10 15:20:30"),
  (4, 27, "2021-01-09 01:44:33"),
  (5, 7, "2020-07-03 19:33:28"),
  (5, 12, "2017-02-24 21:14:22"),
  (5, 14, "2020-08-06 15:23:43"),
  (5, 1, "2020-11-10 13:52:27"),
  (6, 38, "2019-02-07 20:33:48"),
  (6, 29, "2017-01-24 00:31:17"),
  (6, 30, "2017-10-12 12:35:20"),
  (6, 22, "2018-05-29 14:56:41"),
  (7, 5, "2018-05-09 22:30:49"),
  (7, 4, "2020-07-27 12:52:58"),
  (7, 11, "2018-01-16 18:40:43"),
  (8, 39, "2018-03-21 16:56:40"),
  (8, 40, "2020-10-18 13:38:05"),
  (8, 32, "2019-05-25 08:14:03"),
  (8, 33, "2021-08-15 21:37:09"),
  (9, 16, "2021-05-24 17:23:45"),
  (9, 17, "2018-12-07 22:48:52"),
  (9, 8, "2021-03-14 06:14:26"),
  (9, 9, "2020-04-01 03:36:00"),
  (10, 20, "2017-02-06 08:21:34"),
  (10, 21, "2017-12-04 05:33:43"),
  (10, 12, "2017-07-27 05:24:49"),
  (10, 13, "2017-12-25 01:03:57");

INSERT INTO SpotifyClone.followed_artists (user_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6);