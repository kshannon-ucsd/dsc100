--------------------------------------------------------------------------------
-- DSC 100 -- Nested Queries and Set Oprations In SQL
--------------------------------------------------------------------------------

-- In this demo we will use the following schema: 
-- Movie(name, year, genre, budget, rate, revenue)
-- ActedIN(moviename, actorname, salary)


create table Movie
  (name  text primary key,
   year int,
   genre text,
   budget int,
   revenue  int, 
   rating int);

create table ActedIn
  (moviename text references movie,
   actorname text,
   salary int,
  primary key(actorname,moviename));
  


-- download the file Data.zip and extract it in the current directory
-- use .import to import the data; see .help
-- note that other database systems have different ways to import data


.import 'movies-data.txt' Movie
.import 'actors-data.txt' ActedIn

-- Note that Sqlite cannot load missing data as null values
-- So we need to use two steps:
-- Load null values using some type of special value
-- Update the special values to actual null values


update movie set year = null where year = 'null';
update movie set revenue = null where revenue = 'null';
update movie set budget = null where budget = 'null';
update ActedIn set salary = null where salary = 'null';

.nullvalue null
-- the five basic aggregate operations



.mode column
.header ON
.width .

select * from Movie;
select * from ActedIn;




-- For each actor return the genre of movie they acted in

SELECT a.actorname, (SELECT genre 
                     FROM   Movie m                     
                     WHERE  m.name=a.moviename) as genre
FROM  Actedin a;

SELECT   a.actorname, genre
FROM            ActedIn a, Movie m 
WHERE           m.name=a.moviename;



-- Compute the number of actors in each movie




SELECT  m.name, (SELECT count(*)
                        FROM ActedIN a
                        WHERE m.name=a.moviename) as NumActors
FROM Movie m

SELECT  m.name, count(*)
FROM            ActedIn a, Movie m 
WHERE           m.name=a.moviename
GROUP BY m.name;



SELECT m.name, count(a.actorname)
FROM   Movie m LEFT OUTER JOIN ActedIn a  ON 
m.name=a.moviename 
GROUP BY m.name;


-- Compute average salary of actors for all movies with rating > 8

SELECT DISTINCT m.name, (SELECT AVG(salary)
                         FROM   ActedIn a
                         WHERE  m.name=a.moviename) as salary, rating 
FROM Movie m
WHERE m.rating > 8;


SELECT m.name, AVG(salary), rating 
FROM   Movie m, ActedIn a 
WHERE  m.name=a.moviename AND m.rating > 8
GROUP BY m.name

SELECT m.name, AVG(salary), rating 
FROM   Movie m LEFT OUTER JOIN ActedIn a  ON 
m.name=a.moviename 
WHERE  m.rating > 8
GROUP BY m.name


-- nested query in the from clause 

SELECT x.name, rating
FROM (SELECT * 
      FROM Movie AS m 
      WHERE rating > 8) as x
WHERE x.rating < 9


SELECT m.name, rating 
FROM   Movie m
WHERE  m.rating < 9 AND m.rating > 8


-- quantifiers 
-- Find the name of actors who have acted in some crime movie

SELECT DISTINCT  a.actorname FROM   ActedIn a 
WHERE  EXISTS (SELECT m.name
               FROM   Movie m WHERE  m.name=a.moviename AND
               m.genre='Crime')

SELECT DISTINCT  a.actorname, a.moviename FROM   ActedIn a 
WHERE  EXISTS (SELECT m.name
               FROM   Movie m WHERE  m.name=a.moviename AND
               m.genre='Crime')


-- is this is correct query?
SELECT DISTINCT  a.actorname, m.genre 
FROM   ActedIn a 
WHERE  EXISTS (SELECT m.name
               FROM   Movie m 
               WHERE  m.name=a.moviename AND
               m.genre='Crime')


SELECT DISTINCT  a.actorname
FROM   ActedIn a
WHERE  a.moviename IN (SELECT m.name              	  
                       FROM   Movie m
  		          	  WHERE  m.name=a.moviename AND	m.genre='Crime');
                      

SELECT DISTINCT a.actorname
FROM   Movie m, ActedIn a 
WHERE  m.name=a.moviename AND m.genre='Crime'

-- what does this query do?

SELECT DISTINCT a.actorname
FROM   ActedIn a
WHERE  a.moviename NOT IN (SELECT m.name                     
                           FROM   Movie m
  			               WHERE  m.name=a.moviename AND m.genre='Action');
-- it returns the actors who have acted in movies that are not of the genre "Action"                     

-- Which actors acted in the most number of movies that have a revenue of at least $1 billion?

SELECT actorname, COUNT(moviename) FROM ActedIn
WHERE moviename IN (SELECT name FROM Movie WHERE revenue >= 1000000000)
GROUP BY actorname
ORDER BY COUNT(moviename) DESC;

SELECT a.actorname, COUNT(a.moviename)
FROM ActedIn a
JOIN Movie m ON a.moviename = m.name
WHERE m.revenue >= 1000000000
GROUP BY a.actorname
ORDER BY COUNT(a.moviename) DESC;

-- What are the names of the movies that have the highest revenue for each year?

SELECT name FROM Movie
WHERE revenue = (SELECT MAX(revenue) FROM Movie);


-- universal quantifier
-- Retrieve all actor names that only acted on action movies


SELECT a.actorname
FROM   ActedIn a
WHERE  a.actorname Not IN 
                  (SELECT DISTINCT a.actorname
                   FROM   Movie m, ActedIn a 
                   WHERE  m.name=a.moviename AND m.genre <> 'Action');

-- what does the following query retrieve?

SELECT a.actorname
FROM   ActedIn a
WHERE  a.actorname Not IN 
                  (SELECT DISTINCT a.actorname
                    FROM   ActedIn a
                    WHERE  a.moviename NOT IN (SELECT m.name     
                                               FROM   Movie m
                                               WHERE  m.name=a.moviename AND m.genre='Action'));

-- Find all movie s.t. all their actors’ salaries > 2000000


SELECT  m.name
FROM    movie m
WHERE   NOT EXISTS (SELECT *
                    FROM   ActedIn a
  		            WHERE  m.name=a.moviename AND a.salary < 2000000 );

SELECT  m.name
FROM    movie m
WHERE   m.name NOT IN (SELECT m.name
                    FROM   Movie m, ActedIn a 
                    WHERE  m.name=a.moviename AND a.salary < 2000000 );


SELECT DISTINCT  a.actorname
FROM   ActedIn a
WHERE  1 <= (SELECT count(*)
            FROM   Movie m
  		  	WHERE  m.name=a.moviename AND m.genre='Action');


SELECT DISTINCT  a.actorname FROM   ActedIn a 
WHERE  EXISTS (SELECT m.name
               FROM   Movie m WHERE  m.name=a.moviename AND
               m.genre='Action')



-- what does this query do? HINT: Universal Quantifier! 

SELECT a.actorname
FROM   ActedIn a
WHERE  (SELECT count(*)
            FROM   ActedIn b
  		  	WHERE  a.actorname=b.actorname) 
     =  (SELECT  count(*)
            FROM   Movie m
  		  	WHERE  m.name=a.moviename AND m.genre='Action') 

-- recall this one! 
SELECT a.actorname
FROM   ActedIn a
WHERE  a.actorname Not IN 
                  (SELECT DISTINCT a.actorname
                   FROM   Movie m, ActedIn a 
                   WHERE  m.name=a.moviename AND m.genre <> 'Action');


SELECT DISTINCT a1.actorname
FROM Movie m1
JOIN ActedIN a1 ON m1.name = a1.moviename
WHERE m1.genre = 'Action'
AND a1.actorname NOT IN (
  SELECT DISTINCT a2.actorname
  FROM Movie m2
  JOIN ActedIN a2 ON m2.name = a2.moviename
  WHERE m2.genre = 'Drama'
)

-- returns the actor names of actors who acted in movies that are "Action" but not "Drama".


-- Set Oprations

SELECT DISTINCT actorname 
FROM   Movie m, ActedIN a 
WHERE  m.name= a.moviename AND 
(m.genre ='Horror' OR m.genre='Crime'); 



SELECT DISTINCT  a1.actorname 
FROM   Movie m1, ActedIN a1 
WHERE  m1.name=a1.moviename AND m1.genre='Crime'
UNION 
SELECT DISTINCT a2.actorname 
FROM   Movie m2, ActedIN a2 
WHERE  m2.name= a2.moviename AND m2.genre='Action'


--
SELECT DISTINCT z.actorname 
FROM   Movie x, Movie y, ActedIN z, ActedIN w  
WHERE  x.name= z.moviename 
AND    y.name= w.moviename
AND    z.actorname=w.actorname
AND (x.genre='Drama' AND y.genre='Action');


SELECT DISTINCT  a1.actorname 
FROM   Movie m1, ActedIN a1 
WHERE  m1.name=a1.moviename AND m1.genre='Action'
INTERSECT 
SELECT DISTINCT a2.actorname 
FROM   Movie m2, ActedIN a2 
WHERE  m2.name= a2.moviename AND m2.genre='Drama'


SELECT DISTINCT a1.actorname 
FROM   Movie m1, ActedIN a1 
WHERE  m1.name= a1.moviename AND m1.genre ='Action'
EXCEPT 
SELECT DISTINCT a2.actorname 
FROM   Movie m2, ActedIN a2 
WHERE  m2.name= a2.moviename AND m2.genre ='Drama'




-- same as 

SELECT DISTINCT a1.actorname
FROM   ActedIn a1
WHERE  EXISTS
(SELECT a1.actorname
 FROM   Movie m
 WHERE  a1.moviename= m.name
  AND m.genre ='Action')
AND  a1.actorname NOT IN 
(SELECT a2.actorname
 FROM   Movie m, ActedIn a2
 WHERE  a2.moviename= m.name
  AND m.genre ='Drama') 



-- The EXPLAIN QUERY PLAN SQL command is used to obtain a high-level description of the strategy or plan that SQLite uses to implement a specific SQL query.

EXPLAIN QUERY PLAN 
SELECT DISTINCT a1.actorname 
FROM   Movie m1, ActedIN a1 
WHERE  m1.name= a1.moviename AND m1.genre ='Action'
EXCEPT 
SELECT DISTINCT a2.actorname 
FROM   Movie m2, ActedIN a2 
WHERE  m2.name= a2.moviename AND m2.genre ='Drama'

EXPLAIN QUERY PLAN 
SELECT DISTINCT a1.actorname
FROM   ActedIn a1
WHERE  EXISTS
(SELECT a1.actorname
 FROM   Movie m
 WHERE  a1.moviename= m.name
  AND m.genre ='Action')
AND  a1.actorname NOT IN 
(SELECT a2.actorname
 FROM   Movie m, ActedIn a2
 WHERE  a2.moviename= m.name
  AND m.genre ='Drama') 
