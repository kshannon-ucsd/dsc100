--------------------------------------------------------------------------------
-- DSC 100 -- AGGREGATES IN SQL
--------------------------------------------------------------------------------

-- In this demo we will use the following schema: 
-- Movie(name, year, genre, budget, rate, revenue)


create table Movie
  (name  varchar(50) primary key,
   year int,
   genre varchar(20),
   budget int,
   revenue  int, 
   rate int);

-- download the file movies-data.txt in the current directory
-- use .import to import the data; see .help
-- note that other database systems have different ways to import data


.import 'movies-data.txt' Movie


-- Note that Sqlite cannot load missing data as null values
-- So we need to use two steps:
-- Load null values using some type of special value
-- Update the special values to actual null values



.mode column
.header ON


update movie set year = null where year = 'null';
update movie set revenue = null where revenue = 'null';
update movie set budget = null where budget = 'null';

.nullvalue null
-- the five basic aggregate operations

select count(*) from movie;

select count(name) from movie;

-- Null values are not used in the aggregate

select count(year) from movie;

select sum(budget) from movie;

select sum(budget) from movie where budget is not null;

__  

select avg(budget) from movie;


select sum(revenue-budget) as profit from movie;

select sum(revenue)-sum(budget) as profit from movie;


select avg(revenue-budget) as profit from movie;

select avg(revenue)-avg(budget) as profit from movie;

select * from movie where revenue < budget; 


select max(revenue) from movie;

select min(revenue) from movie;

-- what does this query compute? 
select name from movie where revenue=min(revenue);

select name from movie where revenue=(select min(revenue) from movie);



-- Counting the number of distinct values

select count(genre) from movie;
select count(distinct genre) from movie;

--------------------------------------------------------------------------------
-- Aggregates With Group-by


select count(genre) from movie;  

select genre, count(*)
from movie
group by genre;


-- If the grouping column contains a null value, that row becomes its own group in the results.

select year, count(*)
from movie
group by year;


select year, genre, count(*)
from movie
group by year, genre;




-- compute the total proft for each genre:
select genre, sum(revenue-budget)
from movie
group by genre;

select year, sum(revenue-budget)
from movie
group by year;


-- compute the average profir for each gendre 
select genre, sum(revenue-budget)/count(*)
from movie
group by genre;


select genre, avg(revenue-budget)
from movie
group by genre;

-- what do these queries do ?
select genre, max(year)
from movie
group by genre;

select genre, max(year),min(year)
from movie
group by genre;

select genre, year
from movie
group by genre;
-- note: sqlite is WRONG on the last query.  why ?

--------------------------------------------------------------------------------
-- Understanding goups

-- 11 tuples:
select * from movie;

-- 4 groups:
select genre, count(*)
from movie
group by genre;

-- 3 groups:
select genre, count(*)
from movie
where year>2000 
group by genre;
 
--  number of movies 
select genre, count(*)
from movie
where year>2000 
group by genre;




--------------------------------------------------------------------------------
-- "DISTINCT" is the same as "GROUP BY"

select genre, count(*)
from movie
group by genre;

select genre
from movie
group by genre;

select distinct genre
from movie;

SELECT   year, Sum(revenue-budget) AS TotalProft
FROM     Movie
GROUP BY year
ORDER BY  Sum(revenue);


--------------------------------------------------------------------------------
-- Ordering results by aggregate

SELECT   genre, sum(revenue-budget) AS TotalProft
FROM     Movie
GROUP BY genre
order by TotalProft desc;

SELECT   genre, sum(revenue-budget) AS TotalProft
FROM     Movie
GROUP BY genre
order by TotalProft asc;

-- Having 

SELECT   genre, sum(revenue-budget) AS TotalProft
FROM     Movie
GROUP BY genre;

SELECT   genre, sum(revenue-budget) AS TotalProft
FROM     Movie
GROUP BY genre
HAVING count(*)>=2; 


SELECT   genre, sum(revenue-budget) AS TotalProft,count(*) NumberMov 
FROM     Movie
GROUP BY genre
