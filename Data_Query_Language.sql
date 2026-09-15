USE BANKINGDB; 

CREATE TABLE Student(
stud_id varchar(50),
stud_name varchar(50),
address varchar(50),
city varchar(50)
);

INSERT INTO Student values(1,"Shashank","RJPM","Lucknow");

alter table Student add column Date_Of_Birth Date;
desc Student;

alter table Student modify column stud_name varchar(100);

-- drop column city from Student Table 
alter table Student drop column city;

CREATE TABLE if not exists Teacher(
Teacher_ID int (50),
Teacher_Name Varchar(100),
Hiring_Date date,
Age int,
Salary Int(100)
); 

desc Teacher;

INSERT INTO Teacher VALUES (1,"Kamal","2021-08-09",28,50000),
(2,"Reshma","2020-12-12",34,"67000"),
(3,"Ujjwal","2023-11-23",25,15000),
(4,"Jay","2025-11-10",30,56000);

SELECT * FROM Teacher;

SELECT * FROM Student;


ALTER TABLE Student add constraint pk_stud_id primary key (stud_id);

-- RENAME SYNTAX FOR RENAME COLUMN RENAME --
alter table Student Rename column stud_name to name;

INSERT INTO Student VALUES("s01","Gaurav","Dharampeth","2005-10-10"),
("s02","Kunal","Reshimbag","1999-10-08"),
("s03","Farhan","Mominpura","1997-12-10"),
("s04","Vaibhav","Vayuena Nagar","2000-11-14"),
("s05","Vishal","Pratap Nagar","2009-08-07"),
("s06","Kumar","Ravi Nagar","2005-02-05"),
("s07","Dinesh","Sitabuldi","1996-12-12"),
("s08","Tanushree","Medical Square","2009-12-13");

SELECT * FROM Student;

-- How to count total records of table --
-- alias Declaration --

Select count(*) as "Number Of Students"
from Student;


SELECT name from Student;

SELECT Date_Of_Birth,month(Date_Of_Birth),monthname(Date_Of_Birth),dayname(Date_Of_Birth),dayofweek(Date_Of_Birth),
curdate() as "Today Date",datediff(curdate(),Date_Of_Birth) as "Number of Days till Today",
year(datediff(curdate(),Date_Of_Birth)) as "Year"
From Student;

SELECT * FROM Employee;

DESC Employee;
DESC Student;

SELECT city,count(*) as "Number Of Employee"
FROM Employee
group by city
order by city desc;

SELECT Department, count(*) as "Number of Department"
FROM Employee
group by Department
having count(EmployeeID)>=1
Order by Department ASC;


SELECT * FROM Employee;

SELECT Department,sum(salary)
from Employee 
GROUP by Department 
Order by sum(salary) DESC 
limit 3;


# Aggregation Function in SQl 

-- 1> Total Number Of Employees
SELECT COUNT(*) as "Total Numbers Of Employee"
FROM Employee ;


SELECT * FROM Employee;

DESC Employee;




-- 4> Average Salary DepartmentWise
SELECT Department,concat("₹",round(avg(salary),0)) as "Average Salary"
From Employee
GROUP BY Department;

-- Aggregation Function on Salary departmentwise 

SELECT Department,
concat("₹",round(sum(salary),0)) as "Total Salary",
concat("₹",round(max(salary),0)) as "Maximum Salary",
concat("₹",round(min(salary),0)) as "Manimum Salary",
count(*) as "Number of Employee"
From Employee
Group By Department 
Order by avg(salary);

# Pattern Matching:

-- FIND Employee Whose Name Start with "R" --

SELECT * FROM Employee
Where EmployeeName Like "R%";


-- Find Employee Whose Name End With "A"
SELECT * FROM Employee
Where EmployeeName Like "%a";

SELECT * FROM Employee;

-- Employee whose name contains "a"
SELECT * FROM Employee
Where EmployeeName Like "%a%";

-- Find Employee Name Whose Second Character is "a" to "_a"
SELECT * FROM Employee
Where EmployeeName Like "_a%";

-- Find The City Which has only 5 Characters --
SELECT City FROM Employee
Where City Like "_____";

-- Find The City Which Start With "M"
SELECT City From Employee 
Where City Like "M%";

# TO Find City with Whole Condition
SELECT * FROM Employee 
Where City="Mumbai";

