---
layout: page
title: 🙋 FAQs
description: Answers to frequently asked questions each week.
nav_order: 6
---

# 🙋FAQs
{:.no_toc}

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## General 
### Logistics FAQ
1. **Will the course Canvas be updated or used?**
	- No, the course canvas is merely to auto enroll students in Gradescope, Piazza, and for e-grades purposes. We will not use Canvas for any instructional material, quizzes or homework. 
2. **Are office hours or discussion sections recorded?**
	- Office hours are not recorded, no are discussion sections.
	- Course lectures are recorded and available trough UCSD podcast.
3. **My canvas looks empty, am I added to the course?**
	- Only an instance of canvas has been created so that we sync gradescope/piazza with egrades and ucsd. 
	- So as long as you are officially registered for dsc 100, are on piazza and gradescope. then you should be good to go. Look out for the course website for notes, demos.

### Course Content

1. **How would I find the size of my output after using group by?**
	- When you do a count of anything when grouping, it gives the number of items per group. If you want the total number of rows before group by, simply do a count() without the group by. Or else you will have to use nested queries to get the total number of rows.
2. **Where do I find the datasets used in the lectures?**
	- There is separate section as database on the site.
	- You will find the datasets used in a particular lecture as a part of the demo files.
3. **Does the Order of `JOIN` the tables matter?**
	- It depends on what type of `JOIN` you are using. If you are trying to do an `INNER JOIN` or `OUTER JOIN` the order of the tables do not matter. If you think of it in terms of sets, intersection operation is associative and commutative.
	- But if you do a `LEFT JOIN`, you need to be careful with the ordering.
4. **I am getting a foreign key error while trying to import data. What might have gone wrong?**
	- It is possible that you updated the raw data at some point, or have done some other action to the data in the db. I would blow it all away and recreate the flights DB following the instructions to ensure there are no issues. 
	- It usually means either the schema is messed up, or the underlying data has been changed resulting in a mismatch. or. the order of copying is wrong and there should be a PK in the DB to facilitate a FK being added.
5. **I am trying to import and copy the data to the DB. But the 1st row is missing from every table. What went wrong?**
	- Because you might have used the header keyword. It assumes that the first row is a header row and ignores it, but we do not have a header row in our CSV file.
6. **How to know when do you stop BCNF?**
	- A table or relation is said to be in BCNF in DBMS **if the table or the relation is already in 3NF**, and also, for every functional dependency (let's say, X->Y), X is either the super key or the candidate key. In simple terms, for any case (let's say, X->Y), X can't be a non-prime attribute.
	- A relation is in BCNF if and only **if each functional dependency X → Y has a determinant ( X ) which is a superkey**, that is, it determines all the other attributes of the relation.
	- Do go through the notes for better understanding. *confirm this tooo*
7. **Recommended resources for lecture preparation**
	- I would recommend checking out the lecture slides the day before (slides are usually out a day before). You can go to the last slide or two and look at the slide to get an idea of the main topics we will be covering. I would then go online and do some googling about the topic, coupled with cross checking the slides for examples and material. 
	- This material can certainly feel overwhelming because it often takes time to wrestle with it until you really start to get the hang of it, and to walk through a lot of examples. But keep showing up, studying, and everything else will do just fine :)

## Final, Midterm and Quizes

1. **Can quizzes, midterm or finals be done as team collaboration**
	- No, they are supposed to be done alone. The final exam, quizzes and midterm are individual assignments.
	- Only the homework can be done as a team of 2.
2. **Midterm Exam Format**
	- There will have 2 entire days to take the midterm and you can take it at any time. But once you start, you will have limited time for the exam. 
	- The final exam will also follow the same format.
3. **Final Exam Time, is it in person?**
	- The exam is take-home. 
	- You can choose to start the exam whenever you like, but you will only be given 3 hours to complete it.
	- The final exam will be available to take over ~4 days during the weekend before finals.
4. **Will there be a quiz after each class or one for the week?**
	- Not necessarily. There are overall 6 quizzes and they will be released on different days based on the amount of content that has been covered.
	- The website will be updated beforehand to reflect the due dates for the quizzes.
5. **Midterm Format**
	- The midterm format is similar to the quizzes and homeworks. Basically, MCQs will be like the quizzes and the coding part will be like the homeworks. 
	- You will be given 48 hours to do the coding part which is essentially like a short homework. 
6. **Will I need postgres set up for my Midterm?**
	- No, you won't need it for midterm. We will be just sticking with SQLite.
## Homework

### General

1. **Are the scores from the autograder the final grade of our homework?**
	- The scores from the autograder are the final grade for the homework. 
	- There are no hidden test cases.
2. **Why the autograder fails with this error: sqlite3 did not fail on the query. However, it failed on the grading query that checks the state of your database after running the query?**
	- This generally occurs when you add extra constraints that we haven't asked you to add in the assignment.
3. **Why am I getting errors on my submitted yaml file?**
	- As mentioned on the website, please use a yaml checker to validate your yaml. [YAML Checker - The YAML Syntax Validator](https://yamlchecker.com/)
4. **Can I Resubmit my HW multiple times to improve my score before the deadline?**
	- Yes. But do read the instructions in the HW to double check. There might be a limit on the number of submissions.
5. **My query is returning the desired output but it is still failing the autograder? What went wrong?
	- Please make sure to read the homework carefully. You might miss some subtle things.
	- Check the case/ space/ punctuation error while using a condition. eg 'SQLite' and 'sqlite' are different. 
	- Please use a yaml checker to validate your yaml. [YAML Checker - The YAML Syntax Validator](https://yamlchecker.com/)
	- Don't blindly trust large language models to answer your full homework, we add subtle things that gets caught if we rely on LLM completely :) LLMs can be used as a help.

### HW1
1. **How do I use regex in SQL for questions that say match with a sequence of characters?**
    - SQL's regex is in large parts the same and  are similar for each query language, e.g. postgresql, mysql, oracle, etc each have their own different syntax versions of regex. many similarities, but also some differences. SQL does support the core syntax though, e.g. `.*`, `\\d` etc. 
    - The question in this HW1 does not require you to use regex. Because sqlite does not come prebuilt with regex.  
    - Examine the documentation and look at the sqlite supported keywords, especially ones in the logical operator family. 
2. **What is exactly a column form?
	- In the case of SQLite, a column form is a way of altering the presentation of the output in sqlite's shell interface. 
	- To do this you need to play with sqlite's dot commands, sometimes called meta commands. E.g. the `.exit` or `.quit` is a sqlite dot command. It is neither a SQL command or SQL expression, rather it is part of sqlite's RDMS's shell interface syntax also known as the SQLite command-line environment. 
3. **My query seems right, why I am still failing the auto grader tests?
	- Read the question thoroughly again.
	- Use LLM like ChatGPT as a support to gain knowledge and not rely on it blindly. We add few things to catch the use of LLMs. 
	- Check for silly syntax errors.


### HW2
1. I am getting error while trying to import the data. The code looks right though. What went wrong?
    - Kindly check if the Foreign Key Constraints are taken into consideration.   
    - The order in which you import the data also matters because of the foreign key constraints. Do not try to import the data blindly and think about why the order matters.
    - You might have added extra unnecessary constraints. 
    - While submitting the .yaml file, do not use the entire path name that you might have used on ur local device.
2. My Cardinality of the output is correct. Why is my auto grader still failing?
	- Read the question/ homework instructions carefully. You might be asked to order the output.
### HW3

1. How do I optimize my code to decrease it's runtime
	- To optimize your query, think about the use of DISTINCT and how it relates to your query joining strategy.
	- Do not use the `JOIN`s that are fairly complex.
	- You could do some pre-filtering before joining. Remember the use of CTEs from class. There could be optimizations found there. 
	- Also NOT IN subqueries tend to create dependancies between the inner and outer queries, this can cause inefficiencies.
	- You are recommended to use the `WITH ... AS` clause. That'll help store the intermediary. 
	- Avoid nested queries because they are slower. 
	- Try joining two small tables after simplifying them.
2. How to write the PostgreSQL statements needed to import the dataset?
	- Read the instructions carefully and make use of the resources mentioned in the homework
	- Start by creating the database , connecting to it, create the tables and importing the data. Take a look at the \\\\ commands in psql . Try \\\\? for help
	- Do check the quotation marks and slashes.
	- Check the keywords you are using and don't trust LLM blindy :)
3. Why do I get `No command found` when I try to run `psql`?
	- This means that the path is not getting set properly. Check once if `/etc/path.d/postgresapp` file contains the `/Applications/Postgres.app/Contents/Versions/latest/bin` path. If it is, just restart your terminal and you should have psql running.
4. I do not understand where do I write my queries on pgadmin.
	- \\ commands are specific to psql command line tool. You can acces this via the psql query tool or the command line tool. \\ commands are used for creating the database and importing the data
	- Rest of the queries can you queried int he query tool.
5. My code looks fine but still the cardinality is not matching. Why is it happening?
	- Check for silly syntax errors in the `WHERE` clause.
6. I learned all tables that I copied over; every first row was removed. Why did it do this?
	- Because you used the header keyword ,that assumes that the first row is a header row and ignores it, but we do not have a header row in our CSV file.


### HW4
1. Do we have sigma `not in` or `not exist` available in the relational algebra?
    - There is not a specific operator that will perform `not in` or `not exist` in RA.
    - However, you can combine the basic operators to perform such logic. E.g. you could subtract from a relation `R` any tuples that join with relation `S` on a specific attribute. This would be `Not In`. 
    - For `not exist` you could use the cartesian product with some condition (coupled with a selection), as well as a minus.
2. Can we do `!=` in Relational Algebra??
	- In standard relational algebra there is not a `not equals` construct in the same way we use it in SQL. 
	- In extended RA, it is typically included for convenience as `!=` or `<>`, you may use those symbols in this HW as we are using extended RA.
3. For q5 Is it acceptable for students with no failed credits to return null?
	- No! That's the tricky part for Q5. You have to show students with no failed credits and the number should be 0.
	- Try playing around with SET operations and no need to use complex keywords.
4. Why my q4 submission is not working even after correct logic?
	- Please note that sid in the question is a number and not a string.
5. Why my submission is wrong even after the logic is correct?
	- The autograder has a timeout set for each question, so you may need to update your query to improve its efficiency.
6. For q5, do I need to output the students who have not failed in any courses?
	- Yes, you need to give failedcredits for each student. You need to output 0 as failedcredits for students who have not failed in any courses.
7. For q4, do we need to take into consideration prerequisites?
	- No, we just need current courses enrolled by the student 001 and 002 that do not overlap.
8. For q5, if my resulting query contained column names: Student.sid, Student.name, failedcredits. Would this be invalid due to the "Student." prefix?
	- I don’t think it should matter.
9. For q4, do we return both the cid and sid or just the cid?
	- just cid.
10. For q7, does our sql has to have the exact same tree as shown or could we just write a sql that generates the same result as the relational algebra?
	- As long as the query is right, you are good to go. You can use CTE methods, rename, use any other required.
11. Why all my queries are failing on gradescope even after they are giving output correctly?
	- You need to order all your queries in ascending order. Please read the instructions at the start of the homework.
12. I am just a little confused with the styling of writing our queries on YAML file. Since we are unable to type the actual 'pi' or 'sigma' symbols in YAML file, do we need to always add a reference in our queries?
	- You can use any symbols that run successfully with [RelaX](https://dbis-uibk.github.io/relax/landing). 
13. Q2 asks for the name and the title of courses taken from major, for each student. Does this mean we should return one tuple per student where we concatenate the course titles, or do we return one tuple per combination of student and relevant course title?
	- One tuple per combination of student and relevant course title
14. Any hints on q5?
	- The main challenge is to retrieve information for each student, including those who haven't failed any courses. To address this, you can create a temporary table assigning a fixed value of failedcredits to every student, regardless of their grades. Once this temporary table is created, you can then easily figure out the required logic.
15. How to approach q8?
	- The best way to approach this question is to first understand what the SQL query is trying to find out. Once understood, just write a relational algebra expression trying to find out the same thing. Don't go with converting the SQL query syntax by syntax to RA.

### HW5
1. How do I write in Mermaid that the combined latitude and longitude are the primary key?
	- You can just add PK next to the attribute that is part of the primary key or use it as if addressing them as two separate primary keys.
2. Can an ERD have a crow foot that points to itself?
  - Yes, an Entity-Relationship Diagram (ERD) can indeed have a crow's foot that points back to the same entity. This is called a self-referencing or recursive relationship.
3. Person Owns Vehicles Question
	- Person can own 0 or many cars.
	- A vehicle be owned by multiple people.
4. q1 relationship river ends in river or sea?
	- A river can either end in one river or one sea (not in both and not in many)
	- To show that the river ends in ends, use foreign key that it similar to the  Employee-Manager relationship. Avoid self-loops. Once you provide a foreign key, it should be sufficient.
5. BCNF splitting. How do I start?
	- A good strategy could be to evaluate each functional dependency to see if it is already in BCNf, if not then look at the determinant and see for all determinants that are in violation of BCNF which is the weakest super key or the furthest from being a superkey.
	- You shouldn’t have to go from ABC -> ABCD. If instead of splitting the table, you are growing, then you are doing something wrong. Go through the notes again and then attempt the assignment.
6. Should we limit our answers to the relationships provided in the homework, or can we introduce additional logical relationships/ removing some existing relationships to introduce many-to-many relationships?
	- That is kinda the point of the question. You have to introduce new relations to handle many-to-many relations.
	- As long as the relationship from the old diagram holds in the new diagram, you are allowed to remove a relationship and define new ones
7. Are there multiple ways to decompose BCNF?
	- Yes, there are often multiple way to decompose for BCNF. They way you choose (in a real world setting) can vary depending on many factors.
	- Often BCNF makes the schema more complex so there is a lot of tradeoff for going to BCNF from 3NF