사이트 주소 : https://sqlzoo.net/wiki/SUM_and_COUNT
답 : https://github.com/jisaw/sqlzoo-solutions
ansi join은 디폴트가 inner join

- ### select Name
답 : https://gogetem.tistory.com/419
7번 : 첫번째 고비
  SELECT name FROM world
    WHERE name LIKE '%a%a%a%'
9번 : 두번째 고비
13번문제 재밌음
15번 맞는데 틀렸다고 함 
SELECT name, capital, REPLACE(capital, name, '') as extension 
from world
where capital like concat('%', name, '_%')


---https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial ---
1. 문제아님
2. 초급. 인구가 2억명(200000000)이상인 국가
=>SELECT name FROM world
WHERE population > 200000000
3. 초급. 인구가 2억명 이상인 국가들의 이름과 1인당 gdp
=>select name, gdp/population from world
where population > 200000000
4. 초급. 남아메리카 대륙의 모든 국가들의 이름과 백만단위의 인구
=>select name, population/1000000 population from world
where continent = 'South America'
5. 초급. 프랑스, 독일, 이탈리아의 이름과 인구
=>select name, population from world
where name in ('France', 'Germany', 'Italy')
6. 초급. 이름에 United가 들어있는 국가
=>select name from world 
where name like '%United%'
7. 초급. 면적이 300만이상 이거나 인구가 2억5천만 이상인 국가들의 이름, 인구, 면적
=>select name, population, area from world
where area > 3000000
or population > 250000000
8. 중급. 인구가 2억5천만 이상이거나 면적이 3백만 이상중 (양쪽이 아니라 하나의 조건만 만족하는 국가)
name, population, area를 보여주세요.
=>select name, population, area from world
where (area > 3000000 or population > 250000000)
and not(area > 3000000 and population > 250000000)
9. 남아메리카 대륙 국가들의 이름과 인구를 수백만 단위로,
GDP를 수십억 단위로 표현.
round함수사용
=> select name, round(population/1000000,2) as population, round(gdp/1000000000,2) as gdp from world
where continent = 'South America'
10. 1조 달러 국가의 1인당 GDP를 가장 가까운 1000달러로 보여주세요.
=> select name, round(gdp/population, -3) from world
where gdp>1000000000000
11. 이름과 수도의 문자 수가 같은 이름과 수도를 표시합니다.
LENGTH 함수를 사용하여 문자열의 문자 수를 찾을 수 있습니다.
-> LEN 으로 바꿔주기.
=> SELECT name, capital
  FROM world
 WHERE length(name) = LENGTH(capital)
12. 각 문자의 첫 글자가 일치하는 이름과 수도를 표시하십시오. 이름과 수도가 같은 나라들은 포함하지 마라.
left 함수를 사용하여 첫 번째 문자를 분리할 수 있다.
=> select name, capital from world
where left(name,1) = left(capital,1)
and not name = capital

13. 이름에 공백이 없고 모음이 5개 다들어가되 하나씩만 포함된 나라를 찾아보세요.
NOT LIKE '%a%' 구를 사용하여 결과에서 문자를 제외할 수 있습니다.
=> SELECT name
   FROM world
WHERE name LIKE '%a%'
  and name LIKE '%e%'
  and name LIKE '%i%'
  and name LIKE '%o%'
  and name LIKE '%u%'
  and name NOT LIKE '% %'
  
또는 SELECT name
   FROM world
WHERE (name LIKE '%a%'
   and name LIKE '%e%'
   and name LIKE '%i%'
   and name LIKE '%o%'
   and name LIKE '%u%')
  AND name NOT LIKE '% %'
 


--- 노벨수상자 select from nobel tutorial
https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial
테이블 = ** nobel (yr, subject, winner)** 
1. 왕초급. Change the query shown so that it displays Nobel prizes for 1950.
-> SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 2. 초급. Show who won the 1962 prize for Literature.
 -> SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
3. 초급. Show the year and subject that won 'Albert Einstein' his prize.
-> select yr, subject from nobel where winner = 'Albert Einstein'
4. 초급. Give the name of the 'Peace' winners since the year 2000, including 2000.
-> select winner from nobel where yr >= 2000 and subject = 'Peace'
5.쉬움. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
->select yr, subject, winner from nobel where subject = 'Literature' and yr >= 1980 and yr <=1989
6.쉬움. Show all details of the presidential winners:
Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama
->문제가 이게뭐냐.. SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')
7. 쉬움. Show the winners with first name John
->SELECT winner
FROM nobel
WHERE winner LIKE 'john%'
8. 쉬움. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
-> SELECT *
FROM nobel
WHERE (subject = "Physics" AND yr = '1980') OR (subject = 'Chemistry' AND yr = 1984)

9. 쉬움. Chemistry and Medicine을 제외한 1980년 수상자의 연도, 대상 및 이름 표시
=> select yr, subject, winner
from nobel
where yr = 1980
and subject not in ('Chemistry', 'Medicine')

10. 쉬움.  초년(1910년 이전, 1910년 미포함)에 'Medicine'을 수상한 사람과
후기(2004년 이후, 2004년 포함)에 'Literature' 수상자의 연도, 대상,이름을 함께 보여준다.
=> select yr, subject, winner from nobel
where (yr<1910 and subject = 'Medicine')
or (yr>=2004 and subject = 'Literature')

11. 쉬움. Peter Grünberg가 수상한 상의 모든 세부 사항
=> select * from nobel
where winner = 'Peter Grünberg'

12. EUGENE O'NEILL 가 수상자인 모든 정보 출력.
=>SELECT yr, subject, winner from nobel
where winner = 'EUGENE O\'NEILL'

13. 수상자, 연도, 주제를 함께 나열하세요.(이름의 앞이 Sir로 시작되는 사람)
최신 정보를 먼저 표시한 후 이름 순서로 표시합니다.
=> select winner, yr, subject from nobel
where winner like 'Sir%'
order by yr desc, winner


14. 생각하나 뚫어야함 중급. 1984년 수상자와 주제를 주제별, 수상자 이름 순으로 제시하되 화학과 물리학은 마지막에 나열
=> SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject,winner


--SELECT Whthin select
1. 러시아보다 인구수가 많은 국가
-> SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Romania')
2. 유럽에있는 국가중 1인당 GDP가 영국보다 높은곳.
-> select name from world where continent = 'Europe' and gdp/population > (select gdp/population from world where name = 'United Kingdom')
3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
-> select name, continent from world where continent in (select continent from world where name in ('Argentina', 'Australia')) order by name
4. Which country has a population that is more than Canada but less than Poland? Show the name and the population.
-> select name, population from world where population < (select population from world where name = 'Poland') and population > (select population from world where name = 'Canada')
5. Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
The format should be Name, Percentage for example:
name	percentage
Albania	3%
Andorra	0%
Austria	11%
...	...
-> 오 제대로된 문제다. 재밌다.
select name, CONCAT(ROUND(population/(select population from world where name = 'Germany'),2)*100,'%') as percent from world where continent = 'Europe'
나는 00.00%로만 나오네. 여기서 못고치겠다.
6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
->select name from world where gdp> (select max(gdp) from world where continent = 'Europe')
7. Find the largest country (by area) in each continent, show the continent, the name and the area:
-> 어렵군. all 들어가는 쿼리 처음. SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area FROM world y
    WHERE y.continent=x.continent
    AND area>0)
8. 각 대륙마다 제일 알파벳 빠른 나라 하나씩만 출력
->SELECT continent, name
FROM world x
WHERE name <= ALL(SELECT name FROM world y WHERE y.continent = x.continent)
9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
-> all을 이해하기에 좋은 문제다.
SELECT name, continent, population
FROM world x
WHERE 25000000  > ALL(SELECT population FROM world y WHERE x.continent = y.continent AND y.population > 0)


10. Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
-> 이거 안되네. select name, continent from world x where x.population >= 3 * all(select population from world y where x.continent = y.continent and y.population >0) 문법에러.
-> 연산을 뒤로 보내보자. select name, continent from world x where x.population >= all (select 3 * population from world y where x.continent = y.continent and y.population >0) 결과값이 없네   여기에 y.name != x.name 조건 추가해줬으면 됐네.
-> 답지의 정답 SELECT name, continent
FROM world x
WHERE population > ALL(SELECT population*3 FROM world y WHERE x.continent = y.continent AND population > 0 AND y.name != x.name)



--SUM and COUNT
1. Show the total population of the world.
-> SELECT SUM(population) FROM world
2.List all the continents - just once each.
-> select distinct continent from world
3. Give the total GDP of Africa
-> select sum(gdp) from world where continent = 'Africa'
4. How many countries have an area of at least 1000000
-> select count(*) from world where area>1000000
5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')
-> select sum(population) from world where name in ('Estonia', 'Latvia', 'Lithuania')
6.Counting the countries of each continent
-> select continent, count(name) from world group by continent
7. For each continent show the continent and number of countries with populations of at least 10 million.
-> 어려움
select continent, count(name) from world group by continent having sum(population) > 10000000 틀림
select continent, count(name) from world where population >= 10000000 group by continent 이게 정답.
WHERE, GROUP BY, HAVING 순서.
8. List the continents that have a total population of at least 100 million.
-> select continent from world group by continent having sum(population) > 100000000

---------------------------------------------------------------------------------
--The JOIN operation 후반부부터 좀 어렵다. 여러조건은 on에 괄호
	[game] 언제 어떤경기장에서 무슨팀끼리 경기했는지
id	 mdate	 stadium  	team1 	team2
	[goal]  어떤 경기에서 어떤팀의 누가 언제 골을 넣었는지
matchid	  teamid	  player	  gtime
	[eteam] 팀id, 팀이름, 코치
id	  teamname	  coach

1. 독일이 넣은 골 모두의 matchid, player
->SELECT matchid, player FROM goal
  WHERE teamid LIKE 'GER'
2. 1012 게임만 ID, Stadium, team1, team2 표시
Show id, stadium, team1, team2 for just game 1012
->뭐지 갑자기 너무 쉽다. SELECT id,stadium,team1,team2
  FROM game where id = '1012'
3. show the player, teamid, stadium and mdate for every German goal.
모든 독일 골에 대한 선수, 팀 ID, 경기장 및 mdate를 표시
-SELECT player, teamid, stadium, mdate
   FROM game
   JOIN goal
     ON (id=matchid AND teamid='GER')
4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
'마리오%'와 같은 플레이어가 득점한 모든 골을 팀1, 팀2, 플레이어에게 보여줍니다.
->SELECT team1, team2, player
FROM game
  JOIN goal ON (game.id=matchid AND goal.player LIKE 'Mario%')
5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
처음 10분 동안 기록한 모든 골에 대해 선수, 팀id, 코치, gtime을 보여준다.
코치는 저 테이블에 없다.
->SELECT player, teamid, coach, gtime
FROM goal
  JOIN eteam ON (teamid=id AND gtime<=10)
6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
경기 날짜와 '페르난도 산토스'가 1군 감독으로 있던 팀의 이름을 나열하세요.
-> SELECT mdate, teamname
FROM game
  JOIN eteam ON (team1=eteam.id AND coach LIKE '%Santos')
7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
경기장이 '바르샤바 국립 경기장 National Stadium, Warsaw'이었던 경기에서 기록한 모든 골의 선수를 나열합니다.
->select player from goal join game on (id = matchid and stadium = 'National Stadium, Warsaw')
8. show the name of all players who scored a goal against Germany.
독일을 상대로 골을 넣은 모든 선수들의 이름을 보여줘.
-> SELECT DISTINCT(player)
FROM game
  JOIN goal ON matchid = id
WHERE ((team1='GER' OR team2='GER') AND teamid != 'GER')
9. Show teamname and the total number of goals scored.  팀마다 총 골수토털.
팀명과 총 득점 수를 표시합니다.
-> SELECT teamname, COUNT(player)
FROM eteam
  JOIN goal ON id=teamid
GROUP BY teamname
10.Show the stadium and the number of goals scored in each stadium.
경기장과 각 경기장에서 득점한 골 수를 보여줍니다.
-> select stadium, count(player) from game join goal on (matchid = id) group by stadium   그룹바이 한다음 select한다.

11. 중급. For every match involving 'POL', show the matchid, date and the number of goals scored.
POL'과 관련된 모든 경기에 대해 매치id, 날짜 및 득점 수를 표시합니다'
->
SELECT matchid, mdate, COUNT(player) AS goals
FROM game
  JOIN goal ON (matchid=id AND (team1 = 'POL' OR team2 = 'POL'))
GROUP BY matchid, mdate

12.고. 좋은문제
For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
'GER'이 득점한 모든 경기에 대해 매치ID, 경기 날짜 및 'GER'의 골 수를 표시합니다.
-> SELECT id, mdate, COUNT(player)
FROM game
  JOIN goal ON (id=matchid AND (team1 = 'GER' OR team2 = 'GER') AND teamid='GER')
GROUP BY id, mdate
-> select matchid, mdate, count(gtime)
from game
JOIN goal ON matchid = id
WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid='GER'
GROUP BY matchid, mdate

13. 고. 진짜 좋은 고난이도 문제. 이게 최종 목표. case when 사용.
Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2.
-> 각 팀이 기록한 골과 함께 모든 경기를 나열하세요. 이전 연습에서는 설명하지 않았던 "CASE WHEN"을 사용
mdate, matchid, team1 및 team2별로 결과를 정렬
-> 
SELECT mdate,
  team1,
  CASE WHEN teamid=team1 THEN 1 ELSE 0 END score1,
  team2,
  case when teamid=team2 then 1 else 0 end score2
  FROM game JOIN goal ON matchid = id
group by mdate, team1, team2
order by mdate, matchid, team1, team2
-> 답 : sum만 쳐줬으면 됐네.
SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 
  FROM game
  LEFT JOIN goal
    ON (id = matchid)
GROUP BY mdate,team1,team2
ORDER BY mdate, matchid, team1, team2
-> 있어야되는 경기가 없다.
아 0대 0. 엑셀로 뽑아보면 2개 바로 알수 있다.
골이 없던 경기라도 화면에 보이도록
SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 
  FROM game
  LEFT JOIN goal
    ON (id = matchid)
GROUP BY mdate,team1,team2
ORDER BY mdate, team1, team2
-------------------------------------------------------------------------------
more join   
movie : id, title, yr, director, budget, gross
actor : id, name
casting : movieid, actorid, ord

5번까지는 너무 쉬워서 볼필요 없음
1. List the films where the yr is 1962 [Show id, title]
-> SELECT id, title FROM movie WHERE yr=1962
2. Give year of 'Citizen Kane'.
->select yr from movie where title = 'Citizen Kane'
3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
-> select id, title, yr from movie where title like '%Star Trek%' order by yr
4. What id number does the actor 'Glenn Close' have?
-> select id from actor where name = 'Glenn Close'
5. What is the id of the film 'Casablanca'
-> select id from movie where title = 'Casablanca'

6. Obtain the cast list for 'Casablanca'.Use movieid=11768, (or whatever value you got from the previous question)
-> select actor.name from actor join casting on movieid = 11768 and actorid = actor.id
7. Obtain the cast list for the film 'Alien' 엄청 쉬울줄 알았는데 테이블 구조가 분리돼있어서 생각보다 안쉽네
-> select actor.name from actor join casting, movie on movieid = movie.id and movie.title = 'Alien' 문법오류
->정답 :  SELECT name FROM actor, casting WHERE actor.id=casting.actorid AND casting.movieid = (SELECT id FROM movie WHERE title = 'Alien')
-> 조인 쓸거면 이렇게 하면됨. SELECT name FROM actor join casting on (actor.id=casting.actorid AND casting.movieid = (SELECT id FROM movie WHERE title = 'Alien'))
8. List the films in which 'Harrison Ford' has appeared
-> 와 또 쉬운거같은데 모르겠네. 반드시 이정도는 아무생각없이 짤수있을정도가 되어야 된다.
SELECT title
FROM movie
  JOIN casting ON (id=movieid AND actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford'))
-> join안쓰고 하려면 이렇게
SELECT title
FROM movie, casting
where
movie.id = casting.movieid
and
casting.actorid = (select id from actor where name =  'Harrison Ford')
9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]  해리슨포드 출연중 주연이 아닌 영화
-> SELECT title
FROM movie
    JOIN casting ON (id=movieid AND actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') AND ord != 1)

13. Obtain a list, in alphabetical order, of actors who  had at least 15 starring roles
고난이도.
-> SELECT name
FROM actor
  JOIN casting ON (id = actorid AND (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1)>=15)
GROUP BY name


14.List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
-> 못품.
SELECT title, COUNT(actorid) as cast
FROM movie JOIN casting on id=movieid
WHERE yr = 1978
GROUP BY title
ORDER BY cast DESC, title

15.List all the people who have worked with 'Art Garfunkel'.
->답변봄
엑셀에서 정렬하면 답 똑같음
SELECT DISTINCT name
FROM actor JOIN casting ON id=actorid
WHERE movieid IN (SELECT movieid FROM casting JOIN actor ON (actorid=id AND name='Art Garfunkel')) AND name != 'Art Garfunkel'
GROUP BY name

-------------------------------------------------------------------------------------
Using Null
teacher : id, dept, name, phone, mobile
dept : id, name

distinct가 group by와 거의비슷한 형태의 작업이라는 것을 이해하겠는가? 같은것은 합쳐라.
그룹함수는 null을 무시한다. (count, max, min, avg, sum, variance, stddev) null도 다룰려면 nvl을 사용해라.
그룹함수가 중첩된 경우 group by 절에 기술한 컬럼도 출력할 수 있다.
group by 안에 있는 컬럼들의 값이 모두 같아야 같은 그룹으로 묶인다. 요넘들이 같을때 하나의 그룹으로 묶어라. 라고 설정하는거니 당연한말.
그룹바이와 조인을 같이 쓸 경우는 내부쿼리로 그룹바이를 먼저 하는것이 성능상 좋다.


1. List the teachers who have NULL for their department.
-> select name from teacher where dept is null
2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher.  양측테이블 둘다에서 널인건 빼고
-> SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
3. Use a different JOIN so that all teachers are listed. 잘 해석이 안되지만 join을 쓰되 teacher는 null도 다 나오게.
-> SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
          ON (teacher.dept=dept.id)
4. Use a different JOIN so that all departments are listed. 3번과 반대. join을 쓰되 departments는 null도 다 나오게.
-> SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
          ON (teacher.dept=dept.id)
5.
Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'
teacher의 name과 mobile을 가져오되 mobile이 null이면 저 고정값으로 가져와라.
-> 오 COALESCE(합체하다.) 처음 알았다. ISNULL()을 축약해서 쓰는 함수.
SELECT name,
COALESCE(mobile, '07986 444 2266')
FROM teacher
6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.
->select teacher.name, coalesce (dept.name, 'None') from teacher left join dept on dept.id = teacher.dept
7. Use COUNT to show the number of teachers and the number of mobile phones.
-> select count(id), count(mobile) from teacher
8.
그룹바이를 했는데 row가 더 많아지네. 그룹별로 뭉쳐라 라고만 알고있었는데 그룹별로 분리해라라는 말도되네.
-> 처음의 내 답. select dept.name, count(teacher.id) from teacher right join dept on dept.id = teacher.dept  이렇게 하면 컬럼 1개computing에 count다 합쳐져서 4로 나옴. 사실 이거 에러아닌가? 그룹함수를 안쓴 컬럼이(dept.name) group by에 없는데
->고친 답. select dept.name, count(teacher.id) from teacher right join dept on dept.id = teacher.dept group by dept.name
이렇게하면 coumputing 3, design 1, engineering 0 으로    3행 나옴.
9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
 영어가 어렵다. 부서id가 1또는2면 'Sci'로, 나머지는 'Art'로 표현해서 모든 선생님의 이름을 가져와라.
 ->SELECT teacher.name,
CASE WHEN dept.id = 1 THEN 'Sci'
     WHEN dept.id = 2 THEN 'Sci'
     ELSE 'Art' END
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)

10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
-> SELECT teacher.name,
CASE
WHEN dept.id = 1 THEN 'Sci'
WHEN dept.id = 2 THEN 'Sci'
WHEN dept.id = 3 THEN 'Art'
ELSE 'None' END
FROM teacher LEFT JOIN dept ON (dept.id=teacher.dept)

-----------------------------------------------------------------------------------------------------------------
self join
stops : id, name
route : num, company, pos, stop
