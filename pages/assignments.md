---
layout: page
title: 📚 Assignments
description: A listing of all the course assignments and resources
nav_order: 3
has_toc: false
permalink: /assignments/
---

# Assignments

## Assignment Links

All assignments/exams will be submitted through **Gradescope**.

- [Homework 1](https://ucsd.s3.us-west-2.amazonaws.com/dsc100/homework/homework_1_ds67d3.pdf)
- [Homework 2](https://ucsd.s3.us-west-2.amazonaws.com/dsc100/homework/homework_2_k6g3rd.pdf)
- [Homework 3](https://ucsd.s3.us-west-2.amazonaws.com/dsc100/homework/homework_3_d32few.pdf)

### Student Guides
Additional formatting instructions and guides to support HWs

- [Setting up PostgreSQL + PGAdmin](https://ucsd.s3.us-west-2.amazonaws.com/dsc100/guides/Setting+Up+PostgreSQL.pdf)
<!-- - [ER Diagramming Guide](https://ucsd.s3.us-west-2.amazonaws.com/dsc100/guides/er_diagram_formatting_guide.pdf) -->


## Assignment Breakdown

| **Assignment** | **Code (.yaml)** | **Multiple Choice** | **Free Response** (.pdf) | **Collaboration** |
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
- **Collaboration**: Indicates if collaboration with fellow students is permitted for the assignment.

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

> Remember, quizzes are to be completed alone, that includes no phoning friends, even if your `BFF` is an `LLM`. I understand that students no longer use phones to call, MMS, SMS, or any S. But under academic integrity, phoning also means no tiktoking, no snapping 👻, no instagramming, no ~~tweeting~~ Xing, no whatsapping, or any other `*ing`. Keep it old school and ace it on your own! 🚫📱🎉

## Midterm and Final
See the instructions above (under assignments link) for more information on the midterm and final. These will be available shortly before each is available.
