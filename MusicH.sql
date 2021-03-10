SELECT
    Id,
    ArtistName,
    YearEstablished
FROM Artist
ORDER BY ArtistName;


--selects the entire genre table
SELECT * FROM Genre;

--selects songs greater than 100 seconds
SELECT
    Id,
    Title,
    SongLength,
    ReleaseDate,
    GenreId,
    ArtistId,
    AlbumId
FROM Song
WHERE SongLength > 100;

SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;

SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;


--filter by Artist name
SELECT
    Id,
    ArtistName,
    YearEstablished
FROM Artist
ORDER BY ArtistName;


--filter by artists with pop albums
SELECT a.ArtistName
       
  FROM Album al
       LEFT JOIN Artist a on al.ArtistId = a.id
  WHERE al.GenreId = 4

  
  
  --filter by artists with jazz or rock albums
  SELECT a.ArtistName
       
  FROM Album al
       LEFT JOIN Artist a on al.ArtistId = a.id
  WHERE al.GenreId = 2 OR al.GenreId = 4


  --filter by artists with no songs
  Select al.Title
FROM Album al
    LEFT JOIN Song on Song.AlbumId = al.Id
    WHERE Song.id IS NULL

    --insert artist
    INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Richard Paul Astley', 1985);

    --insert album
    INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Whenever You Need Somebody', '06/27/1987', 7783302389, 'RCA', 28, 4);

    --insert song
    INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Never Gonna Give You Up', 212, '06/27/1987', 13, 28, 23);


    Select al.Title, s.Title, a.ArtistName
FROM Song s LEFT JOIN Album al ON s.AlbumId = al.Id 
LEFT JOIN Artist a ON al.ArtistId = a.Id
WHERE al.ArtistId = 12


--display how many songs for each album
SELECT COUNT(Song.Id)
FROM Song
GROUP BY song.AlbumId


--display how many songs for each artist
SELECT COUNT(Song.Id)
FROM Song
GROUP BY Song.ArtistId


--display how many songs for each genre
SELECT COUNT(Song.Id)
FROM Song
GROUP BY Song.GenreId

--Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
SELECT a.ArtistName
FROM Artist a LEFT JOIN Album al ON a.Id = al.ArtistId
GROUP BY al.Label, a.ArtistName
HAVING COUNT(al.Label) > 1

--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT al.Title, al.AlbumLength
FROM Album al
WHERE al.AlbumLength = (SELECT MAX(al.AlbumLength) FROM Album al)     
--selects max album length from album table

--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT s.Title, s.SongLength, al.Title
FROM Song s LEFT JOIN Album al ON s.AlbumId = al.Id
WHERE s.SongLength = (SELECT MAX(s.SongLength) FROM Song s)
--selects max song length from song table