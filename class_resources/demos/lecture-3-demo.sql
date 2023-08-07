-- DSC 100 -- Basic SQL 
--------------------------------------------------------------------------------
-- in this demo we use the following schema:
-- Movie(name, year, genre)
-- ActedIN(actorname, moviename)


--------------------------------------------------------------------------------
create table Movie
  (name varchar(50) primary key,
   year integer,
   genre varchar(50));

insert into Movie  values ('1917', 2019, 'War');
insert into Movie  values ('Apocalypse now', 1979, 'War');
insert into Movie  values ('The god father', 1972, 'Crime');
insert into Movie  values ('Planet Earth II', 2016, 'Nature documentary');
insert into Movie  values ('House of Gucci', 2021, 'Crime');
insert into Movie  values ('In the Name of the Father', 1993, 'Crime');

insert into Movie (name)  values ('The Lion King');



--------------------------------------------------------------------------------
create table ActedIn
  (actorname varchar(20),
   moviename varchar(20) references movie,
  primary key(actorname,moviename));

-- Alert 2: sqlite does NOT enforce foreign keys by default. To enable
-- foreign keys use the following command. The command will have no
-- effect if your version of SQLite was not compiled with foreign keys
-- enabled. Do not worry about it.

PRAGMA foreign_keys=ON;

insert into ActedIn values('Marlon Brando', 'Apocalypse now');
insert into ActedIn values('Al Pacino', 'The god father');
insert into ActedIn values('Marlon Brando', 'The god father');

-- If we try:
insert into ActedIn values('Mel Gibson', 'apocalypto');
-- We should get an error if foreign keys got enforced
-- Error: foreign key constraint failed

--------------------------------------------------------------------------------
-- Notice that the data we created is stored on disk.
-- Quit sqlite3
-- See that database file on disk has now a non-zero size.
-- It's a binary file. It contains the data for all our relations in one file.
-- When we come back to sqlite3, all our data is there.

--------------------------------------------------------------------------------
-- 1. SELECTION queries select a subset of the table:

-- Before we start, let's switch to a better query output format
.mode column
.header ON
.nullvalue null

-- In SQLite, the ".width" command is used to set the display width of columns in the query output. The three parameters following ".width" correspond to the width of the first, second, and third columns respectively. Setting the value to "0" means that the column will have no specific width and will be displayed as wide as necessary to fit the data. So, ".width 0 0 0" sets the width of all columns to be dynamic and will be displayed as wide as necessary to fit the data. This can be useful for columns with long or variable-length data.

.width 0 0 0

-- What do you think the following queries return?

select *
from Movie
where year > 2000;


select name from movie where year between 2010 and 2019;

-- The BETWEEN operator is a logical operator that tests whether a value is in range of values.

select name from movie where 2010<=year AND  year<=2019;




select *
from Movie
where name like '%Father%';


--------------------------------------------------------------------------------
-- 2. PROJECTION queries keep a subset of the attributes

select name
from Movie;


--------------------------------------------------------------------------------
-- some minor variations: DISTINCT and ORDER BY

-- This query returns duplicates:
select genre
from Movie;

-- Wait a minute... didn't we say that relations were sets? Why
-- do we suddently see bags? Why isn't the DBMS eliminating duplicates?
--
-- Key reason is performance: eliminating duplicates is an expensive operations.
-- So the DBMS will leave them if the user/application can tolerate them. 
-- (Later we will learn that we also need to retain duplicates when we compute aggregate values.)

-- To eliminate duplicates, use DISTINCT:

select distinct genre
from movie;

-- We can also order the outputs using ORDER BY

-- order alphabetically by name:
select *
from movie
order by year;

-- order by year descending
select *
from movie
order by year desc;


select name from movie where genre is null;

-- This query selects the names of all movies from the "Movie" table where the "genre" attribute is null. The "IS NULL" operator is used to check if the value of the "genre" attribute is null. This query will return all rows where the "genre" attribute has no value assigned.

-- order by name, then year descenting

select *
from movie
order by genre, year desc


-- What happens if we order on an attribute that we do NOT return ?

-- First, let's try:
select *
from movie
order by year desc

-- Now, let's try:
select genre
from movie
order by year

-- How about the following? 

select distinct genre
from movie
order by year;

-- What happens if we excute the following?  
select * from movie, actedin;

-- how about this? 

select * from movie, actedin;


select * from movie, actedin