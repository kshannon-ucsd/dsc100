---
layout: default
title: "Assignments"
nav_order: 4
has_toc: false
permalink: /assignments/
---

# Assignments


## Assignment Links

All assignments will be submitted through **Gradescope**.

- [Homework 1.pdf](https://s3.us-west-2.amazonaws.com/ucsd.dsc100/homework/Homework+1.pdf)
- [Homework 2.pdf](https://s3.us-west-2.amazonaws.com/ucsd.dsc100/homework/Homework+2.pdf)
- [Homework 3.pdf](https://s3.us-west-2.amazonaws.com/ucsd.dsc100/homework/Homework+3.pdf)
<!-- - [Homework 4.pdf](https://s3.us-west-2.amazonaws.com/ucsd.dsc100/homework/Homework+4.pdf) -->


### Assignment Guides

Auxillary information and guides to support HWs

- [PostgreSQL & PG Admin Installation Instructions](https://s3.us-west-2.amazonaws.com/ucsd.dsc100/guides/postgresql_install.pdf)



## Assignment Breakdown

| **Assignment** | **Code (.yaml)** | **Multiple Choice** | **Free Response** (.pdf) | **Team Collaboration** |
|:--------------:|:----------------:|:-------------------:|:------------------------:|:----------------------:|
| Homework 1     | ✓                | ✗                   | ✗                        | ✓                      |
| Homework 2     | ✓                | ✗                   | ✗                        | ✓                      |
| Homework 3     | ✓                | ✗                   | ✗                        | ✓                      |
| Homework 4     | ✗                | ✗                   | ✓                        | ✓                      |
| Homework 5     | ✗                | ✗                   | ✓                        | ✓                      |
| Quiz 1         | ✗                | ✓                   | ✗                        | ✗                      |
| Quiz 2         | ✗                | ✓                   | ✗                        | ✗                      |
| Quiz 3         | ✗                | ✓                   | ✗                        | ✗                      |
| Quiz 4         | ✗                | ✓                   | ✗                        | ✗                      |
| Quiz 5         | ✗                | ✓                   | ✗                        | ✗                      |
| Quiz 6         | ✗                | ✓                   | ✗                        | ✗                      |
| Midterm Exam   | ✓                | ✓                   | ✗                        | ✗                      |
| Final Exam     | ✓                | ✓                   | ✓                        | ✗                      |

- **Code (.yaml)**: Submitted through Gradescope. We will provide you with necessary `.yaml` file templates.
- **Multiple Choice**: Assignments may have a multiple-choice section, completed on Gradescope.
- **Free Response (.pdf)**: Submit a `.pdf` file of your written response to Gradescope for manual grading.
- **Team Collaboration**: Indicates if collaboration with fellow students is permitted for the assignment.

## Homework (100 points)

##### Autograding Script Formatting Guide

Our autograding platform is designed for reliability and versatility, eliminating dependency on fluctuating external systems and reducing vendor lock-in concerns.

**Steps for Submission**:
1. **Download the Assignment File**: We'll provide a `.yaml` file for each assignment. Start by downloading it.
2. **Input Your Answers**: Populate the `.yaml` file with your responses, making sure you strictly follow any specific guidelines mentioned.
3. **Formatting Reference**: See the example `hw1.yaml` file below to understand the required format. Critical components include the use of the "pipe" character for multiline strings and proper indentation. Incorrect formatting can result in the autograder misreading your submission.
4. **Text Editor Suggestion**: To ensure accurate formatting, paste your code into a text editor or IDE that supports `.yaml` files.
5. **Validate Your File**: Before submission, check the syntax with a `.yaml` checker: [YAML Checker](https://yamlchecker.com/).

```yaml
- question: 1
  answer: |
    SELECT * FROM Student;

- question: 2.1
  answer: |
    INSERT INTO Student VALUES (6, 'Dimitrov', 'Alex', NULL, NULL);
  explanation: A

```

**Additional Formatting Notes**:
- For multiple-choice questions, use notations like **A** or **B** in the `explanation` field.
- Do not modify the "question" sections in the `.yaml` file.
- The `.yaml` file will be provided complete with fields corresponding directly to the questions we share with you.

**Submitting Your Work**:
- Upload your completed `.yaml` file (e.g., `hw1.yaml`) to Gradescope.
- We utilize a Docker image to process your submission. Gradescope will grade your work based on our Docker image.
- You can re-submit your assignment multiple times before the deadline, with the exception of midterm and final exams.

##### Code Style Guide
To encourage good SQL programming style please follow these two simple style rules:

1. Give explicit names to all tables referenced in the FROM clause. For instance, instead of writing:
```
SELECT * from flights, carriers WHERE carrier_id = cid;
```
Write:
```
SELECT * from flights AS f, carriers AS c WHERE f.carrier_id = c.cid;
```
*(notice the `AS`) so that it is clear which table you are referring to.*

2. Similarly, reference to all attributes must be qualified by the table name. Instead of writing:
```
SELECT * FROM flights WHERE fid = 1;
```
Write:
```
SELECT * FROM flights AS f WHERE f.fid = 1;
```
This will be useful when you write queries involving self joins in later assignments. As well as when you are on the job!

## Quizzes (20 points)

Quizzes are 8 questions each, completed through Gradescope, you can see the due dates and release dates ahead of time on Gradescope. They will be worth in total 10% of your grade, so 2% per quiz. But here's the plot twist: your lowest grade? Poof! We drop it like it's hot. 🎤⬇️ 🕺🕺🕺 You will have 20 minutes to complete quizzes on Gradescope. Quizzes are pushed to prod after class, and deprecated right before the next class.

> Remember, quizzes are to be completed alone, that includes no phoning friends, even if your `BFF` is an `LLM`. I understand that students no longer use phones to call, MMS, SMS, or any S. But under academic integrity, phoning also means no tiktoking, no snapping 👻, no instagramming, no ~~tweeting~~ $\mathbb{X}$ ing, no whatsapping, or any other `*ing`. Keep it old school and ace it on your own! 🚫📱🎉


## Midterm (30 points)
#### Midterm Examination Format
The midterm exam consists of two distinct parts:

1. **SQL Query Component:** This part requires you to submit an SQL query to an auto-grader via Gradescope, similar to the procedure used for homework submissions.
2. **Multiple Choice Section:** This will be a 30 question multiple choice exam administered through Gradescope.
  
#### Availability and Duration
- The exam, encompassing both parts, will be accessible for a total duration of 48 hours. It will begin at 12:01 PM on Day 1 (for instance, December 6th) and conclude at 12:01 PM on Day 3 (e.g., December 8th).
- For Part 1 (SQL Query Component), you have the full 48 hours to complete and submit your work.
- You can begin Part 2 (Multiple Choice) at any moment within the 48-hour window. However, please note that once started, you will have a fixed duration of 45 minutes to finish it.

{: .warning .fs-2 }
You must **work alone** on the midterm, this includes both parts. You may not use chatgpt or other LLMs to solve the problems for you, nor may you consult the internet (e.g. asking a question on stackoverflow or github forms).
You may use the following resources:
  - your notes
  - my lecture slides
  - previous homeworks/quizzes
  - the suggested textbook
  - an instance of `sqlite3` and `psql`
  - any official online documentation (e.g. sqlite3)

#### Important Notes
- We have designed this flexible schedule keeping in mind potential life constraints you might encounter. To support your planning, we will provide exact exam dates well in advance.
- With this flexibility, please understand that we will not accept late submissions for the midterm, except in exceptional, documented circumstances that are beyond your control (e.g., an auto accident, illness, family emergencies, etc.).

## Final Exam (50 points)

TODO
