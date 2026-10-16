# University Course Management System

## Project Overview

The University Course Management System is a database project developed using MySQL. It manages students, courses, instructors, enrollments, and academic departments.

This project demonstrates SQL concepts such as database design, CRUD operations, joins, subqueries, aggregate functions, date functions, window functions, and CASE expressions.

## Objectives

- Design and implement a relational database.
- Create tables with primary keys and foreign keys.
- Perform CRUD operations on all tables.
- Retrieve data using SQL queries.
- Apply filtering, sorting, grouping, and aggregate functions.
- Use INNER JOIN and LEFT JOIN.
- Implement subqueries and advanced SQL functions.

## Technologies Used

- MySQL 8.0+
- MySQL Workbench
- Visual Studio Code
- Git and GitHub

## Database Tables

The database contains the following five tables:

1. **Students** – Stores student information, including name, email, birth date, and university enrollment date.
2. **Courses** – Stores course information, department ID, and credits.
3. **Instructors** – Stores instructor details, department ID, and salary.
4. **Enrollments** – Stores student-course enrollment records.
5. **Departments** – Stores academic department information.

## Database Relationships

- One department can have multiple courses.
- One department can have multiple instructors.
- One student can enroll in multiple courses.
- One course can have multiple students.
- The Enrollments table connects Students and Courses.

## Assumptions

- Students.EnrollmentDate represents the date the student joined the university.
- Enrollments.EnrollmentDate represents the date the student enrolled in a particular course.
- A Salary column is added to the Instructors table because the project requires finding the maximum instructor salary.
- Sample data is included to demonstrate the required SQL queries.
- MySQL 8.0 or later is required for the window function.

## SQL Queries Implemented

The project covers all 16 assigned tasks:

1. Perform CRUD operations on all tables.
2. Retrieve students who enrolled after 2022.
3. Retrieve up to five courses offered by the Mathematics department.
4. Count students enrolled in each course and display courses with more than five students.
5. Find students enrolled in both Introduction to SQL and Data Structures.
6. Find students enrolled in either Introduction to SQL or Data Structures.
7. Calculate the average credits of all courses.
8. Find the maximum instructor salary in the Computer Science department.
9. Count students enrolled in each department.
10. Use INNER JOIN to retrieve students and their corresponding courses.
11. Use LEFT JOIN to retrieve all students and their courses, if any.
12. Use a subquery to find students enrolled in courses with more than ten students.
13. Extract the year from students' university enrollment dates.
14. Concatenate instructors' first and last names.
15. Calculate the running total of students enrolled in courses using a window function.
16. Classify students as Senior or Junior using a CASE expression.

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to your MySQL server.
3. Open the `UniversityCourseManagementSystem.sql` file.
4. Execute the SQL script from beginning to end.
5. Verify that all five tables are created successfully.
6. Run and check the output of each SQL query.
7. Upload the SQL file and README.md to your GitHub repository.

**Important:** The SQL script drops and recreates the project tables when executed. Back up any data you need before running it again.

## Project Structure

```text
UniversityCourseManagementSystem/
│
├── UniversityCourseManagementSystem.sql
└── README.md
```

## SQL Concepts Demonstrated

- CREATE DATABASE and CREATE TABLE
- Primary keys and foreign keys
- INSERT, SELECT, UPDATE, and DELETE
- WHERE, ORDER BY, and LIMIT
- GROUP BY and HAVING
- COUNT(), AVG(), and MAX()
- INNER JOIN and LEFT JOIN
- Subqueries
- YEAR(), DATE_SUB(), and CURDATE()
- CONCAT()
- Window functions
- CASE expressions
- UNION ALL

## Conclusion

The University Course Management System demonstrates how SQL can be used to design and manage a relational database. It provides practical experience with data manipulation, table relationships, joins, subqueries, aggregate functions, and advanced SQL queries.

## Author

**Hardvi Bhatti**