USE BANKINGDB;


# Windows Functions 

-- Syntax :

/*
SELECT Column_Name1,
Window_Function(column_name2)
OVER ([PARTITION BY column_name3] [ORDER BY Column_name4] AS new_column
FROm table_name;
*/

-- 1> ROW_NUMBER()
SELECT salary, row_number()
OVER(order by salary desc)

FROM Employee;

-- 2> Rank
SELECT salary, rank()
OVER(order by salary desc)

FROM Employee;


CREATE TABLE sales (
sale_id INT PRIMARY KEY,
employee_name VARCHAR(50),
department VARCHAR(50),
sale_date DATE,
amount DECIMAL(10,2)
);

desc sales;

INSERT INTO sales
(sale_id,employee_name,department,sale_date,amount)
VALUES
(1,'Amit','Electronics','2026-01-05',50000),
(2,'Priya','Electronics','2026-01-10',75000),
(3,'Rahul','Electronics','2026-01-15',75000),
(4,'Sneha','Electronics','2026-01-20',90000),
(5,'Vikas','Clothing','2026-01-05',40000),
(6,'Neha','Clothing','2026-01-10',60000),
(7,'Rohit','Clothing','2026-01-15',60000),
(8,'Pooja','Clothing','2026-01-20',85000),
(9,'Karan','Furniture','2026-01-05',30000),
(10,'Anjali','Furniture','2026-01-10',55000);

SELECT *FROM sales;



#Window Function

-- 1> Assign row number
SELECT 
*, row_number() OVER( ORDER BY amount DESC) AS 'ROW NUMBER ()',
RANK() OVER( ORDER BY amount DESC) AS 'RANK()',
DENSE_RANK() OVER( ORDER BY amount DESC) AS 'DENSE_RANK()'
FROM sales;


-- 2> Partition by --
SELECT department,amount,
	rank() OVER (PARTITION BY department ORDER BY amount DESC) AS 'Department Rank',
    dense_rank() OVER (PARTITION BY department ORDER BY amount DESC) AS 'DENSE_Rank',
    sum(amount)
    OVER (PARTITION BY department ORDER BY amount DESC) AS 'Total_Amount',
    sum(amount)
    OVER (PARTITION BY department ORDER BY amount ) AS 'Total_Amount w/o skip'
FROM sales; 

SELECT sum(amount) as 'New amount'
from sales
group by department;


-- 3> Percentage_wise contribustion of each department
SELECT 
employee_name,department,amount, round(amount/sum(amount) over(partition by department)*100,2) as 'Departmentwise_Contribution'
FROM sales;



-- LAG() --> Used to compare with the previous records --
SELECT sale_id,department,amount,sale_date,amount,
lag(amount) OVER(ORDER BY sale_date) as 'Lag()'
from sales;

-- LEAD(): Compare current value with the next value 
SELECT sale_id,department,amount,sale_date,amount,
lead(amount) OVER(ORDER BY sale_date) as 'Lead()'
from sales;

-- Running Total with use of sum() --
SELECT sale_id,department,sale_date,amount,
 sum(amount) OVER (partition by department ORDER BY sale_date ) as 'running_total'
From sales;

--  Average Sale DepartmentWise 
SELECT sale_id,department,sale_date,amount,
concat('₹ ',round(avg(amount) OVER (partition by department ORDER BY sale_date),2)) as 'Average Sales'
From sales;

-- First_Value() & Last_Value() --
SELECT department,amount,
first_value(amount) OVER (partition by department order by amount desc) as 'First_Value'
FROM sales;

SELECT department,amount,
last_value(amount) OVER (partition by department order by amount desc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as 'Last_Value'
FROM sales;

-- NTILE() --> Divides rows into a specified number of approximately equal group
SELECT department,amount, ntile(6) OVER (order by amount desc ) as Amount_6_Quartile,
row_number() OVER (order by amount desc ) as Total_rows
from sales;



