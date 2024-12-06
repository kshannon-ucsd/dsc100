---
layout: page
title: 💪 Practice
description: Practice Questions with Solutions
nav_order: 4
---

# DSC 100: Database Management Practice Problems
## Table of Contents
1. [Relational Data Model and Design](#relational-data-model)
2. [SQL Fundamentals](#sql-fundamentals) 
3. [Joins and Advanced Queries](#joins-and-advanced-queries)
4. [Indexes and Query Optimization](#indexes-and-optimization)
5. [Normalization and Dependencies](#normalization)
6. [ER Diagrams](#er-diagrams)

Each problem is marked with difficulty: 🟢 Easy | 🟡 Medium | 🟣 Hard

## Relational Data Model
### Problem 1 🟢 (Multiple Choice)
Which statement about relations is TRUE?

a) Relations must have at least one tuple

b) The order of tuples in a relation matters

c) All attributes must be of different types

d) A relation is a set of tuples with the same attributes

<details>
<summary>Solution</summary>
Answer: d) A relation is a set of tuples with the same attributes

Relations are defined as sets of tuples, where:
- Order doesn't matter (rules out b)
- Can be empty (rules out a)
- Attributes can be of same type (rules out c)
</details>

### Problem 2 🟡 (Multiple Choice)
Given a relation R(A,B,C,D) with functional dependencies A→B and B→C, what is TRUE?

a) A is a superkey

b) {A,D} is not a superkey

c) B must be a primary key

d) A→C by transitivity

<details>
<summary>Solution</summary>
Answer: d) A→C by transitivity

Because:
- A→B and B→C implies A→C (transitivity)
- A is not necessarily a superkey as it doesn't determine D
- {A,D} could be a superkey
- B is not necessarily a key as it doesn't determine A or D
</details>

#### Problem 3 🟢
Given the following relation:
```
Student(id, name, major, advisor_id, department)
```
What is the difference between a candidate key and a superkey in this context? Note: id is considered a business key (auto incrementing id)

<details>
<summary>Solution</summary>
A superkey is any set of attributes that can uniquely identify a tuple, while a candidate key is a minimal superkey (removing any attribute would make it no longer unique). For instance, some of the super and/or candidate keys in this case:

- {id} is both a candidate key and a superkey
- {id, name} is only a superkey (not minimal)
- {id, major} is only a superkey (not minimal)
- {name} is neither (might not be unique)
</details>

### Problem 4 🟡
Given these functional dependencies:
```
A → B
BC → D
D → E
```
Find all the attributes that are transitively dependent on A.

<details>
<summary>Solution</summary>
To find transitive dependencies:

1. Start with A → B
2. Since we have A → B, if B were part of any determinant, those dependencies would be transitive
3. However, B alone doesn't determine anything
4. B with C determines D (BC → D)
5. D determines E (D → E)

Therefore, there are no attributes transitively dependent on A alone.
</details>

### Problem 5 🟢 (Multiple Choice)
Which of the following is NOT an atomic data type in SQL?

a) INTEGER

b) VARCHAR

c) ARRAY

d) DATE

<details>
<summary>Solution</summary>
Answer: c) ARRAY

Arrays are not atomic because:
- They can be decomposed into multiple values
- Atomic types must be single, indivisible values
- Common atomic types include INTEGER, VARCHAR, DATE, etc.
</details>

### Problem 6 🟡
Given this table structure:
```sql
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20)
);
```
Write all the domain constraints that are implicitly enforced by this schema.

<details>
<summary>Solution</summary>

The domain constraints are:
1. order_id must be an integer
2. customer_id must be an integer
3. order_date must be a valid date
4. total_amount must be a decimal number with up to 10 digits total and 2 decimal places
5. status must be a variable-length string up to 20 characters
6. order_id cannot be NULL (due to PRIMARY KEY constraint)
</details>

### Problem 7 🟣
Consider the following query:
```sql
SELECT department, COUNT(*) as emp_count
FROM Employee
GROUP BY department
HAVING COUNT(*) > (
    SELECT AVG(dept_count)
    FROM (
        SELECT COUNT(*) as dept_count
        FROM Employee
        GROUP BY department
    ) as dept_sizes
);
```
Explain step by step how this query is evaluated by the database engine.

<details>
<summary>Solution</summary>

Query evaluation order:
1. Innermost subquery:
   - Groups employees by department
   - Counts employees in each department
   
2. Middle subquery:
   - Takes those counts
   - Calculates average department size
   
3. Main query:
   - Groups employees by department again
   - Counts employees in each department
   - Compares each count to the average
   - Returns only departments with above-average counts

The query finds departments that have more than the average number of employees.
</details>

### Problem 8 🟡 (Multiple Choice)
Which statement about NULL values in SQL is correct?

a) NULL = NULL evaluates to TRUE

b) NULL values are considered equal to each other

c) NULL values are ignored in COUNT(*)

d) NULL values are excluded from COUNT(column_name)

<details>
<summary>Solution</summary>
Answer: d) NULL values are excluded from COUNT(column_name)

Because:
- NULL = NULL evaluates to NULL, not TRUE
- NULL values are not considered equal to each other
- COUNT(*) includes rows with NULL values
- COUNT(column_name) excludes NULL values in that column
</details>

### Problem 9 🟡
Write a query using window functions to rank employees by salary within each department. Display the following:
- Employee name
- Department
- Salary
- Rank within department

<details>
<summary>Solution</summary>

<pre>
SELECT 
    name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) as dept_rank
FROM Employee;
</pre>
</details>

## Joins and Advanced Queries
### Problem 10 🟣
Given tables:
```sql
Movies(movie_id, title, release_year)
Actors(actor_id, name)
Roles(movie_id, actor_id, character_name)
```
Write a query to find all pairs of actors who have appeared in at least 3 movies together.

<details>
<summary>Solution</summary>

<pre>
WITH ActorPairs AS (
    SELECT 
        r1.actor_id as actor1_id,
        r2.actor_id as actor2_id,
        COUNT(DISTINCT r1.movie_id) as movies_together
    FROM Roles r1
    JOIN Roles r2 ON r1.movie_id = r2.movie_id
    WHERE r1.actor_id < r2.actor_id
    GROUP BY r1.actor_id, r2.actor_id
    HAVING COUNT(DISTINCT r1.movie_id) >= 3
)
SELECT 
    a1.name as actor1_name,
    a2.name as actor2_name,
    ap.movies_together
FROM ActorPairs ap
JOIN Actors a1 ON ap.actor1_id = a1.actor_id
JOIN Actors a2 ON ap.actor2_id = a2.actor_id;
</pre>
</details>

## Indexes and Optimization
### Problem 11 🟡 (Multiple Choice)
When is a non-clustered index LEAST useful?

a) When querying a small percentage of rows

b) When the table is frequently updated

c) When performing range queries

d) When doing full table scans

<details>
<summary>Solution</summary>
Answer: d) When doing full table scans

Because:
- Full table scans need to read all data anyway
- Index would add overhead without benefit
- Other cases can benefit from index usage
</details>

## Normalization
### Problem 12 🟣
Given the relation:
```
StudentCourse(student_id, student_name, course_id, course_name, instructor_id, instructor_name, department)
```
With functional dependencies:
- student_id → student_name
- course_id → course_name, instructor_id
- instructor_id → instructor_name, department

Decompose into BCNF. Show work step by step.

<details>
<summary>Solution</summary>

1. **Identify all violations:**
   - No partial dependencies are present, which is desirable.
   - However, there are multiple transitive dependencies that need addressing.

2. **Decomposition into BCNF:**
   - Decompose into the following relations:
    <pre>
     Student(student_id, student_name)
     Course(course_id, course_name, instructor_id)
     Instructor(instructor_id, instructor_name, department)
     Enrollment(student_id, course_id)
    </pre>
   This achieves BCNF because:
   - In each relation, all determinants are candidate keys.
   - Transitive dependencies have been eliminated.
   - All original functional dependencies are preserved.

</details>

## ER Diagrams
### Problem 13 🟣
Design an ER diagram using Mermaid syntax for a Library Management System with these requirements:
- Library has multiple branches
- Each branch has books and employees
- Books can exist in multiple copies
- Members can borrow books
- Members can have fines
- Employees can be librarians or managers

<details>
<summary>Solution</summary>

<pre>
erDiagram

    Library ||--|{ Branch : has
    Branch ||--|{ Book : contains
    Branch ||--|{ Employee : employs
    Book ||--|{ Copy : consists-of
    Member ||--|{ Borrow : borrows
    Borrow ||--|| Copy : of
    Member ||--|{ Fine : has

    Library {
        string library_id PK
        string name
    }

    Branch {
        string branch_id PK
        string address
        string library_id FK
    }

    Book {
        string book_id PK
        string title
        string author
    }

    Copy {
        string copy_id PK
        string book_id FK
        string branch_id FK
        string status
    }

    Member {
        string member_id PK
        string name
        string address
    }

    Borrow {
        string member_id FK
        string copy_id FK
        datetime borrow_date
        datetime return_date
    }

    Fine {
        string fine_id PK
        string member_id FK
        float amount
        datetime date
    }

    Employee {
        string employee_id PK
        string branch_id FK
        string name
        string role
        string title "takes either librarian or manager"
    }
</pre>

Key design decisions:
1. Used composite entities where needed (BOOK_COPY)
2. Captured inheritance for employee types
3. Included appropriate cardinalities
4. Added necessary attributes for each entity
5. Marked primary and foreign keys
</details>

### Problem 14 🟡 (Multiple Choice)
In an ER diagram, what does a double-line (thick line) relationship indicate?

a) Many-to-many relationship

b) Total participation

c) Weak entity relationship

d) Inheritance relationship

<details>
<summary>Solution</summary>
Answer: b) Total participation
Let's break down the key visual elements in ER diagrams:

Double-line (thick line) in relationship:


Indicates total participation
Means every entity in the participating entity set MUST be involved in the relationship
Also known as mandatory participation
Contrasts with partial participation (single line) where participation is optional


Double rectangle (double outline) around entity:


Indicates a weak entity
Different from the double-line relationship!
Weak entities cannot exist without their identifying owner (strong entity)
Example: A room number only makes sense within a specific building


Strong vs Weak Entities:


Strong entities:

Have their own primary key
Can exist independently
Drawn with single rectangle
Example: A Building has its own unique building_id


Weak entities:

Depend on strong entity for identification
Need parent entity's key as part of their identifier
Drawn with double rectangle
Example: Room depends on Building, identified by (building_id, room_number)




Visual Summary:


<pre>
Single line ──── : Partial participation
Double line ════ : Total participation
Single rectangle └─┐ : Strong entity
Double rectangle └═┐ : Weak entity
</pre>

Common mistake: Don't confuse double-line relationships (total participation) with double-rectangle entities (weak entities)!
</details>