-- DSC 100  Relational Data Model
-- 
--
-- SQLite is a C-language library that implements a small and effient SQL database engine.
-- 1 Creating tables
--
create table Student
  (sid Char(20) primary key,
   name Char(20),
   surname Char(20),
   age integer, 
   gpa real);
   
   

insert into Student  values (1, 'Alicia', 'Shan', 20, 3.5);
insert into Student  values (2,  'Audre', 'Lorde', 21, 3);
insert into Student  values (3, 'Yan', 'Ke', 19, 4);
insert into Student  values (4, 'Li', 'Yan', 27, 4.5);
insert into Student  values (5, 'Sudip', 'Roy', 22, 4);



select * from Student; 

-- Making sure SQL Lite shows us the data in a nicer format
-- These commands are specific to SQLite!
.header on -- (Turn display of headers on or off)
.mode column -- (The .mode command sets the output mode. This determines how the output data is formatted and presented. The default mode is list. Supported modes include table, csv, hdml)


-- what happens if we insert the following? 

insert into Student  values (5, 'Wright', 'James', 22, 4);



-- Null values: whenever we don't know the value, we can set it to NULL

insert into Student values (6, 'Dimitrov', 'Alex', null, null);




-- NULL is special. It indicates that a piece of information is unknown or not applicable. For example, some student may not provide information about their age. To store these students' age we must use NULL. NULL is not equal to anything even the number zero, an empty string, and so on. Especially, NULL is not equal to itself. 


-- SQLite shows null values with empty string (''). We can change this by using the -nullvalue command line option when launching SQLite.

.nullvalue null


insert into Student  values (null, 'Wright', 'James', 22, 4);



-- In SQL standard, the primary key column must not contain NULL values. It means that the primary key column has an implicit NOT NULL constraint. However,  SQLite is really lite and allows the primary key column to contain NULL values.
-- this is dangerous, since we cannot uniquely identify the tuple
-- better delete it before we get into trouble

select * from student where sid=null;

-- It’s not valid to use the NULL this way. To check if a value is NULL or not, you use the IS NULL operator instead:

select * from student where sid is not null;

-- The NOT operator negates the IS NULL operator as follows:


select * from student;

-- Deleting tuples from the database:

delete from student where surname = 'Shan';


delete from student where sid is null;
-- what happens here??

select * from student;


------------------------------------------
-- 2  Altering a table  in SQL

-- Add/Drop attribute(s)
-- let's drop the for_profit attribute:

-- Note: SQL Lite does not support dropping an attribute:
-- ALTER TABLE Company DROP for_profit;  -- doesn't work

alter table student add gender char(20);
select * from student;

update student set gender='male' where name = 'Sudip';

select * from student;

-- A peek at the physical implementation:

-- What happens when you alter a table ?  Consider row-wise and column-wise.

------------------------------------------
-- 3 Multiple Tables, and Keys/Foreign-Keys
-- Now alter student to add the courses that they enroll in.
-- Problem: can't add an attribute that is a LIST OF courses. What should we do??
--
--

-- Create a separate table the students' enrollments, with a foreign key to the company:
create table Enrolled
  (cid varchar(20),
   sid varchar(20) references student,
   grade real,
   primary key (cid, sid));

-- Alert 2: sqlite does NOT enforce foreign keys by default. To enable
-- foreign keys use the following command. The command will have no
-- effect if your version of SQLite was not compiled with foreign keys
-- enabled. Do not worry about it.

PRAGMA foreign_keys=ON;

insert into enrolled values('dsc100', 2, 98);
insert into enrolled values('dsc80', 2, 92);
insert into enrolled values('dsc100', 4, 80);
insert into enrolled values('dsc102', 4, 85);

-- now it enforces foreign kyes:
insert into enrolled values('dsc102', 100, 85);

-- Error: FOREIGN KEY constraint failed