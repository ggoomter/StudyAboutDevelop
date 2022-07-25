--1. 아티스트가 총 몇명인지 출력(매우쉬움)
SELECT COUNT(ArtistId)  FROM Artist a ;	--275

--2. 아티스트가 중복되지 않은 앨범의수 출력(쉬움)
-- 예) 100개의 앨범중에 a라는가수가 4개, b라는가수가 13개의 앨범을 냈다면 85
SELECT  COUNT(DISTINCT ArtistId)  FROM Album ;  --204

--3. 곡(Track)의 길이(Milliseconds)가 4분이 넘는 곡의 이름(Name)을 보여주세요.(쉬움)
SELECT Name , Milliseconds  FROM Track t ;
--60초=1분.  4분=240000ms
SELECT Name , Milliseconds  FROM Track t WHERE Milliseconds>240000;


--4. 장르는 앨범이 아니라 곡에 부여된다.
--  Genre(장르)별로 몇개의 곡(Track)이 있는지 보여주세요.(보통)
SELECT TrackId  FROM Track t GROUP BY GenreId;

--곡수,  장르명
SELECT g.Name as '장르명' --장르명
     , count(t.TrackId) --곡의갯수
  FROM Track t 
  JOIN Genre g 
    ON t.GenreId = g.GenreId
 GROUP BY t.GenreId;
--25


--5. Artistid, Name, 그 아티스트가 출시한앨범(Album)의수를 앨범수의 내림차순으로 출력(어려움. 조인)
SELECT a.ArtistId , a.Name , count(b.AlbumId) as 앨범수
  FROM Artist a 
  JOIN Album b
    ON a.ArtistId = b.ArtistId
 GROUP BY b.ArtistId 
 ORDER BY count(b.AlbumId) desc;
