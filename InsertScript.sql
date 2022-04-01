delete from artist_category;
delete from artist_album;
delete from collection_track;
delete from collection;
delete from artist;
delete from category;
delete from track;
delete from album;
ALTER SEQUENCE artist_id_seq RESTART WITH 1;
ALTER SEQUENCE collection_id_seq RESTART WITH 1;
ALTER SEQUENCE category_id_seq RESTART WITH 1;
ALTER SEQUENCE track_id_seq RESTART WITH 1;
ALTER SEQUENCE album_id_seq RESTART WITH 1;


INSERT into artist(artist_name) 
values('Placebo');
INSERT into artist(artist_name) 
values('The Weeknd');
INSERT into artist(artist_name) 
values('Metallica');
INSERT into artist(artist_name) 
values('Daft Punk');
INSERT into artist(artist_name) 
values('Red Hot Chili Peppers');
INSERT into artist(artist_name) 
values('Kendrick Lamar');
INSERT into artist(artist_name) 
values('Linkin Park');
INSERT into artist(artist_name) 
values('The Cure');

INSERT into category(category_name) 
values('alternative');
INSERT into category(category_name) 
values('pop');
INSERT into category(category_name) 
values('metall');
INSERT into category(category_name) 
values('electronic');
INSERT into category(category_name) 
values('rock');
INSERT into category(category_name) 
values('hip-hop');

insert into artist_category(artist_id, category_id)
values (
(select id from artist where artist_name='Placebo'),
(select id from category where category_name='alternative')
);
insert into artist_category(artist_id, category_id)
values (
(select id from artist where artist_name='The Weeknd'),
(select id from category where category_name='pop')
);
insert into artist_category(artist_id, category_id)
values (
(select id from artist where artist_name='Daft Punk'),
(select id from category where category_name='electronic')
);
insert into artist_category(artist_id, category_id)
values (
(select id from artist where artist_name='Metallica'),
(select id from category where category_name='metall')
);
insert into artist_category(artist_id, category_id)
values (
(select id from artist where artist_name='Red Hot Chili Peppers'),
(select id from category where category_name='rock')
);
insert into artist_category(artist_id, category_id)
values (
(select id from artist where artist_name='Kendrick Lamar'),
(select id from category where category_name='hip-hop')
);
insert into artist_category(artist_id, category_id)
values (
(select id from artist where artist_name='Linkin Park'),
(select id from category where category_name='rock')
);
insert into artist_category(artist_id, category_id)
values (
(select id from artist where artist_name='The Cure'),
(select id from category where category_name='rock')
);

INSERT into album(album_name, release_date) 
values('Without You I''m Nothing', 1998);
INSERT into album(album_name, release_date) 
values('Meds', 2006);
INSERT into album(album_name, release_date) 
values('Dawn FM', 2022);
INSERT into album(album_name, release_date) 
values('House Of Balloons', 2011);
INSERT into album(album_name,release_date) 
values('Reload', 1997);
INSERT into album(album_name,release_date) 
values('Random Access Memories', 2013);
INSERT into album(album_name,release_date) 
values('Da Funk', 1995);
INSERT into album(album_name,release_date) 
values('Stadium Arcadium', 2006);
INSERT into album(album_name,release_date) 
values('Californication', 1999);
INSERT into album(album_name,release_date) 
values('Damn', 2017);
INSERT into album(album_name,release_date) 
values('Hybrid Theory', 2000);
INSERT into album(album_name,release_date) 
values('Meteora', 2003);
INSERT into album(album_name,release_date) 
values('Three Imaginary Boys', 1979);
INSERT into album(album_name,release_date) 
values('Seventeen Seconds', 1980);


insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='Placebo'),
(select id from album where album_name='Without You I''m Nothing')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='Placebo'),
(select id from album where album_name='Meds')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='The Weeknd'),
(select id from album where album_name='Dawn FM')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='The Weeknd'),
(select id from album where album_name='House Of Balloons')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='Metallica'),
(select id from album where album_name='Reload')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='Daft Punk'),
(select id from album where album_name='Random Access Memories')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='Daft Punk'),
(select id from album where album_name='Da Funk')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='Red Hot Chili Peppers'),
(select id from album where album_name='Stadium Arcadium')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='Red Hot Chili Peppers'),
(select id from album where album_name='Californication')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='Kendrick Lamar'),
(select id from album where album_name='Damn')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='Linkin Park'),
(select id from album where album_name='Hybrid Theory')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='Linkin Park'),
(select id from album where album_name='Meteora')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='The Cure'),
(select id from album where album_name='Three Imaginary Boys')
);
insert into artist_album(artist_id, album_id)
values (
(select id from artist where artist_name='The Cure'),
(select id from album where album_name='Seventeen Seconds')
);

INSERT into collection (collection_name,release_date) 
values('A Place For Us To Dream', 2016);
INSERT into collection (collection_name,release_date) 
values('Trilogy', 2012);
INSERT into collection (collection_name,release_date) 
values('Garage Inc', 1998);
INSERT into collection (collection_name,release_date) 
values('Musique Vol. 1', 2006);
INSERT into collection (collection_name,release_date) 
values('Greatest Hits', 2003);
INSERT into collection (collection_name,release_date) 
values('Best Of 2017', 2017);
INSERT into collection (collection_name,release_date) 
values('Hybrid Theory Anniversary', 2020);
INSERT into collection (collection_name,release_date) 
values('Boys Don''t Cry', 1980);
INSERT into collection (collection_name,release_date) 
values('Standing On Beach', 1986);

INSERT into track(track_name, album_id, duration) 
values ('Pure Morning', 
(select id from album where album_name='Without You I''m Nothing'),
294);
INSERT into track(track_name, album_id, duration) 
values ('Infra Red',
(select id from album where album_name='Without You I''m Nothing'),
195);
INSERT into track(track_name, album_id, duration) 
values ('Gasoline',
(select id from album where album_name='Dawn FM'),
212);
INSERT into track(track_name, album_id, duration) 
values ('What You Need',
(select id from album where album_name='House Of Balloons'),
196);
INSERT into track(track_name, album_id, duration) 
values ('Fuel',
(select id from album where album_name='Reload'),
269);
INSERT into track(track_name, album_id, duration) 
values ('It''s Electric',
(select id from album where album_name='Reload'),
213);
INSERT into track(track_name, album_id, duration) 
values ('Instant Crush',
(select id from album where album_name='Random Access Memories'),
337);
INSERT into track(track_name, album_id, duration) 
values ('Musique',
(select id from album where album_name='Da Funk'),
387);
INSERT into track(track_name, album_id, duration) 
values ('Dani California',
(select id from album where album_name='Stadium Arcadium'),
283);
INSERT into track(track_name, album_id, duration) 
values ('Scar Tissue',
(select id from album where album_name='Californication'),
215);
INSERT into track(track_name, album_id, duration) 
values ('Blood',
(select id from album where album_name='Damn'),
119);
INSERT into track(track_name, album_id, duration) 
values ('Humble',
(select id from album where album_name='Damn'),
174);
INSERT into track(track_name, album_id, duration) 
values ('In The End',
(select id from album where album_name='Hybrid Theory'),
216);
INSERT into track(track_name, album_id, duration) 
values ('A Place For My Head',
(select id from album where album_name='Hybrid Theory'),
184);
INSERT into track(track_name, album_id, duration) 
values ('Numb',
(select id from album where album_name='Meteora'),
187);
INSERT into track(track_name, album_id, duration) 
values ('Boys Don''t Cry',
(select id from album where album_name='Three Imaginary Boys'),
135);
INSERT into track(track_name, album_id, duration) 
values ('A Forest',
(select id from album where album_name='Seventeen Seconds'),
355);

insert into collection_track (collection_id, track_id)
values (
(select id from collection where collection_name='A Place For Us To Dream'),
(select id from track where track_name='Infra Red')
);
insert into collection_track (collection_id, track_id)
values (
(select id from collection where collection_name='A Place For Us To Dream'),
(select id from track where track_name='Pure Morning')
);
insert into collection_track (collection_id, track_id)
values (
(select id from collection where collection_name='Trilogy'),
(select id from track where track_name='What You Need')
);
insert into collection_track (collection_id, track_id)
values (
(select id from collection where collection_name='Garage Inc'),
(select id from track where track_name='It''s Electric')
);
insert into collection_track (collection_id, track_id)
values (
(select id from collection where collection_name='Musique Vol. 1'),
(select id from track where track_name='Musique')
);
insert into collection_track (collection_id, track_id)
values (
(select id from collection where collection_name='Greatest Hits'),
(select id from track where track_name='Scar Tissue')
);
insert into collection_track (collection_id, track_id)
values (
(select id from collection where collection_name='Best Of 2017'),
(select id from track where track_name='Humble')
);
insert into collection_track (collection_id, track_id)
values (
(select id from collection where collection_name='Boys Don''t Cry'),
(select id from track where track_name='Boys Don''t Cry')
);
insert into collection_track (collection_id, track_id)
values (
(select id from collection where collection_name='Standing On Beach'),
(select id from track where track_name='A Forest')
);

