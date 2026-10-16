
-- ============================================
-- UNIVERSITY COURSE MANAGEMENT SYSTEM
-- ============================================

CREATE DATABASE IF NOT EXISTS UniversityCourseManagementSystem;
USE UniversityCourseManagementSystem;

-- DROP TABLES
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Departments;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- 1. DEPARTMENTS TABLE
-- ============================================

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- ============================================
-- 2. STUDENTS TABLE
-- ============================================

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(120) NOT NULL UNIQUE,
    BirthDate DATE NOT NULL,
    EnrollmentDate DATE NOT NULL
);

-- ============================================
-- 3. INSTRUCTORS TABLE
-- Salary added for Query 8
-- ============================================

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(120) NOT NULL UNIQUE,
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CHECK (Salary >= 0)
);

-- ============================================
-- 4. COURSES TABLE
-- ============================================

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(120) NOT NULL UNIQUE,
    DepartmentID INT NOT NULL,
    Credits TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CHECK (Credits BETWEEN 1 AND 10)
);

-- ============================================
-- 5. ENROLLMENTS TABLE
-- ============================================

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID)
        REFERENCES Students(StudentID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (CourseID)
        REFERENCES Courses(CourseID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE (StudentID, CourseID)
);

-- ============================================
-- INSERT SAMPLE DATA
-- ============================================

INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Information Technology');

INSERT INTO Students VALUES
(1, 'John', 'Doe', 'john.doe@email.com',
 '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com',
 '1999-05-25', '2021-08-01'),
(3, 'Aarav', 'Patel', 'aarav.patel@email.com',
 '2003-02-12', '2023-07-15'),
(4, 'Diya', 'Shah', 'diya.shah@email.com',
 '2002-11-03', '2024-08-01'),
(5, 'Riya', 'Mehta', 'riya.mehta@email.com',
 '2001-06-19', '2020-08-01'),
(6, 'Kabir', 'Desai', 'kabir.desai@email.com',
 '2003-09-22', '2025-08-01'),
(7, 'Anaya', 'Joshi', 'anaya.joshi@email.com',
 '2002-04-10', '2022-01-10'),
(8, 'Vivaan', 'Trivedi', 'vivaan.trivedi@email.com',
 '2001-12-30', '2021-07-20'),
(9, 'Isha', 'Parikh', 'isha.parikh@email.com',
 '2004-03-17', '2026-08-01'),
(10, 'Reyansh', 'Rana', 'reyansh.rana@email.com',
 '2003-07-08', '2023-08-01'),
(11, 'Mira', 'Vyas', 'mira.vyas@email.com',
 '2000-10-21', '2019-08-01'),
(12, 'Arjun', 'Bhatt', 'arjun.bhatt@email.com',
 '2002-01-29', '2024-01-15');

INSERT INTO Instructors VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com',
 1, 85000.00),
(2, 'Bob', 'Lee', 'bob.lee@univ.com',
 2, 78000.00),
(3, 'Neha', 'Shah', 'neha.shah@univ.com',
 1, 92000.00),
(4, 'David', 'Miller', 'david.miller@univ.com',
 3, 81000.00),
(5, 'Sara', 'Patel', 'sara.patel@univ.com',
 2, 88000.00);

INSERT INTO Courses VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 1, 4),
(103, 'Calculus I', 2, 4),
(104, 'Database Systems', 1, 3),
(105, 'Statistics', 2, 3),
(106, 'Web Development', 3, 3);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 101, '2021-08-01'),
(3, 3, 101, '2023-07-15'),
(4, 4, 101, '2024-08-01'),
(5, 5, 101, '2020-08-01'),
(6, 6, 101, '2025-08-01'),
(7, 7, 101, '2022-01-10'),
(8, 8, 101, '2021-07-20'),
(9, 9, 101, '2026-08-01'),
(10, 10, 101, '2023-08-01'),
(11, 11, 101, '2019-08-01'),
(12, 1, 102, '2022-08-02'),
(13, 2, 102, '2021-08-02'),
(14, 3, 102, '2023-07-16'),
(15, 5, 102, '2020-08-02'),
(16, 7, 102, '2022-01-11'),
(17, 12, 102, '2024-01-16'),
(18, 1, 103, '2022-08-03'),
(19, 2, 103, '2021-08-03'),
(20, 4, 103, '2024-08-03'),
(21, 6, 104, '2025-08-02'),
(22, 8, 104, '2021-07-21'),
(23, 10, 104, '2023-08-02'),
(24, 3, 105, '2023-07-17'),
(25, 9, 105, '2026-08-02'),
(26, 11, 106, '2019-08-02'),
(27, 12, 106, '2024-01-17');

-- ============================================
-- QUERY 1: CRUD OPERATIONS ON ALL TABLES
-- ============================================

-- CREATE: INSERT new records
INSERT INTO Departments
VALUES (4, 'Physics');

INSERT INTO Students
VALUES (99, 'Test', 'Student', 'test.student@email.com',
        '2004-01-01', '2026-08-01');

INSERT INTO Instructors
VALUES (99, 'Test', 'Instructor', 'test.instructor@univ.com',
        1, 50000.00);

INSERT INTO Courses
VALUES (199, 'Test Course', 1, 3);

INSERT INTO Enrollments
VALUES (199, 99, 199, '2026-08-01');

-- READ: Display all records
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;
SELECT * FROM Departments;

-- UPDATE: Modify records
UPDATE Students
SET Email = 'john.updated@email.com'
WHERE StudentID = 1;

UPDATE Courses
SET Credits = 4
WHERE CourseID = 101;

UPDATE Instructors
SET Salary = 90000
WHERE InstructorID = 1;

UPDATE Departments
SET DepartmentName = 'Physics and Science'
WHERE DepartmentID = 4;

UPDATE Enrollments
SET EnrollmentDate = '2022-08-05'
WHERE EnrollmentID = 1;

-- DELETE: Remove test records
DELETE FROM Enrollments WHERE EnrollmentID = 199;
DELETE FROM Courses WHERE CourseID = 199;
DELETE FROM Instructors WHERE InstructorID = 99;
DELETE FROM Students WHERE StudentID = 99;
DELETE FROM Departments WHERE DepartmentID = 4;

-- ============================================
-- QUERY 2: STUDENTS ENROLLED AFTER 2022
-- ============================================

SELECT *
FROM Students
WHERE EnrollmentDate >= '2023-01-01'
ORDER BY EnrollmentDate;

-- ============================================
-- QUERY 3: MATHEMATICS COURSES, MAXIMUM 5
-- ============================================

SELECT c.CourseID, c.CourseName, c.Credits,
       d.DepartmentName
FROM Courses c
INNER JOIN Departments d
    ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
ORDER BY c.CourseName
LIMIT 5;

-- ============================================
-- QUERY 4: COUNT STUDENTS PER COURSE
-- SHOW ONLY COURSES WITH MORE THAN 5 STUDENTS
-- ============================================

SELECT c.CourseID, c.CourseName,
       COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Courses c
INNER JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(DISTINCT e.StudentID) > 5
ORDER BY StudentCount DESC;

-- ============================================
-- QUERY 5: STUDENTS IN BOTH COURSES
-- ============================================

SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID
WHERE c.CourseName IN
      ('Introduction to SQL', 'Data Structures')
GROUP BY s.StudentID, s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.CourseName) = 2;

-- ============================================
-- QUERY 6: STUDENTS IN EITHER COURSE
-- ============================================

SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID
WHERE c.CourseName IN
      ('Introduction to SQL', 'Data Structures')
ORDER BY s.StudentID;

-- ============================================
-- QUERY 7: AVERAGE COURSE CREDITS
-- ============================================

SELECT ROUND(AVG(Credits), 2) AS AverageCredits
FROM Courses;

-- ============================================
-- QUERY 8: MAXIMUM INSTRUCTOR SALARY
-- IN COMPUTER SCIENCE DEPARTMENT
-- ============================================

SELECT d.DepartmentName,
       MAX(i.Salary) AS MaximumSalary
FROM Instructors i
INNER JOIN Departments d
    ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science'
GROUP BY d.DepartmentName;

-- ============================================
-- QUERY 9: STUDENTS ENROLLED IN EACH DEPARTMENT
-- ============================================

SELECT d.DepartmentID, d.DepartmentName,
       COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Courses c
    ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY d.DepartmentID;

-- ============================================
-- QUERY 10: INNER JOIN STUDENTS AND COURSES
-- ============================================

SELECT s.StudentID, s.FirstName, s.LastName,
       c.CourseID, c.CourseName,
       e.EnrollmentDate AS CourseEnrollmentDate
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID
ORDER BY s.StudentID, c.CourseID;

-- ============================================
-- QUERY 11: LEFT JOIN ALL STUDENTS AND COURSES
-- ============================================

SELECT s.StudentID, s.FirstName, s.LastName,
       c.CourseName
FROM Students s
LEFT JOIN Enrollments e
    ON s.StudentID = e.StudentID
LEFT JOIN Courses c
    ON e.CourseID = c.CourseID
ORDER BY s.StudentID;

-- ============================================
-- QUERY 12: SUBQUERY
-- STUDENTS IN COURSES WITH MORE THAN 10 STUDENTS
-- ============================================

SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
WHERE e.CourseID IN (
    SELECT CourseID
    FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(DISTINCT StudentID) > 10
)
ORDER BY s.StudentID;

-- ============================================
-- QUERY 13: EXTRACT YEAR FROM ENROLLMENT DATE
-- ============================================

SELECT StudentID, FirstName, LastName,
       EnrollmentDate,
       YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students
ORDER BY StudentID;

-- ============================================
-- QUERY 14: CONCATENATE INSTRUCTOR NAMES
-- ============================================

SELECT InstructorID,
       CONCAT(FirstName, ' ', LastName) AS FullName,
       Email
FROM Instructors;

-- ============================================
-- QUERY 15: RUNNING TOTAL USING WINDOW FUNCTION
-- ============================================

SELECT EnrollmentID, StudentID, CourseID, EnrollmentDate,
       COUNT(*) OVER (
           ORDER BY EnrollmentDate, EnrollmentID
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS RunningTotal
FROM Enrollments
ORDER BY EnrollmentDate, EnrollmentID;

-- ============================================
-- QUERY 16: CASE EXPRESSION
-- SENIOR IF ENROLLED MORE THAN 4 YEARS AGO
-- ============================================

SELECT StudentID, FirstName, LastName,
       EnrollmentDate,
       CASE
           WHEN EnrollmentDate <
                DATE_SUB(CURDATE(), INTERVAL 4 YEAR)
           THEN 'Senior'
           ELSE 'Junior'
       END AS StudentLevel
FROM Students
ORDER BY StudentID;

-- ============================================
-- EXTRA: COUNT RECORDS IN ALL TABLES
-- ============================================

SELECT 'Departments' AS TableName, COUNT(*) AS TotalRecords
FROM Departments
UNION ALL
SELECT 'Students', COUNT(*) FROM Students
UNION ALL
SELECT 'Instructors', COUNT(*) FROM Instructors
UNION ALL
SELECT 'Courses', COUNT(*) FROM Courses
UNION ALL
SELECT 'Enrollments', COUNT(*) FROM Enrollments;
