University Student Performance Analysis  SQLite Project

A SQL project analysing student enrolment and academic performance data for a university, using SQLite. The project covers database design, data loading, and 20 analytical queries ranging from basic filtering to CTEs and window functions.

Project Overview

Acting as a Data Analyst, this project explores a university's student, course, and assessment records to answer key institutional questions: who is at risk academically, which courses are under-performing, how performance varies by gender, and how students rank against their peers overall.

The dataset models a realistic academic structure:

Students (1) ──Enrollments ── (1) Courses ── (1) Departments
                     │
                     └── Assessments
Students — 12 students (demographics: name, gender, age, city)
Departments — 5 departments across 3 faculties
Courses — 8 courses, each linked to a department
Enrollments — 24 student-course enrolments
Assessments — 72 individual assessment marks (Assignment, Test, Exam per enrolment)
Tools & Techniques
SQLite 3 (standard SQL, no proprietary extensions)
Multi-table JOINs across a 5-table relational schema
Aggregation with GROUP BY / HAVING
Correlated and non-correlated subqueries
CTEs (WITH clauses) for layered logic
Window functions (RANK() OVER (...)) for ranking and ties
CASE expressions for performance classification


Each query in the script is labelled with its question number and can be run individually by copying it into any SQLite client (DB Browser for SQLite, the sqlite3 CLI, VS Code SQLite extensions, etc.).

Analytical Questions Answered

The script answers 20 questions of increasing complexity, including:

Basic filtering and sorting (age, demographics)
Multi-condition filtering (gender, age range, city)
Aggregate demographic breakdowns
Enrolment and performance reporting across joined tables
Performance classification using CASE (Distinction / Merit / Pass / Fail)
Course-level performance comparisons with HAVING thresholds
Identifying the single best-performing student-course combination
Dynamic subqueries (marks above the overall average, calculated in-query)
Multi-metric course summaries (avg/highest/lowest mark, enrolment count)
Gender-based performance comparison (deduplicated per student)
Assessment-type performance breakdown (Assignment vs Test vs Exam)
At-risk enrolment identification
Above-average student identification (dynamic threshold)
CTE-based performance categorisation
"Difficult course" identification (combined average + enrolment criteria)
Student ranking with RANK(), including tie handling
Best course per student, including tied results
A full integrated per-student performance report combining every metric above

##Full question text and mark allocations are in the script's comments.

Key Insights

Running the queries against the provided dataset surfaces some clear patterns:

Top performer: Sarah Adams leads with a 90.5 average, followed by Mary Jones (89.0) and Daniel Smith (81.83).
Strongest course: Data Visualisation has the highest average mark (83.11), while Machine Learning is the only course meeting the "difficult course" criteria — average below 70 (67.92) with at least two students enrolled.
Gender gap: Female students average 81.47 across all assessments versus 72.33 for male students.
Assessment type: Exams produced the highest average mark (78.83), narrowly ahead of Tests (75.96) and Assignments (75.92).
No enrolments fell below the 50-mark "at-risk" threshold in this dataset — every enrolment classifies as Pass or higher.
Skills Demonstrated
Relational database design (primary/foreign keys, referential integrity)
Translating business questions into precise SQL logic
Multi-table joins and aggregate reporting
Window functions for ranking and tie-handling
CTEs for readable, layered query logic
Data-driven insight generation from raw relational data

This project was completed as a self-directed SQL practice exercise modelled on a university data-analyst scenario, and is included here as a demonstration of SQL and relational database analysis skills.
