CREATE DATABASE ShoppingDB;
USE ShoppingDB;

CREATE TABLE Customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50)
);


CREATE TABLE Products(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50),
price DECIMAL(10,2)
);

CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
quantity INT,
order_date DATE,

FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers VALUES (101,'Rahul Sharma','Nagpur'),
(102,'Priya Verma','Pune'),
(103,'Amit Patil','Mumbai'),
(104,'Sneha Joshi','Nashik');

INSERT INTO Products VALUES (201,'Laptop','Electronics',55000),
(202,'Keyboard','Accessories',1500),
(203,'Headphones','Accessories',2500),
(204,'Monitor','Electronics',12000);

INSERT INTO Orders VALUES (1001,101,201,1,'2026-09-01'),
(1002,102,202,2,'2026-09-03'),
(1003,103,203,1,'2026-09-05'),
(1004,101,202,2,'2026-09-07'),
(1005,104,203,1,'2026-09-10');


-- THREE Table JOINS
SELECT c.*,o.*,p.*
FROM Customers c INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Products p 
ON p.product_id=o.product_id;

-- Q. Calculate citiwise Total price
-- TOTAL Purchase citywise
SELECT c.city,sum(p.price) as `Total Price`
FROM Customers c INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Products p 
ON p.product_id=o.product_id
GROUP BY c.city ORDER BY `Total Price` desc;


-- Top 2 city purchase wise

SELECT * FROM Products;
SELECT c.city,sum(p.price) as `Total Price`
FROM Customers c INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Products p 
ON p.product_id=o.product_id
GROUP BY c.city ORDER BY `Total Price` desc limit 2;

-- TOP 2 Bottom purchase wise
SELECT * FROM Products;
SELECT c.city,sum(p.price) as `Total Price`
FROM Customers c INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Products p 
ON p.product_id=o.product_id
GROUP BY c.city ORDER BY `Total Price` asc limit 2;

-- 
SELECT p.product_name,dayname(o.order_date),sum(p.price),c.city
FROM Customers c INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Products p 
ON p.product_id=o.product_id
group by p.product_name,dayname(o.order_date),city order by sum(p.price) desc;

SELECT c.customer_id,count(o.order_id) as `Number of Orders`
FROM Customers c INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Products p
ON p.product_id=o.product_id
group by c.customer_id
having `Number of Orders`>1;

SELECT c.customer_id,c.city,p.product_name
FROM Customers c INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Products p
ON p.product_id=o.product_id
group by c.customer_id,p.product_name;











