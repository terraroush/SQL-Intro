--1 Query all of the entries in the Genre table

SELECT Label
FROM Genre;

--2 Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords

SELECT ArtistName
FROM Artist 
ORDER BY ArtistName

--3 Write a SELECT query that lists all the songs in the Song table and include the Artist name

SELECT
  s .Title, a.ArtistName
FROM Song s
LEFT JOIN Artist a on ArtistId = a.id;

--4 Write a SELECT query that lists all the Artists that have a Pop Album

SELECT ArtistName, al.Title as AlbumName, g.Label
FROM Artist
inner JOIN Album al on ArtistId = Artist.id
inner JOIN Genre g on GenreId = g.id
WHERE g.Label = 'pop';

--5 Write a SELECT query that lists all the Artists that have a Jazz or Rock Album

SELECT ArtistName, al.Title as AlbumName, g.Label
FROM Artist
inner JOIN Album al on ArtistId = Artist.id
inner JOIN Genre g on GenreId = g.id
WHERE g.Label = 'jazz' OR g.Label ='rock';

--6 Write a SELECT statement that lists the Albums with no songs

SELECT Title, AlbumLength
FROM Album
WHERE AlbumLength IS NULL;

--7 Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT Artist (ArtistName, YearEstablished) VALUES ('Radiohead', 1990);
INSERT INTO Genre (Label) VALUES ('Alternative');

--8 Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Amnesiac', 2001, 44, 'Parlophone', 31, 15)

--9 Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
VALUES ('Pyramid Song', 4, 05/16/2001, 15, 31, 27) 

INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
VALUES ('I Might Be Wrong', 5, 06/04/2001, 15, 31, 27)

INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
VALUES ('Knives Out', 4, 08/06/2001, 15, 31, 27)

--10 Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.

SELECT s.title as SongTitle, al.title as AlbumTitle, a.ArtistName
 FROM song s
       left JOIN Artist a on s.ArtistId = a.id
       left JOIN Album al on s.AlbumId = al.id
    WHERE a.ArtistName =  'Radiohead'; 
--Reminder: Direction of join matters. Try the following statements and see the difference in results.

--SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
--SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;

--11 Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT al.Title, COUNT(s.id) as numOfSongsPerAlbum
FROM Song s
left JOIN Album al on s.AlbumId = al.id
GROUP BY al.Title

--12 Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

--13 Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

--14 Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword

--15 Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

--16 Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

--17 Modify the previous query to also display the title of the album.


