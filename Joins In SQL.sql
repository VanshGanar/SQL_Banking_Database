use n325db;


CREATE TABLE Customers (
customer_id INT Primary key,
customer_name VARCHAR(50),
city VARCHAR(50)
);


INSERT INTO Customers
VALUES
(101,'Amit','Nagpur'),
(102,'Priya','Pune'),
(103,'Rahul','Mumbai'),
(104,'Sneha','Delhi'),
(105,'Vikas','Nashik');

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
product VARCHAR(50),
amount DECIMAL(10,2)
);

INSERT INTO orders
VALUES 
(1,101,'Laptop',55000),
(2,102,'Mobile',25000),
(3,101,'Mouse',1500),
(4,103,'Keyboard',3000),
(5,102,'Monitor',12000),
(6,106,'Printer',10000);

DROP TABLE orders;


## INNER Joins : Inner Join returns only the records that have matching values in both tables.alter

SELECT 
Customers.*,orders.*
FROM Customers JOIN orders
ON Customers.customer_id=orders.customer_id;

--- using alias to column name like this syntax
SELECT 
c.*,o.*
FROM Customers as c JOIN orders as o
ON c.customer_id=o.customer_id;

-- different pattern  with alias 
SELECT x.*,y.amount,y.product
FROM Customers as x JOIN orders as y
ON x.customer_id=y.customer_id;

-- joins table using alias 
SELECT 
c.customer_id,
c.customer_name,
o.product,
concat('₹ ',o.amount) as Amount
FROM customers c INNER JOIN orders o
ON c.customer_id = o.customer_id;


-- LEFT JOIN 
-- > LEFT join retrun all records from left table and matching records from right table 
-- > left joins means 1st table 
SELECT 
c.customer_id,
c.customer_name,
o.product,
concat('₹ ',o.amount) as Amount
FROM customers c LEFT JOIN orders o
ON c.customer_id = o.customer_id;

select * from customers;
select * from orders;

-- RIGHT JOIN 
-- > right join return all records from right table and matching records from left table 
-- > Right joins means 2nd table 
SELECT 
c.customer_id,
c.customer_name,
o.product,
concat('₹ ',o.amount) as Amount
FROM customers c RIGHT JOIN orders o
ON c.customer_id = o.customer_id;


-- 3> CROSS JOINS / CARTESIAN JOINS
-- >  CROSS JOIN Produces the Cartesian product of two tables
-- if :
 -- table A has rows
 -- Table B has 6 rows 
 -- IT will generate 5 rows * 6 rows = 30 rows
 -- CROSS JOINS will generate a very large number of rows 
 
 SELECT 
c.*,
o.*
FROM customers c CROSS JOIN orders o;


-- 4> SELF JOIN 
-- > A table joins itself 
-- > it is useful when records within the same table have relationships with each other.

CREATE TABLE employees (
employee_id INT Primary key,
employee_name VARCHAR(50),
manager_id INT
);

INSERT INTO employees VALUES
(1,'Amit',NULL),
(2,'Priya',1),
(3,'Rahul',1),
(4,'Sneha',2),
(5,'Rockey',3);

SELECT
e.employee_name AS Employee,
m.employee_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;


-- self join example
CREATE TABLE employee_new (
emp_id INT primary key,
emp_name varchar(50),
department varchar(100)
);


INSERT INTO employee_new VALUES
(1,'Rahul','IT'),(2,'Priya','HR'),(3,'Hitesh','IT'),(4,'Gaurav','HR'),(5,'Amit','Finance');

select e_n.emp_name,e_d.emp_name,e_n.department,e_d.department
from employee_new e_n
JOIN employee_new e_d
ON e_n.department=e_d.department;


## FULL OUTER JOINS : Mysql does not directly supports, but we can make full outer join by union of LEFT JOINS & RIGHT JOINS --
-- This will give records from both tables, including unmatched records.
-- Full Join or Full Outer Join : IT will return matching and non-matching rows from both tables.

SELECT c.customer_id,c.customer_name,o.order_id,o.product
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id,c.customer_name,o.order_id,o.product
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- Q. Show records using inner joins where amount >12000
-- > JOINS With Where clause
-- > where clause is used to pass records 
-- >  used to filter the records 
SELECT c.*,
o.product,
o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
where o.amount>12000;

-- Group by condition
SELECT c.*,
sum(o.amount),o.product
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
group by o.customer_id,o.product;

-- WHERE Clause Example
SELECT c.*,o.product,o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id where o.product in ("Laptop","Monitor") and c.city='Pune';


# HAVING
-- > Having clause is used to fliter the group
SELECT c.*,
sum(o.amount) as 'Total Amount',o.product
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
group by o.customer_id,o.product
having o.amount=12000;

-- Group by example
SELECT c.customer_name,c.city,
sum(o.amount) as 'total_amount_spent'
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
group by c.customer_id,c.customer_name having c.city in ('Pune','Nagpur','Mumbai') order by total_amount_spent desc limit 1 offset 1;


## Multiply joins 
CREATE TABLE products(prod_id varchar(40)primary key,
prod_name varchar(50),
manufactured_at varchar(100)
);

INSERT INTO products VALUES (501,'Laptop','USA'),
(502,'Mobile','South Korea'),
(503,'Keyboard','China'),
(504,'Monitor','Taiwan');

SELECT * FROM products;

SELECT 
c.*,
o.*
FROM customers c
INNER JOIN orders o
ON c.customer_id=o.customer_id;






