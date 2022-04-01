drop table if exists artist_album;
drop table if exists artist_category;
drop table if exists collection_track;
drop table if exists track;
drop table if exists collection;
drop table if exists album;
drop table if exists artist;
drop table if exists category;


CREATE TABLE IF NOT EXISTS category(
id            serial PRIMARY KEY,
category_name varchar(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS artist(
id serial   PRIMARY KEY,
artist_name varchar(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS artist_category(
artist_id   integer references artist(id),
category_id integer references category(id),
CONSTRAINT  artist_category_pk primary key (artist_id, category_id));

CREATE TABLE IF NOT EXISTS collection(
id            serial PRIMARY KEY,
category_name varchar(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS album(
id           serial PRIMARY KEY,
album_name   varchar(80) NOT NULL,
release_date integer NOT NULL
);

CREATE TABLE IF NOT EXISTS artist_album(
artist_id  integer   REFERENCES artist(id),
album_id   integer REFERENCES album(id),
CONSTRAINT artist_album_pk PRIMARY KEY (artist_id, album_id));

CREATE TABLE IF NOT EXISTS track(
id serial  PRIMARY KEY,
track_name varchar(80) NOT NULL, 
duration   numeric(6,2) NOT NULL CHECK (duration>0),
album_id   integer REFERENCES album(id) NOT NULL
);

CREATE TABLE IF NOT EXISTS collection_track(
collection_id integer   REFERENCES collection (id),
track_id      integer REFERENCES track(id),
CONSTRAINT    collection_track_pk PRIMARY KEY (collection_id, track_id));




