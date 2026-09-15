use n325db;


CREATE TABLE company(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(200),
department VARCHAR(50),
job_role VARCHAR(50),
salary DECIMAL(10,2) DEFAULT 20000,
hire_date DATE,
city VARCHAR(50)
);

INSERT INTO company
(emp_id,emp_name,department,job_role,salary,hire_date,city)
VALUES
(101,'Rahul Sharma','IT','Development',65000,'2021-01-15','Nagpur'),
(102,'Priya Singh','HR','HR Manager',75000,'2020-05-20','Mumbai'),
(103,'Amit Kumar','IT','Developer',70000,'2022-03-10','Pune'),
(104,'Sneha Patil','Finance','Accountant',60000,'2021-07-12','Nagpur'),
(105,'Rohit Verma','IT','Tester',55000,'2023-02-18','Mumbai'),
(106,'Neha Joshi','HR','Recruiter',50000,'2022-11-25','Pune'),
(107,'Vikas Gupta','Finance','Manager',85000,'2019-09-30','Delhi'),
(108,'Anjali Rao','IT','Developer',80000,'2020-12-05','Delhi'),
(109,'Suresh Yadav','Sales','Executive',45000,'2023-06-15','Nagpur'),
(110,'Pooja Mehta','Sales','Manager',70000,'2021-10-10','Mumbai');

SELECT * FROM company;


# String FUNCTIONS
Select emp_name,length(emp_name) as "No of Characters" From company;

-- CONCATE() --> used to combine characters or strings
SELECT concat(emp_name,' - ',department) From company;

-- SUBSTRING(string, start_position, length)
-- SUBSTR & SUBSTRING functions are same 
-- USED TO return string from start postion to end postion through user given conditions
select substr(emp_name,2,4),
substring(emp_name,2,4) from company;


-- TRIM() : Used to removes unnecessary spaces --
SELECT
emp_name,trim(emp_name) as cleaned_name
FROM company;

SELECT length('  Nagpur  '),length(trim('  Nagpur  ')) from dual;

-- replace(old_str,new_str)--
select emp_name from company;
SELECT 
emp_name,
REPLACE(emp_name,'a','@') as Modified_name
from company;

## Mathematical Functions

-- 1>round() 
SELECT 
salary,salary/12
round(salary / 12, 3) As Monthly_salary
from company;

-- 2) floor() --( floor( 4.9)  result -- (4) )
select floor(salary) from company;

select emp_name,salary,
floor(salary/100) ,
floor(salary/1000) as 'rounded down salary'
from company;

select emp_name,salary,
floor(salary/12) as 'Rounded down salary'
from company;

-- round + floor --
select emp_name,salary,
round(salary/12,3) as 'Round of',
floor(salary/12) as 'Rounded down salary'
from company;
#-------------------------------------------#

-- Ceil --(ceil(4.77 RESULT TO 5) -- 
select emp_name,salary,
CEIL(salary/12) as 'Rounded down salary'
from company;

-- Round + floor + Ceil --
select emp_name,salary,
round(salary/12,3) as 'Round of',
floor(salary/12) as 'Rounded down salary',
CEIL(Salary/12) as 'Rounded up salary'
from company;
-- #---------------------------------------------------@

-- 3 ABS() -- ABSOLUTE value (abs return vale allways positive value) ex - (Abs(10-50 ) result = (40) ) --
select ABS(10-40) FROM DUAL; -- ( DUAL SECONDAY COLUMN HAI JO PHALE SE SQL me hota hai )--

select 
emp_name,job_role,salary,salary-60000,
ABS(salary-60000) as 'salary difference with ABS'
from company;
-- ----------------------------------------------------@
-- 4) MOD()= (Modulo operation returns the reminder) ex (10/3 reminder=1 so result is (1))

select emp_id,
MOD(EMP_ID,2) 
FROM company;

SELECT SALARY,
MOD(salary,545) as reminder
from company;
-- ------------------------------------@

-- 5) POWER() POWER VALUE 
 SELECT Salary,
 power(salary,2) as 'sqaure of salary'
 from company;

SELECT Salary,
 power(salary,3) as 'cube of salary'
 from company;
 
#######################################################################################################################################################################

-- @@ COMPARISION OPERATORS --
-- sanytax (Select [column name] FROM [table name] where [compersion >,<,=,etc]; --
# TYPE-1
select emp_name,salary
from company 
where salary>70000;

# TYPE-2
select emp_name,salary,salary*0.25'salary increased by 25%'
from company;
select emp_name,salary,salary*1.25 as 'salary increased by 125%',salary*0.25 as 'salary increased by 25%' 
from company ;

select emp_name,salary,salary*1.25 as 'salary increased by 125%',salary*0.25 as 'salary increased by 25%' 
from company 
where city ='nagpur';

select emp_name,salary,salary*(1-0.1) AS 'SALARY REDUCE BY 10%' 
from company ;

select emp_name,salary,salary*(1-0.25) AS 'SALARY REDUCE BY 25%', SALARY* 0.9 as  'salary reduced by 10%'
from company ;
 
## type-3 [Not Equal to !=]

select * from company where salary != 65000;
-- ------------------------------------------------------@

## Comparision based on classification
 -- SYNTEX SELECT [CASE] (WHEN)1 xyz (When) xyz ELSE  ENDN AS XYZ FROM [table name];
 
 Select *,
 Case 
 when salary >= 55000 THEN 'High salary'
 when salary >= 45000 THEN 'medium salary'
 ELSE 'LOW salary'
 end as Salary_category
 from employees;
 #######################################################################################################################
 
 ## DISTINCT() --> ITS Returns unique value of columns-- 
-- syntax => select Count(DISTINCT [COLUMN_NAME]) FROM [TABLE_NAME];
select 
count(DISTINCT City) as 'Unique City',
count(city) 
from employees;

###########################################################################################################################

## Aggregate function in sql
-- Aggregation function performs calculation on multiple rows

select count(emp_id) as 'total emp in comapy'
from company;

select department,
sum(salary)as total_employees
from company
group by department 
order by sum(salary) ; -- order by ka sort karna hota ASE YA DESC ME 

select SALARY,
AVG(salary)as AVG_salary
from company
group by salary 
order by AVG(salary);

select SALARY,
min(salary)as min_salary
from company
group by salary
order by min(salary);




