-- =====================================================================
-- UNIVERSITY DATABASE: SCHEMA + DATA
-- =====================================================================

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Assessments;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
    student_id  INTEGER PRIMARY KEY,
    first_name  TEXT NOT NULL,
    last_name   TEXT NOT NULL,
    gender      TEXT NOT NULL,
    age         INTEGER NOT NULL,
    city        TEXT NOT NULL
);

CREATE TABLE Departments (
    department_id    INTEGER PRIMARY KEY,
    department_name  TEXT NOT NULL,
    faculty          TEXT NOT NULL
);

CREATE TABLE Courses (
    course_id      INTEGER PRIMARY KEY,
    course_name    TEXT NOT NULL,
    department_id  INTEGER NOT NULL,
    credits        INTEGER NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Enrollments (
    enrollment_id    INTEGER PRIMARY KEY,
    student_id       INTEGER NOT NULL,
    course_id        INTEGER NOT NULL,
    enrollment_date  TEXT NOT NULL,
    status           TEXT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Assessments (
    assessment_id    INTEGER PRIMARY KEY,
    enrollment_id    INTEGER NOT NULL,
    assessment_type  TEXT NOT NULL,
    mark             INTEGER NOT NULL,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
);

-- ---------------------------------------------------------------------
-- STUDENTS
-- ---------------------------------------------------------------------
INSERT INTO Students (student_id, first_name, last_name, gender, age, city) VALUES
(1,  'John',    'Smith',   'Male',   22, 'Cape Town'),
(2,  'Mary',    'Jones',   'Female', 24, 'Bellville'),
(3,  'Peter',   'Ncube',   'Male',   21, 'Khayelitsha'),
(4,  'Thandi',  'Moyo',    'Female', 23, 'Parow'),
(5,  'David',   'Williams','Male',   27, 'Mitchells Plain'),
(6,  'Sarah',   'Adams',   'Female', 25, 'Claremont'),
(7,  'Michael', 'Dube',    'Male',   20, 'Goodwood'),
(8,  'Linda',   'Maseko',  'Female', 28, 'Bellville'),
(9,  'James',   'Brown',   'Male',   26, 'Cape Town'),
(10, 'Nomsa',   'Sibanda', 'Female', 22, 'Khayelitsha'),
(11, 'Daniel',  'Smith',   'Male',   24, 'Bellville'),
(12, 'Amanda',  'Jacobs',  'Female', 26, 'Parow');

-- ---------------------------------------------------------------------
-- DEPARTMENTS
-- ---------------------------------------------------------------------
INSERT INTO Departments (department_id, department_name, faculty) VALUES
(1, 'Data Science',         'Science'),
(2, 'Computer Science',     'Engineering'),
(3, 'Statistics',           'Science'),
(4, 'Mathematics',          'Science'),
(5, 'Information Systems',  'Business');

-- ---------------------------------------------------------------------
-- COURSES
-- ---------------------------------------------------------------------
INSERT INTO Courses (course_id, course_name, department_id, credits) VALUES
(101, 'Database Systems',           1, 15),
(102, 'Statistics',                 3, 15),
(103, 'Python Programming',         2, 15),
(104, 'Machine Learning',           1, 20),
(105, 'Data Visualisation',         1, 15),
(106, 'Mathematics for Data Science', 4, 15),
(107, 'Information Systems',        5, 15),
(108, 'Advanced SQL',               1, 20);

-- ---------------------------------------------------------------------
-- ENROLLMENTS
-- ---------------------------------------------------------------------
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date, status) VALUES
(1001, 1,  101, '2026-02-01', 'Active'),
(1002, 1,  103, '2026-02-01', 'Active'),
(1003, 1,  104, '2026-02-01', 'Active'),
(1004, 2,  101, '2026-02-01', 'Active'),
(1005, 2,  102, '2026-02-01', 'Active'),
(1006, 3,  101, '2026-02-02', 'Active'),
(1007, 3,  103, '2026-02-02', 'Active'),
(1008, 4,  102, '2026-02-03', 'Active'),
(1009, 4,  105, '2026-02-03', 'Active'),
(1010, 5,  104, '2026-02-04', 'Active'),
(1011, 5,  108, '2026-02-04', 'Active'),
(1012, 6,  101, '2026-02-05', 'Active'),
(1013, 6,  105, '2026-02-05', 'Active'),
(1014, 7,  103, '2026-02-05', 'Active'),
(1015, 8,  104, '2026-02-06', 'Active'),
(1016, 8,  105, '2026-02-06', 'Active'),
(1017, 9,  108, '2026-02-07', 'Active'),
(1018, 9,  101, '2026-02-07', 'Active'),
(1019, 10, 102, '2026-02-07', 'Active'),
(1020, 10, 106, '2026-02-07', 'Active'),
(1021, 11, 108, '2026-02-08', 'Active'),
(1022, 11, 103, '2026-02-08', 'Active'),
(1023, 12, 104, '2026-02-08', 'Active'),
(1024, 12, 107, '2026-02-08', 'Active');

-- ---------------------------------------------------------------------
-- ASSESSMENTS
-- ---------------------------------------------------------------------
INSERT INTO Assessments (assessment_id, enrollment_id, assessment_type, mark) VALUES
(1,  1001, 'Assignment', 72), (2,  1001, 'Test', 68), (3,  1001, 'Exam', 81),
(4,  1002, 'Assignment', 85), (5,  1002, 'Test', 78), (6,  1002, 'Exam', 88),
(7,  1003, 'Assignment', 70), (8,  1003, 'Test', 65), (9,  1003, 'Exam', 74),
(10, 1004, 'Assignment', 91), (11, 1004, 'Test', 87), (12, 1004, 'Exam', 94),
(13, 1005, 'Assignment', 82), (14, 1005, 'Test', 89), (15, 1005, 'Exam', 91),
(16, 1006, 'Assignment', 58), (17, 1006, 'Test', 64), (18, 1006, 'Exam', 69),
(19, 1007, 'Assignment', 73), (20, 1007, 'Test', 67), (21, 1007, 'Exam', 72),
(22, 1008, 'Assignment', 80), (23, 1008, 'Test', 85), (24, 1008, 'Exam', 78),
(25, 1009, 'Assignment', 75), (26, 1009, 'Test', 82), (27, 1009, 'Exam', 79),
(28, 1010, 'Assignment', 55), (29, 1010, 'Test', 49), (30, 1010, 'Exam', 52),
(31, 1011, 'Assignment', 68), (32, 1011, 'Test', 72), (33, 1011, 'Exam', 61),
(34, 1012, 'Assignment', 94), (35, 1012, 'Test', 91), (36, 1012, 'Exam', 96),
(37, 1013, 'Assignment', 88), (38, 1013, 'Test', 84), (39, 1013, 'Exam', 90),
(40, 1014, 'Assignment', 60), (41, 1014, 'Test', 65), (42, 1014, 'Exam', 58),
(43, 1015, 'Assignment', 77), (44, 1015, 'Test', 73), (45, 1015, 'Exam', 79),
(46, 1016, 'Assignment', 81), (47, 1016, 'Test', 86), (48, 1016, 'Exam', 83),
(49, 1017, 'Assignment', 92), (50, 1017, 'Test', 88), (51, 1017, 'Exam', 95),
(52, 1018, 'Assignment', 69), (53, 1018, 'Test', 74), (54, 1018, 'Exam', 71),
(55, 1019, 'Assignment', 71), (56, 1019, 'Test', 76), (57, 1019, 'Exam', 80),
(58, 1020, 'Assignment', 83), (59, 1020, 'Test', 79), (60, 1020, 'Exam', 85),
(61, 1021, 'Assignment', 76), (62, 1021, 'Test', 81), (63, 1021, 'Exam', 89),
(64, 1022, 'Assignment', 84), (65, 1022, 'Test', 79), (66, 1022, 'Exam', 82),
(67, 1023, 'Assignment', 73), (68, 1023, 'Test', 71), (69, 1023, 'Exam', 77),
(70, 1024, 'Assignment', 65), (71, 1024, 'Test', 70), (72, 1024, 'Exam', 68);
-- =====================================================================
-- SECTION B: SQL QUESTIONS -- ANSWERS
-- =====================================================================

-- ----------------------------------------------------------------------
-- QUESTION 1 -- Basic Data Retrieval [5 Marks]
-- Students who are at least 24 years old, oldest to youngest.
-- ----------------------------------------------------------------------
SELECT
    student_id,
    first_name,
    last_name,
    age,
    city
FROM Students
WHERE age >= 24
ORDER BY age DESC;


-- ----------------------------------------------------------------------
-- QUESTION 2 -- Multiple Filtering Conditions [5 Marks]
-- Female students aged 22-26 in Bellville, Parow or Khayelitsha.
-- ----------------------------------------------------------------------
SELECT
    student_id,
    first_name,
    last_name,
    age,
    city
FROM Students
WHERE gender = 'Female'
  AND age BETWEEN 22 AND 26
  AND city IN ('Bellville', 'Parow', 'Khayelitsha')
ORDER BY last_name ASC;


-- ----------------------------------------------------------------------
-- QUESTION 3 -- Demographic Analysis [5 Marks]
-- Number of students and average age per gender.
-- ----------------------------------------------------------------------
SELECT
    gender,
    COUNT(*) AS number_of_students,
    ROUND(AVG(age), 2) AS average_age
FROM Students
GROUP BY gender;


-- ----------------------------------------------------------------------
-- QUESTION 4 -- Student Distribution by City [6 Marks]
-- Cities with at least two students, largest to smallest.
-- ----------------------------------------------------------------------
SELECT
    city,
    COUNT(*) AS number_of_students
FROM Students
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY number_of_students DESC;


-- ----------------------------------------------------------------------
-- QUESTION 5 -- Student Enrolment Report [8 Marks]
-- Which courses each student is enrolled in.
-- ----------------------------------------------------------------------
SELECT
    s.student_id,
    s.first_name || ' ' || s.last_name AS student_name,
    c.course_name,
    d.department_name,
    e.enrollment_date,
    e.status
FROM Enrollments e
JOIN Students s     ON s.student_id = e.student_id
JOIN Courses c      ON c.course_id = e.course_id
JOIN Departments d  ON d.department_id = c.department_id
ORDER BY s.student_id, c.course_name;


-- ----------------------------------------------------------------------
-- QUESTION 6 -- Enrolment Performance [8 Marks]
-- Average assessment mark for every enrolment.
-- ----------------------------------------------------------------------
SELECT
    e.enrollment_id,
    e.student_id,
    e.course_id,
    ROUND(AVG(a.mark), 2) AS average_mark
FROM Enrollments e
JOIN Assessments a ON a.enrollment_id = e.enrollment_id
GROUP BY e.enrollment_id, e.student_id, e.course_id;


-- ----------------------------------------------------------------------
-- QUESTION 7 -- Student Performance Classification [8 Marks]
-- Classify each enrolment using a CASE expression.
-- ----------------------------------------------------------------------
SELECT
    e.student_id,
    e.course_id,
    ROUND(AVG(a.mark), 2) AS average_mark,
    CASE
        WHEN AVG(a.mark) >= 75 THEN 'Distinction'
        WHEN AVG(a.mark) >= 60 THEN 'Merit'
        WHEN AVG(a.mark) >= 50 THEN 'Pass'
        ELSE 'Fail'
    END AS classification
FROM Enrollments e
JOIN Assessments a ON a.enrollment_id = e.enrollment_id
GROUP BY e.enrollment_id, e.student_id, e.course_id;


-- ----------------------------------------------------------------------
-- QUESTION 8 -- Course Performance [10 Marks]
-- Average overall mark per course, only >= 70, highest to lowest.
-- ----------------------------------------------------------------------
SELECT
    c.course_id,
    c.course_name,
    ROUND(AVG(a.mark), 2) AS average_mark
FROM Courses c
JOIN Enrollments e  ON e.course_id = c.course_id
JOIN Assessments a  ON a.enrollment_id = e.enrollment_id
GROUP BY c.course_id, c.course_name
HAVING AVG(a.mark) >= 70
ORDER BY average_mark DESC;


-- ----------------------------------------------------------------------
-- QUESTION 9 -- Highest Performing Student-Course Combination [8 Marks]
-- ----------------------------------------------------------------------
SELECT
    s.first_name || ' ' || s.last_name AS student_name,
    c.course_name,
    ROUND(AVG(a.mark), 2) AS average_mark
FROM Enrollments e
JOIN Students s     ON s.student_id = e.student_id
JOIN Courses c      ON c.course_id = e.course_id
JOIN Assessments a  ON a.enrollment_id = e.enrollment_id
GROUP BY e.enrollment_id, s.first_name, s.last_name, c.course_name
ORDER BY average_mark DESC
LIMIT 1;


-- ----------------------------------------------------------------------
-- QUESTION 10 -- Marks Above the Overall Average [8 Marks]
-- Average calculated dynamically via subquery.
-- ----------------------------------------------------------------------
SELECT
    assessment_id,
    enrollment_id,
    assessment_type,
    mark
FROM Assessments
WHERE mark > (SELECT AVG(mark) FROM Assessments)
ORDER BY mark DESC;


-- ----------------------------------------------------------------------
-- QUESTION 11 -- Course Performance Summary [10 Marks]
-- Students enrolled, avg/highest/lowest mark, courses with >= 2 students.
-- ----------------------------------------------------------------------
SELECT
    c.course_name,
    COUNT(DISTINCT e.student_id) AS number_of_students,
    ROUND(AVG(a.mark), 2) AS average_mark,
    MAX(a.mark) AS highest_mark,
    MIN(a.mark) AS lowest_mark
FROM Courses c
JOIN Enrollments e  ON e.course_id = c.course_id
JOIN Assessments a  ON a.enrollment_id = e.enrollment_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(DISTINCT e.student_id) >= 2;


-- ----------------------------------------------------------------------
-- QUESTION 12 -- Gender and Academic Performance [10 Marks]
-- Each student counted once for number_of_students.
-- ----------------------------------------------------------------------
SELECT
    s.gender,
    COUNT(DISTINCT s.student_id) AS number_of_students,
    ROUND(AVG(a.mark), 2) AS average_mark
FROM Students s
JOIN Enrollments e  ON e.student_id = s.student_id
JOIN Assessments a  ON a.enrollment_id = e.enrollment_id
GROUP BY s.gender;


-- ----------------------------------------------------------------------
-- QUESTION 13 -- Assessment Performance [8 Marks]
-- Per assessment type, highest average mark first.
-- ----------------------------------------------------------------------
SELECT
    assessment_type,
    COUNT(*) AS number_of_assessments,
    ROUND(AVG(mark), 2) AS average_mark,
    MAX(mark) AS highest_mark,
    MIN(mark) AS lowest_mark
FROM Assessments
GROUP BY assessment_type
ORDER BY average_mark DESC;


-- ----------------------------------------------------------------------
-- QUESTION 14 -- Identifying At-Risk Enrolments [10 Marks]
-- Enrolments with average mark below 50, lowest to highest.
-- ----------------------------------------------------------------------
SELECT
    s.first_name || ' ' || s.last_name AS student_name,
    c.course_name,
    ROUND(AVG(a.mark), 2) AS average_mark
FROM Enrollments e
JOIN Students s     ON s.student_id = e.student_id
JOIN Courses c      ON c.course_id = e.course_id
JOIN Assessments a  ON a.enrollment_id = e.enrollment_id
GROUP BY e.enrollment_id, s.first_name, s.last_name, c.course_name
HAVING AVG(a.mark) < 50
ORDER BY average_mark ASC;


-- ----------------------------------------------------------------------
-- QUESTION 15 -- Students Performing Above Average [10 Marks]
-- Student average > overall average, calculated dynamically.
-- ----------------------------------------------------------------------
SELECT
    s.student_id,
    s.first_name || ' ' || s.last_name AS student_name,
    ROUND(AVG(a.mark), 2) AS student_average_mark
FROM Students s
JOIN Enrollments e  ON e.student_id = s.student_id
JOIN Assessments a  ON a.enrollment_id = e.enrollment_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING AVG(a.mark) > (SELECT AVG(mark) FROM Assessments)
ORDER BY student_average_mark DESC;


-- ----------------------------------------------------------------------
-- QUESTION 16 -- CTE and Performance Categories [12 Marks]
-- ----------------------------------------------------------------------
WITH EnrolmentAverages AS (
    SELECT
        e.enrollment_id,
        s.first_name || ' ' || s.last_name AS student_name,
        c.course_name,
        AVG(a.mark) AS average_mark
    FROM Enrollments e
    JOIN Students s     ON s.student_id = e.student_id
    JOIN Courses c      ON c.course_id = e.course_id
    JOIN Assessments a  ON a.enrollment_id = e.enrollment_id
    GROUP BY e.enrollment_id, s.first_name, s.last_name, c.course_name
)
SELECT
    student_name,
    course_name,
    ROUND(average_mark, 2) AS average_mark,
    CASE
        WHEN average_mark >= 75 THEN 'High Performer'
        WHEN average_mark >= 50 THEN 'Average Performer'
        ELSE 'At Risk'
    END AS performance_category
FROM EnrolmentAverages
ORDER BY average_mark DESC;


-- ----------------------------------------------------------------------
-- QUESTION 17 -- Identifying Difficult Courses [12 Marks]
-- Average < 70 AND at least two students enrolled.
-- ----------------------------------------------------------------------
SELECT
    c.course_name,
    COUNT(DISTINCT e.student_id) AS number_of_students,
    ROUND(AVG(a.mark), 2) AS average_mark
FROM Courses c
JOIN Enrollments e  ON e.course_id = c.course_id
JOIN Assessments a  ON a.enrollment_id = e.enrollment_id
GROUP BY c.course_id, c.course_name
HAVING AVG(a.mark) < 70
   AND COUNT(DISTINCT e.student_id) >= 2
ORDER BY average_mark ASC;


-- ----------------------------------------------------------------------
-- QUESTION 18 -- Student Ranking [15 Marks]
-- RANK() window function, ties share the same rank.
-- ----------------------------------------------------------------------
SELECT
    s.student_id,
    s.first_name || ' ' || s.last_name AS student_name,
    ROUND(AVG(a.mark), 2) AS average_mark,
    RANK() OVER (ORDER BY AVG(a.mark) DESC) AS rank
FROM Students s
JOIN Enrollments e  ON e.student_id = s.student_id
JOIN Assessments a  ON a.enrollment_id = e.enrollment_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY rank;


-- ----------------------------------------------------------------------
-- QUESTION 19 -- Best Course for Each Student [15 Marks]
-- Ties for a student's highest average must all be returned.
-- ----------------------------------------------------------------------
WITH StudentCourseAverages AS (
    SELECT
        s.student_id,
        s.first_name || ' ' || s.last_name AS student_name,
        c.course_name,
        AVG(a.mark) AS average_mark
    FROM Enrollments e
    JOIN Students s     ON s.student_id = e.student_id
    JOIN Courses c      ON c.course_id = e.course_id
    JOIN Assessments a  ON a.enrollment_id = e.enrollment_id
    GROUP BY s.student_id, s.first_name, s.last_name, c.course_name
),
RankedCourses AS (
    SELECT
        student_id,
        student_name,
        course_name,
        average_mark,
        RANK() OVER (PARTITION BY student_id ORDER BY average_mark DESC) AS course_rank
    FROM StudentCourseAverages
)
SELECT
    student_id,
    student_name,
    course_name,
    ROUND(average_mark, 2) AS average_mark
FROM RankedCourses
WHERE course_rank = 1
ORDER BY student_id;


-- ----------------------------------------------------------------------
-- QUESTION 20 -- Integrated Data Science Analysis [20 Marks]
-- Comprehensive per-student performance report.
-- ----------------------------------------------------------------------
SELECT
    s.student_id,
    s.first_name || ' ' || s.last_name AS student_name,
    s.gender,
    COUNT(DISTINCT e.course_id) AS number_of_courses,
    ROUND(AVG(a.mark), 2) AS average_mark,
    MAX(a.mark) AS highest_mark,
    MIN(a.mark) AS lowest_mark,
    CASE
        WHEN AVG(a.mark) >= 75 THEN 'Excellent'
        WHEN AVG(a.mark) >= 60 THEN 'Good'
        WHEN AVG(a.mark) >= 50 THEN 'Satisfactory'
        ELSE 'At Risk'
    END AS category
FROM Students s
JOIN Enrollments e  ON e.student_id = s.student_id
JOIN Assessments a  ON a.enrollment_id = e.enrollment_id
GROUP BY s.student_id, s.first_name, s.last_name, s.gender
ORDER BY average_mark DESC;
