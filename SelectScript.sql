select album_name, release_date from album 
where release_date>2018;

select track_name, duration from track 
order by duration desc 
limit 1;

select track_name from track
where duration>210;

select collection_name from collection
where release_date>=2018 and release_date<=2020;

select artist_name from artist
where artist_name ~ '^\w+$';

select track_name from track 
where track_name ~ '\sMy\s' or track_name ~ '\sМой\s';
