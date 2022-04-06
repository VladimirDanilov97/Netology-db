--количество исполнителей в каждом жанре;
select category_name, COUNT(*) from artist a
join artist_category ac on a.id = ac.artist_id  
join category c on ac.category_id = c.id
group by category_name;

--количество треков, вошедших в альбомы 2019-2020 годов;
select count(*) from track t
join album a on t.album_id = a.id
where release_date in (2019, 2020);

--средняя продолжительность треков по каждому альбому;
select album_name, avg(duration) from track t 
join album a on t.album_id = a.id
group by album_name;

--все исполнители, которые не выпустили альбомы в 2020 году;
select distinct artist_name from artist ar
join artist_album aa on ar.id = aa.artist_id 
join album al on aa.album_id = al.id
where artist_name not in (
select distinct artist_name  from artist ar
join artist_album aa on ar.id = aa.artist_id 
join album al on aa.album_id = al.id
where release_date in (2020));

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
select distinct collection_name from collection c
join collection_track ct on c.id = ct.collection_id
join track t on ct.track_id = t.id 
join album a on t.album_id = a.id 
join artist_album aa on a.id = aa.album_id
join artist on aa.artist_id = artist.id 
where artist_name = 'Placebo';

--наименование треков, которые не входят в сборники;
select track_name  from track 
left join collection_track ct on track.id = ct.track_id
where ct.track_id is null;

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
with grouped as(
select artist_name, duration from track t 
join album a on t.album_id = a.id 
join artist_album aa on a.id = aa.album_id 
join artist a2 on aa.artist_id = a2.id)
select artist_name, duration from grouped
where duration = (select MIN(duration) from track);

--название альбомов, содержащих наименьшее количество треков.
with grouped as( select a.album_name, count(*) track_number from track t
join album a on t.album_id = a.id 
group by a.album_name)
select * from grouped
where track_number = (select Min(track_number) from grouped);

--название альбомов, в которых присутствуют исполнители более 1 жанра;
select album_name, count(category_name) cat_count from album al
join artist_album aa on al.id = aa.album_id
join artist_category ac on aa.artist_id = ac.artist_id 
join category c on ac.category_id = c.id
group by album_name
having COUNT(distinct category_name) > 1;












