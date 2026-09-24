CREATE DATABASE Google;
use Google;

CREATE TABLE Boys(
Boy_ID int UNIQUE,
FirstName Varchar(200) Primary key,
LastName Varchar(200) NOT NULL,
City Varchar(100),
Phone Bigint
);

DROP TABLE Boys;
desc Boys;

ALTER TABLE Boys Modify Column LastName Varchar(200) Not null;

ALTER TABLE Boys Add column Age int;

INSERT INTO Boys VALUES (101,"Vansh","Ganar","Nagpur",9309144203,20);

ALTER TABLE Boys Add Constraint Check(Age>18);
INSERT INTO Boys VALUES (102,"Vaibhav","Ganar","Wardha",9226782341,21);



-- Question with practice 

CREATE TABLE Students(
student_id INT PRIMARY KEY,
name VARCHAR(100),
city VARCHAR(100),
age int,
marks int,
dept_id int
);

INSERT INTO Students (student_id, name, city, age, marks, dept_id)
VALUES
(101, 'Vansh', 'Nagpur', 21, 85, 1),
(102, 'Rahul', 'Pune', 22, 72, 2),
(103, 'Amit', 'Nagpur', 20, 91, 1),
(104, 'Sneha', 'Mumbai', 21, 68, 3),
(105, 'Priya', 'Pune', 22, 88, 2),
(106, 'Rohan', 'Nashik', 20, 76, 3);

-- Display all students.
SELECT * FROM Students;

-- Display only name and city
SELECT name,city 
FROM Students;

-- Find students who belong to Nagpur.
SELECT * FROM Students 
WHERE city = 'Nagpur';

-- Find students whose marks are greater than 80.
SELECT * FROM Students
WHERE marks>80;

-- Find students whose age is 21 or above.
SELECT * FROM Students 
WHERE age>=21;

-- Display students from Nagpur or Pune.
SELECT * FROM Students 
Where city in ('Nagpur','Pune');

-- Display students whose marks are between 70 and 90.
SELECT * FROM Students 
WHERE marks between 70 and 90;

-- Sort students by marks in descending order.
SELECT * FROM Students 
order by marks desc;

-- Sort students by name alphabetically.
SELECT * FROM Students
order by name asc;

-- Find the highest marks.
SELECT max(marks) from Students;

-- Find the lowest marks.
SELECT MIN(marks) FROM Students;

-- Find the average marks.
SELECT avg(marks) from Students;

-- Find the total number of students.
SELECT COUNT(*) from Students;

-- Find the total marks of all students.
SELECT sum(marks) from Students;

-- Display students whose name starts with 'A'.
SELECT * FROM Students
WHERE name like 'A%';


-- Level 2 — GROUP BY & HAVING

-- Find the number of students in each city.
SELECT city ,count(*) FROM Students
group by city;

-- Find the average marks of students in each city.
SELECT city,avg(marks) FROM Students
group by city;

-- Find the maximum marks in each city.
SELECT city ,max(marks) from Students
group by city;

-- Find the minimum marks in each city.
SELECT city ,min(marks) from Students
group by city;

-- Find the total marks obtained by students in each department.
SELECT dept_id,sum(marks) FROM Students
group by dept_id;

SELECT * FROM Students;

-- Display only those cities having more than 1 student.
SELECT city, COUNT(*) AS student_count
FROM Students
GROUP BY city
HAVING COUNT(*) > 1;

-- Display departments whose average marks are greater than 80.
SELECT dept_id FROM Students
group by dept_id
having avg(marks)>80;

-- Find the number of students in each age group.
SELECT age,count(*) FROM Students
group by age;


## LEVEL 3 JOINS 

CREATE TABLE Departments(
dept_id int primary key,
dept_name varchar(100)
);

INSERT INTO Departments VALUES (1,'Computer'),
(2,'Data Science'),(3,'Electronics');

SELECT * FROM Departments;

-- Display student name and department name.
SELECT s.name,d.dept_name
FROM Students s JOIN Departments d
On s.dept_id=d.dept_id;

-- Display all students belonging to Computer department.
SELECT s.*,d.*
FROM Students s JOIN Departments d
ON s.dept_id=d.dept_id
WHERE dept_name='Computer';

-- Display students whose department is Data Science.
SELECT s.*,d.*
FROM Students s JOIN Departments d
ON s.dept_id=d.dept_id
where dept_name='Data Science';

-- Find the average marks of each department.
SELECT dept_name,avg(s.marks) as average_marks
FROM Students s JOIN Departments d
ON s.dept_id=d.dept_id
Group by d.dept_name;

-- Find the highest marks in each department.
SELECT d.dept_name,max(s.marks)
FROM Students s JOIN Departments d
ON s.dept_id=d.dept_id
group by d.dept_name;


-- Display department name and number of students in each department.
SELECT d.dept_name,count(s.dept_id)
FROM Students s JOIN Departments d
ON s.dept_id=d.dept_id
group by d.dept_name;

-- Display students who scored more than 80, along with their department name.
SELECT s.name,d.dept_name,s.marks
FROM Students s JOIN Departments d
ON s.dept_id=d.dept_id
group by s.name,d.dept_name,s.marks
having marks >80;


## LEVEL 4

-- Level 5 — Window Functions

-- Give every student a row number based on marks descending.
SELECT *, ROW_NUMBER() OVER (ORDER BY marks DESC) as `row_number`
FROM Students;

SELECT VERSION();

-- Rank students based on marks.
SELECT *,RANK() OVER (ORDER BY marks ) 
FROM Students;


-- Find the difference between RANK() and DENSE_RANK() using the student data.
SELECT *,
RANK() OVER (order by marks desc),
DENSE_RANK() OVER (order by marks desc)
FROM Students;

-- Give each student their department-wise rank based on marks.
SELECT *,
RANK() OVER (partition by dept_id order by marks desc)
FROM Students;

-- Find the top 2 students from each department.
SELECT *
from (
select *,
RANK() OVER (PARTITION by dept_id order by marks desc ) as rnk
FROM Students
)as RANKED
WHERE rnk <=2; 

-- Find the second-highest marks using a window function.
SELECT *
FROM (
select marks,
RANK() OVER (order by marks desc) as rnk
FROM Students
) as Ranked_Student
Where rnk=2;

-- Divide students into 3 groups based on marks using: 
SELECT NTILE(3) 
OVER (order by marks)
from Students;


## LEVEL 5 SUBSTRING 

