Select * from Song;

Select * from Artist;
Select * from Album;

Select SongLength from Song where Id = 15;

Select * from Genre;

Select * from Artist Order by Artist.ArtistName;

Select s.Title, a.ArtistName
From Song s
INNER JOIN Artist a ON s.ArtistId = a.Id;

select DISTINCT a.ArtistName
From Artist a
INNER JOIN Album ON a.Id = Album.ArtistId
where Album.GenreId = 1;

select Distinct a.ArtistName
From Album
INNER JOIN Artist a ON a.Id = Album.ArtistId
where Album.GenreId = 4 or Album.GenreId = 2;

SELECT al.Title, s.Title
FROM Song s
RIGHT JOIN Album al ON s.AlbumId = al.Id
where s.Title IS NULL;

INSERT INTO ARTIST (ArtistName, YearEstablished)
VALUES ('Simpsons', '1987');

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ('Simpsons Sing the Blues', '12/15/1992', '333', 'Fox', '28', '3');

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('Do the Bartman', '63', '11/15/1991', '4', '28', '23');

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('No IDea', '100', '8/15/1991', '6', '28', '23');

SELECT ar.ArtistName, al.Title, s.Title
FROM Song s
INNER JOIN Album al ON al.Id = s.AlbumId
INNER JOIN Artist ar ON ar.Id = al.ArtistId
WHERE ar.Id = 28 AND al.Id = 23;

SELECT COUNT(Song.Id) AS NumSongs, Album.Title
FROM Song
INNER Join Album ON Song.AlbumId = Album.Id
GROUP BY (Album.Title);

SELECT COUNT(Song.Id) AS NumSongs, Artist.ArtistName
FROM Song
INNER Join Artist ON Song.ArtistId = Artist.Id
GROUP BY (Artist.ArtistName);

SELECT COUNT(Song.Id) AS NumSongs, Genre.Name
FROM Song
INNER Join Genre ON Song.GenreId = Genre.Id
GROUP BY (Genre.Name);

SELECT COUNT(Song.Id) AS NumSongs, Artist.ArtistName
FROM Song
INNER Join Artist ON Song.ArtistId = Artist.Id
GROUP BY (Artist.ArtistName)
HAVING COUNT(Song.ID) > 2;

SELECT Title, AlbumLength
FROM Album
where AlbumLength in (select max(AlbumLength) from Album);

SELECT Title, SongLength
FROM Song
where SongLength in (select max(SongLength) from Song);

SELECT s.Title, s.SongLength, al.Title
FROM Song s
INNER JOIN Album al ON s.AlbumId = al.Id 
where SongLength in (select max(SongLength) from Song);
